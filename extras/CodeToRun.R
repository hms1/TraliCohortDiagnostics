# Prevents errors due to packages being built for other R versions: 
# Sys.setenv("R_REMOTES_NO_ERRORS_FROM_WARNINGS" = TRUE)
## First, it probably is best to make sure you are up-to-date on all existing packages. 
## Important: This code is best run in R, not RStudio, as RStudio may have some libraries 
## (like 'rlang') in use.
#update.packages(ask = "graphics")
## When asked to update packages, select '1' ('update all') (could be multiple times)
## When asked whether to install from source, select 'No' (could be multiple times)
#install.packages("devtools")

# Running the package -------------------------------------------------------------------------------
library(cohortEvaluationTrali)

# Optional: specify where the temporary files (used by the ff package) will be created:
options(fftempdir = "s:/FFtemp")

# Details for connecting to the server:
connectionDetails <- createConnectionDetails(
  dbms = "pdw",
  server = Sys.getenv("PDW_SERVER"),
  user = NULL,
  password = NULL,
  port = Sys.getenv("PDW_PORT")
  )

cdmDatabaseSchema <- ""    ## CDM location
cohortDatabaseSchema <- "" ## needs write access
cohortTable <- "traliDiagnosticsV1"

# For Oracle: define a schema that can be used to emulate temp tables:
oracleTempSchema <- NULL

# Details specific to the database:
outputFolder <- "" ##Select an output folder

databaseId <- ""
databaseName <- ""
databaseDescription <- ""


cohortGroups <- c("Transfusions") ## Do not change

# Use this to run the evaluations. The results will be stored in a zip file called 
# 'AllResults_<databaseId>.zip in the outputFolder. 
execute(connectionDetails = connectionDetails,
        cdmDatabaseSchema = cdmDatabaseSchema,
        cohortDatabaseSchema = cohortDatabaseSchema,
        cohortTable = cohortTable,
        oracleTempSchema = cohortDatabaseSchema,
        outputFolder = outputFolder,
        databaseId = databaseId,
        databaseName = databaseName,
        databaseDescription = databaseDescription,
        cohortGroups = cohortGroups,
        createCohorts = TRUE,
        runCohortDiagnostics = TRUE,
        minCellCount = 5) 
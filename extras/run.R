library(Covid19HivDrugs)

library(tidyverse)
# Optional: specify where the temporary files (used by the ff package) will be created:
options(fftempdir = "~/fftemp")

# Details for connecting to the server:
connectionDetails <- DatabaseConnector::createConnectionDetails(dbms = "redshift",
                                                                server = str_c(Sys.getenv("HOSPITAL_SERVER"),"/prod_hospital"),
                                                                user = Sys.getenv("REDSHIFT_USER"),
                                                                password = Sys.getenv("REDSHIFT_PASSWORD"),
                                                                port = 5439)

# For Oracle: define a schema that can be used to emulate temp tables:
oracleTempSchema <- NULL

# Details specific to the database:
outputFolder <- str_c(getwd(),"/outputPheno_HOSPITAL")# Be sure to have one outputFolder per database!
cdmDatabaseSchema <- Sys.getenv("HOSPITAL_SCHEMA")
cohortDatabaseSchema <- "study_reference"
cohortTable <- "covid_pheno_hiv2"
databaseId <- "HOSPITAL"
databaseName <- "HOSPITAL"
databaseDescription <- "HOSPITAL"

# For uploading the results. You should have received the key file from the study coordinator:
keyFileName <- "~/covid_testing/study-data-site-covid19.dat"
userName <- "study-data-site-covid19"

# Selecting the cohort groups to run:
# cohortGroups <- c("Exposures", "SafetyOutcomes", "EfficacyOutcomes")
cohortGroups <- c("Exposures") # Prioritizing outcomes for now

# Use this to run the evaluations. The results will be stored in a zip file called 
# 'AllResults_<databaseId>.zip in the outputFolder. 
Covid19HivDrugs::execute(connectionDetails = connectionDetails,
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

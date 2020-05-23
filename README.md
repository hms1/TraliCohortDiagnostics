Covid19CohortEvaluation
=======================

Introduction
============

A central package for evaluation the cohorts used in the various COVID-19 studies.

Installation
=============
To install, in R type:

```r
# Prevents errors due to packages being built for other R versions: 
Sys.setenv("R_REMOTES_NO_ERRORS_FROM_WARNINGS" = TRUE)

# First, it probably is best to make sure you are up-to-date on all existing packages. 
# Important: This code is best run in R, not RStudio, as RStudio may have some libraries 
# (like 'rlang') in use.
update.packages(ask = "graphics")

# When asked to update packages, select '1' ('update all') (could be multiple times)
# When asked whether to install from source, select 'No' (could be multiple times)
install.packages("devtools")
devtools::install_github("ohdsi-studies/Covid19CohortEvaluation")
```

See 'extras/CodeToRun.R' for instructions on how to run.

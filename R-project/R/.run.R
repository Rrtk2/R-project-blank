# Loads packages and data
source("./R/1-load.R")

# Loads required custom functions
source("./R/2-functions.R")

# Creates QC plots and data cleanup (outliers)
source("./R/3-data-cleanup.R")

# Processing of data using algorithms
source("./R/4-analysis.R")

# Creation of figures and files
source("./R/5-post-processing.R")

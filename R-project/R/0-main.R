#-----------------------------------------------------------------------------------------------------#
# 							GENERAL INFORMATION
#-----------------------------------------------------------------------------------------------------#
# Copyright statement comment:
#   No Copyright statement, up to Maastricht University to decide.


# Author comment:
#   Rick Reijnders i6167500
#   ra.reijnders@student.maastrichtuniversity.nl
#   Script version: XX-XX-2019


# Project description:
#	Name
#	  	R-project-blank
#
#   Purpose
#     	This code was made to ...
#
#   Inputs
#		I need this data....
#
#   Outputs
#		This is created....
#


#-----------------------------------------------------------------------------------------------------#
# 							SETTINGS
#-----------------------------------------------------------------------------------------------------#
# General settings
options(stringsAsFactors = F)

# Setting seed to keep consistent results 
set.seed(123)


#-----------------------------------------------------------------------------------------------------#
#							WORKFLOW
#-----------------------------------------------------------------------------------------------------#
setwd("D:\\Github\\R-project-blank\\R-project)


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







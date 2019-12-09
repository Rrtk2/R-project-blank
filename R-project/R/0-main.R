#-----------------------------------------------------------------------------------------------------#
# 							GENERAL INFORMATION
#-----------------------------------------------------------------------------------------------------#
# Licence information:
# GNU GENERAL PUBLIC LICENSE 
# Please see the github folder:
# https://github.com/Rrtk2/R-project-blank

# Author comment:
#   Rick Reijnders
#   rick.reijnders@home.nl
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

# For this workflow to work the structure must be:
#	/My-project
#		/input							(data files)
#			/my-data-set.csv
#		/R							(code)
#			/load.R 					(data import)
#			/clean.R 					(data cleanup)
#			/fucntion.R 					(defined functions)
#			/analysis.R 					(pipeline)
#			/grapics.R 					(post processing)
#		/output
#			/session-2019-12-04				(session ID)
#				/results.txt			(resulted txt files)
#				/graphics				(resulted images)
#					/figure1.png

# NOTE: during the creation of this script, assumed was to create a gene expression microarray dataset analysis pipeline.

#-----------------------------------------------------------------------------------------------------#
# 							SETTINGS
#-----------------------------------------------------------------------------------------------------#
# All settings should have an lowercase & underscore prefix (s_Settingvariable1)
# General settings
options(stringsAsFactors = F)

# Setting seed to keep consistent results 
set.seed(123)

# Define root folder (if needed):
s_rootFolder = "D:/Github/R-project-blank/R-project"

# Use the autoimporter; all files in ./R/input/ will be imported and stored in variable using the name.
# Works with: .txt .csv .xlsx (can be expanded easally)
s_AutoImport = TRUE

# s_maindataname can be set to the name of the to be selected main data; skips the selection step when loading data. Leave empty to select later.
s_maindataname = ""#"data_real"

#-----------------------------------------------------------------------------------------------------#
#							WORKFLOW
#-----------------------------------------------------------------------------------------------------#

# Set the top root folder (/My-project)
setwd(s_rootFolder)

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







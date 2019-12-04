#-----------------------------------------------------------------------------------------------------#
# 									(Install &) Load packages
#-----------------------------------------------------------------------------------------------------#
# Insert all packages in requiredpackages
requiredpackages =
  c(
  "tidyverse",
  "limma"
  )

# Install packages if needed and load, or just load packages
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager", ask = F)

for (i in requiredpackages) {
	if (!requireNamespace(i, quietly = TRUE))
		BiocManager::install(i, ask = F, dependencies = c("Depends", "Imports"))
	require(as.character(i), character.only = TRUE)
	print(i)
}


#-----------------------------------------------------------------------------------------------------#
# 											Load data
#-----------------------------------------------------------------------------------------------------#
# Some examples to import (saves time searching on the web)
	# R object:
	# load("DataWorkspace.RData")

	# Txt file:
	# data = read.delim("DataTabDelim.txt",header = T)

	# xlsx file:
	# data = as.data.frame(readxl::read_xlsx("DataFromExcel.xlsx",sheet=1))

	# CSV file:
	# data = read.csv("Data.csv",header = T)

data = read.delim("./input/data-name-1.txt",header = T)


@RRR identify de dingen vanzelf list.files(path = "./input/")
#-----------------------------------------------------------------------------------------------------#
#							CHECK IF IN CORRECT FOLDER
#-----------------------------------------------------------------------------------------------------#
if (!sum(c("R","input","output")%in% list.files(path = "./")) == 3){stop("Data structure does not contain required elements:'R','input','output'")}


#-----------------------------------------------------------------------------------------------------#
# 							(INSTALL &) LOAD PACKAGES
#-----------------------------------------------------------------------------------------------------#
# Insert all packages in requiredpackages
requiredpackages =
  c(
  "tools",
  "gplots",
  "tidyverse",
  "limma"
  )

# Install packages if needed and load, or just load packages
if (!requireNamespace("BiocManager", quietly = TRUE))
  install.packages("BiocManager", ask = F)

for (i in requiredpackages) {
	if (!requireNamespace(i, quietly = TRUE))
		BiocManager::install(i, ask = F)  # dependencies = c("Depends", "Imports")
	require(as.character(i), character.only = TRUE)
	#print(i)
}


#-----------------------------------------------------------------------------------------------------#
#							LOAD DATA: AUTOIMPORT TRUE
#-----------------------------------------------------------------------------------------------------#
# AUTOIMPORT
# So the goal of this function is to load all files which exist in the ./input folder. This way all data is imported automatically. If used correctly importing has not to be defined; only coupling of names to rest of data. The idea is randominput -> autoimport -> link to rest of script. 

if (s_AutoImport){

	# first check if any files in folder
	if (length(list.files(path = "./input/")) == 0){stop("No data files in ./R/input folder")}
	
	# Move into the input folder
	setwd( "./input/")
	
	# loop trough every file and determine extension; then load and put in varible with identical name
	for (i in list.files(path = "./")){
		# Get the extension of file
		temp_Extension = file_ext(i)
	
		#if (tempExtension == "Rdata")
		#	load(i)
		
		# cCheck which one it is
		if (temp_Extension == "txt")
			temp_data = read.delim(i, header = T)
			
		if (temp_Extension == "xlsx")
			temp_data = as.data.frame(readxl::read_xlsx(i, sheet=1))  # note: only first sheet is imported
			
		if (temp_Extension == "csv")
			temp_data = read.csv(i,header = T)
			
		# Assign the data to the correct variable name
		assign(x = as.character(substr(i, 1, nchar(i)-4)), value = temp_data)
		
		# Remove the temp_ files
		rm(list=c("temp_data", "temp_Extension"))
	}
	
	# Move out the input folder; back to root
	setwd( "..")
	
	#SET UNIQUE DATA NAME TO UNIVERAL NAME
	# Because 'data' will be used further; the uniquely extracted names need to be set to correct univeral names.

	# Check if user entered some main data name in SETTINGS
	if(nchar(s_maindataname) == 0){
		# Message user it needs to do something (make alert!)
		message("Select the main data from following options:")
		
		# list of names:
		if(TRUE){print(as.character(substr(list.files(path = "./input/"), 1, nchar(list.files(path = "./input/"))-4)))}

		# Read the input from user
		s_maindataname <- readline(prompt = "Main data name: ")
	}

# Store name in data
Data = get(s_maindataname)
#@RRR MORE DATAs
}


#-----------------------------------------------------------------------------------------------------#
#							LOAD DATA: AUTOIMPORT FALSE
#-----------------------------------------------------------------------------------------------------#
# If autoimport is false; use manual import
if (!s_AutoImport){
	warning("make sure this part is correct!")
	
	# set the file to correct path
	Data = read.delim("path/to/folder", header = T)
}






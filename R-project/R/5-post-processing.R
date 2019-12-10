#-----------------------------------------------------------------------------------------------------#
#							Create Result folder
#-----------------------------------------------------------------------------------------------------#
temp_currentdir = "./output/"
#-----------------------------------------------------------------------------------------------------#
#							GET OBJECTS WHICH NEED PLOTTED OR STORED
#-----------------------------------------------------------------------------------------------------#
# @RRR note to self: define method to do this; plot image is structural thing;always has xlab and ylab; size ect.
# make dataframe which has this info and make this part univeral!!

# Write the data in in a tab-delim manner, using commas as comma.
write.table(x = DataResult, file = paste(temp_currentdir, "/", 
"DataResult.txt", sep = ""), sep = "\t", row.names = T,
col.names = NA, dec = ".", na = "")  # Dot as comma!

#-----------------------------------------------------------------------------------------------------#
#							Remove temp_ files/variables
#-----------------------------------------------------------------------------------------------------#
# Detect all variables and remove
rm(list = ls()[grep("temp_",x = ls())])

#-----------------------------------------------------------------------------------------------------#
#							VERSIONS
#-----------------------------------------------------------------------------------------------------#
# Indicate used packages, versions and system hardware
version
Sys.info()
sessionInfo()




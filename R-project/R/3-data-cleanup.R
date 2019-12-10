#-----------------------------------------------------------------------------------------------------#
#							Create QC folder
#-----------------------------------------------------------------------------------------------------#
temp_currentdir = "./output/graphics/qc/"
suppressWarnings(dir.create(temp_currentdir))  # this one is silenced because it warns the user of existing folder

#-----------------------------------------------------------------------------------------------------#
# 							DATA INSPECTION
#-----------------------------------------------------------------------------------------------------#
# General info
str(mydata)
colnames(mydata)
rownames(mydata)
summary(mydata)

# mydata is going to be fitted to a standardized structure:
# rownames 		- col1 		- col2 		- col3 		.. col_n 
# nameSamples	- feature1 	- feature2	- feature3	.. feature_n
# features can be things like groups, experimental treatment, time, replicates
# based on this; the user sets the Pheno_df_Features. This links sample (nameSamples/rownames) to feature.

Pheno_df_Features = c("Time", "Replicate") # used to set name later

# The structure defines colnames as features (thus samples)
Pheno_df_Samples = colnames(mydata)

# Create the Pheno_df_Features matrix 
Pheno_df = as.data.frame(matrix(, nrow = length(Pheno_df_Samples), ncol = length(Pheno_df_Features)))
rownames(Pheno_df) = colnames(mydata)
colnames(Pheno_df) = Pheno_df_Features

# Find all the unique features per sample; required for colors and comparisson
# Time:
Pheno_df[,1] = as.factor(gsub(pattern = list("\\D+"), x = Pheno_df_Samples, replacement = ""))
# Replicate:
Pheno_df[,2] = as.factor(gsub(pattern = ".[^I]+", x = Pheno_df_Samples, replacement = ""))

# Remove empty samples (which are unneeded)
RemoveID = c(which(Pheno_df[, 1] == ""))  # can be expanded using the c
Pheno_df = Pheno_df[-RemoveID, ]

# In this case this is likely the name;
rownames(mydata) = mydata[,RemoveID]

# This can be removed from mydata and continue with numbers dataframe
mydata = mydata[,-RemoveID]


#-----------------------------------------------------------------------------------------------------#
# 							QC
#-----------------------------------------------------------------------------------------------------#
## do this: @RRR
#boxplot
#density
#MA
#correl
#cluster
#pca


temp_PCA = prcomp(t(mydata))

for (i in 1:dim(Pheno_df)[2]){
i=1  # overwrite @RRR
	# Make Boxplot
	png(file = paste(temp_currentdir, "boxplot-",colnames(Pheno_df)[i],".png", sep = ""),	width = 1024, height = 1024)
		boxplot(mydata, col = Pheno_df[,i], main = paste("Boxplot of mydata;",colnames(Pheno_df)[i]), las = 3)
		legend(x = "topright", legend = unique(Pheno_df[,i]), 
		fill = unique(Pheno_df[,i]), cex = 0.9)
	dev.off()

	# Make PCA plot
	png(file = paste(temp_currentdir, "pca-",colnames(Pheno_df)[i],".png", sep = ""),	width = 1024, height = 1024)
		print(autoplot(temp_PCA,scale = T,col=Pheno_df[,i], main = paste("PCA of mydata;",colnames(Pheno_df)[i]))) 
	dev.off()
}

# Make Correlation plot
png(file = paste(temp_currentdir, "correlation plot.png", sep = ""),	width = 1024, height = 1024)
	print(corrplot(cor(mydata), type="upper"))
dev.off()



#-----------------------------------------------------------------------------#
# Part 3 of 8 #NORMALIZE DATA
#-----------------------------------------------------------------------------#
# Normalize the dataset.
mydataNorm <- normalizeQuantiles(mydata)



#-----------------------------------------------------------------------------------------------------#
# 							POST QC
#-----------------------------------------------------------------------------------------------------#
## do this: @RRR
#boxplot
#density
#MA
#correl
#cluster
#pca


temp_PCA = prcomp(t(mydataNorm))

for (i in 1:dim(Pheno_df)[2]){
i=1  # overwrite @RRR
	# Make Boxplot
	png(file = paste(temp_currentdir, "boxplot-",colnames(Pheno_df)[i],"-normalized.png", sep = ""),	width = 1024, height = 1024)
		boxplot(mydataNorm, col = Pheno_df[,i], main = paste("Boxplot of mydataNorm;",colnames(Pheno_df)[i]), las = 3)
		legend(x = "topright", legend = unique(Pheno_df[,i]), 
		fill = unique(Pheno_df[,i]), cex = 0.9)
	dev.off()

	# Make PCA plot
	png(file = paste(temp_currentdir, "pca-",colnames(Pheno_df)[i],"-normalized.png", sep = ""),	width = 1024, height = 1024)
		print(autoplot(temp_PCA,scale = T,col=Pheno_df[,i], main = paste("PCA of mydataNorm;",colnames(Pheno_df)[i]))) 
	dev.off()
}

# Make Correlation plot
png(file = paste(temp_currentdir, "correlation plot-normalized.png", sep = ""),	width = 1024, height = 1024)
	print(corrplot(cor(mydataNorm), type="upper"))
dev.off()



#-----------------------------------------------------------------------------------------------------#
#							Remove temp_ files/variables
#-----------------------------------------------------------------------------------------------------#
# Detect all variables and remove
rm(list = ls()[grep("temp_",x = ls())])





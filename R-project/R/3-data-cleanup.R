#-----------------------------------------------------------------------------------------------------#
# 							DATA INSPECTION
#-----------------------------------------------------------------------------------------------------#

# General info
str(Data)
colnames(Data)
rownames(Data)

# Data is going to be fitted to a standardized structure:
# rownames 		- col1 		- col2 		- col3 		.. col_n 
# nameSamples	- feature1 	- feature2	- feature3	.. feature_n
# features can be things like groups, experimental treatment, time, replicates
# based on this; the user sets the Pheno_df_Features. This links sample (nameSamples/rownames) to feature.

Pheno_df_Features = c("Time", "Replicate") # used to set name later

# The structure defines colnames as features (thus samples)
Pheno_df_Samples = colnames(Data)

# Create the Pheno_df_Features matrix 
Pheno_df = as.data.frame(matrix(, nrow = length(Pheno_df_Samples), ncol = length(Pheno_df_Features)))
rownames(Pheno_df) = colnames(Data)
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
rownames(Data) = Data[,RemoveID]

# This can be removed from Data and continue with numbers dataframe
Data = Data[,-RemoveID]


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

# Make Boxplot (figure 1/7)
#png(file = paste(results.folder, "/", loop.name, " ", "boxplot.png", sep = ""), 
#width = 1024, height = 1024)

boxplot(Data, col = Pheno_df[,@RRR, main = paste("boxplot"), las = 3)

legend(x = "topright", legend = colnames(loop.object), 
fill = as.factor(data.groups), cex = 0.9)

dev.off()
  
#
## Density @RRR fix
#plot(0, main=paste("Density histogram", sep=""), 
#		cex.axis = 0.7, cex.lab=0.8, type="n", xlab="Value", ylab="Density")
#		
#for (s in 1:(dim(Data)[2])) {
#    dens <- density(Data[,s])
#	lines(dens, lwd=3)
#}
#
## cor plot
#    crp <- cor(Data, use="complete.obs", method="spearman")
#	
#	heatmap.2(crp)

  
#-----------------------------------------------------------------------------------------------------#
#							Cleanup
#-----------------------------------------------------------------------------------------------------#


#-----------------------------------------------------------------------------------------------------#
# 							post QC
#-----------------------------------------------------------------------------------------------------#

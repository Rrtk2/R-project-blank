#-----------------------------------------------------------------------------------------------------#
#							LIMMA
#-----------------------------------------------------------------------------------------------------#
#@RRR this needs to be fixed
design <- model.matrix(~vars + 0)

j = as.character((paste("data.groups", i, " - data.groups", levels(data.groups)[kContrast.copareto.level], sep = "")))

#j = as.character((paste("data.groups", i, " - data.groups0", sep = "")))

cont.matrix <- makeContrasts(contrasts = j, levels = design)

fit <- lmFit(data.norm[, 1:12], design = design)

fit1 <- contrasts.fit(fit, cont.matrix)

fit_bayes <- eBayes(fit1)

temptable <- topTable(fit_bayes, sort = "none", j , n = Inf)

assign(x = paste("toptable", ".", i, "-0", sep = ""), value = temptable)


if(inherits(try(hist(temptable$adj.P.Val)), "try-error")){

next
}

# Make pval Hist plot (figure 5/7)
png(file = paste(results.folder, "/Histogram Pvalue group_", i, "- 0 ", 
" plot.png", sep = ""), width = 1024, height = 1024)

hist(temptable$adj.P.Val,xlab="Pvalue",main = 
paste("Pvalue histogram of group ",i,"- 0"))

dev.off()


# Make log2FC Hist plot (figure 6/7)
png(file = paste(results.folder, "/Histogram log2FC group_", i, "- 0 ", 
" plot.png", sep = ""), width = 1024, height = 1024)

hist(temptable$logFC,xlab="log2FC",main = 
paste("log2FC histogram of group ",i,"- 0"))

dev.off()
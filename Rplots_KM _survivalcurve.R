# @Author: Chenmeijun
# @Email: mjchen1996@outlook.com
# @Date:   2019-06-10 13:49:42
# @Last Modified by:   Meijun
# @Last Modified time: 2019-06-10 14:02:15

rm(list = ls())
setwd("E:/CODE/R")

# load packages
library(survival)
library(survminer)

# TCGAdata is a dataframe including days_to_death,vital_status(1,0),expr(gene expression level,count,RPKM,FPKM)

# define the Type by expr (using median)
TCGAdata <- within(TCGAdata,{
  Type <- NA
  Type[TCGAdata$expr > quantile(TCGAdata$expr,0.5)] <- "HighExp"
  Type[TCGAdata$expr < quantile(TCGAdata$expr,0.5)] <- "LowExp"})

fit <- survfit(Surv(days_to_death, vital_status) ~ Type, data = TCGAdata)

# draw the plot
pdf(file = "KM_analysis.pdf", onefile = FALSE)
ggsurvplot(fit,
           pval = TRUE, 
           ggtheme =theme_light(),
           xlab = "Time",
           legend.labs = c("HighExp", "LowExp")
)

dev.off()

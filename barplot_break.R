#install.packages("ggplot2")
#remotes::install_github("YuLab-SMU/ggbreak")

library(ggplot2)
library(ggbreak)

data <- read.table(file = "E:/SMU/test/data.csv", header = T,sep = ",")

ggplot(data=data, aes(x=factor(Sample, levels=(Sample)), y=Val)) +
     geom_bar(fill= "steelblue",stat="identity") + theme_minimal() + 
     geom_errorbar(aes(ymin = Val-Err, ymax = Val + Err), width = 0.2) +
     scale_y_break(c(0.5,10),scales = 0.5) +  # scale_y_break(c(0.5,10),scales = 0.5) 可多次叠加修改
     ylab("Data") + xlab("Sample")

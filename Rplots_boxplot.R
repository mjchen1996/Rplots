# Time@Jun,7,2019
# Author@Meijun

## boxplot ##
# use iris dataset

# loading packages
library(ggplot2)

head(iris)

## basic option

p.box <- ggplot(data = iris, aes(x = Species, y = Sepal.Length)) + geom_boxplot(aes(fill = Species,alpha = 1), width = 0.8)
p.box

# position
p.box + coord_flip()

# theme
p.box + theme_bw() # chang into white
p.box + theme(panel.grid=element_blank(),panel.border=element_blank(),axis.line=element_line(size=1,color="black")) # remove lines

# add title and subtitles
p.title <- p.box + ggtitle("Iris") + xlab("Species") + ylab("Sepal.Length") + 
      theme(plot.title = element_text(hjust = 0.5))   # 标题居中
p.title
# change palette
p.col <- p.title + scale_fill_brewer(palette = "Accent")
p.col
# add jitter
p.jit <- p.box + geom_jitter(aes(x=Species, y=Sepal.Length, shape = Species, color = Species))
p.jit

# ignore outliers without jitters
ggplot(data = iris, aes(x = Species, y = Sepal.Length)) + geom_boxplot(aes(fill = Species,alpha = 1), width = 0.8, outlier.shape = NA)

# plot
ggplot(data = iris, aes(x = Species, y = Sepal.Length)) + 
    geom_boxplot(aes(fill = Species,alpha = 1), width = 0.8) + 
    theme_bw() + theme(panel.grid=element_blank(),panel.border=element_blank(),axis.line=element_line(size=1,color="black")) + 
    ggtitle("Iris") + xlab("Species") + ylab("Sepal.Length") + 
    theme(plot.title = element_text(hjust = 0.5)) + 
    geom_jitter(aes(x=Species, y=Sepal.Length, shape = Species, color = Species))
    


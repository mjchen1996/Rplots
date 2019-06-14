---
title: "Rplots"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```

## This is a collection of R code for multiple plots

R is a functional tool for visualization. Here are some examples for plots.


### boxplot

```{r ggplot}
# loading packages
library(ggplot2)

head(iris)
```

```{r boxplot}
## basic option

p.box <- ggplot(data = iris, aes(x = Species, y = Sepal.Length)) + geom_boxplot(aes(fill = Species,alpha = 1), width = 0.8)
p.box

```

```{r position}
# position
p.box + coord_flip()

```

```{r theme}
# theme
p.box + theme_bw() + theme(panel.grid=element_blank(),panel.border=element_blank(),axis.line=element_line(size=1,color="black")) # remove lines

```

```{r title}
# add title and subtitles
p.title <- p.box + ggtitle("Iris") + xlab("Species") + ylab("Sepal.Length") + 
      theme(plot.title = element_text(hjust = 0.5))   
p.title
```

```{r palette}
# change palette
p.col <- p.title + scale_fill_brewer(palette = "Accent")
p.col

```

```{r jitter}
# add jitter
p.jit <- p.box + geom_jitter(aes(x=Species, y=Sepal.Length, shape = Species, color = Species))
p.jit
```

```{r outlier}
# ignore outliers without jitters
ggplot(data = iris, aes(x = Species, y = Sepal.Length)) + geom_boxplot(aes(fill = Species,alpha = 1), width = 0.8, outlier.shape = NA)

```

```{r plot}
# plot
ggplot(data = iris, aes(x = Species, y = Sepal.Length)) + 
    geom_boxplot(aes(fill = Species,alpha = 1), width = 0.8) + 
    theme_bw() + theme(panel.grid=element_blank(),panel.border=element_blank(),axis.line=element_line(size=1,color="black")) + 
    ggtitle("Iris") + xlab("Species") + ylab("Sepal.Length") + 
    theme(plot.title = element_text(hjust = 0.5)) + 
    geom_jitter(aes(x=Species, y=Sepal.Length, shape = Species, color = Species))
```



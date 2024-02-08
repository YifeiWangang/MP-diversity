# Libraries
library(vegan)

# create a dataset
df<- read.table(file.choose(),header=T,sep='\t',row.names=1)

richness<- rowSums(df>0)
shannon<- diversity(df,index = "shannon")
simpson<- diversity(df,index = "simpson")

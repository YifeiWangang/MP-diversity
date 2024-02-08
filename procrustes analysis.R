# Libraries
library(vegan)

# create a dataset
df<- read.table(file.choose(),header=T,sep='\t',row.names=1)

# create a environmental dataset
env <- read.table("env.txt",sep="\t",header = T,row.names = 1,check.names = F)

spe.dist <- vegdist(df)
env.dist <- vegdist(scale(env), "euclid")
mds.s <- monoMDS(spe.dist)
mds.e <- monoMDS(env.dist)
pro.s.e <- procrustes(mds.s,mds.e, symmetric = TRUE)
summary(pro.s.e)
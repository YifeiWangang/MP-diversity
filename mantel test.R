# Libraries
library(vegan)

# create a dataset
df<- read.table(file.choose(),header=T,sep='\t',row.names=1)

# create a environmental dataset
env <- read.table("env.txt",sep="\t",header = T,row.names = 1,check.names = F)

df_mantel <- mantel_test(df, env, mantel.fun = 'mantel',
                         spec.dist.method = 'bray', 
                         env.dist.method = 'euclidean')

# Libraries
library(vegan)

# create a dataset
df<- read.table(file.choose(),header=T,sep='\t',row.names=1)
# create a group dataset
data1 <- read.table(file.choose(),sep = '\t', header = T,row.names=1)

distance <- vegdist(df, method = 'bray')
pcoa <- cmdscale(distance, k = (nrow(df) - 1), eig = TRUE)
distance <- as.matrix(distance)
result<-adonis2(df~data1$group,data = df,permutations = 999,method = 'bray')
result


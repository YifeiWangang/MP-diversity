# Libraries
library(stats)

# create a dataset
df<- read.table(file.choose(),header=T,sep='\t',row.names=1)
df <- data.frame(scale(df))

fit.lm <- lm(PC1~ph+TN+TC+TP+OM+AP+DOC, data = df)
summary(fit.lm)

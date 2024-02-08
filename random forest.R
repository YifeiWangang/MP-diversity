# Libraries
library(randomForest)
library(rfPermute)

# create a dataset
df<- read.table(file.choose(),header=T,sep='\t',row.names=1)

set.seed(123)
df_rfP <- rfPermute(ARG~., data = df, importance = TRUE, ntree = 500, nrep = 1000, num.cores = 1)
df_rfP


importance_df.scale <- data.frame(importance(df_rfP, scale = TRUE), check.names = FALSE)
importance_df.scale


# summary(otu_rfP)
importance_df.scale.pval <- (df_rfP$pval)[ , , 2]
importance_df.scale.pval



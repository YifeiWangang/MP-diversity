# Libraries
library(ropls)
library(ggplot2)
library(ggsci)
library(Cairo)
library(tidyverse)
library(extrafont)

# create a dataset
df<- read.table(file.choose(),header=T,sep='\t',row.names=1)

# create a group dataset
group<- read.table(file.choose(),header=T,sep='\t',row.names=1)

df_plsda <- opls(df, group$group, orthoI = 0)

data_VIP <- df_plsda@vipVn
data_VIP_select <- data_VIP[data_VIP > 1]
data_VIP_select <- cbind(otu_raw[names(data_VIP_select), ], data_VIP_select)
names(data_VIP_select)[13] <- "VIP"
data_VIP_select <- data_VIP_select[order(data_VIP_select$VIP, decreasing = TRUE), ]



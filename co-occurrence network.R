# Libraries
library(phyloseq)
library(igraph)
library(network)
library(sna)
library(tidyverse)
library(ggClusterNet)
library(tidyfst)
library("pulsar")

# create a dataset
metadata = read.delim("./metadata.tsv",row.names = 1)
otutab = read.delim("./otutab.txt", row.names=1)
taxonomy = read.table("./taxonomy.txt", row.names=1)
ps = phyloseq(sample_data(metadata),
              otu_table(as.matrix(otutab), taxa_are_rows=TRUE),
              tax_table(as.matrix(taxonomy)))


result = network.2(ps = ps,
                   big = TRUE,
                   maxnode = 5,
                   select_layout = TRUE,
                   layout_net = "model_maptree2",
                   r.threshold=0.6,
                   p.threshold=0.05,
                   label = FALSE,
                   zipi = FALSE,
                   norm = F,
                   end = 150,
                   start = 0,
                   con.method = "pulsar")

p = result[[1]]

data = result[[2]]



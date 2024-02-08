# Libraries
library(ggplot2)
library(ggpmisc)

# create a dataset
df<- read.table(file.choose(),header=T,sep='\t',row.names=1)

# Plot
col <-c("#ff0009", "#0080bf", "#00b534")
ggplot(df,aes(x,y))+
  geom_point(aes(fill=group),shape=21,size=5,alpha=0.7)+
  geom_smooth(data = df,
              method = "lm", color = "white",
              formula = y ~ x,
              linetype=1,alpha=0.5,linewidth = 0.8)+
  scale_fill_manual(values = col)+
  theme_bw()+
  theme(axis.text=element_text(color='black',size=14),
        legend.text = element_text(color='black',size=14),
        axis.title = element_text(color='black',size=15),
        panel.grid = element_blank(),
        legend.title = element_blank(),
        legend.position = c(0.9,0.2))+
  scale_x_continuous(expand = c(0,0))


model<-lm(y ~ x,data = df)
summary(model)

require("ggplot2")
#Generate the boxplot with the persistent entropy data.

#Select a normalization value. Generate the boxplot of its persistent
# entropy. It might be a list of values
list.numbers <- seq(5,385,5)


for (i in list.numbers){
  fig <- ggplot(myData0[myData0$cell.number == i,], 
                aes(x = cell.type, y = PE.dimension.0, colour = cell.type))+
         geom_boxplot()+
         labs(x = "", y = "")+
         ggtitle(paste("dimension=0, normalization=", as.character(i),sep=""))+
                 theme(legend.position="none",
                 plot.title=element_text(size=15))+
         scale_color_manual(values=c("blue", "green", "red"))
          
 dir.create(paste("figures", as.character(i), sep = "//"))       
 ggsave('boxplot_dimension_0.pdf', plot = fig, device = "pdf",
        path = paste("figures", as.character(i), sep = "//"))      
 
 fig <- ggplot(myData0[myData0$cell.number == i,], 
               aes(x = cell.type, y = PE.dimension.1, colour = cell.type))+
   geom_boxplot()+
   labs(x = "", y = "")+
   ggtitle(paste("dimension=1, normalization=", as.character(i),sep=""))+
   theme(legend.position="none",
         plot.title=element_text(size=15))+
   scale_color_manual(values=c("blue", "green", "red"))
 
 ggsave('boxplot_dimension_1.pdf', plot = fig, device = "pdf",
        path = paste("figures", as.character(i), sep = "//"))
 
 fig <- ggplot(myData0[myData0$cell.number == i,], 
               aes(x = cell.type, y = PE.dimension.All, colour = cell.type))+
   geom_boxplot()+
   labs(x = "", y = "")+
   ggtitle(paste("dimension=0&1, normalization=", as.character(i),sep=""))+
   theme(legend.position="none",
         plot.title=element_text(size=15))+
   scale_color_manual(values=c("blue", "green", "red"))
 
 ggsave('boxplot_dimension_All.pdf', plot = fig, device = "pdf",
        path = paste("figures", as.character(i), sep = "//"))
                 
}
ggplot(PE.data, aes(type, PE.dimension.0, colour = type))+ 
geom_point()+
labs(x = "", y = "")+
ggtitle("PE of dimension 0")+
theme(legend.text=element_text(size=17), 
      legend.title=element_text(size=17),
      plot.title=element_text(size=20))+
scale_color_manual(values=c("blue", "green", "red"))
ggsave('results//figures//points_dimension_0.pdf')


ggplot(PE.data, aes(type, PE.dimension.1, colour = type))+ 
  geom_point()+
  labs(x = "", y = "")+
  ggtitle("PE of dimension 1")+
  theme(legend.text=element_text(size=17), 
        legend.title=element_text(size=17),
        plot.title=element_text(size=20))+
  scale_color_manual(values=c("blue", "green", "red"))
ggsave('results//figures//points_dimension_1.pdf')


ggplot(PE.data, aes(type, PE.dimension.All, colour = type))+ 
  geom_point()+
  labs(x = "", y = "")+
  ggtitle("PE of all dimensions together")+
  theme(legend.text=element_text(size=17), 
        legend.title=element_text(size=17),
        plot.title=element_text(size=20))+
  scale_color_manual(values=c("blue", "green", "red"))
ggsave('results//figures//points_dimension_All.pdf')


ggplot(PE.data, aes(type, PE.dimension.0, colour = type))+ 
  geom_boxplot()+
  labs(x = "", y = "")+
  ggtitle("PE of dimension 0")+
  theme(legend.text=element_text(size=17), 
        legend.title=element_text(size=17),
        plot.title=element_text(size=20))+
  scale_color_manual(values=c("blue", "green", "red"))
ggsave('results//figures//boxplot_dimension_0.pdf')


ggplot(PE.data, aes(type, PE.dimension.1, colour = type))+ 
  geom_boxplot()+
  labs(x = "", y = "")+
  ggtitle("PE of dimension 1")+
  theme(legend.text=element_text(size=17), 
        legend.title=element_text(size=17),
        plot.title=element_text(size=20))+
  scale_color_manual(values=c("blue", "green", "red"))
ggsave('results//figures//boxplot_dimension_1.pdf')


ggplot(PE.data, aes(type, PE.dimension.All, colour = type))+ 
  geom_boxplot()+
  labs(x = "", y = "")+
  ggtitle("PE of all dimensions together")+
  theme(legend.text=element_text(size=17), 
        legend.title=element_text(size=17),
        plot.title=element_text(size=20))+
  scale_color_manual(values=c("blue", "green", "red"))
ggsave('results//figures//boxplot_dimension_All.pdf')



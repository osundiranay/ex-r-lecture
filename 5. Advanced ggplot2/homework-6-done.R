# read data
setwd("C:\\Users\\DELL\\Desktop\\Data Science\\r-programming-tutorial\\5. Advanced ggplot2")
raw_data <- read.csv("Section6-Homework-Data.csv")
head(raw_data)

data_cleaned <- raw_data[c("Genre", "Studio", "Budget...mill.", "Gross...US")]
head(data_cleaned)
colnames(data_cleaned) <- c("Genre", "Studio", "Budget", "Gross")
unique(data_cleaned[c("Budget", "Studio")])

# filter
#budget_filter <- data_cleaned$Budget >= 100.0
budget_filter <- data_cleaned$Budget >= 0.0
data_cleaned2 <- data_cleaned[budget_filter,]

studio_filter <- data_cleaned2$Studio == "Buena Vista Studios" | 
  data_cleaned2$Studio == "Fox" |
  data_cleaned2$Studio == "Paramount Pictures" |
  data_cleaned2$Studio == "Sony" |
  data_cleaned2$Studio == "Universal"|
  data_cleaned2$Studio == "WB"
data_cleaned3 <- data_cleaned2[studio_filter,]

genre_filter <- data_cleaned3$Genre == "action" | 
  data_cleaned3$Genre == "adventure" |
  data_cleaned3$Genre == "animation" |
  data_cleaned3$Genre == "comedy" |
  data_cleaned3$Genre == "drama"
data_cleaned4 <- data_cleaned3[genre_filter,]

summary(data_cleaned4)
head(data_cleaned4)
data_cleaned4
#unique(data_cleaned3[c("Studio")])

#box_plot_sub <- ggplot(data=data_cleaned4, aes(x=Genre, y=Gross,
 #                                              size=Budget)) +
  #geom_point(aes(x=Genre, y=Gross,colour=Studio)) +  ylim(0,80)
box_plot_sub <- ggplot(data=data_cleaned4, aes(x=Genre, y=Gross)) + ylim(0,80)
plot6 <- box_plot_sub + geom_jitter(aes(colour=Studio, size=Budget)) +  
  geom_boxplot(alpha=0.5) + scale_size_continuous(range = c(2, 5), 
                                                  trans = scales::exp_trans(base = 1.2),
                                                  breaks = c(100, 200, 300))
plot6 + 
  labs(title = "Domestic Gross % by Genre", x = "Genre", y = "Gross % US", size = "Budget $M") +
  theme(text = element_text(family = "Comic Sans MS"),
        axis.title.x = element_text(colour="blue", size=15),
        axis.title.y = element_text(colour="blue", size=15),
        axis.text.x = element_text(size=10, face="bold"),
        axis.text.y = element_text(size=8),
        
        legend.title = element_text(size=10, face="bold"),
        legend.text = element_text(size=10),
       # legend.position = 
        #legend.justification = c(1,1),
        
        plot.title = element_text(colour="black",
                                  size=20,
                                  hjust = 0.5))











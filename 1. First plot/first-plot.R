my_data <- read.csv(file.choose())


#remove ggplot2
remove.packages("ggplot2")

#install ggplot2
install.packages("ggplot2")

#load ggplot2
library(ggplot2)

ggplot(data=my_data[my_data$carat<2.5,], aes(x=carat, y=price, colour=clarity)) + 
        geom_point(alpha=0.1)+geom_smooth()

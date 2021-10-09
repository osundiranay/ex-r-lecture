setwd("C:\\Users\\DELL\\Desktop\\Data Science\\r-programming-tutorial\\4. DataFrame")
data <- read.csv("P2-Demographic-Data.csv")

#---------------------------- Introduction to qplot
library(ggplot2)
?qplot()
# If with one column, there will be histogram plot
qplot(data = data, x=Internet.users,)
# If two columns, there will be scatter plot to see the correlation
qplot(data = data, x=Internet.users, y=Birth.rate, size=10)
# Change to boxplot 
# 4 different levels of Income.Group will generate 4 different boxplots to compare
qplot(data = data, x=Income.Group, y=Birth.rate, geom="boxplot")
# With continuous variable like Birth.rate & Internet.users, it will combine into 1 boxplot only
qplot(data = data, x=Internet.users, y=Birth.rate, geom="boxplot")



#---------------------------- vISUALIZING COMBINATION OF COLUMNS
qplot(data = data, x=Internet.users, y=Birth.rate,
      color=Income.Group, size=I(3))
# We can analyze sth out from thr graph:
# When people have like a lot of Internet, they tend to have less time for children
# On the other hand, People have no Internet, all they're doing is making more children.




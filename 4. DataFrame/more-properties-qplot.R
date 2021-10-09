setwd("C:\\Users\\DELL\\Desktop\\Data Science\\r-programming-tutorial\\4. DataFrame")
data <- read.csv("updated_data_regions.csv")
head(data)

#---------------------------- vISUALIZING COMBINATION OF COLUMNS
qplot(data = data, x=Internet.users, y=Birth.rate,
      color=Regions, size=I(3))

# 1. Shapes of points in the plot (search for "r shapes" to see other options)
# Triangle
qplot(data = data, x=Internet.users, y=Birth.rate,
      color=Regions, size=I(3), shape=I(17))
# Rectangle
qplot(data = data, x=Internet.users, y=Birth.rate,
      color=Regions, size=I(3), shape=I(15))

# 2. Transparancy (alpha) -> to see overlap of some points -> find cluster of observations
qplot(data = data, x=Internet.users, y=Birth.rate,
      color=Regions, size=I(3), shape=I(19),
      alpha=I(0.6))


# 3. Title
qplot(data = data, x=Internet.users, y=Birth.rate,
      color=Regions, size=I(3), shape=I(19),
      alpha=I(0.6),
      main= "Birth Rate Vs Internet Users")
      
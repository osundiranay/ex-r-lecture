
# Set Working Directory
setwd("C:\\Users\\DELL\\Desktop\\Data Science\\r-programming-tutorial\\4. DataFrame")
stats <- read.csv("P2-Demographic-Data.csv")

#-------------------------------------- Exploring data

stats 
nrow(stats)
ncol(stats)
head(stats, n=8)
tail(stats)

str(stats)
summary(stats)


#-------------------------------------- Using the $ sign
stats
head(stats)
stats[3,3]
stats[5,"Birth.rate"]

# 2 ways to Extract whole column
test1 <- stats[,"Internet.users"]
test2 <- stats$Internet.users
is.vector(test1) # TRUE
is.vector(test2) # TRUE

stats[,"Income.Group"]
levels(stats$Birth.rate)

#-------------------------------------- Basic Operation with a DataFrame
# Subsetting
stats[1:10,]
# Choosing 2 specific rows 
stats[c(4,100),]
is.data.frame(stats[c(4,100),]) # No need for drop=F

# OPERATIONS ON DATAFRAME
# multiply columns
head(stats)
stats$Birth.rate * stats$Internet.users
stats$Birth.rate + stats$Internet.users
# add columns
stats$MyCalc <- stats$Birth.rate + stats$Internet.users


#-------------------------------------- Filtering DataFrames
head(stats)
filter <- stats$Internet.users < 50
# filter is a true/false vector, so when pass to dataframe it will print out TRUE rows
stats[filter,]

stats[stats$Country.Name == "Vietnam",]

stats[stats$Internet.users < 10 | stats$Birth.rate > 40,]

head(stats[stats$Income.Group == "High income" & stats$Internet.users > 70,])









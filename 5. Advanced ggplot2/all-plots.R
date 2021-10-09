# Steps in graphics:
# 1.Data  2.Aesthetics  3.Geometries    4.Statistics  5.Facets    6.Coordinates   7.Theme


# 1. DATA:
setwd("C:\\Users\\DELL\\Desktop\\Data Science\\r-programming-tutorial\\5. Advanced ggplot2")
movie_data <- read.csv("P2-Movie-Ratings.csv")
head(movie_data)
colnames(movie_data) <- c("Film","Genre","CriticRating","AudienceRating","BudgetMillions","Year")
# structure of movie_data
str(movie_data)
summary(movie_data)
# "Year" column in movie_data has been seen as numeric variable, so we need to convert it into Factor
movie_data$Year <- factor(movie_data$Year)


# 2. AESTHETICS:
library(ggplot2)
# ggplot doesn't know the type of plots (dots, line, bubbles,...),
# so without geometry, there will be only BLANK graph  
ggplot(data=movie_data, aes(x=CriticRating, y=AudienceRating))
# add geometry
ggplot(data=movie_data, aes(x=CriticRating, y=AudienceRating)) + 
  geom_point()
# add color
ggplot(data=movie_data, aes(x=CriticRating, y=AudienceRating, color=Genre)) + 
  geom_point()
# add size
ggplot(data=movie_data, aes(x=CriticRating, y=AudienceRating,
                            color=Genre, size=Genre)) + 
  geom_point()
# add size - better way
ggplot(data=movie_data, aes(x=CriticRating, y=AudienceRating,
                            color=Genre, size=BudgetMillions, alpha=0.5)) + 
  geom_point()
#>>> export 1. scatterplot

# 3. GEOMETRIES
# ------------------------------ PLOTTING WITH LAYERS
# This step create a foundation object of plot and assign to p variable
p <- ggplot(data=movie_data, aes(x=CriticRating, y=AudienceRating,
                                 color=Genre, size=BudgetMillions))
# Now we can add many other layers to p
# point
p + geom_point()
# lines
p + geom_line()
# well, actually line graph is useless in this case ^^
# multiple layer
p + geom_line() + geom_point()

#------------------------------------ Overriding Aesthetics
q <- ggplot(data=movie_data, aes(x=CriticRating, y=AudienceRating,
                                 color=Genre, size=BudgetMillions))
# add geom layer
q + geom_point(aes(size=CriticRating))
#ex 2
q + geom_point(aes(size=BudgetMillions))
# ex3:
# From this chart we can see that budget does not affect pretty much to the audience rating
q + geom_point(aes(x=BudgetMillions)) + xlab("BudgetMillions")
#>>>>> export 2. scatterplot_2
# ex 4
q + geom_line(size=1) + geom_point()


# 4. STATISTICS
#------------------------------- Mapping and Setting
r <- ggplot(data=movie_data, aes(x=CriticRating, y=AudienceRating))
r + geom_ponit()
# add colour
# 1. Mapping(what we've done so far):
r + geom_point(aes(colour=Genre))
# 2. Setting
r + geom_point(color=BudgetMillions)
# change size
# 1. Mapping 
r + geom_point(aes(size=BudgetMillions))
# 2. Setting 
r + geom_point(size=1)


#--------------------------------Histogram anh Density Charts
s <- ggplot(data=movie_data, aes(x=BudgetMillions))
#add colour and some custom (space between col)
s + geom_histogram(binwidth = 10, fill="black", col="grey")
# add color using aesthetic
s + geom_histogram(binwidth = 10, aes(fill=Genre),colour="black")
# >>>> export 3. histogram (improve later - not export yet)
# Density Chart
s + geom_density(aes(fill=Genre), position="stack")
s + geom_density(aes(fill=Genre))


#------------------------------ Starting Layer Tips
t <- ggplot(data=movie_data)
# Audience Rating looks like normal distribution
# audience is easier to give their rating just based on their feeling and emotion they receive throughout the movie
t + geom_histogram(binwidth = 10,
                   aes(x=AudienceRating),
                   fill="white", colour="blue")
#>>>> export 4. histogram_normal_dist.png
# while, critic rating looks like uniform distribution
# The reason is easy to understand, critic rating basically relies on judgement and professional opinion,
# based on a set of rules (camera, audio, acting skills,...)
t + geom_histogram(binwidth = 10,
                   aes(x=CriticRating),
                   fill="white", colour="blue")
#>>>> export 5. histogram_uniform_dist.png

# ---------------------------- Statistical Transformation
?geom_smooth

u <- ggplot(data=movie_data, aes(x=CriticRating, y=AudienceRating,
                                 colour=Genre))
u + geom_smooth(fill=NA)
# We can see how are the critic rating and audience rating interrelated
# For example: Romance movie
# Critic gives it low rating about 25 then its actually 50 in AudienceRating
# Ex2: horrow & action movie 
# With 75 of critic rating for horror and action movie,
# Then ACTION tend to have higher audience rating than HORROR movie

# boxplot
# x should be categorical (discrete) variable 
u <- ggplot(data=movie_data, aes(x= Genre, y=AudienceRating,
                                 colour=Genre))
# always combine box_plot with jiter to spot outliers
u + geom_boxplot(size=1.2) + geom_jitter()
# another way
u + geom_jitter() + geom_boxplot(size=1.2, alpha=0.5) 



# 5. FACETS
# improve our previous histogram
v <- ggplot(data=movie_data, aes(x=BudgetMillions))
v + geom_histogram(binwidth = 10, aes(fill=Genre),
                   colour="Black")
# facets
# facet split a plot into many other plots based on categorical variable we pass into
v + geom_histogram(binwidth = 10, aes(fill=Genre),
                   colour="Black")+
  facet_grid(Genre~., scale="free")

# using facet with scatter plot
w <- ggplot(data =movie_data, aes(x=CriticRating, y=AudienceRating,
                                  colour=Genre))
# facet_grid(Genre~.) -> row format
# facet_grid(.~Genre) -> column format
w + geom_point(size=3) + facet_grid(Genre~.)
# split based on both Genre and Year
w + geom_point(aes(size=BudgetMillions)) +
  geom_smooth() +
  facet_grid(Genre~Year) 
  


# 6. COORDINATES
# Set limits of x-axis and y-axis
m <- ggplot(data=movie_data, aes(x=CriticRating, y=AudienceRating,
                                 size=BudgetMillions,
                                 colour=Genre))

m + geom_point()

m + geom_point() + 
  xlim(50,100)+
  ylim(50,100)

# instead - zoom:
n <- ggplot(data=movie_data, aes(x=BudgetMillions))
n + geom_histogram(aes(fill=Genre), binwidth = 10, colour='Black')+
  coord_cartesian(ylim=c(0,50))

# improve histogram 1:
w + geom_point(aes(size=BudgetMillions), size=2) +
  geom_smooth() +
  facet_grid(Genre~Year) +
  coord_cartesian(ylim=c(0,100))
# In 2008, comedy hardly get more than 80 for, however this tendency has grown in positive way after each year.


# 7.THEMES 
#------------------------- (add label, label_color,...)
# Custom Plot 1
plot1 <- ggplot(data=movie_data, aes(x=CriticRating, y=AudienceRating,
                            color=Genre, size=BudgetMillions, alpha=0.5))+
        geom_point()

plot1 + 
  xlab("Critic Rating") +
  ylab("Audience Rating") +
  ggtitle("Scatter plot of Audience VS Critic Rating") +
  theme(axis.title.x = element_text(colour="DarkGreen", size=15),
        axis.title.y = element_text(colour="Red", size=15),
        axis.text.x = element_text(size=10),
        axis.text.y = element_text(size=10),
        
        legend.title = element_text(size=10),
        legend.text = element_text(size=10),
     #   legend.position = c(1,1),
        legend.justification = c(1,1),
        
        plot.title = element_text(colour="DarkBlue",
                                  size=20,
                                  family="Courier",
                                  hjust = 0.5))

# Custom Plot 2:
# add font "comic sans ms" to use
windowsFonts("Comic Sans MS" = windowsFont("Comic Sans MS"))
plot2 <- ggplot(data=movie_data, aes(x=BudgetMillions, y=AudienceRating,
                                 color=Genre, size=BudgetMillions)) +
        geom_point()

plot2 + 
  xlab("Budget (million)") +
 # geom_text(aes(label=text), family="CM Sans", ) +
  ylab("Audience Rating") +
  ggtitle("Scatter plot of Budget VS Audience Rating") +
  theme(axis.title.x = element_text(colour="red", size=15, family="Comic Sans MS",),
        axis.title.y = element_text(colour="red", size=15, family="Comic Sans MS",),
        axis.text.x = element_text(size=10),
        axis.text.y = element_text(size=10),
        
        legend.title = element_text(size=10, family="Comic Sans MS",),
        legend.text = element_text(size=10, family="Comic Sans MS",),
        #   legend.position = c(1,1),
        legend.justification = c(1,1),
        
        plot.title = element_text(colour="Blue",
                                  size=20,
                                  face="bold",
                                  family="Comic Sans MS",
                                  hjust = 0.5))

# Custom Plot 3:
windowsFonts("Roboto" = windowsFont("Roboto"))
windowsFonts("Montserrat" = windowsFont("Montserrat"))
windowsFonts("Palatino" = windowsFont("Palatino"))
windowsFonts("URWPalladio" = windowsFont("URWPalladio"))
windowsFonts("Courier" = windowsFont("Courier"))

myFont1 <- "Montserrat"
myFont2 <- "Roboto"
#myFont3 <- "Palatino"
myFont3 <- "Courier"
plot3_sub <- ggplot(data=movie_data, aes(x=BudgetMillions))

plot3 <- plot3_sub + geom_histogram(binwidth = 10, aes(fill=Genre),colour="black")
plot3 +
  xlab("Money Axis") +
  ylab("Number of Movies") +
  ggtitle("Movie Budget Distribution") +
  theme(text = element_text(family = myFont1),
        
        axis.title.x = element_text(colour="DarkGreen", size=20),
        axis.title.y = element_text(colour="red", size=15),
        axis.text.x = element_text(size=10),
        axis.text.y = element_text(size=10),
        
        legend.title = element_text(size=10),
        legend.text = element_text(size=10),
         legend.position = c(1,1),
        legend.justification = c(1,1),
        
        plot.title = element_text(colour="DarkBlue",
                                  size=20,
                                
                                  family=myFont3,
                                  hjust = 0.5))

# Custom Plot 3:
windowsFonts("Raleway" = windowsFont("Raleway"))
myFont4 <- "Raleway"
plot4_sub <- ggplot(data=movie_data)
plot4 <- plot4_sub + geom_histogram(binwidth = 10,
                   aes(x=AudienceRating),
                   fill="white", colour="blue")
plot4 +
  #theme(text = element_text(size = 16, family = myFont3))+
  xlab("Audience Rating") +
  ylab("Number of Movies") +
  ggtitle("Audience Rating Distribution") +
  theme(axis.title.x = element_text(colour="DarkBlue", size=15),
        axis.title.y = element_text(colour="DarkBlue", size=15),
        axis.text.x = element_text(size=10, face="bold"),
        axis.text.y = element_text(size=10, face="bold"),
        
        legend.title = element_text(size=10),
        legend.text = element_text(size=10),
        legend.position = c(1,1),
        legend.justification = c(1,1),
        
        plot.title = element_text(colour="DarkBlue",
                                  size=20,
                                  hjust = 0.5))
# Custom Plot 5:
plot5 <- plot4_sub + geom_histogram(binwidth = 10,
                   aes(x=CriticRating),
                   fill="white", colour="darkred")
plot5 +
  #theme(text = element_text(size = 16, family = myFont3))+
  xlab("Critic Rating") +
  ylab("Number of Movies") +
  ggtitle("Professional Rating Distribution") +
  theme(axis.title.x = element_text(colour="darkred", size=15),
        axis.title.y = element_text(colour="darkred", size=15),
        axis.text.x = element_text(size=10, face="bold"),
        axis.text.y = element_text(size=10, face="bold"),
        
        legend.title = element_text(size=10),
        legend.text = element_text(size=10),
        legend.position = c(1,1),
        legend.justification = c(1,1),
        
        plot.title = element_text(colour="DarkRed",
                                  size=20,
                                  hjust = 0.5))


#Custom plot 6:
plot6_sub <- ggplot(data=movie_data, aes(x= Genre, y=AudienceRating,
                                 colour=Genre))
# always combine box_plot with jiter to spot outliers
plot6 <- plot6_sub + geom_jitter() + geom_boxplot(size=1.2, alpha=0.5)
 
plot6 +
  xlab("Genre") +
  ylab("Audience Rating") +
  ggtitle("Audience Rating on different Genres") +
  theme(text = element_text(family = "Comic Sans MS"),
        axis.title.x = element_text(colour="black", size=15),
        axis.title.y = element_text(colour="black", size=15),
        axis.text.x = element_text(size=10, face="bold"),
        axis.text.y = element_text(size=10, face="bold"),
        
        legend.title = element_text(size=10),
        legend.text = element_text(size=10),
       # legend.position = c(1,0.1),
        #legend.justification = c(1,1),
        
        plot.title = element_text(colour="black",
                                  size=20,
                                  hjust = 0.5))
  

# Custom plot 7
plot7_sub <- ggplot(data=movie_data, aes(x=CriticRating, y=AudienceRating,
                                 size=BudgetMillions,
                                 colour=Genre))

plot7_sub + geom_point() + 
  xlim(50,100)+
  ylim(50,100)

library(grid)

plot7 <- plot7_sub + geom_point(aes(size=BudgetMillions), size=2) +
  geom_smooth() +
  facet_grid(Genre~Year) +
  coord_cartesian(ylim=c(0,100))
# In 2008, comedy hardly get more than 80 for, however this tendency has grown in positive way after each year.
plot7 +
  xlab("Genre") +
  ylab("Audience Rating") +
  ggtitle("Audience Rating on different Genres") +
  theme(text = element_text(family = "Comic Sans MS"),
        axis.title.x = element_text(colour="black", size=15),
        axis.title.y = element_text(colour="black", size=15),
        axis.text.x = element_text(size=10, face="bold"),
        axis.text.y = element_text(size=8),
        
        legend.title = element_text(size=10),
        legend.text = element_text(size=10),
        legend.position = "none",
        legend.justification = c(1,1),
        
        plot.title = element_text(colour="black",
                                  size=20,
                                  hjust = 0.5),
        panel.spacing = unit(1, "lines"))




















# --------------------------
# library(ggplot2)
# library(extrafont) 
# font_import("C:\\Windows\\Fonts\\Comic Sans MS")
# loadfonts(device = "win")
# font_import(paths = c("C:\\Windows\\Fonts\\arial.ttf"), prompt = F)
# 
# font_import(path = "C:/Users/DELL/AppData/Local/Microsoft/Windows/Fonts")
# 
# 
# library(extrafont)
# library(remotes)
# remotes::install_version("Rttf2pt1", version = "1.3.8")
# extrafont::font_import()
# 
# 
# 
# file.exists("C:/Windows/Fonts/arial.ttf") # TRUE
# extrafont::font_import(pattern="comic.ttf", prompt=FALSE) 
# 
# 
# windowsFonts()
# 







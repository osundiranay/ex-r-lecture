# Access vector elements

#double vector
x <- c(123,445,343)

#sequence
y <- seq(210,300,10)

# string vector
z <- rep("Thang Tran",3)

# normal reference
# Note: vector begin with 1 not 0
y[1]

# take all elements except for ith element: 
y[-3]

# assign to another vector by filtering out old vector
new_vec1 <- y[-5]
new_vec2 <- y[c(-3,-5)]
new_vec3 <- y[c(1:4)]
new_vec4 <- y[-3:-5]

y[length(y)]
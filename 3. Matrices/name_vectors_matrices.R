# Named Vectors
Charlie <- 1:5

# give names
names(Charlie) <- c("a","b","c","d","e")
Charlie
Charlie["d"]

# clear name
names(Charlie) <- NULL
Charlie

# ---------------------------
# "each" helps you replicate each elements n times 
# and put them next to each other
temp_vector <- rep(c("a","B","zZ"), each=3)
temp_vector

Bravo <- matrix(temp_vector,3,3)
Bravo

rownames(Bravo) <- c("How", "are", "you")
Bravo

colnames(Bravo) <- c("X", "Y", "Z")
Bravo

Bravo["are","Y"] <- 0
Bravo

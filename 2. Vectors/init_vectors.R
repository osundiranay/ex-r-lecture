MyFirstVector <- c(1,2,66,34)

# Method to check if variable is numerical or not
is.numeric(MyFirstVector)
# The reason for this strange situation is that all operations in R usually
# happen in double mode
is.double(MyFirstVector)
is.integer(MyFirstVector)


# Character vector
v2 <- c("ads","B24","dsad")
is.character(v2)


# Integer Vector
v3 <- c(0L, 23L, 11L)
is.integer(v3)

# Init Vector using sequence: seq(begin, end, gap)
z <- seq(1,15,4)
z


#Init vector using replicating value: rep
d <- rep(3, 100)
d
# replicate charact vector
rep_cha_vec <- rep("abc",5)
rep_cha_vec



# INIT MATRICES IN R

# matrix()
my_data <- 1:20

matrix_by_col <- matrix(my_data,4,5)
matrix_by_col

matrix_by_row <- matrix(my_data, 4,5, byrow = TRUE)
matrix_by_row


# rbind()
r1 <- c("I", "am", "happy")
r2 <- c("What", "a", "day")
matrix_rbind <- rbind(r1,r2)
matrix_rbind


# cbind()
c1 <- c("I", "he","she")
c2 <- c("am","was","has been")
c3 <- c("Thang", "here", "waiting")
matrix_cbind <- cbind(c1,c2,c3)
matrix_cbind











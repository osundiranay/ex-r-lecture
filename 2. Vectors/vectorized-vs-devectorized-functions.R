

x <- rnorm(5)
x

test <- rep(NA,5)
# R-specific programming loop
for (i in x){
  print(i)
}

# conventional programming loop
for (j in 1:5){
  test[j] <- x[j]
}

# --------------- 2nd Part
# COMPARE VECTORIZE VS DE-VECTORIZED OPERATION

N <- 100
a <- rnorm(N)
b <- rnorm(N)

# ADDITION (+):
# Vectorized approach:
add_vec1 = a+b

# De-vectorized approach:
add_vec2 <- rep(NA, length(add_vec1))
for (i in 1:N){
  add_vec2[i] <- a[i]+b[i]
}


# MULTIPLICATION (*):
# Vectorized approach:
mul_vec1 = a * b

# De-vectorized approach:
mul_vec2 <- rep(NA, length(mul_vec1))
for (i in 1:N){
  mul_vec2[i] <- a[i]+b[i]
}

















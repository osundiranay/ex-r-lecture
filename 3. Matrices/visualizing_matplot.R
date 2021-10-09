

# transpose Matrix
t(FieldGoals)

# Why we need to use transpose matrix?
# Cuz matplot only plots columns of Matrix, 
# so to see specifically performance of each player,
# we need to transpose matrix,
# so that each player will be showed in each column
matplot(t(FieldGoals/Games), type="b", pch=15:18, col=c(1:4,6))

# legend is a symbol assigned to each line in our chart
legend("bottomleft", inset=0.01, legend=Players, col=c(1:4,6), pch=15:18, horiz=F)



# FIELD GOALS VS FIELD GOAL ATTEMPTS
matplot(t(FieldGoals/FieldGoalAttempts), type="b", pch=15:18, col=c(1:4,6))
legend("bottomleft", inset=0.01, legend=Players, col=c(1:4,6), pch=15:18, horiz=F)


# SALARY PER MINUTES
matplot(t(Salary/MinutesPlayed), type="b", pch=15:18, col=c(1:4,6))
legend("bottomleft", inset=0.01, legend=Players, col=c(1:4,6), pch=15:18, horiz=F)


# SALARY FOR EACH POINT
matplot(t(Salary/Points), type="b", pch=1:18, col=c(1:4,6),ylim=c(1000,10000))
legend("bottomleft", inset=0.01, legend=Players, col=c(1:4,6), pch=15:18, horiz=F)


t(Salary/MinutesPlayed)

max(Points)













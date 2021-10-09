

Games
Games
# subsetting
# take top 3 of players in matrix
top_3_minutes_played <- MinutesPlayed[1:3,]
top_3_minutes_played

matplot(t(top_3_minutes_played), type="b", pch=15:18, col=c(1:4,6))
legend("bottomleft", inset=0.01, legend=Players[1:3], col=c(1:4,6), pch=15:18, horiz=F)

# extract only one player 
kobe <- top_3_minutes_played["KobeBryant",]
is.vector(top_3_minutes_played)
is.matrix(top_3_minutes_played)

matplot(kobe, type="b", pch=15:18, col=c(1:4,6))
legend("bottomleft", inset=0.01, legend=Players[""], col=c(1:4,6), pch=15:18, horiz=F)










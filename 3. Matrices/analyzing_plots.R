
# SALARY
# 1. How had salaries of these players been changing?
myplot(Salary)

# 2. How much they get paid per game?
myplot(Salary / Games)
# So we can see 2 abnormal points, which are DerrickRose and KobeBryant
# There salary/game in 2013-2014 is suddenly rocketed, while in the previous plot, all 10 salaries is pretty comparable to others
# The reason is both of these players were actually injured in this season, 
# hence the number of games they play was dropped down while the money they got still the same, so that results in these 2 points

# 3, well, the injuries actually does not affect pretty much to the relation of salary and number of games,
myplot(Salary / FieldGoals)


# IN-GAME METRICS
myplot(MinutesPlayed)
myplot(Points)
# So in these 2 plots, the results are quite the same as 3 salary plots above, because of the injuries of players,

# INTERESTING OBSERVATION
myplot(FieldGoals/Games)
myplot(FieldGoals/FieldGoalAttempts)
myplot(FieldGoalAttempts/Games)
myplot(Points/Games)


#INTERESTING OBSERVATION
# these players tend ato play less minutes than previous year, they get older, their strengths are not permitted played with high intensity
myplot(MinutesPlayed/Games)

# Who score the most field goals, who use their time most efficiently.
# kevin durant -> young join recently -> his goals rising star
myplot(FieldGoals/MinutesPlayed)


#player style
# two point shot more or 3-point shot more, style of scoring of players
myplot(Points/FieldGoals)





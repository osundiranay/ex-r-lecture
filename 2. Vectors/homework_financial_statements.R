#Data
revenue <- c(14574.49, 7606.46, 8611.41, 9175.41, 8058.65, 8105.44, 11496.28, 9766.09, 10305.32, 14379.96, 10713.97, 15433.50)
expenses <- c(12051.82, 5695.07, 12319.20, 12089.72, 8658.57, 840.20, 3285.73, 5821.12, 6976.93, 16618.61, 10054.37, 3803.96)

#Solution
profit = revenue-expenses

profit_after_tax = round(profit*70/100, digits = 2)

profit_margin = round(profit_after_tax/revenue, digits=2)*100
profit_margin
mean_profit = mean(profit)

# 1st way:
good_months <- vector()
bad_months <- vector()
for (i in 1:length(profit_after_tax)){
  if(profit_after_tax[i]>mean_profit){
    good_months <- append(good_months, i)
  }
  else{
    bad_months <- append(bad_months, i)
  }
}

# 2nd way:
good_months2 = profit_after_tax > mean_profit
bad_months2 = !good_months2

# Get index of Max and Min value:
which.max(profit_after_tax)
which.min(profit_after_tax)

best_month = profit_after_tax == max(profit_after_tax)
best_month







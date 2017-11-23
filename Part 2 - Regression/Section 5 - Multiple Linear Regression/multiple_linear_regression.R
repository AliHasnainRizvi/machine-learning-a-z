# Multiple Linear Regression

# Importing the dataset
dataset = read.csv('50_Startups.csv')

dataset$State = factor(dataset$State,
                       levels = c('New York', "California", 'Florida'),
                       labels = c(1,2,3)
                       )

library(caTools)
set.seed(123)
split = sample.split(dataset$Profit , SplitRatio = 0.8)
training_set = subset(dataset, split == TRUE)
test_set = subset(dataset, split == FALSE)

regressor = lm(formula = Profit ~ R.D.Spend,
               data = dataset
               )

y_pred = predict(regressor, newdata = test_set)
library(ggplot2)

ggplot() +
  geom_point(aes(y_pred, y_pred), color = 'red') +
  geom_point(aes(test_set$Profit, test_set$Profit), color='green') 

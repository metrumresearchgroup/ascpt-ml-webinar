# Installation testing script
# This script runs a trivial model with xgboost

# Source: https://xgboost.readthedocs.io/en/stable/get_started.html
library(xgboost)
library(tidyverse)
library(tidymodels)

data(agaricus.train, package='xgboost')
data(agaricus.test, package='xgboost')
train <- agaricus.train
test <- agaricus.test
# fit model
bst <- xgboost(data = train$data, label = train$label, max.depth = 2, eta = 1, nrounds = 2,
               nthread = 2, objective = "binary:logistic")

# The output should look approximately like
#   [1]	train-logloss:0.233376 
#   [2]	train-logloss:0.136658
# predict
pred <- predict(bst, test$data)


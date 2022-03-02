### Using Linear regression
### Predict the Price (Price) for used Toyota Corolla cars.
### Use the follwoing three predictors Age_08_04, KM, Fuel_Type
library(forecast)


car.df <- read.csv("ToyotaCorolla.csv")

# partition data into Training (70%) and Validation (30%) datasets

train.rows <- sample(rownames(car.df), dim(car.df)[1]*0.7)

train.data <- car.df[train.rows, ]
 
valid.rows <- setdiff(rownames(car.df), train.rows) 
valid.data <- car.df[valid.rows, ]
head(train.data)
# use lm() to run a linear regression of Price on the 
# three predictors in the training set. 

reg <- lm(Price ~ .-Model -mfg_Year, data = car.df, subset = train.rows) 
c.res <- data.frame(train.data$Price, reg$Model, reg$mfg_Year)
head(c.res)

#  use options() to ensure numbers are not displayed in scientific notation.
options(scipen = 999)

# Display the results (summary()) of the linear regression

summary(train.data)
# use predict() to make predictions on a new set. 

pred <- predict(reg, newdata = valid.data)
cl.res <- data.frame(valid.data$Price, pred, residuals = 
                       valid.data$Price - pred)
head(c.res)



predict(train.data)
# use accuracy() to compute common accuracy measures.
# recall that accuracy is computed against the validation dataset
accuracy(train.data)







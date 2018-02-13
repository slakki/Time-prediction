library(statmod)
library(car)
library(Metrics) #For rmse function
set.seed(1)

dir_path <- "/Users/sirisha/Desktop/Desktop/Fall 2017/Adv Stats/Project/661150823_Project-Mid Report"
setwd(dir_path)
rm(list=ls())
infile <-"vend_machine_data.csv"

#Need to read the csv file to a table
data <- read.table(infile, header = TRUE, sep = ",")

#Splitting the dataset into training and test datasets
train = sample(dim(data)[1], dim(data)[1]*0.8)
data.train = data[train, ]
data.test = data[-train, ]

####################################################

##Base line model
best.guess <- mean(data.train$Time)
rmse_baseline <- rmse(data.test$Time,best.guess)
rmse_baseline

####################################################

##Linear Regression models

#Plotting the data for the Products versus the time taken
par(mfrow=c(1,1))
plot(data.train$Products, data.train$Time, main = "Time Versus products", xlab = "Products", ylab = "Time")

#Linear model built for Time Vs Products
lm_prod <- lm(Time ~ Products, data = data.train)

#To find the Intercepts and co efficients of the linear model function
summary.lm(lm_prod)
abline(3.0354,2.1790)

#Plot the model
par(mfrow=c(1,2))
plot(lm_prod)

##Conversion to a data frame
#df=data.frame(data.train)

####################################################

#Plotting the data for the distance versus the time taken
par(mfrow=c(1,1))
plot(data.train$Distance, data.train$Time, main = "Time Versus distance", xlab = "Distance", ylab = "Time")

#Linear model built for Time Vs Distance
lm_dist <- lm(Time ~ Distance, data = data.train)

#To find the Intercepts and co efficients of the linear model function
summary.lm(lm_dist)
abline(4.961841, 0.043885)

#Plot the model
par(mfrow=c(1,2))
plot(lm_dist)

####################################################

##A 3D plot for the same scatterplot as above
library(scatterplot3d)
par(mfrow=c(1,1))
scatterplot3d(df[,1:3],
              main="3D Scatter Plot",
              xlab = "Products",
              ylab = "Distance",
              zlab = "Time")

####################################################

###Multiple Linear Regression
par(mfrow=c(1,2))

#Multiple Linear regression model built for Time Vs Products and Distance, its summary and the plot
lm_multiregress <- lm(Time ~ Products + Distance, data = data.train)
summary.lm(lm_multiregress)
vif(lm_multiregress)
plot(lm_multiregress)

#RMSE values for the multiple linear regression model
Time_pred = predict(lm_multiregress, data.test)
rmse_pred <- rmse(data.test$Time, Time_pred)
rmse_pred

####################################################

#Multiple linear model built for the variables with interaction factor, its summary and the plot
lm_multiregress1 <- lm(Time ~ Products + Distance + (Products * Distance), data=data.train)
summary.lm(lm_multiregress1)
#plot(lm_multiregress1)

#RMSE values for the multiple linear regression model
Time_pred1 = predict(lm_multiregress1, data.test)
rmse_pred1 <- rmse(data.test$Time, Time_pred1)
rmse_pred1

####################################################

#Gamma regression model
glm.time <- glm(Time~Products+Distance,data = data.train,family=Gamma)
summary(glm.time)
plot(glm.time)

Time_pred_glm = predict(glm.time, data.test)
rmse <- rmse(data.test$Time, Time_pred_glm)
rmse

## R programming. Quiz 3. Week 3

## Question 1
library(datasets)
data(iris)
x = iris['Sepal.Length'][iris['Species']=='virginica']
mean(x)

## Question 2
apply(iris[, 1:4], 2, mean)

## Question 3
## How can one calculate the average miles per gallon (mpg) 
## by number of cylinders in the car (cyl)?
library(datasets)
data(mtcars)
with(mtcars, tapply(mpg, cyl, mean))
tapply(mtcars$mpg, mtcars$cyl, mean)

## Question 4
with(mtcars, tapply(mpg, cyl, mean))
y = with(mtcars, tapply(hp, cyl, mean))
y[3] - y[1]


## Question 5
debug(ls)
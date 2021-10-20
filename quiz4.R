## Quiz 4

## Question 1
set.seed(1)
rpois(5, 2)

## Question 5
set.seed(10)
x <- rep(0:1, each = 5)
e <- rnorm(10, 0, 20)
y <- 0.5 + 2 * x + e
x
e
y
plot(x, y)

## Question 8
library(datasets)
Rprof()
fit <- lm(y ~ x1 + x2)
Rprof(NULL)
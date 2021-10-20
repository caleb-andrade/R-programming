## Author:        Caleb Andrade
## Created:       Aug/17/2015
## Programming Assignment 1 part 3 - R programming

corr <- function(directory, threshold = 0) {
    old.dir = getwd()
    setwd(directory)
    files <- list.files(pattern = "*.csv")
    corr = c()
    for (idx in 1:332) {
        monitor <- read.csv(files[idx])
        good <- complete.cases(monitor)
        temp <- as.vector(monitor[good,])
        if (nrow(temp) > threshold){
            corr = c(corr, cor(temp["sulfate"], temp["nitrate"]))
        }
    }
    setwd(old.dir)
    as.vector(corr)
}

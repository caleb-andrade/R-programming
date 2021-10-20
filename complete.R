## Author:        Caleb Andrade
## Created:       Aug/17/2015
## Programming Assignment 1 part 2 - R programming

complete <- function(directory, id = 1:332) {
    old.dir = getwd()
    setwd(directory)
    files <- list.files(pattern = "*.csv")
    idnum = c()
    nobs = c()
    for (idx in id) {
        monitor <- read.csv(files[idx])
        good <- complete.cases(monitor)
        temp <- as.vector(monitor[good,])
        if (nrow(temp) != 0){
            nobs <- c(nobs, nrow(temp))
            idnum <- c(idnum, idx)
        }
    }
    setwd(old.dir)
    as.data.frame(cbind(idnum, nobs))
}

## Author:     Caleb Andrade
## Created:    Aug/17/2015
## Data Science Specialization - R programming Week 2

pollutantmean <- function(directory, pollutant, id = 1:332) {
    old.dir = getwd()
    setwd(directory)
    files <- list.files(pattern = "*.csv")
    totalsum = 0
    measures = 0
    for (idx in id) {
        monitor <- read.csv(files[idx])
        good <- complete.cases(monitor[pollutant])
        temp <- as.vector(monitor[good,][pollutant])
        if (nrow(temp) != 0) {
            totalsum = totalsum + sum(temp)
            measures = measures + nrow(temp)
        }
    }
    setwd(old.dir)
    if (measures != 0) {
        round(totalsum / measures, digits = 3)
    }
    else {
        0
    }
}

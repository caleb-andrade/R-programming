## Author:         Caleb Andrade
## Created:        Aug/19/2015
## Last modified:  Aug/19/2015
##
## Programming Assignment 2: Lexical Scoping
## R programming. Data Science Specialization 
## Coursera & Johns Hopkins University (Bloomberg School of public health)
##
## This code implements two functions to cache the inverse of a Matrix if
## the inverse has to be recomputed and the matrix has not changed.


## This function creates an object (a "cacheable" matrix), consisting 
## of a list that stores 4 functions: "set" defines a matrix; "get"
## returns the matrix; "set_inv" defines the inverse; 
## "get_inv" returns the inverse.

makeCacheMatrix <- function(x = matrix()) {
    inv_matrix <- NULL
    
    fset <- function(y) {
        x <<- y
        inv_matrix <<- NULL
    }
    
    fget <- function() {
        x
    }
    
    fset_inv <- function(inverse) {
        inv_matrix <<- inverse
    }
    
    fget_inv <- function() {
        inv_matrix
    }
    
    list(set = fset, get = fget, 
         set_inv = fset_inv, get_inv = fget_inv)
    
}


## This function computes the inverse of a "cacheable" matrix, that is,
## if the object that stores the matrix stores also the inverse, it returns
## the inverse. But if the inverse is NULL in the object, then it calculates
## the inverse and stores it in the object.

cacheSolve <- function(x, ...) {
    ## Return a matrix that is the inverse of 'x'
    inverse <- x$get_inv()
    if(!is.null(inverse)) {
        message("getting cached data")
        return(inverse)
    }
    matrix <- x$get()
    inverse <- solve(matrix, diag(nrow(matrix)))
    x$set_inv(inverse)
    inverse
}

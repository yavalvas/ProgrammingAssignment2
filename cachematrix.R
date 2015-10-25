# The inversion of large matrixes could be very slow and resource-intensive. It's available to 
# achive computational advantages by using of caching of the computational result and using
# of the cached result on demand (depending on parameters).
# The following functions are quite good for caching and restoring of inverted matrixes

# makeCacheMatrix function return a list with the following interface as a function-objects:
# * set - setter function to make an assignment of the value of the matrix.
# * get - getter function to get the value of the matrix.
# * setInverse - setter function of the inversed matrix.
# * getInverse - getter function, which returns inversed version of matrix.
makeCacheMatrix <- function(x = matrix()) {
    inverted <- NULL
    set <- function(y) {
        x <<- y
        inverted <<- NULL
    }
    get <- function() x
    setInverse <- function(inverse) inverted <<- inverse
    getInverse <- function() inverted
    list(set=set, 
         get=get, 
         setInverse=setInverse, 
         getInverse=getInverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
}

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


# cacheSolve function returns the inverse of the created matrix.
# It checks if the inverse was computed. This function gets the cached result and don't make any computing.
# If inverse wasn't computed yet, the function computes it ans sets the result to the cache by setter function.
cacheSolve <- function(x, ...) {
    inverted <- x$getInverse()
    if(!is.null(inverted)) {
        message("cached data.")
        return(inverted)
    }
    data <- x$get()
    inverted <- solve(data)
    x$setInverse(inverted)
    inverted
}

# The example of usage:
#> x = cbind(c(9.4, 2.5, 6.3), c(21/2, 3., 43.), c(54,2/4, 5.6))
#> cacheList = makeCacheMatrix(x)
#> cacheSolve(cacheList)
#             [,1]        [,2]          [,3]
#[1,] -0.001015932  0.48920356 -0.0338824048
#[2,] -0.002345289 -0.06215773  0.0281650867
#[3,]  0.019151394 -0.07307143  0.0004215036
#> cacheSolve(cacheList)
#cached data.
#             [,1]        [,2]          [,3]
#[1,] -0.001015932  0.48920356 -0.0338824048
#[2,] -0.002345289 -0.06215773  0.0281650867
#[3,]  0.019151394 -0.07307143  0.0004215036

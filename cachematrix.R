## functions to compute inverse of matrix or retrieve cached inverse for faster computation

## this function creates a special matrix that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
    inv <- NULL
    set <- function(y) {
        x <<- y
        inv <<- NULL
    }
    get <- function() x
    setsolve <- function(solve) inv <<- solve
    getsolve <- function() inv
    list(set = set, get = get,
         setsolve = setsolve,
         getsolve = getsolve)

}


## this function computes the inverse of the special matrix or retrieves the cached inverse

cacheSolve <- function(x, ...) {
    inv <- x$getsolve()
    if(!is.null(inv)) {
        message("getting cached matrix inverse")
        return(inv)
    }
    data <- x$get()
    inv <- solve(mat, ...)
    x$setsolve(inv)
    inv
}

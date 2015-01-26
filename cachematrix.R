



## The makeCacheMatrix function creates a special matrix object  
## that can cache its inverse. This function takes a matrix as an
## argument and returns a list of functions to set/get matrix
## and set/get invserse of a matrix.

makeCacheMatrix <- function(x = matrix()) {
	m <- NULL
	set function(y) {
		x <<- y
		m <<- NULL
	}
	get <- function() x
	setinverse <- function(solve) m <<- solve
        getinverse <- function() m
        list(set = set, get = get, setinvese = setinvese,
				   getinverse = getinverse)

}

## The cacheSolve function computes the inverse of the 
## matrix returned by makeCacheMatrix above. If the inverse has 
## already been calculated (and the matrix has not changed), 
## then the cachesolve retrieves the inverse from the cache.
## If matrix is changed it calculates the inverse without
## retrieving the cache.

										      cacheSolve <- function(x, ...) {
	      	m<-x$getinverse()
		if(!is.null(m)) {
		   	message("Getting the cached data")
		      	return(m)
	        }
											        data <- x$get()
	        m <- solve(data)
										## Return a matrix that is inverse of the input data.

	x$setinverse(m)
	m
}

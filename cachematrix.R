## pair of functions that cache the inverse of a matrix
## How to run code: 
## lets define matrix: x<- matrix(c(1,2,3,4), nrow=2, ncol=2) 
## define object: yy<-makeCacheMatrix(x)
## now we can run: cacheSolve(yy)
## after first run result is:[,1] [,2]
##                      [1,]   -2  1.5
##                      [2,]    1 -0.5
## after second run result is:> cacheSolve(yy)
##                              getting cached data
##                              [,1] [,2]
##                        [1,]   -2  1.5
##                        [2,]    1 -0.5


## makeCacheMatrix: This function creates a special 
## "matrix" object that can cache its inverse

makeCacheMatrix <- function(x = matrix()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) m <<- inverse
  getinverse <- function() m
  list(set = set, 
       get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


##cacheSolve: This function computes the inverse of the special "matrix" returned by makeCacheMatrix above. If the inverse has already been calculated (and the matrix has not changed), 
##then the cachesolve should retrieve the inverse from the cache.

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  mm <- x$get()
  m <- solve(mm)
  x$setinverse(m)
  m
}

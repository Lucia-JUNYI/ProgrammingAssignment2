##I will cache the inverse of a matrix on the whole

##To set the matrix and its inverse, I tried to create a list of functions
makeCacheMatrix <- function(x = matrix()) {
  g <- NULL
  set <- function(y){
          x <<- y
          g <<- NULL
  }
  get <- function()x
  setInverse <- function(inverse) g <<- inverse
  getInverse <- function() g 
  list(set = set, get = get, 
  setInverse = setInverse, 
  getInverse = getInverse)
}

##If an inverse hasn't been cached before, I need to make this following function to solve it. 

cacheSolve <- function(x, ...) {
## Return a matrix that is the inverse of 'x'
  g <- x$getInverse()
  if(!is.null(g)){
          message("getting cached data")
          return(g)
  }
  mat <- x$get()
  g <- solve(mat,...)
  x$setinverse(g)
  g
}

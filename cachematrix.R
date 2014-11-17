# makeCacheMatrix is a function that returns a list of functions.
# Matrix inversion is a potentially time-consuming computation. 
# Calculating the inverse of a matrix is a fast operation for small matrices. 
# However, for a very large matrix, it may take too long to compute the inverse, 
# especially if it has to be computed repeatedly (e.g. in a loop). 
# If the contents of a matrix are not changing, it may make sense to cache the value 
# of the inverted matrix so that when we need it again, it can be looked up in the 
# cache rather than recomputed. 
# The function makeCacheMatrix created an object to store a matrix and its inverse.
# The function cacheSolve takes a matrix object created with the makeCacheMatrix and returns 
# the cached inverse or recomputes the inverse if the matrix has changed.
# The object has functions get() and set() to get/set the matrix 
# and getinverse() and setinverse() to access the inverse.


makeCacheMatrix <- function(x = matrix()) {
  inverse <- NULL
  set <- function(y) {
    x <<- y
    inverse <<- NULL
  }
  get <- function() x
  setinverse <- function(inv) inverse <<- inv
  getinverse <- function() inverse
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}


# The function cacheSolve takes a special matrix object created with
# the makeCacheMatrix function and calculates its inverse or returns a 
# cached instance of its inverse


cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  inv <- x$getinverse()
  if(!is.null(inv)) {
    message("getting cached inverted matrix")
    return(inv)
  }
  inv <- solve(x$get())
  x$setinverse(inv)
  inv
}
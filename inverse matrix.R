

rm(list=ls())


install.packages("matlib")

library(matlib)




## I loaded a package called "matlib" to find the inverse of the matrix

## This function works the same as example.  

makeCacheMatrix <- function(x = matrix()) {
  
  m<-NULL
  
  set<-function(y){
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setinverse <- function(inverse) m <<- inverse
  getinverse<-function() m
  list(set = set, get = get,
       setinverse = setinverse,
       getinverse = getinverse)
}
## Then get the inverse of the cachematrix

cacheSolve <- function(x, ...) {
  ## Return a matrix that is the inverse of 'x'
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- inv(data, ...)
  x$setinverse(m)
  m
}

B <- matrix(c(1,2,3,4),2,2)
A<-makeCacheMatrix(B)
cacheSolve(A)

## And we can get answer

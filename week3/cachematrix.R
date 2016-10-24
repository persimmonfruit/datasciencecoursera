## This a homework for leaning R, for the purpose to avoid repeated time-consuming calculation 
## for the same data by R scopping property. 
## Matrix inversion is usually a costly computation and it makes sense 
## to caching the inverse of a matrix rather than compute it aganin again...
## According to the requirement, the codes should be splied into two function, one is
## is called makeCacheMatrix, one is called cacheSolve.


###makeCacheMatrix: This function creates a special "matrix" object that can cache its inverse.
makeCacheMatrix <- function(x = matrix()) {
  
    m <- NULL
    set <- function(y) {
      x <<- y
      m <<- NULL
    }
    get<- function() x
    setsolve <- function(solve) m <<-solve
    getsolve <- function() m
    list(set = set, get = get,
         setsolve = setsolve,
         getsolve = getsolve)
  }
  


###This function computes the inverse of the special "matrix" returned by 
###makeCacheMatrix above. If the inverse has already been calculated 
###(and the matrix has not changed), then the cachesolve should retrieve the 
###inverse from the cache.

cacheSolve <- function(x, ...) {

    m <- x$getsolve()
    if(!is.null(m)) {
      message("getting cached data")
      return(m)
    }
    data <- x$get()
    m <- solve(data, ...)
    x$setsolve(m)
    m
  }       
  
####TESINg above functions.
#First step, create a square matrix
m1=rbind(c(1, -1/4), c(-1/4, 1))

#second step, calulating the inverse of matrix "m1"
m2 = makeCacheMatrix(m1)

#third step: getting the cached data if the input matrix is not changed
cacheSolve(m2)




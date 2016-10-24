library(datasets)
data(iris)
?iris
iris

head(iris)

s<-split(iris,iris$Species)
sapply(s,function(iris) colMeans(iris[,c("Sepal.Length","Sepal.Width","Petal.Length","Petal.Width")]))

head(iris)
apply(iris[, 1:4], 2, mean)

library(datasets)
data(mtcars)
?mtcars
head(mtcars)

with(mtcars, tapply(mpg, cyl, mean))
tapply(mtcars$mpg, mtcars$cyl, mean)
sapply(split(mtcars$mpg, mtcars$cyl), mean)

head(mtcars)
tapply(mtcars$hp, mtcars$cyl, mean)

209.214-82.636

debug(ls)
ls(iris)

makeVector <- function(x = numeric()) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setmean <- function(mean) m <<- mean
  getmean <- function() m
  list(set = set, get = get,
       setmean = setmean,
       getmean = getmean)
  

      

#4
 x <- 4L
class(x)

#5
y <- c(4, TRUE)
class(y)

#8
x <- list(2, "a", "b", TRUE)
x[[2]]

#10
x <- c(3, 5, 1, 10, 12, 6)
x[x < 6] <- 0
x[x <= 5] <- 0


x <- c(17, 14, 4, 5, 13, 12, 10)
x[x > 10] <- 4
View(x)


x <- 1:4
y <- 2:3
z<-x+y
View (z)
class(z)

setwd("C:/Users/X/Documents/improvements/R programming")

#12
x<- read.csv("hw1_data.csv")
x1<-x[1:2,]
View(x1)
View(x)

#13
x2<-x[47,]
View(x2)


#16
length(which(is.na(x$Ozone)))
View(x)


y=subset(x, Ozone>31 & Temp >90)


mean(y$Solar.R)



z=subset(x,Month==6)
mean(z$Temp)



w=subset(x,Month==5)
#remove missing value
max(w$Ozone,na.rm=T)
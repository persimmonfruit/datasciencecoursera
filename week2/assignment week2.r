
setwd("C:/Users/X/Documents/improvements/R programming/week2/")

## dir <- "C:/Users/X/Documents/improvements/R programming/week2/specdata/"


pollutantmean<-function(directory, pollutant, flist) {
  fs = length(flist)
  for (i in 1:fs) {  
    id = flist[i]
    if (id<10) file = paste0(directory,"/00",id,".csv")
    if (id>9 & id<100) file = paste0(directory,"/0",id,".csv")
    if (id>99) file = paste0(directory,"/",id,".csv")
    pollutanti<-  read.csv(file, header = TRUE)
    
    if (i==1) tot=pollutanti
    else tot<-rbind(tot, pollutanti)
  }
  col = which(colnames(tot) == pollutant)
  pollutantmean=mean(tot[,col],na.rm=T)
  return(pollutantmean)
}

pollutantmean("specdata","sulfate",1:10)
pollutantmean("specdata","nitrate",70:72)
pollutantmean("specdata","sulfate",34)
pollutantmean("specdata","nitrate",1:332)
#2

pollutantn<-function(directory, idlist) {
  
  nid = length(idlist)
  for (i in 1:nid) { 
    id = idlist[i]
    if (id<10) file = paste0(directory,"/00",id,".csv")
    if (id>9 & id<100) file = paste0(directory,"/0",id,".csv")
    if (id>99) file = paste0(directory,"/",id,".csv")
    
    pollutanti<-  read.csv(file, header = TRUE)
    ni = length(which( complete.cases(pollutanti)) )
      
    if (i==1) rtot= c(id, ni)
    else rtot<-rbind(rtot, c(id, ni))
  }
 
  return(rtot)
}

pollutantn("specdata",c(2,4,6))

pollutantn("specdata", c(6, 10, 20, 34, 100, 200, 310))



cc=pollutantn("specdata", 332:1)
set.seed(42)
use <- sample(332, 10)
print(cc[use, ])



#3
crr<-function(directory, thres=0) {
  crs = numeric()
  for (id in 1:332) { 
    
    if (id<10) file = paste0(directory,"/00",id,".csv")
    if (id>9 & id<100) file = paste0(directory,"/0",id,".csv")
    if (id>99) file = paste0(directory,"/",id,".csv")
    
    pollutanti<-  read.csv(file, header = TRUE)
    pollutanti <- pollutanti[complete.cases(pollutanti),]
    ni = length(complete.cases(pollutanti))
    
   if (ni>=thres) {
     cri=cor(pollutanti$sulfate,pollutanti$nitrate)
     crs = c(crs, cri)
   }
   # return(cri)
  }
 
  return(crs)

}

cr("specdata",400)

cr <- cr("specdata")                
cr <- sort(cr)                
set.seed(868)                
out <- round(cr[sample(length(cr), 5)], 4)
print(out)




cr <- crr("specdata", 129)                
cr <- sort(cr)                
n <- length(cr)                
set.seed(197)                
out <- c(n, round(cr[sample(n, 5)], 4))
print(out)


cr <- crr("specdata", 2000)                
n <- length(cr)                
cr <- crr("specdata", 1000)                
cr <- sort(cr)
print(c(n, round(cr, 4)))


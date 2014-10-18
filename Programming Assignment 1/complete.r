complete <- function(directory, id = 1:332){
  filename_length <- 7 ## all filenames have 7 characters 
  zeros <- paste(rep(0,3),collapse ="") ## zeros to add to beginning of id
  nobs <- NULL
  for (i in id){
    filename <- paste(zeros,i,".csv", sep="")
    size <- nchar(filename)
    filename <- paste(directory,"/",substr(filename,size-(filename_length-1),size),sep="")
    data <- read.csv(filename)
    nobs <- c(nobs, sum(complete.cases(data)))
  }
  
  return(data.frame(id,nobs))
}
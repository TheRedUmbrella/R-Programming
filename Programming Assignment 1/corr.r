corr <- function(directory, threshold = 0){
  filename_length <- 7 ## all filenames have 7 characters 
  zeros <- paste(rep(0,3),collapse ="") ## zeros to add to beginning of id
  completes <- complete(directory)
  completes <- completes[completes["nobs"]>threshold,"id"]
  correlations = numeric()
  for (i in completes){
      filename <- paste(zeros,i,".csv", sep="")
      size <- nchar(filename)
      filename <- paste(directory,"/",substr(filename,size-(filename_length-1),size),sep="")
      data <- read.csv(filename)
      nitrates <- data[complete.cases(data),"nitrate"]
      sulfates <- data[complete.cases(data),"sulfate"]
      correlations <- c(correlations, cor(nitrates,sulfates))
  }
  return(correlations)
}
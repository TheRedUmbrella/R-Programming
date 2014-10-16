pollutantmean <- function(directory, pollutant, id = 1:332){
  filename_length <- 7 ## all filenames have 7 characters 
  zeros <- paste(rep(0,3),collapse ="") ## zeros to add to beginning of id
  filenames <- paste(zeros,id,".csv", sep="")
  sizes <- nchar(filenames)
  filenames <- paste(directory,"/",substr(filenames,sizes-(filename_length-1),sizes),sep="")
  
  return(filenames)
}
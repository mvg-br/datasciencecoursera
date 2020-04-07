folder<-"C:/Users/marco/Desktop/R-Coursera-Course/datasciencecoursera/Data/specdata/"

pollutantmean<-function(directory, pollutant,id=1:332){
  actual_dir<-getwd()
  setwd(directory)
  vect_mean<-c()

  for(i in id) {
    
    file_open<-paste(as.character(i),".csv",sep="")
    
    if (nchar(file_open)==5){
      file_open<-paste("00",file_open,sep="")
    } else if (nchar(file_open)==6) {
      file_open<-paste("0",file_open,sep="")
    }
    
    print(file_open)
    
    file_data <- read.csv(file_open,header=T, sep=",")
    file_data <- file_data[!is.na(file_data[, pollutant]), pollutant]
    vect_mean <- c(vect_mean, file_data)
  }
  result <- mean(vect_mean)
  
  setwd(actual_dir)
  return(result)
}

pollutantmean(folder,"sulfate",1:10)
pollutantmean(folder,"nitrate",70:72)
pollutantmean(folder,"nitrate",23)

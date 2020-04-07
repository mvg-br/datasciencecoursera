folder <- "C:/Users/marco/Desktop/R-Coursera-Course/datasciencecoursera/Data/specdata/"

complete <- function(directory, id=1:332){
  actual_wd <- getwd()
  setwd (directory)
  file_data<-c()
  file_count<-c()

  
  for(i in id) {
    
    file_open<-paste(as.character(i),".csv",sep="")
    
    if (nchar(file_open)==5){
      file_open<-paste("00",file_open,sep="")
    } else if (nchar(file_open)==6) {
      file_open<-paste("0",file_open,sep="")
    }
    
    file_data<-read.csv(file_open,header=T, sep=",")
#    file_data<- file_data[!is.na(file_data)]    
#    count_entries <- sum(!is.na(file_data[,"sulfate"] | !is.na(file_data[,"nitrate"])))
    file_count<-c(file_count,i,nrow(na.omit(file_data)))
  }
  final_matrix<-matrix(file_count,ncol=2,byrow=TRUE)
  final_dataframe<-as.data.frame(final_matrix)
  
  names(final_dataframe)<-c("id","nobs")
  
  setwd(actual_wd)
  return(final_dataframe)
  
}

complete(folder, 30:25)


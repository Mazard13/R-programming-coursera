complete <- function(directory, id = 1:332){
  
  setwd(directory) # settting working directory
  
  file_list <- list.files() # creating a vector of files in directory
  
  i <- 1
  
  for (file in file_list){
    temp_data <- read.csv(file)
    
    for (y in id){ #taking all id IN INCREASING ORDER!(warning)
      
      if (temp_data[2,4] == y){
        clean_data <- temp_data[complete.cases(temp_data),] #removing all NAs
        wanted_data <- c(y,sum(clean_data[,4]== y ))  # creating vectors of id and sum(id)
    
        if (i==1){
          dataset <- wanted_data
          i<-i+1
        }  
        if(i>1){
          dataset<-rbind(dataset,wanted_data)
        }
      }
    }
  }
  frame<-data.frame(id = dataset[,1],nobs = dataset[,2])
  
 frame
}


    
    
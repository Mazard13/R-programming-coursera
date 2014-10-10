complete <- function(directory, id = 1:332){
  
  setwd(directory) # settting working directory
  
  file_list <- list.files() # creating a vector of files in directory
  
  i <- 1
  
  for (y in id){ #for outside gives preference to order
    for (file in file_list){ 
    temp_data <- read.csv(file)
        
      if (temp_data[2,4] == y){   # 2 is random . can put any value in the range of the column
        clean_data <- temp_data[complete.cases(temp_data),] #removing all NAs
        wanted_data <- c(y,sum(clean_data[,4]== y ))  # creating vectors of id and sum(id)
    
        if(i>1){
          dataset<-rbind(dataset,wanted_data)
          break
        }
        if (i==1){#if this condition was placed earlier , output would have the initial 2 rows as same
          dataset <- wanted_data
          i<-i+1
          break
        }  
      }
    }
  }
  frame<-data.frame(id = dataset[,1],nobs = dataset[,2]) #defined data frames with column names
  
 frame
}


    
    
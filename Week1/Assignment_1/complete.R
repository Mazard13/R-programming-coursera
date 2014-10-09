complete <- function(directory, id = 1:332){
  
  setwd(directory)
  
  file_list <- list.files()
  
  i<- 1
  
  for (file in file_list){
    temp_data <- read.csv(file)
    for (y in id){
      if (temp_data[2,4] == y){
        clean_data <- temp_data[complete.cases(temp_data),] #removing all NAs
        #2 is irrelevant . just capturing value in column 4
        wanted_data <- c(clean_data[2,4],sum(clean_data[,4]==clean_data[2,4]))
    
        if (i==1 & clean_data[2,4]==y){
          dataset <- wanted_data
          i<-i+1
        }  
        else{
          dataset<-rbind(dataset,wanted_data)
        }
      }
    }
  }
    
  frame<-data.frame(dataset[,1:2])
  
  #using ID constraints
  #id_min<-min(id)
  #id_max<-max(id)
  
  #final_complete <- subset(frame,frame$X1 >= id_min & frame$X1 <= id_max)
  
  frame
}
    
    
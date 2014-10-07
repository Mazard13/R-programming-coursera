pollutantmean <- function(directory, pollutant , id = 1:332){
  
  setwd(directory)
  #merge all files to form one
  file_list <- list.files()
  
  #merging files into dataset
  for(file in file_list){ 
    
    #temporarily storing files
    temp_data <- read.csv(file)
    
    clean_data <- temp_data[complete.cases(temp_data)]
    
    #if merged data exists
    if(exists("dataset")){
      dataset <- rbind(dataset,clean_data)
    }
    
    #if merged data doesn't exist
    if (!exists("dataset")){
      dataset <- clean_data
      }
    rm(temp_data)
    rm(clean_data)
  }
  write.csv(dataset,"final.csv")
}


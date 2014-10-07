pollutantmean <- function(directory, pollutant , id = 1:332){
  
  setwd(directory)
  #merge all files to form one
  file_list <- list.files()
    
  i<-1
  
  #merging files into dataset
  for(file in file_list){ 
    
    #temporarily storing files
    temp_data <- read.csv(file)
    
    clean_data <- temp_data[complete.cases(temp_data),]
    
    if(i==1){
      dataset<-clean_data
    }
    else{
      dataset<-rbind(dataset,clean_data)
    }
  i<-i+1
  }
  #dataset created - complete file with all IDs not containing NA values
  
  #bringin in pollutants
  if (pollutant == "sulphate"){
    x <- 2 
  }
  if (pollutant == "nitrate"){
    x <- 3
  }
  
  #Using ID
  data_ID <- subset(dataset,dataset$ID == id)
  return(mean(data_ID[,x]))
}


pollutantmean <- function(directory, pollutant , id = 1:332){
  
  setwd(directory)
  #merge all files to form one
  file_list <- list.files()
    
  i<-1
  
  #bringing in pollutants
  if (pollutant == "sulfate"){
    x <- 2 
  }
  if (pollutant == "nitrate"){
    x <- 3
  }
  
  #merging files into dataset
  for(file in file_list){ 
    
    #temporarily storing files
    temp_data <- read.csv(file)
    
    clean_data <- temp_data[complete.cases(temp_data[,x]),] # deletes NA from column x
    
    if(i==1){
      dataset<-clean_data
    }
    else{
      dataset<-rbind(dataset,clean_data)
    }
  i<-i+1
  }
  #dataset created - complete file with all IDs not containing NA values
    
  #Using ID
  id_min<-min(id)
  id_max<-max(id)
  data_ID <- subset(dataset,dataset$ID >= id_min & dataset$ID <= id_max)
  
  mean(data_ID[,x]) # gives mean in column x
}


file <- "hardata.zip"
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
data_path <- "UCI HAR Dataset"
outputs_folder <- "Output Files"

# Ensure that the plyr and data.table packages have been installed for this file to work
library(plyr)
library(data.table)

# Create data and folders   

if(!file.exists(file))
{
  download.file(url,file, mode = "wb")
}

if(!file.exists(outputs_folder))
{
  dir.create(outputs_folder)
} 


##reads a table from the zip data file and applies cols
getTable <- function (filename,cols = NULL)
{
  f <- unz(file, paste(data_path,filename,sep="/"))
  data <- data.frame()
  
  if(is.null(cols))
{
    data <- read.table(f,sep="",stringsAsFactors=F)
} 

  else 
{
    data <- read.table(f,sep="",stringsAsFactors=F, col.names= cols)
}
  
  
  data
  
}

##Reads and creates a complete data set
getData <- function(type, features)
{
  
  subject_data <- getTable(paste(type,"/","subject_",type,".txt",sep=""),"id")
  y_data <- getTable(paste(type,"/","y_",type,".txt",sep=""),"activity")    
  x_data <- getTable(paste(type,"/","X_",type,".txt",sep=""),features$V2) 
  
  return (cbind(subject_data,y_data,x_data)) 
}

##saves the data into the result folder
saveResult <- function (data,name){
  
  file <- paste(outputs_folder, "/", name,".csv" ,sep="")
  write.csv(data,file)
}


#features.txt file used for column names when creating train and test data sets
features <- getTable("features.txt")

# Load the data sets into R 
train <- getData("train",features)
test <- getData("test",features)

#Condition 1. Merges the training and the test sets to create one data set
data <- rbind(train, test)
data <- arrange(data, id)

# Condition 3. Uses descriptive activity names to name the activities in the data set.
activity_labels <- getTable("activity_labels.txt")

# Condition 4. Appropriately labels the data set with descriptive activity names.  
data$activity <- factor(data$activity, levels=activity_labels$V1, labels=activity_labels$V2)

# Condition 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
largedata <- data[,c(1,2,grep("std", colnames(data)), grep("mean", colnames(data)))]
saveResult(largedata,"largedata")

# Condition 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 
tidydata <- ddply(largedata, .(id, activity), .fun=function(x){ colMeans(x[,-c(1:2)]) })
colnames(tidydata)[-c(1:2)] <- paste(colnames(tidydata)[-c(1:2)], "_mean", sep="")

saveResult(tidydata,"tidydata")
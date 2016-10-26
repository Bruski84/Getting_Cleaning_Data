# Code Book 

## Getting and Cleaning Data 
## Data Science Specialisation - Coursera

### Details of the steps completed in the run_analytics.R script 

01. Loads plyr and data.table libraries to use the commands specific to these libraries
02. Downloads and unzips the UCI HAR Dataset data from (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
03. Creates "Output Files" folder 
04. Loads the features.txt file to name the final dataset
05. Loads and merges the train component of the final dataset using X_train.txt, y_train.txt, subject_train.txt
06. Loads and merges the test component of the final dataset using X_test.txt, y_test.txt, subject_test.txt
07. Merges the train and test components into a single dataset - *Condition 1 of the Assignment*
08. Loads activity labels that are set out in the file activity_labels.txt - *Condition 3 of the Assignment*
09. Uses the activity labels to be used as data labels in the dataset - *Condition 4 of the Assignment*
10. Calcluates and adds the mean and std values into the final dataset - *Condition 2 of the Assignment*
11. Creates a file from the dataset, named "largedata.csv" which is saved in the folder "Output Files"
12. Creates a second, independent tidy dataset with the average of each variable for each activity and each subject - *Condition 5 of the Assignment*
13. Creates a file from this second dataset, named "tidydata.csv" which is saved in the folder "Output Files"


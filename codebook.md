# Code Book 

## Getting and Cleaning Data 
## Data Science Specialisation - Coursera

### Details of the steps completed in the run_analytics.R script 

1. Loads library plyr and library data.table to use the commands specific to these libraries
2. Downloads and unzips the UCI HAR Dataset data from (https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
3. Creates "Output Files" folder 
4. Loads feature data set features.txt used for columns
5. Loads and appends train dataset using X_train.txt, y_train.txt, subject_train.txt
**subject_train contains the ids
**y_train contains the activity labels
**X_train contains the data using the feature data set as columns
Loads and appends test dataset using X_test.txt, y_test.txt, subject_test.txt
subject_test contains the ids
y_test contains the activity labels
X_test contains the data using the feature data set as columns
Appends train and test data
Rearrange the data using id
Loading activity labels activity_labels.txt
Changes the data activity row to use the activity labels
Extracts the mean,std into dataset1
Saves dataset1 into result/dataset1.csv
Uses plur to calculate mean on activity for each id
appends _mean to all data columns
saves the tidy dataset2 into result/dataset2.csv
dataset1.csv


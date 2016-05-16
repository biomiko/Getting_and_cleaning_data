# Data source
Data were downloaded from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

# Data binding
Data from test and train set were combained:

## Test set:
1. "subject_test.txt" 
2. "X_test.txt"       
3. "y_test.txt" 

## Train set:
1. "subject_train.txt" 
2. "X_train.txt"       
3. "y_train.txt" 

## Binded dataset containted following variables:
1. "subject_test"
2. "X" - 561 measurments
3. "y" - from the set of c(1,2,3,4,5,6)

# Mean and Mean standard deviation for each measurment
variable "y" correspond to "activity" with the following patern:
1."WALKING" 
2."WALKING_UPSTAIRS" 
3."WALKING_DOWNSTAIRS" 
4."SITTING" 
5."STANDING"
6."LAYING"

"extract_dataset" contains following variables:
1. "subject_test" - from the set of 1:30 (30 participants)
2. "X_mean" - mean of 561 "X" measurments 
3. "X_sd" - sd of 561 "X" measurments
3. "activity" - from the set of c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING","LAYING")

#final_tidy_data_set consist of the average of each variable for each activity and each subject.

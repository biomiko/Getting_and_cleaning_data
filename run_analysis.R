# Load libraries
library(qdap)
library(dplyr)

# Data download
if (!file.exists("data")){dir.create("data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile="./data/dataset.zip")
# Unzip the files
unzip("./data/dataset.zip")

#Read files from the test directory and combain in the single data frame
setwd("UCI HAR Dataset/test")
file_list_test <- list.files(pattern="txt")
file_content_test <- lapply(file_list_test, read.table)
combined.df_test <- do.call(cbind, file_content_test)

# Read files from the train directory and combain in the single data frame
setwd('..')
setwd("train/")
file_list_train <- list.files(pattern="txt")
file_content_train <- lapply(file_list_train, read.table)
combined.df_train <- do.call(cbind, file_content_train)

# Bind both datasets
setwd('..')
full_dataset <- rbind(combined.df_test, combined.df_train)
colnames(full_dataset) <- c("subject_test", replicate(561, "X"), "y")
write.csv(full_dataset, file = "Full_dataset.csv")

# Mean standard deviation for each measurment
extract_dataset <- full_dataset[1]
extract_dataset <- cbind(extract_dataset, apply(full_dataset[2:562], 1 ,mean))
colnames(extract_dataset)[2] <- "X_mean"
extract_dataset <- cbind(extract_dataset, apply(full_dataset[2:562], 1 ,sd))
colnames(extract_dataset)[3] <- "X_sd"
extract_dataset <- cbind(extract_dataset, full_dataset[563])

# Labels the data set with descriptive variable names
extract_dataset$y <-
    multigsub(c("1","2", "3", "4", "5", "6"), 
          c("WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING","LAYING"), 
          extract_dataset$y)
colnames(extract_dataset)[4] <- "activity"
write.csv(extract_dataset, file = "extract_dataset.csv")

# Final tidy data set with the average of each variable for each activity and each subject
final_tidy_data_set <- 
    extract_dataset %>% 
    group_by(subject_test, activity) %>% 
    summarise_each(funs(mean), X_mean, X_sd)
write.csv(final_tidy_data_set, file = "final_tidy_data_set.csv")


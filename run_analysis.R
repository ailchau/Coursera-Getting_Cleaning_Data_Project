# Getting and Cleaning Data: Course Project

# Created: 2016-02-01

# Load libraries.
library(reshape2)
library(dplyr)

# Download the UCI Har Dataset in working directory
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
destinfile <- "./UCI HAR Dataset.zip"
download.file(url, destinfile, method = "curl")

# Unzip UCI HAR Dataset in working directory
unzip(destinfile)


# --------------------------------------------------------------------------------
# 1. Merge the training and the test sets to create one data set.
# --------------------------------------------------------------------------------

# Load the data, activity labels, and subject ID for the training and testing sets
train_data <- read.table("./UCI HAR Dataset/train/X_train.txt")
train_activity <- read.table("./UCI HAR Dataset/train/y_train.txt", col.names=c("activity"))
train_subject <- read.table("./UCI HAR Dataset/train/subject_train.txt", col.names=c( "subject"))

test_data <- read.table("./UCI HAR Dataset/test/X_test.txt")
test_activity <- read.table("./UCI HAR Dataset/test/y_test.txt", col.names=c("activity"))
test_subject <- read.table("./UCI HAR Dataset/test/subject_test.txt", col.names=c("subject"))

# Merge subject ID, activity and train and test data into a single data set
train <- cbind(train_subject, train_activity, train_data)
test <- cbind(test_subject, test_activity, test_data)

full_data <- rbind(train, test)

# Load variable names from features.txt file and name variables in data set
features <- read.table("./UCI HAR Dataset/features.txt", as.is=TRUE, col.names=c("item", "variable"))
names(full_data) <- c("subject", "activity", features$variable)


# --------------------------------------------------------------------------------
# 2. Extract only the measurements on the mean and standard deviation for each measurement.
# --------------------------------------------------------------------------------

# Note: only the mean and standard deviations of the measurement values were extracted from the data. For this reason, variables labeled with "meanFreq" were removed.
var_extract <- grepl("subject|activity|mean()|std()", names(full_data)) & !grepl("meanFreq()", names(full_data))
extract_data <- full_data[, var_extract]

# --------------------------------------------------------------------------------
# 3. Use descriptive activity names to name the activities in the data set.
# --------------------------------------------------------------------------------

# Load activities from file
activity_list <- read.table("./UCI HAR Dataset/activity_labels.txt", as.is=TRUE, col.names=c("code", "activity"))
extract_data$activity <- factor(extract_data$activity, labels=activity_list$activity)

# --------------------------------------------------------------------------------
# 4. Label the data set with descriptive variable names.
# --------------------------------------------------------------------------------

# Remove ()
names(extract_data) <- gsub("()","", names(extract_data), fixed=TRUE)

# Expand shortened terms in variable names to be more descriptive and understandable
names(extract_data) <- gsub("Acc","Acceleration", names(extract_data), fixed=TRUE)
names(extract_data) <- gsub("Mag","Magnitude", names(extract_data), fixed=TRUE)
names(extract_data) <- gsub("Gyro","Gyroscope", names(extract_data), fixed=TRUE)
names(extract_data) <- gsub("mean","Mean", names(extract_data), fixed=TRUE)
names(extract_data) <- gsub("std","StandardDeviation", names(extract_data), fixed=TRUE)
names(extract_data) <- gsub("^t","time-", names(extract_data))
names(extract_data) <- gsub("^f","frequency-", names(extract_data))


# --------------------------------------------------------------------------------
# 5. Create a second independent tidy data set with the average of each variable for each activity and each subject.
# --------------------------------------------------------------------------------

# Melt and cast data with the average of each variable for each activity and each subject.
melt_data <- melt(extract_data, id.vars=c("subject", "activity"))
means <- dcast(melt_data, subject + activity ~ ..., mean)

# Write tidy data set to file
write.table(means, file="./tidy_data.txt", sep="\t")



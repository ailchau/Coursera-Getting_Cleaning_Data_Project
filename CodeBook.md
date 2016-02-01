# Getting and Cleaning Data: Course Project Code Book


## Original Data Set

The data set is the Human Activity Recognition Using Smartphones Data Set originally from the UCI Machine Learning Repository. The data set used for this project was downloaded from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.

The original data set consists of 10299 observations and 563 variables divided into separate files for training and testing data, as well as, subject ID, activity labels, variable labels. 

A description of the data is included below:

"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data."

"The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals)."


## Tidy Data Set

In this tidy data set, there are the mean of each measurement variable (total: 66) for each activity (total: 6) and subject (total: 30). Only the subject ID, activity labels, and mean and standard deviations of the measurement values were extracted from the original data. Variables labeled with "meanFreq" were not included.

Factor variables:
* subject ID
* activity label

Measurement variables:
(notes: '-XYZ' is used to denote 3 separate axial measurements in the X, Y and Z directions)

* Time Domain Signals:

time-BodyAcceleration-Mean-XYZ
time-BodyAcceleration-StandardDeviation-XYZ
time-GravityAcceleration-Mean-XYZ
time-GravityAcceleration-StandardDeviation-XYZ
time-BodyAccelerationJerk-Mean-XYZ
time-BodyAccelerationJerk-StandardDeviation-XYZ
time-BodyGyroscope-Mean-XYZ
time-BodyGyroscope-StandardDeviation-XYZ
time-BodyGyroscopeJerk-Mean-XYZ
time-BodyGyroscopeJerk-StandardDeviation-XYZ
time-BodyAccelerationMagnitude-Mean
time-BodyAccelerationMagnitude-StandardDeviation
time-GravityAccelerationMagnitude-Mean
time-GravityAccelerationMagnitude-StandardDeviation
time-BodyAccelerationJerkMagnitude-Mean
time-BodyAccelerationJerkMagnitude-StandardDeviation
time-BodyGyroscopeMagnitude-Mean
time-BodyGyroscopeMagnitude-StandardDeviation
time-BodyGyroscopeJerkMagnitude-Mean
time-BodyGyroscopeJerkMagnitude-StandardDeviation

* Frequency Domain Signals:

frequency-BodyAcceleration-Mean-XYZ
frequency-BodyAcceleration-StandardDeviation-XYZ
frequency-BodyAccelerationJerk-Mean-XYZ
frequency-BodyAccelerationJerk-StandardDeviation-XYZ
frequency-BodyGyroscope-Mean-XYZ
frequency-BodyGyroscope-StandardDeviation-XYZ
frequency-BodyAccelerationMagnitude-Mean
frequency-BodyAccelerationMagnitude-StandardDeviation
frequency-BodyBodyAccelerationJerkMagnitude-Mean
frequency-BodyBodyAccelerationJerkMagnitude-StandardDeviation
frequency-BodyBodyGyroscopeMagnitude-Mean
frequency-BodyBodyGyroscopeMagnitude-StandardDeviation
frequency-BodyBodyGyroscopeJerkMagnitude-Mean
frequency-BodyBodyGyroscopeJerkMagnitude-StandardDeviation


## Tidying the Data Set

The run_analysis.R that does the following:

* As part of setting up, downloads and unzips the data set.

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement.
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names.
5. From the data set in step 4, creates a second, independent tidy data set (tidy_data.txt) with the average of each variable for each activity and each subject.


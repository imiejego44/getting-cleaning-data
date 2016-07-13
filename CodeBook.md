# Code Book

This document describes the code inside `run_analysis.R`. Original data are taken from: [a https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

The code is splitted in some sections, which do different parts:

* Merging the training and the test sets
* Extraction of the measurements on the mean and standard deviation
* Descriptive activity labeling to name the activities in the data set
* Labeling the data set with descriptive variable names.
* Creation of a second, independent tidy data set from the previous table.  That one contains the average of each variable for each activity and each subject.

## The data
The data used represent data collected from the accelerometers from the Samsung Galaxy S smartphone. The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz has been captured. 


## List of variables

* filepath - is a path to a ".txt" file 
* i - is an index in the filereading loop
* mean_std_inx - list of indexes in "feature.txt" containing mean or standard deviation
* names0 - contains names of label files
* names1 - contains names of test folder files
* names2 - contains names of test folder files

## List of data frames
* 'features','activity_labels' - labels of variables and activities
* 'X_test', 'y_test', 'subject_test' - Test: data, activity names, subject who performed the activity
* 'X_train', 'y_train','subject_train' - Train: the same as above
* X - binded: X_test, X_train
* Y - binded: y_test, y_train
* subject - binded: subject_test, subject_train
* mean_std_inx - indices from feature that contains mean or std in their names
* part_data - the data with mean or std only
* act_labels - merged activity numbers with activity_labels
* activity_table_part_names - data used with activities (and later: also names of variables)
* pre_tidy_set1 - untidy averaged data
* pre_tidy_set2 - removed NA column, renamed etc.
* tidy_set_averages - is the result of the script, containing task data

## What happens

Working directory is set
Files are read:
* Get names
* Load files (from different paths)
Data for train and test are merged separately: activities, variable, subjects
Mean and Standard deviation are extracted
* Grep from "features"
* Cut from data frame
Descriptive activity labels are used
* Merge labels with activity index
* Add only label to the data used
Descriptive variable names added
Data for averaging tidied
* Aggregate
* Remove "old" rows
* Rename new columns from aggregation
* Rename file
* Obtain final tidy product


## Values (variables) in the final file can be more understandable with the following key:
* Acc - accelerometer
* Gyro - gyroscope
*  - XYZ - is used to denote 3-axial signals in the X, Y and Z directions
* Mag -  magnitude of these signals (using the Euclidean norm)
* Time -  time domain signals
* FFT - Fast Fourier Transform of these signals 
* Jerk - Jerk signals
* angle(): Angle between to vectors.
* Body - body acceleration signals
* Gravity - gravity acceleration signals
* Mean -  Mean value
* Std - Standard deviation


## Lis of values in the final file:
* Time.BodyAcc.Mean.X
* Time.BodyAcc.Mean.Y
* Time.BodyAcc.Mean.Z
* Time.GravityAcc.Mean.X
* Time.GravityAcc.Mean.Y
* Time.GravityAcc.Mean.Z
* Time.BodyAccJerk.Mean.X
* Time.BodyAccJerk.Mean.Y
* Time.BodyAccJerk.Mean.Z
* Time.BodyGyro.Mean.X
* Time.BodyGyro.Mean.Y
* Time.BodyGyro.Mean.Z
* Time.BodyGyroJerk.Mean.X
* Time.BodyGyroJerk.Mean.Y
* Time.BodyGyroJerk.Mean.Z
* Time.BodyAccMag.Mean
* Time.GravityAccMag.Mean
* Time.BodyAccJerkMag.Mean
* Time.BodyGyroMag.Mean
* Time.BodyGyroJerkMag.Mean
* FFT.BodyAcc.Mean.X
* FFT.BodyAcc.Mean.Y
* FFT.BodyAcc.Mean.Z
* FFT.BodyAcc-meanFreq()-X
* FFT.BodyAcc-meanFreq()-Y
* FFT.BodyAcc-meanFreq()-Z
* FFT.BodyAccJerk.Mean.X
* FFT.BodyAccJerk.Mean.Y
* FFT.BodyAccJerk.Mean.Z
* FFT.BodyAccJerk-meanFreq()-X
* FFT.BodyAccJerk-meanFreq()-Y
* FFT.BodyAccJerk-meanFreq()-Z
* FFT.BodyGyro.Mean.X
* FFT.BodyGyro.Mean.Y
* FFT.BodyGyro.Mean.Z
* FFT.BodyGyro-meanFreq()-X
* FFT.BodyGyro-meanFreq()-Y
* FFT.BodyGyro-meanFreq()-Z
* FFT.BodyAccMag.Mean
* FFT.BodyAccMag-meanFreq()
* FFT.BodyBodyAccJerkMag.Mean
* FFT.BodyBodyAccJerkMag-meanFreq()
* FFT.BodyBodyGyroMag.Mean
* FFT.BodyBodyGyroMag-meanFreq()
* FFT.BodyBodyGyroJerkMag.Mean
* FFT.BodyBodyGyroJerkMag-meanFreq()
* angle(Time.BodyAccMean,gravity)
* angle(Time.BodyAccJerkMean),gravityMean)
* angle(Time.BodyGyroMean,gravityMean)
* angle(Time.BodyGyroJerkMean,gravityMean)
* angle(X,gravityMean)
* angle(Y,gravityMean)
* angle(Z,gravityMean)
* Time.BodyAcc.Std.X
* Time.BodyAcc.Std.Y
* Time.BodyAcc.Std.Z
* Time.GravityAcc.Std.X
* Time.GravityAcc.Std.Y
* Time.GravityAcc.Std.Z
* Time.BodyAccJerk.Std.X
* Time.BodyAccJerk.Std.Y
* Time.BodyAccJerk.Std.Z
* Time.BodyGyro.Std.X
* Time.BodyGyro.Std.Y
* Time.BodyGyro.Std.Z
* Time.BodyGyroJerk.Std.X
* Time.BodyGyroJerk.Std.Y
* Time.BodyGyroJerk.Std.Z
* Time.BodyAccMag.Std
* Time.GravityAccMag.Std
* Time.BodyAccJerkMag.Std
* Time.BodyGyroMag.Std
* Time.BodyGyroJerkMag.Std
* FFT.BodyAcc.Std.X
* FFT.BodyAcc.Std.Y
* FFT.BodyAcc.Std.Z
* FFT.BodyAccJerk.Std.X
* FFT.BodyAccJerk.Std.Y
* FFT.BodyAccJerk.Std.Z
* FFT.BodyGyro.Std.X
* FFT.BodyGyro.Std.Y
* FFT.BodyGyro.Std.Z
* FFT.BodyAccMag.Std
* FFT.BodyBodyAccJerkMag.Std
* FFT.BodyBodyGyroMag.Std
* FFT.BodyBodyGyroJerkMag.Std





# Code Book

This document describes the code inside `run_analysis.R`.

The code is splitted in some sections, which do different parts:


* Merging the training and the test sets
* Extraction of the measurements on the mean and standard deviation
* Descriptive activity labeling to name the activities in the data set
* Labeling the data set with descriptive variable names.
* Creation of a second, independent tidy data set from the previous table.  That one contains the average of each variable for each activity and each subject.




## List of values

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






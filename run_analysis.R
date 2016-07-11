##  run_analysis.R
## The following code is created for collect and clean a data set. The data set is obtained from
## http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
## The data represent data collected from the accelerometers from the Samsung Galaxy S smartphone.


## I was not sure how I should interprate the instructions, therefore the code does:
## Merges the training and the test
# 1. Merges the training and the test sets to create one data set.
# 2. From the data set extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Then uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. Creates a second, independent tidy data set from the previous table. That one contains the average of each variable for each activity and each subject.
# I understand that I should use only the measurements on mean and sd for all the project. In fact it is more or less the same code except one step.



## Set working directory

setwd("/Users/ac/Desktop/UZER/kursera/datasajensspec/gettingdata/projekt/")

#####
##Read files##
#####

### Get file names:
names0 <- c('features','activity_labels')
names1 <- c('X_test', 'y_test', 'subject_test')
names2 <- c('X_train', 'y_train','subject_train')

###Load all files
for(i in names0){
  filepath <- file.path(".",paste(i,".txt",sep=""))
  assign(i, read.table(filepath, sep = "",colClasses=c("integer", "character")))
}

for(i in names1){
  filepath <- file.path("./test",paste(i,".txt",sep=""))
  assign(i, read.table(filepath,header = FALSE, fill = TRUE, sep = ""))
}

for(i in names2){
  filepath <- file.path("./train",paste(i,".txt",sep=""))
  assign(i, read.table(filepath,header = FALSE, fill = TRUE, sep = ""))
}

#####
## MERGE FILES
#####

X <- rbind(X_test, X_train)
Y <- rbind(y_test, y_train)
subject <- rbind(subject_test, subject_train)


#####
## Extracts mean and sd
####

mean_std_inx <- grep("[Mm]ean\\(\\)| [Ss]td\\(\\)",features[[2]])
# In case of separated indices:
#means_inx <- grep("[Mm]ean\\(\\)",features[[2]])
#stds_inx <- grep("[Ss]td\\(\\)",features[[2]])


part_data <- X[,mean_std_inx]

######
## Use descriptive activity labels
######

# Merge labels with activity index
act_labels <- merge(Y,activity_labels)

# Add only label to the data used
activity_table_part_names <- cbind(act_labels[[2]],subject,part_data)

# In case of all needed data set
#activity_table_full_names <- cbind(act_labels[[2]],X)
#activity_table_pfull_names <- cbind(act_labels[[2]],X)

######
## Add descriptive variable names
######

colnames(activity_table_part_names) <- c("Activity","Subject Performing",features[mean_std_inx,2])

# In case of all the data needed to be named
#colnames(activity_table_full_names) <- c("Activity",features[[2]]

#####
## Tidy data for averaging
#####

pre_tidy_set1 <- aggregate(activity_table_part_names, list(activity_table_part_names$Activity, activity_table_part_names$`Subject Performing`), mean)

# Remove "old" rows
pre_tidy_set2 <- pre_tidy_set1[-c(3,4)]

# Rename new columns from aggregation
colnames(pre_tidy_set2) <- c("Activity","Subject Performing",features[mean_std_inx,2])

# Final tidy product
tidy_set_averages <- pre_tidy_set2

write.table(tidy_set_averages,file="tidy.txt",row.name=FALSE )



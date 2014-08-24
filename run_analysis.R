## run_analysis()
## The data processed by this function was collected from the accelerometers 
## from the Samsung Galaxy S smartphone.
## The experiments were carried out with a group of 30 volunteers within an age 
## bracket of 19-48 years. Each person performed six activities 
## (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
## wearing a smartphone (Samsung Galaxy S II) on the waist. 
## Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and
## 3-axial angular velocity were captured at a constant rate of 50Hz. 
## The experiments were video-recorded to label the data manually. The obtained 
## dataset was randomly partitioned into two sets, where 70% of the volunteers were
## selected for generating the training data and 30% the test data. 
## The sensor signals (accelerometer and gyroscope) were pre-processed by applying
## noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 
## 50% overlap (128 readings/window). The sensor acceleration signal, which has 
## gravitational and body motion components, was separated using a Butterworth 
## low-pass filter into body acceleration and gravity. The gravitational force is 
## assumed to have only low frequency components, therefore a filter with 0.3 Hz 
## cutoff frequency was used. From each window, a vector of features was obtained
## by calculating variables from the time and frequency domain. 
## A full description is available at the site where the data was obtained: 
## http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
##
## The run_analysis function performs the following:
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each 
##    measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. Creates a second, independent tidy data set with the average of each variable
##    for each activity and each subject. 
## The directory to which the data has been extracted must be passed to the function.


run_analysis <- function(datadir)
   {
## Change current directory to data directory and save prev curr dir
   saved_dir <- setwd(datadir)

## Read data into data frames
   X_test <- read.fwf("test\\X_test.txt",widths=rep(16,561))
   X_train <- read.fwf("train\\X_train.txt",widths=rep(16,561))
   Y_train <- read.table("train\\Y_train.txt")
   Y_test <- read.table("test\\Y_test.txt")
   activity_labels <- read.table("activity_labels.txt",sep=" ")
   subject_train <- read.table("train/subject_train.txt")
   features <- read.table("features.txt",sep=" ")
## Fix the feature names found in the original data by:
## Changing all '-' to '_'
## Removing '()' found at the end of names
## Chenging '(' to '_'
## Changing ')' to '_'
## Changing ',' to '_'
## Changing '__' to '_'
   features$V2 <- gsub("-","_",features$V2)
   features$V2 <- gsub("[(][)]$","",features$V2)
   features$V2 <- gsub("[(]([a-zA-Z])","_\\1",features$V2)
   features$V2 <- gsub("[)]$","",features$V2)
   features$V2 <- gsub("[,]","_",features$V2)
   features$V2 <- gsub("[(][)]","_",features$V2)
   features$V2 <- gsub("[)]","_",features$V2)
   features$V2 <- gsub("[_][_]","_",features$V2)
## Change the names of the test and train fdata frame columns 
   names(X_test) <- features$V2
   names(X_train) <- features$V2
## Add a column to the test and train data frames indicating which files they 
## originate from
   X_train$type <- rep("train", nrow(X_train))
   X_test$type <- rep("test", nrow(X_test))
## Add the activity column to the train and test data franmes
   X_train$activity <- activity_labels$V2[Y_train$V1]
   X_test$activity <- activity_labels$V2[Y_test$V1]

## Add the subject column to the train and test data franmes
   X_test$subject <- subject_test$V1
   X_train$subject <- subject_train$V1

## Merge the train and test data together
   X_test_train <- rbind(X_test,X_train)
## Extract the columns to be subsetted from the merged data frame
## These are all columns whose names contain 'Mean', 'mean' or 'std'.
   tidy_first_cols <- names(X_test_train)[grep("[mM][Ee][Aa][Nn]|[sS][Tt][Dd]|type|activity|subject",names(X_test_train))]
## extract the subset 
   tidy_first <- subset(X_test_train,,tidy_first_cols)
## Extract the colums which must have their mean calculated
## These are all columns whose names contain 'Mean', 'mean' or 'std'.
   aggregate_cols <- names(X_test_train)[grep("[mM][Ee][Aa][Nn]|[sS][Tt][Dd]",names(X_test_train))]
## Calculate the aggregate means of the columns by activity and subject
   tidy_aggregate <- aggregate(tidy_first[aggregate_cols], by=tidy_first[c("activity","subject")], FUN=mean)
## Save the tidy aggregate file to a text file
   write.table(tidy_aggregate,"tidy_aggregate.txt",row.names=FALSE)
## Restore the saved current directory
   if (!is.null(saved_dir)) setwd(saved_dir)
   }
#read.table("tidy_aggregate.txt",header=TRUE)


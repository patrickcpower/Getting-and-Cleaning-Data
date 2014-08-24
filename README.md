
Getting and Cleaning Data
----------------------------------------------------------------------------
The goal of this project is to create a function that will prepare tidy data that can be used for later analysis.

The name of the function is run_analysis() and it is contained in the file
run_analysis.R
The path of the directory to which the data has been extracted must be passed to the function.
An example of running the function is:
```run_analysis("C:\\datascience\\UCI HAR Dataset")```

The data processed by this function was collected from the accelerometers 
from the Samsung Galaxy S smartphone.
The experiments were carried out with a group of 30 volunteers within an age 
bracket of 19-48 years. Each person performed six activities 
(WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist. 
Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and
3-axial angular velocity were captured at a constant rate of 50Hz. 
The experiments were video-recorded to label the data manually. The obtained 
dataset was randomly partitioned into two sets, where 70% of the volunteers were
selected for generating the training data and 30% the test data. 
The sensor signals (accelerometer and gyroscope) were pre-processed by applying
noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 
50% overlap (128 readings/window). The sensor acceleration signal, which has 
gravitational and body motion components, was separated using a Butterworth 
low-pass filter into body acceleration and gravity. The gravitational force is 
assumed to have only low frequency components, therefore a filter with 0.3 Hz 
cutoff frequency was used. From each window, a vector of features was obtained
by calculating variables from the time and frequency domain. 
A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The run_analysis function performs the following:
-- Merges the training and the test sets to create one data set.
-- Extracts only the measurements on the mean and standard deviation for each measurement. 
    
-- Uses descriptive activity names to name the activities in the data set
-- Appropriately labels the data set with descriptive variable names. 
-- Creates a second, independent tidy data set with the average of each variable
for each activity and each subject. 

The features containing mean and standard deviation were extracted by checking 
which had the phrases 'Mean', 'mean' and 'std'.
The feature names were tidied by performing the following transformations on the names:
* Changing all '-' to '_'
* Removing '()' found at the end of names
* Changing '(' to '_'
* Changing ')' to '_'
* Changing ',' to '_'
* Changing '__' to '_'
Thus tBodyAcc-mean()-X becomes tBodyAcc_mean_X
and tGravityAccMag-std() becomes tGravityAccMag_std.

The data has been tidied as per Hadley Wickham's paper Tidy Data
(http://vita.had.co.nz/papers/tidy-data.pdf)




## References
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012


run_analysis.R Code Book

Note: Detailed desriptions of the activities used in this data set are found here: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones
and also in the README and features.info files of the unzipped data set.

Feature Selection 
=================

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation

This is a total of sixty-six separate activity variables.



Variables and transformations

"dat_df1": merged data.frame containing mean and standard deviation measurements for each subject, from raw data. Column 1 contains the subject identifier variable, columns 2 to 67 contain the mean and standard deviation of the activities for the X, Y and Z axes, followed by the 'Y' variable and a variable to indicate whether or not the row of data was from a "train" or a "test" data set.


"dat_melt0": transformed data.table of merged data, consisting of one row per observation and one column per variable (ie: subject, activity and observation value).


"dat_melt": summarised data.table of merged data, with mean values for data grouped by activity and subject. 
"datatypes": a vector of the names of the two data types, "test" and "train"

"df_colnames": a list of the descriptors to be used as column names for the merged data.frame.

"filepath": a three row by two column matrix of the paths to the data files.

"folderpath": a vector of the two file paths to the folders that that contain the data.files.





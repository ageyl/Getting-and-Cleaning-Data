# Getting-and-Cleaning-Data
Course project for "Getting and Cleaning data" 

The run_analysis.R script has been written to achieve the following assigned goals:

The script:
* Merges the training and the test sets to create one data set.
* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 
* From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.


The run_analysis.R script assumes you have taken the unzipped and placed in
your working directory. You will need to replace 

setwd("your/working/directory/path")

with your actual directory path.


The script performs the following tasks:

1. Identifies the file paths of the files that need to be extracted and records them in the 
"filepath" matrix.

2. Collects the descriptive column names to be used for the data set from "features.txt".

3. Creates the merged data set, dat_df1,  with desccriptive activity names
including only the mean and standard deviation values of the data. It is
created as follows:
	i) The outer "sapply" determines which column of the filepath matrix will be used
(ie "test" or "train")
	ii) The inner "sapply" takes each of the files of the data type determined in 3.i, 
provides a column name.
	iii) If the file consists of activity data returns only "mean()" and "std()" data, 
otherwise returns the data.frame entire.
	iv) The "do.call" cbinds the columns with each other.
	v) The outer ldply creates a single data.frame from the list of the two ("test" and "train") 
data.frames.

4. Creates data.table "dat_melt0" from dat_df1, and then melts the merged dat_df1 data.frame 
to provide a single observation per variable. A data.table is created to improve the speed of the
melt function and for the following step.

5. Creates data.table "dat_melt" from "dat_melt0" by taking the mean value when grouped by
for each "subject" and "activity" combination.

6. Dataset is written to a ".txt" file.

1 to 3 complete the first four requirements of the script, 
and 4 and 5 complete the final requirement.



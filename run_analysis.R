library(data.table)
library(pbapply)
library(plyr)

#setwd("D:/USERS/geyla/Coursera/Getting_and_Cleaning_Data")
setwd("your/working/directory/path")

# determine path to data files
datatypes <- c("train", "test")
folderpath <- file.path("CourseData","UCI HAR Dataset", datatypes )
filepath <- sapply(folderpath , function(x) file.path(x , list.files(x)[grep(".txt", list.files(x))]))

# column names for merged data.frame
df_colnames <- list("subject", read.table(file.path("CourseData","UCI HAR Dataset", "features.txt"), 
				stringsAsFactors=F)[,2], "y_var")

# created merged data.frame
dat_df1 <- ldply(sapply(1:2, function(x){
			cbind(
				do.call(cbind, sapply(1:nrow(filepath), function(y){
					dat_df0 <- read.table(filepath[y, x], colClasses="numeric")
					
					# label data with activty names
					colnames(dat_df0) <- df_colnames[[y]]
					
					# return only data with colnames including "mean()" or "std()"
					if(y == 2) {
					return(dat_df0[, grepl("subject|mean\\(\\)|std\\(\\)|y_var|datatype", 
						colnames(dat_df0))])} else {
						return(dat_df0)}
					}, simplify=F)

				# cbind with 'datatype' test v train variable
				), datatype = datatypes [x], stringsAsFactors=F)
			}, simplify=F),
		.progess='text')





### Tidy data: each variable forms a column
###            each observation forms a row
### columns will be subject, activity and value, so need to reshape data

library(reshape2)

# uses melt.data.table, which is much faster than using melt on a data.frame
dat_melt0 <-  melt(data.table(dat_df1), id.vars=c("subject", "y_var","datatype"), 
			variable.name = "activity")

# take averages, grouped by subject and activity
dat_melt <- dat_melt0[, list(mean = mean(value)), by=list(subject, activity)]

# write to .txt file
write.table(dat_melt, file = "tidy_data_set.txt",  row.names=FALSE)








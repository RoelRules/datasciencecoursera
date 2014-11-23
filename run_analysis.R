# title : Peer Assessments/Getting and Cleaning Data Course Project
# author: "RoelRules"
# date: : "November 23, 2014"
# Step 1 
# Download UCI HAR Dataset.zip and unzip it in the wd.
# 1.Merge the training and test sets to create one data set 
# ----------------------------------------------------------------

x_train <- read.table("./UCI HAR Dataset/train/X_train.txt") 
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt") 
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt") 

x_test <- read.table("./UCI HAR Dataset/test/X_test.txt") 
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt") 
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt") 
 

# create 'x' data set 
x_data <- rbind(x_train, x_test) 
 

# create 'y' data set 
y_data <- rbind(y_train, y_test) 
 

# create 'subject' data set 
subject_data <- rbind(subject_train, subject_test) 

# Step 2
# 2.Extracts only the measurements on the mean and standard deviation for each measurement.
# Use columns with mean() or std() 
# -----------------------------------------------------------------------------------------

features <- read.table("./UCI HAR Dataset/features.txt") 

# get only columns with mean() or std() in their names out of
# the complete list of variables of each feature vector in 'features.txt'.

mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2]) 

# subset the desired columns 
x_data <- x_data[, mean_and_std_features] 

# correct the column names 
names(x_data) <- features[mean_and_std_features, 2] 

# Step 3
# 3.Uses descriptive activity names to name the activities in the data set.
# Extracts the activities from activity_labels.txt file.
# -------------------------------------------------------------------------

activities <- read.table("./UCI HAR Dataset/activity_labels.txt") 

# update values with correct activity names 
y_data[, 1] <- activities[y_data[, 1], 2] 
 

# correct column name 
names(y_data) <- "activity" 

# Step 4
# 4.Appropriately labels the data set with descriptive variable names.
# -------------------------------------------------------------------------

# correct column name 
names(subject_data) <- "subject" 
 

# bind all the data in a single data set 
all_data <- cbind(x_data, y_data, subject_data)
colnames(all_data)

# Step 5 
# 5.From the data set in step 4, creates a second, independent tidy data set 
#   with the average of each variable for each activity and each subject.
# tidy dataset = last two colums(activity and subject) from 68 columns
# Install package plyr
# ----------------------------------------------------------------------------
 

tidy_dataset <- ddply(all_data, .(activity, subject), function(x) colMeans(x[, 1:66])) 


write.table(tidy_dataset, "./tidy_dataset.txt", row.name=FALSE) 

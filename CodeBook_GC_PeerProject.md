---
title: "CodeBook_variables Peer Assessments/Getting and Cleaning Data Course Project"
author: "RoelRules"
date: "Sunday, November 23, 2014"
output: html_document
---


Introduction:

The script  run_analysis.R performs the 5 steps described in the course project's definition.

.step 1, all the similar data is merged using the  rbind()  function. By similar, we address those files   having the same number of columns and referring to the same entities.

.step 2, only those columns with the mean and standard deviation measures are taken from the whole dataset. After extracting these columns, they are given the correct names, taken from  features.txt.

.step 3, as activity data is addressed with values 1:6, we take the activity names and IDs from  
 activity_labels.txt  and they are substituted in the dataset.

.step 4, on the whole dataset, those columns with vague column names are corrected.

.step 5, finally, we generate a new dataset with all the average measures for each activity and           subjects type (6 activities * 30 subjects = 180 rows). The output file is called  tidy_dataset.txt,
and is uploaded.


Variables:

.  x_train ,  y_train ,  x_test ,  y_test ,  subject_train  and  subject_test  contain the data from the   downloaded files. The file is unzipped and placed in the working directory.

.  x_data ,  y_data  and  subject_data  are merged from the above datasets.

.  features  contains the correct names for the  x_data  dataset, which are applied to the column names   stored in  mean_and_std_features , a numeric vector used to extract the desired data.

. The same is done with activity names from the  activities file.

. all_data  contains  x_data ,  y_data  and  subject_data  in a big dataset.

. Finally,  tidy_dataset  contains the relevant averages which will be later stored in a  .txt  file.  
  ddply()  from the plyr package is used to apply  colMeans()  and ease the development.

# Introduction

Here we have data collected from the accelerometers from the Samsung Galaxy S smartphone.
A full description of these data can be obtained from the link below: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

From the below link the data for the project is availabe: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

It contains train and test for set of variables (x) and the activity that is performed (y).

There is also subject file for test and trian whcih is showing whcich indivuduals did whcih activities.

# Variables

x_train, y_train, x_test, y_test, subject_train and subject_test contain the data from the downloaded files.

train and test data are merged and stored in x_data,y_data and subject_data.

features contains the names for the x_data dataset.

* "Only the names whcih has "mean" and "std" are selected from featurs and are applied to the column names and stored in "my data", a numeric vector used to extract the desired data."

*A similar approach is taken with activity names through the activities variable.

*Tidy Data  merges x_data, y_data and subject_data in a big dataset.
  
*"Final data" contains the relevant averages which is stored in a .txt file. ddply() from the dplyr package is used to apply colMeans() to take the average for each activity and each subject.
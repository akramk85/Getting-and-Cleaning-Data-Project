library(dplyr)

#Merges the training and the test sets to create one data set.
--------------------------------------------------------------
     
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")


x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)
subject_data <- rbind(subject_train, subject_test)

features <- read.table("UCI HAR Dataset/features.txt")

------------------------------------------------------------------

#Extracts only the measurements on the mean and standard deviation for each measurement.
     
Mydata<-grep(".*mean.*|.*std.*",features[,2])
x_data<-x_data[,Mydata]

----------------------------------------------------------------
     
#Uses descriptive activity names to name the activities in the data set
     
activities <- read.table("UCI HAR Dataset/activity_labels.txt")
y_data[, 1] <- activities[y_data[, 1], 2]
------------------------------------------------------------------
     
 # Appropriately labels the data set with descriptive variable names
     
names(x_data)<-features[Mydata,2]
names(y_data) <- "activity"
names(subject_data) <- "subject"
-------------------------------------------------------------------
     
 #creates a second, independent tidy data set with the average of each variable for each activity and each subject
     
Tidydata<-cbind(x_data,y_data,subject_data)    
Finaldata <- ddply(Tidydata, .(subject,activity), function(x) colMeans(x[,1:79]))

write.table(Finaldata, "Finaldata.txt", row.name=FALSE)

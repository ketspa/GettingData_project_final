#Download data at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#and unzip into local working directory "D:\\coursera\\GettingData\\project"

#Step 1 is to merge the training and test sets to create one data set.
# setwd("D:\\coursera\\GettingData\\project")
#import training and testing data and join
train <- read.table(".\\train\\X_train.txt")
test <- read.table(".\\test\\X_test.txt")
data_joined <- rbind(train,test)
#import training and testing label and join
trainlabel <-read.table(".\\train\\Y_train.txt")
testlabel <-read.table(".\\test\\Y_test.txt")
label_joined <- rbind(trainlabel,testlabel)
#import training and testing subject and join
trainsubject <- read.table(".\\train\\subject_train.txt")
testsubject <- read.table(".\\test\\subject_test.txt")
subject_joined <- rbind(trainsubject,testsubject)

#step 2 is to extract only the measurements on the mean and standard deviation 
#for each measurement.
features <- read.table(".\\features.txt")
#use sqldf to get mean and std of related features
library(sqldf)
features_MeanStd <- sqldf("select V1,V2 from features where V2 like '%mean()%' 
                                          UNION all select V1,V2 from features where V2 like '%std()%'")
data_joined_MeanStd <- data_joined[,features_MeanStd[,1]]
#rename features to enable converting features to column names of joined data
features_MeanStd[,2] <- gsub("\\(\\)", "", features_MeanStd[, 2])
features_MeanStd[,2] <- gsub("-", "_", features_MeanStd[, 2])
names(data_joined_MeanStd) <- features_MeanStd[,2]

#step 3 is to use descriptive activity names to name the activities in the data set
activities <- read.table(".\\activity_labels.txt")
label_joined_activity <- merge(label_joined,activities,by="V1",sort=F)
label_joined_activity <- data.frame(label_joined_activity[,2])
names(label_joined_activity) <- "Activity"

#step 4 is to appropriately labels the data set with descriptive variable names
names(subject_joined) <- "subject"
tidydata <- cbind(subject_joined,label_joined_activity,data_joined_MeanStd)
#tidydata has 10299 obs and 68 variables
write.table(tidydata,"tidydata.txt",row.name=FALSE)

#step 5 is to create a second, independent tidy data set with the average of 
# each variable for each activity and each subject from the data set in step 4
tidydataMean = aggregate(tidydata[,names(tidydata) != c('Activity','subject')],by=list(tidydata$Activity,tidydata$subject),mean)
drops <- c("Group.2","Activity")
tidydataMean <- tidydataMean[,!(names(tidydataMean) %in% drops)]
colnames(tidydataMean)[1] <- "Activity"
write.table(tidydataMean,"tidydataMean.txt",row.name=FALSE)
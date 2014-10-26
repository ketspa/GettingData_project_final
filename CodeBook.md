This code book describes the variables, the data, and any transformations or work that I performed to clean up the data

1. Downloaded data at https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip and upzipped all the files into a local directory.

2. Create a run_analysis.R file in RStudio

3. In step1, imported training and test datasets and create a combined dataset in the following steps:
             read training data and test dataset from \train\X_train.txt and \test\X_test.txt, respectively, and then rbind to data_joined;
             read training data label and test dataset label from \train\Y_train.txt and \test\Y_test.txt, respectively, and then rbind to label_joined;
             read training data subject and test dataset subject from \train\subject_train.txt and \test\subject_test.txt, respectively, and then rbind to subject_joined.

4. In step2, extracted only the measurements on the mean and standard deviation for each measurement in the following steps:
	     read all features from .\features.txt in to features
	     used sqldf to extra only the measurements on the mean and std for each measurement and stored in features_MeanStd;
	     the use features_MeanStd to extra data for mean and std values from data_joined and stored in data_joined_MeanStd;
	     names of mean and std features were cleaned, such as removed "()" and changed "-" into "_" to enable transferring these features into colnames in data.frame
	     then these names were applied to colnames of data_joined_MeanStd.

5. In step3, used descriptive activity names to name the activities in the data set in the following steps:
	     read in .\activity_labels.txt into activities;
	     merge label_joined and activities by the label column and make sure use "sort=F" option in merge step to present auto sorting;

6. In step4, cbind subject_joined,label_joined_activity,data_joined_MeanStd to create clean data, tidydata.

7. In step5, used aggreate function to create second independent tidy data set(tidydataMean.txt) with the average of each variable for each activity and each subject from the data set in step 4.
	   
	  
	     

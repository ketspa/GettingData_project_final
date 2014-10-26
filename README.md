Coursera JHU "Gettting and Cleaning Data" Project

Backgroud:

    The purpose of this project is to demonstrate ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.
    The data to be worked on represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
    And the data for the project can be downloaded at: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

How the script works:

1. Download the zip file and unzip all files inside into a local directory, which will be
set as R working directory.

2. Run run_analysis.R. This will spit out "tidydata.txt", which contains all training and test datasets with the mean and standard deviation of each feature of each subject and activity, and "tidydataMean.txt" file, which contains the average of each each for each activity and each subject  
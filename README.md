## Getting And Cleaning Data -- Course Project
===================================

### PROJECT DESCRIPTION

The purpose of this project is to demonstrate your ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. You will be graded by your peers on a series of yes/no questions related to the project. You will be required to submit: 1) a tidy data set as described below, 2) a link to a Github repository with your script for performing the analysis, and 3) a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data called CodeBook.md. You should also include a README.md in the repo with your scripts. This repo explains how all of the scripts work and how they are connected. 

One of the most exciting areas in all of data science right now is wearable computing - see for example this article . Companies like Fitbit, Nike, and Jawbone Up are racing to develop the most advanced algorithms to attract new users. The data linked to from the course website represent data collected from the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

You should create one R script called run_analysis.R that does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set.
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

### NOTE 1
David Hood, TA for this class provided an excellent pictorial diagram of data relationships for this assignment. The diagram titled "David_Hood_Diagram" is included in this repo for review. This diagram forms the basis for the underlying script code logic. If you do not understand this diagram, for the benefit of both of us, please skip evaluating my work.

### NOTE 2
The script makes certain assumptions which are commented in the code. Essentially I assume the evaluator knows how to download and extract a zip file to their working R directory and add packages to their development environment. Also, if you wish to download and read the submitted tidy data set "Step5TidyDataset.txt" familiarity with read.table() is required. The read.table() code is included in the script file. Downloading the tidy data set is dependent on operating system and browser used. Typically a right click and download option will suffice.


### SUMMARY OF "run_analysis.R" SCRIPT

Please refer to the codebook for decriptions of variable names and assignment results

Line 7 contains code to obtain the current working directory. Normally this is not necessary assuming proper placement of data files, but is included for the sake of completeness

Line 10 loads the plyr library which us used for the ddply call when creating the second tidy data set

Lines 12-25 preprocess and combine the subject, X and y test and training data files into three distinctive datasets in preparation for a full merge

Lines 27-31 provide descriptive variable names to the distinctive data sets as required in Step 4

Line 34 performs an initial merge of the now descriptively labled preprocessed files into a single file. Technically this completes Step 1 but additional processing is performed later in the script to produce a more user friendly format

Lines 36-38 convert the y number codes into descriptive activity names as required in Step 3 for the single data set created above

Lines 40-44 sort the single data set by subject and writes out a file for reference. Step 1 is complete at this point

Lines 46-50 extract the mean and std measurements from the sorted single data set and places them into a working data set preparing for creation of a second tidy data set. Step 2 is complete at this point. Additionally a file is written out with this data for reference.

Lines 52-56 create the second tidy data set containing the "means of the means" for each variable of each activity for each subject, and also writes out to a file for reference. Step 5 is complete at this point.

### Assignment is complete at this point.

Line 59 is included to show the code to write the second tidy data set out in the required text format for assignment upload

Line 60 is included as sample code if an evaluator wished to read in the text file created in previous step

Line 59 





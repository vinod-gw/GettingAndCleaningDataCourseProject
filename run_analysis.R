## NOTE --> the assignment does not request or require R code to download and unzip source data
## NOTE --> source data url is provided for documentation purposes only
## NOTE --> url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
## Assumption is zip properly extracted with files located in the unzipped directory

## dataLocation where the Samsung data directories reside in the unzipped UCI HAR Dataset directory
dataLocation <- getwd()

## Load plyr
library(plyr)

## Merge "subject" data from txt files
subjectTestData <- read.table("test/subject_test.txt")
subjectTrainData <- read.table("train/subject_train.txt")
combinedSubjectData <- rbind(subjectTestData, subjectTrainData)

## Merge "X" data from txt files
xTestData <- read.table("test/X_test.txt")
xTrainData <- read.table("train/X_train.txt")
combinedXData <- rbind(xTestData, xTrainData)

## Merge "y" data from txt files
yTestData <- read.table("test/y_test.txt")
yTrainData <- read.table("train/y_train.txt")
combinedYData <- rbind(yTestData, yTrainData)

## STEP 4 - Appropriately labels the data set with descriptive variable names
colnames(combinedSubjectData) <- "subjectID"
colnames(combinedYData) <- "activity"
colNamesX <- read.table("features.txt",sep="",stringsAsFactors=F)
colnames(combinedXData) <- colNamesX$V2

## STEP 1 - Merge the training and test sets to create one data set
combinedDataset <- cbind(combinedSubjectData, combinedYData, combinedXData)

## STEP 3 - Uses descriptive activity names to name the activities in the data set
activityLabels <- read.table("activity_labels.txt")
combinedDataset$activity <- factor(combinedDataset$activity, levels=activityLabels$V1, labels=activityLabels$V2)

## STEP 1 - Sort the full data set by subjectID
combinedDataset <- arrange(combinedDataset, combinedDataset$subjectID)

## STEP 1 - Save the full data set to working directory
write.csv(combinedDataset, "fullDataSet.csv")

## STEP 2 - Extracts only the measurements on the mean and standard deviation for each measurement
combinedMeanStd <- combinedDataset[,c(1,2,grep("mean", colnames(combinedDataset)), grep("std", colnames(combinedDataset)))]

## STEP 2 - Write the extracted data to working directory
write.csv(combinedMeanStd, "MeanAndStd.csv")

## STEP 5 - Creates a second, independent tidy data set with the average of each variable for each activity and each subject
secondTidyDataset <- ddply(combinedMeanStd, .(subjectID, activity), .fun=function(x){ colMeans(x[,-c(2:3)]) })

## STEP 5 - Write the second tidy data set as csv to working directory -- proof of completion
write.csv(secondTidyDataset, "secondTidyDataset.csv")

## Output for submission upload - Please upload your data set as a txt file created with write.table() using row.name=FALSE
write.table(secondTidyDataset, "Step5TidyDataset.txt", sep="\t", row.names = FALSE)

## To read the submitted file, download the file to your working directory and use the following code
## read.table("Step5TidyDataset.txt", header = TRUE, sep="\t")
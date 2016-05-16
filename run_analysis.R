# This script makes use of the plyr library
library(plyr)

# Download the data if it doesn't already exist
if(!dir.exists(".data")) dir.create(".data")
if(!file.exists(".data/dataset.zip")){
    download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip", 
                  ".data/dataset.zip")
    unzip(".data/dataset.zip", exdir=".data")
}

# Load activity data used to label factor variable in main data set
activities    <- as.vector(read.table(".data/UCI HAR Dataset/activity_labels.txt",
                                      col.names = c("level", "label")))
# Load features, to be used as colnames for the main data set
features      <- as.vector(read.table(".data/UCI HAR Dataset/features.txt")[,2])

# List features that are mean or std values
featuresAllowed <- grep("mean[(]|std[(]", features) 

# Clean feature name so they can be used as labels in the main data set
featureNames    <- features[featuresAllowed]
featureNames    <- gsub("mean[(])", "Mean", featureNames)
featureNames    <- gsub("std[(])", "Std", featureNames)
featureNames    <- gsub("-", "", featureNames)

# Load train data
trainSubjects <- read.table(".data/UCI HAR Dataset/train/subject_train.txt")
Ytrain        <- read.table(".data/UCI HAR Dataset/train/Y_train.txt")
Xtrain        <- read.table(".data/UCI HAR Dataset/train/X_train.txt")

# Load test data
testSubjects  <- read.table(".data/UCI HAR Dataset/test/subject_test.txt")
Ytest         <- read.table(".data/UCI HAR Dataset/test/Y_test.txt")
Xtest         <- read.table(".data/UCI HAR Dataset/test/X_test.txt")

# Removed features we aren't interested in
Xtrain <- Xtrain[,featuresAllowed]
Xtest  <- Xtest[,featuresAllowed]

# Column bind the subjects, Y and X datasets for train and test groups
trainSet <- cbind(trainSubjects, Ytrain, Xtrain)
testSet  <- cbind(testSubjects, Ytest, Xtest)

# Row bind and clean the train and test data sets
#   - Set column Labels
#   - Order by subject
#   - Set labels for the Activity column factor levels
finalSet          <- rbind(trainSet, testSet)
names(finalSet)   <- c("subject", "activity", featureNames)
finalSet          <- finalSet[order(finalSet$subject),]
finalSet$activity <- factor(finalSet$activity, activities$level, activities$label)

# Calculate the means of the columns from the X data set grouped by subject and activity
tidyData <- ddply(finalSet, .(subject, activity), function (x) colMeans(x[3:68]))

# write summarized tiny data to a .txt file
write.table(tidyData, "tidy_data.txt", row.names = FALSE)
# Analysis CodeBook

## About The data
The original data is pulled from:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Information on the data can be found:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

## Variables

`activities`: Vector of different activities

`features`: Vector of features being measured in raw dataset

`featureAllowed`: Vector of keys in `features` that are mean or std measurements

`FeatureNames`: Vector of feature names that have been cleaned up and are to be used a colnames in the final data set

`trainSubjects`: Raw subjects data for the train group

`Ytrain`: Raw Y data for the train group

`Xtrain`: Raw X data for the train group

`testSubjects`: Raw subjects data for the test group

`Ytest`: Raw Y data for the test group

`Xtest`: Raw X data for the test group

`trainSet`: train subjects, y and x column merged with added descriptive colnames

`testSet`: test subjects, y and x column merged with added descriptive colnames

`finalSet`: Data set of the test and train groups merged. The activity factor column is now labelled and the data is sorted by subject.

The column names for this data are:
- subject
- activity
- tBodyAccMeanX
- tBodyAccMeanY
- tBodyAccMeanZ
- tBodyAccStdX
- tBodyAccStdY
- tBodyAccStdZ
- tGravityAccMeanX
- tGravityAccMeanY
- tGravityAccMeanZ
- tGravityAccStdX
- tGravityAccStdY
- tGravityAccStdZ
- tBodyAccJerkMeanX
- tBodyAccJerkMeanY
- tBodyAccJerkMeanZ
- tBodyAccJerkStdX
- tBodyAccJerkStdY
- tBodyAccJerkStdZ
- tBodyGyroMeanX
- tBodyGyroMeanY
- tBodyGyroMeanZ
- tBodyGyroStdX
- tBodyGyroStdY
- tBodyGyroStdZ
- tBodyGyroJerkMeanX
- tBodyGyroJerkMeanY
- tBodyGyroJerkMeanZ
- tBodyGyroJerkStdX
- tBodyGyroJerkStdY
- tBodyGyroJerkStdZ
- tBodyAccMagMean
- tBodyAccMagStd
- tGravityAccMagMean
- tGravityAccMagStd
- tBodyAccJerkMagMean
- tBodyAccJerkMagStd
- tBodyGyroMagMean
- tBodyGyroMagStd
- tBodyGyroJerkMagMean
- tBodyGyroJerkMagStd
- fBodyAccMeanX
- fBodyAccMeanY
- fBodyAccMeanZ
- fBodyAccStdX
- fBodyAccStdY
- fBodyAccStdZ
- fBodyAccJerkMeanX
- fBodyAccJerkMeanY
- fBodyAccJerkMeanZ
- fBodyAccJerkStdX
- fBodyAccJerkStdY
- fBodyAccJerkStdZ
- fBodyGyroMeanX
- fBodyGyroMeanY
- fBodyGyroMeanZ
- fBodyGyroStdX
- fBodyGyroStdY
- fBodyGyroStdZ
- fBodyAccMagMean
- fBodyAccMagStd
- fBodyBodyAccJerkMagMean
- fBodyBodyAccJerkMagStd
- fBodyBodyGyroMagMean
- fBodyBodyGyroMagStd
- fBodyBodyGyroJerkMagMean
- fBodyBodyGyroJerkMagStd

`tidyData`: a summarized version of the mean of each measurement is calculated grouped by subject and activity

## Transformations

The following transformations have been applied to the raw data
- Measurements that aren't averages or standard deviations have been removed
- Test and Train groups have been merged
- Descriptive labels have been added to column names
- the average of each measurement has been calculated grouped by subject and activity
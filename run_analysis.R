# Set the working directory
setwd("~/UCI/")

# Read training data from txt files
training = read.csv("HAR/train/X_train.txt", sep="", header=FALSE)
training[,562] = read.csv("HAR/train/y_train.txt", sep="", header=FALSE)
training[,563] = read.csv("HAR/train/subject_train.txt", sep="", header=FALSE)

# Read testing data from txt files
testing = read.csv("HAR/test/X_test.txt", sep="", header=FALSE)
testing[,562] = read.csv("HAR/test/y_test.txt", sep="", header=FALSE)
testing[,563] = read.csv("HAR/test/subject_test.txt", sep="", header=FALSE)

# Read activity labels data from txt files
activityLabels = read.csv("HAR/activity_labels.txt", sep="", header=FALSE)

# Read features data and rename feature names to be R-friendly
features = read.csv("HAR/features.txt", sep="", header=FALSE)
features[,2] = gsub('-mean', 'Mean', features[,2])
features[,2] = gsub('-std', 'Std', features[,2])
features[,2] = gsub('[-()]', '', features[,2])

### Step 1 in the Assignment - Merge the two datasets: training  and testing.
mergedData = rbind(training, testing)

### Steps 2, 3, and 4 in the Assignment

#    substep A - Retrieve only the data on mean and standard deviation
colsGrepped <- grep(".*Mean.*|.*Std.*", features[,2])

#    substep B -  reduce the features table to what is needed based on columns grepped
features <- features[colsGrepped,]

#    substep C -  add the columns (subject and activity) as the last two columns
colsGrepped <- c(colsGrepped, 562, 563)

#    substep D -  Subset mergedData based on columns grepped to get desired columns in the dataset
mergedData <- mergedData[,colsGrepped]

#    substep E - Add the column names (features) to mergedData
colnames(mergedData) <- c(features$V2, "Activity", "Subject")
colnames(mergedData) <- tolower(colnames(mergedData))

#    substep F - Update the activity column in the merged dataset
curActivity = 1
for (currentActivityLabel in activityLabels$V2) {
  mergedData$activity <- gsub(curActivity, currentActivityLabel, mergedData$activity)
  curActivity <- curActivity + 1
}

#   substep G - Render activity and subject columns as factors
mergedData$activity <- as.factor(mergedData$activity)
mergedData$subject <- as.factor(mergedData$subject)

#   substep H - Use aggregate() function to create a second independendent tidy dataset,
#    that represents the average of each variable for each activity and each subject  
tidyHARmean = aggregate(mergedData, by=list(activity = mergedData$activity, subject=mergedData$subject), mean)

#   substep I - Remove the activity and the subject columns because those are not required
tidyHARmean[,90] = NULL
tidyHARmean[,89] = NULL

### Step 5 in the Assignment - Create the desired tab-separated file
write.table(tidyHARmean, "tidy.txt", sep="\t")
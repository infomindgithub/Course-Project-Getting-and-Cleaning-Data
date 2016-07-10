#CodeBook for the tidy dataset
##Data source

###Source of original Datasets: 
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 
("Human Activity Recognition Using Smartphones Data Set")

##Selection of Features

*See the features.txt files in the original datasets, and the README file which provide additional information about the feature selection for this dataset; those include the following description:
*The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. 
*Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz.
*The body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag).
*Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals).

###Rationale for selection of features
The assignment states "Extracts only the measurements on the mean and standard deviation for each measurement." All variables identified as or referring to  mean or standard deviation were included.

*For the second, independent tidy dataset, following signals were used to estimate variables of the feature vector for each pattern:
*'-XYZ' denotes 3-axial signals in the X, Y, and Z directions.

tBodyAcc-XYZ

tGravityAcc-XYZ

tBodyAccJerk-XYZ

tBodyGyro-XYZ

tBodyGyroJerk-XYZ


tBodyAccMag

tGravityAccMag

tBodyAccJerkMag

tBodyGyroMag

tBodyGyroJerkMag


fBodyAcc-XYZ

fBodyAccJerk-XYZ

fBodyGyro-XYZ


fBodyAccMag

fBodyAccJerkMag

fBodyGyroMag

fBodyGyroJerkMag

###Variables used for this assignment from the above signals
mean(): Mean value

std(): Standard deviation

###Other Info
Additional vectors were obtained by averaging the signals in a signal window sample, and were used on the angle() variable:

gravityMean

tBodyAccMean

tBodyAccJerkMean

tBodyGyroMean

tBodyGyroJerkMean

Other signals were not included for the purpose of this excercise.

Special Note: features are normalized and bounded within [-1,1].

The resulting variable names are of the form: tbodyaccmeanx, which denotes the mean value of tBodyAcc-XYZ.
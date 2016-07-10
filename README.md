#Getting and Cleaning Data: Course Project
##Introduction

This README file covers the content of this repository for the Coursera "Getting and Cleaning data" Data Science Course Project.

##The Codebook markdown file

The Codebook.md file summarizes the transformations performed and briefly discusses resulting data and variables. It is included in this repository.

##Notes on the test and training raw input data

Testdata: The 561 features are unlabeled and can be found in the X_test.txt files. The activity labels are in the y_test.txt file. The test subjects are in the subject_test.txt file.

Training data: The 561 features are unlabeled and can be found in the X_train.txt files. The activity labels are in the y_train.txt file. The training subjects are in the subject_train.txt file.


##The R script and the tidy dataset

###R Script
Developed an R script which is in the file run_analysis.R. The script merges the test and train datasets together. Please read the comments in this run_analysis.R file that describes the steps performed. The comment lines begin with the # special character.

###Extracting raw data to a subdirectory
For the Rscript described earlier to work, the UCI HAR Dataset needs be extracted manually in to a subdirectory HAR of the directory UCI. That is, the UCI HAR Dataset must be availble in a subdirectory HAR of directory "UCI" relative to the R working directory.

### Key steps in the R script
After merging test and train datasets, labels are added. Only columns that pertain to mean and standard deviation are retained.

## Output of the R Script
The run_analysis.R script creates a tidy dataset containing the means (averages) of all the columns per test subject and per activity. This tidy dataset is written to a tab-delimited file "tidy.txt", which is included in this repository.

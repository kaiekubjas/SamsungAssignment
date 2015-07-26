# SamsungAssignment
This repository consists of three files:
1) tidy_data.txt
2) run_analysis.R
3) CodeBook.md

The file 'tidy_data.txt' contains the tidy data set obtained by applying code in 'run_analysis.R' to the original data from the accelerometers and gyroscope from the Samsung Galaxy S smartphone. Each row corresponds to a subject and activity. The variables for columns are explained in CodeBook.md.

The file 'tidy_data.txt' can be read with the command 'read.table("tidy_data.txt")'.

In the file 'run_analysis.R' we perform the following steps:
1) use 'read.table' command to read the training and test set
2) use 'rbind' to merge them to one data set 'data'
3) read the variable names for columns in the 'features' data frame
4) check which features contain 'mean()' or 'std()'
5) keep only these columns of 'data' that contain 'mean()' or 'std()'
6) read activities for each row of the training and test set
7) use 'rbind' to combine them into one data frame 'activities'
8) use 'activity_labels.txt' to replace the activity numbers by names ('activitiesByNames')
9) replace the variables by descriptive variable names
10) read subjects for each row of the training and test set
11) use 'rbind' to combine them into one data frame 'subjects'
12) group data by subjects and activities
13) use 'summarise_each' to summarise the grouped data by average values for each column

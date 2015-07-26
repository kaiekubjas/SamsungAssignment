library(dplyr)

#download and unzip
#fileURL<-"https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
#download.file(fileURL,"temp.zip",method="curl")
#unzip("temp.zip")

#read in training and test set
trainSet<-read.table("UCI HAR Dataset/train/X_train.txt")
testSet<-read.table("UCI HAR Dataset/test/X_test.txt")

#combine training and test set
data<-rbind(trainSet,testSet)

#extract the measurements on the mean and standard deviation for each measurement
features<-read.table("UCI HAR Dataset/features.txt",stringsAsFactors=FALSE)
meanVector<-grepl("mean()",features$V2,fixed=TRUE)
stdVector<-grepl("std()",features$V2,fixed=TRUE)
meanStdVector<- meanVector | stdVector
dataMeanStd<-data[,meanStdVector]

#use descriptive activity names to name the activities in the data set
trainActivity<-read.table("UCI HAR Dataset/train/y_train.txt",stringsAsFactors=FALSE)
testActivity<-read.table("UCI HAR Dataset/test/y_test.txt",stringsAsFactors=FALSE)
activities<-rbind(trainActivity,testActivity)
activityLabels<-read.table("UCI HAR Dataset/activity_labels.txt",stringsAsFactors=FALSE)
activitiesByNames<-activityLabels[activities$V1,2]

#label the data set with descriptive variable names
variableNames<-features[meanStdVector,2]
colnames(dataMeanStd)<-variableNames

#creates a second, independent tidy data set with the average of each 
#variable for each activity and each subject
trainSubject<-read.table("UCI HAR Dataset/train/subject_train.txt",stringsAsFactors=FALSE)
testSubject<-read.table("UCI HAR Dataset/test/subject_test.txt",stringsAsFactors=FALSE)
subjects<-rbind(trainSubject,testSubject)
groupedData<- dataMeanStd %>% mutate(subject=subjects$V1,activity=activitiesByNames) %>% group_by(subject,activity) 
tidyData<-summarise_each(groupedData,funs(mean))




                



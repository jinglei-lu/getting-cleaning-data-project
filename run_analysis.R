#get the column names
column_names <- read.table("UCI HAR Dataset/features.txt", col.names=c("number", "feature"))

# read in the four data sets
X_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = as.vector(column_names$feature))
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names="activity")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names="subject")

X_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = as.vector(column_names$feature))
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names="activity")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names="subject")

# combine the datasets
combined_test <- cbind(y_test,subject_test, X_test)
combined_train <- cbind(y_train,subject_train, X_train)

combined_all <- rbind(combined_test, combined_train)


#The following command calculates the column number that has the comlumn names containing "activity",
# "mean", or "std"
index <-grep("activity|subject|mean|std]", names(combined_all),ignore.case=TRUE)


#Extracts only the measurements on the mean and standard deviation for each measurement, plus activity.
combined_all <- combined_all[, index]

# rename the activity coding
combined_all[combined_all$activity == 1, "activity"] <- "WALKING"
combined_all[combined_all$activity == 2, "activity"] <- "WALKING_UPSTAIRS"
combined_all[combined_all$activity == 3, "activity"] <- "WALKING_DOWNSTAIRS"
combined_all[combined_all$activity == 4, "activity"] <- "SITTING"
combined_all[combined_all$activity == 5, "activity"] <- "STANDING"
combined_all[combined_all$activity == 6, "activity"] <- "LAYING"

# calculate the average of each variable for each activity and each subject
final <- aggregate(.~activity+subject, combined_all, mean)

# write to a file
write.table(final, file="samsung_result.txt", row.name=FALSE )


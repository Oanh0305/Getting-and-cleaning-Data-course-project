# Read data files
test_data <- read.table("test/X_test.txt")
train_data <- read.table("train/X_train.txt")
label_test <- read.table("test/Y_test.txt")
label_train <- read.table("train/y_train.txt")
activity <- read.table("activity_labels.txt")
feature_names <- read.table("features.txt")
subject_train <- read.table("train/subject_train.txt")
subject_test <- read.table("test/subject_test.txt")

# Change variable names for better readability
name <- function(n) {
  names(n) <- feature_names[, "V2"]
  n
}
test_data = name(test_data)
train_data  = name(train_data)

# Question 1: Merges the training and the test sets to create one data set.

merged_data <- rbind(test_data, train_data)
print(merged_data)

#Question 2: Extracts only the measurements on the mean and standard deviation for each measurement. 

subset_measurements<-feature_names[grepl("*std*", feature_names$V2) |
                                     grepl("*mean*", feature_names$V2), "V1"]
merged_data[, as.vector(subset_measurements)]

#Question 3: Uses descriptive activity names to name the activities in the data set

merged_label <- rbind(label_test, label_train)

name_the_activities <- function(n) {
  list_activities <- character(n)
  for (x in 1:n) {
    list_activities[x] <- merged_label[x, 1]
    if (list_activities[x] == 1) {
      list_activities[x] <- "WALKING"
    } else if (list_activities[x] == 2) {
      list_activities[x] <- "WALKING_UPSTAIRS"
    } else if (list_activities[x] == 3) {
      list_activities[x] <- "WALKING_DOWNSTAIRS"
    } else if (list_activities[x] == 4) {
      list_activities[x] <- "SITTING"
    } else if (list_activities[x] == 5) {
      list_activities[x] <- "STANDING"
    } else{
      list_activities[x] <- "LAYING"
    }
    
  }
  list_activities
}
list_activities_vector <- name_the_activities(nrow(merged_label))
merged_data_ac <- cbind(as.data.frame(list_activities_vector), merged_data)
head(merged_data_ac)
# rename column activity
names(merged_data_ac)[1]<- "activity"

# Question 4: Appropriately labels the data set with descriptive variable names.
#Already did this on first step.

# Question 5: Creates independent tidy data set with the average of each 
# variable for each activity and each subject

# Merge subject_test and subject_train

merged_subject <- rbind(subject_test, subject_train)

# Merge entire data
merged_entire_data <- cbind(merged_subject,merged_data_ac)
# rename column subject
names(merged_entire_data)[1]<- "subject"



split <-split(merged_entire_data,merged_entire_data[,c("activity","subject")])



head(sapply(split,function(x)colMeans(x[,-c(1,2)])))



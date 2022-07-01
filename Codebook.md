## Raw data:

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data

## Codebook:

-   First read all files -Rename all variable names for better readability base on `features_info.txt`
-   Merges the training and the test sets to create one data set called `merged_data`
-   Extracts only the measurements on the mean and standard deviation for each measurement base on subsetting `merged_data`
-   Merges the training and the test labels to create one data set called `merged_label`
-   Creates function name_the_activities to have list_activities
-   Merges list_activities and merged_data in to `merged_data_ac`
-   Renames first column to activity
-   Merges `subject_test` and `subject_train` called `merged_subject`
-   Merges `merged_subject` and `merged_data_ac` called `merged_entire_data`
-   Renames first column to subject
-   Splits `merged_entire_data` by activity and subject
-   Uses sapply function to create output
-   Write table to create `output.txt`

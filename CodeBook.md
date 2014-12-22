The dataset was collected from subject wearing samsung smart device while doing different activities. More infor could be found at http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Below is description of variables:

"activity" -- describles the activity, it could be one of WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, or LAYING.

"subject"  -- identifies a unique subject in the experiment

Information about all other variables could be found in "features_info.txt", written by the researchers in the study.

run_analysis.R first reads four datasets, then combined them. Then the script extracts only the measurements on the mean and standard deviation for each measurement, plus activity and subject. After that the coding for activities is replaced by description. Finally, the average of each variable for each activity and each subject is calculated and writen to a file called "samsung_result.txt".
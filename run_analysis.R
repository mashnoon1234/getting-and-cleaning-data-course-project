# -------------------- Description --------------------
# This script installs and loads the required package dependences,
# loads and merges the train and test data, selects the columns
# with the keywords "mean" and "std" and writes two tidy datasets
# to two output files.

if (!require("dplyr", character.only = TRUE)) {
    install.packages("dplyr", dependencies = TRUE)
    library("dplyr", character.only = TRUE)
}

X_train = read.table("UCI\ HAR\ Dataset/train/X_train.txt")
y_train = read.table("UCI\ HAR\ Dataset/train/y_train.txt")
subject_train = read.table("UCI\ HAR\ Dataset/train/subject_train.txt")
X_test = read.table("UCI\ HAR\ Dataset/test/X_test.txt")
y_test = read.table("UCI\ HAR\ Dataset/test/y_test.txt")
subject_test = read.table("UCI\ HAR\ Dataset/test/subject_test.txt")
feature_names = read.table("UCI\ HAR\ Dataset/features.txt")
activity_labels = read.table("UCI\ HAR\ Dataset/activity_labels.txt")

merge_X_train_y_train = cbind(X_train, y_train)
merge_X_train_y_train_subject_train = cbind(merge_X_train_y_train, subject_train)
merge_X_test_y_test = cbind(X_test, y_test)
merge_X_test_y_test_subject_test = cbind(merge_X_test_y_test, subject_test)

merge_train_test = rbind(merge_X_train_y_train_subject_train, merge_X_test_y_test_subject_test)

names(merge_train_test) = feature_names[, "V2"]
names(merge_train_test)[562] = "activity_labels"
names(merge_train_test)[563] = "subject"

mean_std_measurements = select(merge_train_test, contains("mean") | contains("std") | "activity_labels" | "subject")

map = setNames(as.vector(activity_labels[, "V2"]), as.vector(activity_labels[, "V1"]))
mean_std_measurements[, "activity_labels"] = map[mean_std_measurements[, "activity_labels"]]

columnwise_mean = mean_std_measurements %>% 
    group_by(activity_labels, subject) %>% summarise_all(funs(mean(.)))

columnwise_mean = as.data.frame(columnwise_mean)

write.table(columnwise_mean, "tidy_columnwise_mean.txt")
write.table(mean_std_measurements, "tidy_mean_std_measurements.txt")


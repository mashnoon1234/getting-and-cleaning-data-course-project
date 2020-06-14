if (!require("dplyr", character.only = TRUE)) {
    install.packages("dplyr", dependencies = TRUE)
    library("dplyr", character.only = TRUE)
}

X_train = read.table("UCI\ HAR\ Dataset/train/X_train.txt")
y_train = read.table("UCI\ HAR\ Dataset/train/y_train.txt")
X_test = read.table("UCI\ HAR\ Dataset/test/X_test.txt")
y_test = read.table("UCI\ HAR\ Dataset/test/y_test.txt")
feature_names = read.table("UCI\ HAR\ Dataset/features.txt")
activity_labels = read.table("UCI\ HAR\ Dataset/activity_labels.txt")

print(paste("X_train dims: (", dim(X_train)[1], ",", dim(X_train)[2], ")", sep = ""))
print(paste("y_train dims: (", dim(y_train)[1], ",", dim(y_train)[2], ")", sep = ""))
print(paste("X_test dims: (", dim(X_test)[1], ",", dim(X_test)[2], ")", sep = ""))
print(paste("y_test dims: (", dim(y_test)[1], ",", dim(y_test)[2], ")", sep = ""))

merge_X_train_y_train = cbind(X_train, y_train)
merge_X_test_y_test = cbind(X_test, y_test)

merge_train_test = rbind(merge_X_train_y_train, merge_X_test_y_test)

names(merge_train_test) = feature_names[, "V2"]
names(merge_train_test)[562] = "activity_labels"

print(paste("merge_train_test dims: (", dim(merge_train_test)[1], ",", dim(merge_train_test)[2], ")", sep = ""))

mean_std_measurements = select(merge_train_test, contains("mean") | contains("std") | "activity_labels")
print(names(mean_std_measurements))

map = setNames(as.vector(activity_labels[, "V2"]), as.vector(activity_labels[, "V1"]))
mean_std_measurements[, "activity_labels"] = map[mean_std_measurements[, "activity_labels"]]
print(head(mean_std_measurements))

columnwise_mean = mean_std_measurements %>% group_by(activity_labels) %>%
    summarise_all(funs(mean(.)))

columnwise_mean = as.data.frame(columnwise_mean)
print(columnwise_mean)

write.table(columnwise_mean, "tidy_columnwise_mean.txt")
write.table(mean_std_measurements, "tidy_mean_std_measurements.txt")


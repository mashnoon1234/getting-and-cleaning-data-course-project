X_train = read.table("UCI\ HAR\ Dataset/train/X_train.txt")
y_train = read.table("UCI\ HAR\ Dataset/train/y_train.txt")
X_test = read.table("UCI\ HAR\ Dataset/test/X_test.txt")
y_test = read.table("UCI\ HAR\ Dataset/test/y_test.txt")
feature_names = read.table("UCI\ HAR\ Dataset/features.txt")
activity_labels = read.table("UCI\ HAR\ Dataset/activity_labels.txt")

print(paste("X_train ncols: ", ncol(X_train)))
print(paste("y_train ncols: ", ncol(y_train)))
print(paste("X_test ncols: ", ncol(X_test)))
print(paste("y_test ncols: ", ncol(y_test)))

merge_X_train_y_train = cbind(X_train, y_train)
names(merge_X_train_y_train) = feature_names[, "V2"]
names(merge_X_train_y_train)[562] = "activity_labels"
print(head(merge_X_train_y_train, n = 1))

merge_X_test_y_test = cbind(X_test, y_test)
names(merge_X_test_y_test) = feature_names[, "V2"]
names(merge_X_test_y_test)[562] = "activity_labels"
print(head(merge_X_train_y_train, n = 1))



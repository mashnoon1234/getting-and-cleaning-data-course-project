# Dataset Overview and Source
Two datasets have been created from the train and test data provided in the [Human Activity Recognition using Smartphones Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) using a custom data-preprocessing script. Relevant information including experiment design, data collection method and units of the source dataset can be found in the <em>README.txt</em> file in the <em>Source Information</em> directory, which has been collected from the original data source.

# Dataset Information

## Files 
### <b>1. merged_mean_std_measurements.txt</b>
#### Description 
This file contains data merged from files in the data source ([download data source](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)). At first, <em>X_train.txt</em>, <em>y_train.txt</em> and <em>subject_train.txt</em> have been merged column-wise, so that all the columns from the three files are in one dataset. The same is done for <em>X_test.txt</em>, <em>y_test.txt</em> and <em>subject_test.txt</em>. The data from both column-wise merge operations have then been merged row-wise, so that all rows from both datasets are in one dataset. This final dataset is then written to this file (<em>merged_mean_std_measurements.txt</em>).

#### Variables
All the variables except for <em>activity_labels</em> and <em>subject</em>, which have categorical values, are numerical variables. The names of these 88 variables for the tidy datasets are included in the first line of the file and also in the file <em>tidy_features.txt</em>. Information regarding these variables, except for the variable <em>activity_labels</em>, can be found in the files <em>feature_info.txt</em> and <em>README.txt</em> (taken from the raw data source) in the <em>Source Information</em> directory. The variable <em>activity_labels</em> consists of the following categorical values: 
1. WALKING
2. WALKING_UPSTAIRS
3. WALKING_DOWNSTAIRS
4. SITTING
5. STANDING
6. LAYING

#### Dimensions
The data in the file contains 10299 rows and 88 columns in total, with no missing values.

### <b>2. groupwise_column_mean.txt</b>
#### Description 
This file contains group-wise mean of each column from <em>merged_mean_std_measurements.txt</em> (except for the columns <em>activity_labels</em> and <em>subject</em>, as these are the grouping variables). 

#### Variables
The variable information for this file is exactly the same as that for the file <em>merged_mean_std_measurements.txt</em>. 

#### Dimensions
The data in the file contains 180 rows and 88 columns in total, with no missing values.




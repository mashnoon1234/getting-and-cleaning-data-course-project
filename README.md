# Overview 

This repository contains an R script <em>run_analysis.R</em> that transforms the train and test data of the [Human Activity Recognition Using Smartphones Dataset](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) into two tidy datasets, which have been described in [CodeBook.md](CodeBook).

# Usage Instructions

1. Download the [dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) and unzip the folder
2. Open up R terminal
3. Use the command...

    ```{r}
    source("run_analysis.R")
    ```

    ...and two output data files will be present in the directory of the script once the script completes execution. Required dependencies will also be automatically installed and loaded. The contents of the output files will all be delimited by one white space character.
# Readme

This document describes the code inside `run_analysis.R`.

The code is splitted  in some sections:

* Helper function
* Main function

## Helper function

### analyze_1set

####Used to manipulate data in every set - test and train

* Reads "X_", "y_" and "subject" files from appropriate directory.
* Selects all mean and std values from X_ file with indexes obtained from main function.
* Replaces activity numbers with activity names.
* Binds all columns together and returns resulting dataframe.


## Main function

### main_function

####function that performs all main actions.

* Defines constant - path to the files.
* Reads file features.txt and finds indexes of the values containing "std" or "mean".
* Creates column names for the resulting dataframe.
* Reads activity labels from  activity_labels.txt.
* Calls "analyze_1set" function for every dataset "train" and "test".
* Merges results.
* Sets column names for the result.

At this point resulting dataframe looks like this:

Subject_ID Activity tBodyAcc-mean()-X tBodyAcc-mean()-Y tBodyAcc-mean()-Z tGravityAcc-mean()-X
1          1 STANDING        -0.9750599        -0.9915537        -0.9689591           0.37731121
2          1 STANDING        -0.9847146        -0.9915537        -0.9806831          -0.45855331
3          1 STANDING        -0.9847146        -0.9661929        -0.9763171           0.09051947

* Creates new dataframe with  averages and sets appropiate column names.
* Writes last dataframe to a file. 

Resulting dataframe looks like this:

Subject_ID Activity tBodyAcc-mean()-X_Avg tBodyAcc-mean()-Y_Avg tBodyAcc-mean()-Z_Avg tGravityAcc-mean()-X_Avg
1          1   LAYING            -0.8298188            -0.9096780            -0.8747595               -0.1780861
2          2   LAYING            -0.9664883            -0.9372385            -0.9500116               -0.2152265
3          3   LAYING            -0.9583081            -0.9482670            -0.9515648               -0.3228530


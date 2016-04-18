# Code Book

This document describes variables and manipulations inside `run_analysis.R`.

## Variables
  
  activity_table - data from "y_" file.
  vector_table - data from  "/X_" file.
  subject_table - data from "/subject_" file.
  mean_table - subset of vector_table containing only "mean" values.
  std_table - subset of vector_table containing only "std" values.
  act_table - activity_table with activity numbers replaced with activity labels.
  result_set - subject_table+act_table+mean_table+std_table.
  home_directory - path to home directory.
  path_to_data - home_directory+"UCI HAR Dataset/".
  feature_table - data from "features.txt" file.
  feature_vector - second cloumn of feature table (actual names).
  mean_index - indexes of feature_vector containing "mean".
  mean_names - actual names from feature_vector containing "mean".
  std_index - indexes of feature_vector containing "std".
  std_names - acual_names from feature vector containing "std".
  colnames_result - column names for resulting dataset.
  labels_table - data from "activity.labels.txt"
  train_df - result dataframe after performing all operations on "train" dataset.
  test_df - result dataframe after performing all operations on "test" dataset
.
  result_df - train_df+test_df resuling dataframe.
  result_df_mean - second resulting dataframe with means calculated.
  mean_names_avg - mean_names updated - "_Avg" added to every name.
  std_names_avg - mean_names updated - "_Avg" added to every name.
  
  result_df_mean <- aggregate(result_df[, 3:81], list(result_df$Subject,result_df$Activity), mean)
  mean_names_avg <-as.character(sapply(mean_names,function(x) paste0(x,"_Avg")))
  std_names_avg <-as.character(sapply(std_names,function(x) paste0(x,"_Avg")))

#Manipulations(main and helper functions).

* Defines constant - path to the files.
* Reads file features.txt and finds indexes of the values containing "std" or "mean".
* Creates column names for the resulting dataframe.
* Reads activity labels from  activity_labels.txt
* Calls "analyze_1set" function for every dataset "train" and "test".
        * Reads "X_", "y_" and "subject" files from appropriate directory.
	* Selects all mean and std values from X_ file with indexes obtained from main function.
	* Replaces activity numbers with activity names.
	* Binds all columns together and returns resulting dataframe.

* Merges results.
* Sets column names for the result.
* Creates new dataframe with  averages and sets appropiate column names.
* Writes last dataframe to a file. 

analyze_1set <-function(sub_dir){
result_set <- cbind(subject_table,act_table,mean_table,std_table)
}

main_function <- function() {
  home_directory <-"/Users/tatianameleshko/"
  path_to_data <- paste0(home_directory,"UCI HAR Dataset/")
  
  feature_table <- read.table(paste0(path_to_data,"features.txt"))
  feature_vector <- feature_table[[2]]
  mean_index <-which(grepl("mean",feature_vector))
  mean_names <- feature_vector[mean_index]
  std_index <- which(grepl("std",feature_vector))
  std_names <- feature_vector[std_index]
  colnames_result <- c("Subject_ID","Activity",as.character(mean_names),as.character(std_names))
  
  labels_table <- read.table(paste0(path_to_data,"activity_labels.txt"))
  
  train_df <- analyze_1set("train")
  test_df <- analyze_1set("test")
  result_df <- rbind(train_df,test_df)
  colnames(result_df) <- colnames_result
  
  result_df_mean <- aggregate(result_df[, 3:81], list(result_df$Subject,result_df$Activity), mean)
  mean_names_avg <-as.character(sapply(mean_names,function(x) paste0(x,"_Avg")))
  std_names_avg <-as.character(sapply(std_names,function(x) paste0(x,"_Avg")))
  colnames(result_df_mean) <- c("Subject_ID","Activity",mean_names_avg,std_names_avg)
  write.csv(result_df_mean,paste0(path_to_data,"result_df_mean.csv"))
}
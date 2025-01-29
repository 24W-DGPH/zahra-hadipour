# Load necessary libraries  
library(dplyr)  

# Load your data  
diabetes_data <- read.csv("/Users/niloufar/Desktop/diabetes_data_upload.csv")  

# Inspect the dataset structure and summary statistics  
str(diabetes_data)  
summary(diabetes_data)  

# Check for missing values  
missing_values <- colSums(is.na(diabetes_data))  
print(missing_values)  

# Removing rows with missing values (if appropriate)  
# You can choose to remove or impute based on how critical the data is  
diabetes_data <- na.omit(diabetes_data)  

# Alternatively, if you wish to impute missing values,  
# consider using methods such as mean/mode substitution or other imputation techniques.  
# Example: Filling missing numerical values with the mean  
diabetes_data$Age[is.na(diabetes_data$Age)] <- mean(diabetes_data$Age, na.rm = TRUE)  

# Convert relevant columns to factors  
diabetes_data$class <- factor(ifelse(diabetes_data$class == 1, "Positive", "Negative"),   
                              levels = c("Positive", "Negative"))  
diabetes_data$Polyuria <- factor(diabetes_data$Polyuria)  # Assuming this is binary Yes/No  
diabetes_data$Polydipsia <- factor(diabetes_data$Polydipsia)  # Assuming this is binary Yes/No  

# Review the cleaned dataset  
print(head(diabetes_data))
# Load dplyr for data manipulation  
library(dplyr)  

# Descriptive statistics  
summary_stats <- diabetes_data
  summarise(mean_Age = mean(Age, na.rm = TRUE),  # Example for Age column  
            mean_Polyuria = mean(Polyuria, na.rm = TRUE))  # Example for Polyuria column  
print(summary_stats)  

# Correlation analysis  
cor_matrix <- cor(diabetes_data[, sapply(diabetes_data, is.numeric)], use = "complete.obs")  


library(ggplot2)  

# Example: Bar plot of diabetes outcomes by Gender  
ggplot(diabetes_data, aes(x = Gender, fill = class)) +  
  geom_bar(position = "dodge") +  
  labs(title = "Diabetes Outcomes by Gender",   
       x = "Gender",   
       y = "Count") +  
  theme_minimal()  

# Example: Bar plot of diabetes outcomes by Polyuria  
ggplot(diabetes_data, aes(x = Polyuria, fill = class)) +  
  geom_bar(position = "dodge") +  
  labs(title = "Diabetes Outcomes by Polyuria",   
       x = "Polyuria (Yes/No)",   
       y = "Count") +  
  theme_minimal()
# Example: Scatter plot using Gender and Polyuria  
ggplot(diabetes_data, aes(x = Gender, y = Polyuria, color = class)) +  
  geom_jitter(width = 0.1, height = 0.1, alpha = 0.5) +  
  labs(title = "Diabetes Outcomes by Gender and Polyuria",   
       x = "Gender",   
       y = "Polyuria (Yes/No)") +  
  theme_minimal()
# Example: Bar plot with Gender, Polyuria, and Obesity  
ggplot(diabetes_data, aes(x = Gender, y = Polyuria, color = class, shape = Obesity)) +  
  geom_jitter(width = 0.1, height = 0.1, alpha = 0.7, size = 3) +  
  labs(title = "Diabetes Outcomes by Gender, Polyuria, and Obesity",   
       x = "Gender",   
       y = "Polyuria (Yes/No)") +  
  theme_minimal() +  
  scale_shape_manual(values = c(16, 17))  # Example shapes for Obesity (16 for No, 17 for Yes)


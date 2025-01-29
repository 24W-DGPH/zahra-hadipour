library(shiny)  
library(ggplot2)  

# Load your data  
diabetes_data <- read.csv("/Users/niloufar/Desktop/diabetes_data_upload.csv")  

# Clean and prepare the data  
diabetes_data$class <- factor(ifelse(diabetes_data$class == 1, "Positive", "Negative"), levels = c("Positive", "Negative"))  

# UI  
ui <- fluidPage(  
  titlePanel("Diabetes Data Visualization"),  
  
  sidebarLayout(  
    sidebarPanel(  
      # Removed selectInput for class, now it's fixed as "Negative"  
      h3("Class: Negative"),  # Just a label indicating the fixed class  
      selectInput("y_variable", "Select variable to plot against Age:",   
                  choices = c("Polyuria", "Polydipsia", "sudden_weight_loss", "weakness",   
                              "Polyphagia", "Genital_thrush", "visual_blurring",   
                              "Itching", "Irritability", "delayed_healing",   
                              "partial_paresis", "muscle_stiffness", "Alopecia", "Obesity"))  
    ),  
    
    mainPanel(  
      plotOutput("scatterPlot")  
    )  
  )  
)  

# Server  
server <- function(input, output) {  
  output$scatterPlot <- renderPlot({  
    # Filter the data only for the "Negative" class  
    filtered_data <- subset(diabetes_data, class == "Negative")  
    
    # Check if filtered data is empty  
    if (nrow(filtered_data) == 0) {  
      return(NULL)  # Return nothing if there's no data  
    }  
    
    # Create the plot  
    ggplot(filtered_data, aes_string(x = "Age", y = input$y_variable, color = input$y_variable)) +  
      geom_point(alpha = 0.6) +  
      labs(title = paste("Relationship between Age and", input$y_variable, "for Class: Negative"),   
           x = "Age",   
           y = input$y_variable) +  
      theme_minimal() +  
      theme(legend.position = "bottom") +  
      scale_color_manual(values = c("Yes" = "blue", "No" = "red"))  # Customize colors for Yes/No  
  })  
}  

# Run the application   
shinyApp(ui = ui, server = server)
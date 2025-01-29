# app.R  
library(shiny)  
library(ggplot2)  

# UI  
ui <- fluidPage(  
  titlePanel("Diabetes Data Visualization"),  
  
  sidebarLayout(  
    sidebarPanel(  
      selectInput("outcome", "Select Outcome:", choices = levels(diabetes_data$Outcome))  
    ),  
    
    mainPanel(  
      plotOutput("scatterPlot")  
    )  
  )  
)  

# Server  
server <- function(input, output) {  
  output$scatterPlot <- renderPlot({  
    filtered_data <- subset(diabetes_data, Outcome == input$outcome)  
    
    ggplot(filtered_data, aes(x = Age, y = Glucose)) +  
      geom_point() +  
      labs(title = paste("Glucose Levels for Outcome:", input$outcome), x = "Age", y = "Glucose Level")  
  })  
}  

# Run the application   
shinyApp(ui = ui, server = server)


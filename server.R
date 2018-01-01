#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {

  # Will use carat, cut, color, clarity and price from diamonds data set 
  # within ggplot2 library        
  diamond_data <- diamonds[,c(1:4,7)]
  
  # Let's define a simple linear regression model
  fit <- lm(price~carat+cut+color+clarity, diamond_data)
  
  output$price <- renderText({
      # And predict the price based on user input
      prediction <- predict(fit,data.frame(carat=input$carat,cut=input$cut,color=input$color,clarity=input$clarity))
  })
  
})

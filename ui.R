#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Diamond Pricing Guide"),
  
  # Sidebar with a input options describing the dimaond you are looking for
  sidebarLayout(
    sidebarPanel(
       h3("Please select the characteristics of the diamond you are looking at."),
       h3("This app will tell you the approximate cost that you should expect to pay"),
       numericInput("carat", "Carats", step = 0.01, value = 1.00),
       selectInput("cut", "Choose Cut:", c("Fair"="Fair","Good"="Good","Very Good"="Very Good","Premium"="Premium","Ideal"="Ideal"), selected = "Very Good"),
       selectInput("color", "Choose Color:", c("J (Worst)"="J","I"="I","H"="H","G"="G","F"="F","E"="E","D (Best)"="D"), selected = "G"),
       selectInput("clarity", "Choose Clarity:", c("I1 (Worst)"="I1","SI2"="SI2","SI1"="SI1","VS2"="VS2","VS1"="VS1","VVS2"="VVS2","VVS1"="VVS1","IF (Best)"="IF"),selected = "VS2")
    ),
    
    # Show the expected price of your diamond
    mainPanel(
       h2("Based on your selected criteria, the price for your chosen diamond should be approximately: "),
       h1("$",textOutput("price",inline = TRUE))
    )
  )
))

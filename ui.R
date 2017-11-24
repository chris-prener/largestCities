library(shiny)

# Define UI for miles per gallon application
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Largest Cities"),
  
  sidebarPanel(# Simple integer interval
    sliderInput("year", "Year:", 
                min=1790, max=1810, value=0, step=10, sep = "")
    ),
  
  # Show a table summarizing the values entered
  mainPanel(
    tableOutput("values")
  )
))
library(shiny)

# Define UI for miles per gallon application
shinyUI(pageWithSidebar(
  
  # Application title
  headerPanel("Largest Cities in America"),
  
  sidebarPanel(
    helpText("Trace the growth of America's largest cities from 1790 to 2010."),
    
    sliderInput("year", "Census Year:", 
                min=1790, max=2010, value=10, step=10, sep = ""),
    
    selectInput("city", 
                label = "Optionally choose a city to focus on:",
                choices = c(" ", "Baltimore", "Boston", "Chicago", "Los Angeles", "New Orleans", "New York",
                            "Philadelphia", "St. Louis"),
                selected = " "),
    
    checkboxInput("allYears", "Show all years' data for selected city", FALSE)
    ),
  
  # Show a table summarizing the values entered
  mainPanel(
    tableOutput("values")
  )
))
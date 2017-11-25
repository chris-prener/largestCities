library(shiny)

# Define UI for miles per gallon application
shinyUI(fluidPage(
  
  # Application title
  headerPanel("Largest Cities in America"),
  
  sidebarPanel(
    helpText("Trace the growth of America's largest cities from 1790 to 2010. You can display either the ten largest cities per decennial census or focus on a single city's changes over time."),
    
    sliderInput("year", "Choose a Census Year:", 
                min=1790, max=2010, value=10, step=10, sep = ""),
    
    selectInput("city", 
                label = "Choose a City:",
                choices = c(" ", "Baltimore", "Boston", "Chicago", "Los Angeles", "New Orleans", "New York",
                            "Philadelphia", "St. Louis"),
                selected = " "),
    
    actionButton("reset", "Reset App")
    ),
  
  # Show a table summarizing the values entered
  mainPanel(
    
    # Output: Tabset w/ table and plot
    tabsetPanel(type = "tabs",
                tabPanel("Table", tableOutput("values")),
                tabPanel("Plot", plotOutput("plot"))
    )
    
  )
))
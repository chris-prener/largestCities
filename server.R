library(shiny)
library(dplyr)

largestCities <- readRDS("data/largestCities.rds")

# Define server logic required to plot various variables against mpg
shinyServer(function(input, output) {
  
  # Reactive expression to compose a data frame containing all of the values
  sliderValues <- reactive({
    
    largestCities %>%
      filter(year == input$year) %>%
      select(-year) %>%
      mutate(pop = as.integer(pop))
    
  })
  
# Show the values using an HTML table
output$values <- renderTable({
    sliderValues()
  })
})
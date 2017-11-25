library(shiny)
library(dplyr)

largestCities <- readRDS("data/largestCities.rds")

# Define server logic required to plot various variables against mpg
shinyServer(function(input, output) {
  
  # Reactive expression to compose a data frame containing all of the values
  sliderValues <- reactive({
    
    if (input$city == " ") {
      largestCities %>%
        filter(Year == input$year) %>%
        select(-Year) %>%
        mutate(Population = as.integer(Population))
    } else if (input$city != " ") {
      largestCities %>%
        filter(City == input$city) %>%
        select(-City, -State) %>%
        select(Year, Population, Rank) %>%
        mutate(Population = as.integer(Population)) %>%
        mutate(Year = as.integer(Year))
    }
    
  
  })
  
# Show the values using an HTML table
output$values <- renderTable({
    sliderValues()
  })
})
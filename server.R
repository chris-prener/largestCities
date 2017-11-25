library(shiny)
library(dplyr)

largestCities <- readRDS("data/largestCities.rds")

# Define server logic required to plot various variables against mpg
shinyServer(function(input, output, session) {
  
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
  
  observeEvent(input$reset, {
    updateSliderInput(session, "year", value = 1790, min=1790, max=2010, step=10)
    updateSelectInput(session, "city", 
                label = "Optionally choose a city to focus on:",
                choices = c(" ", "Baltimore", "Boston", "Chicago", "Los Angeles", "New Orleans", "New York",
                            "Philadelphia", "St. Louis"),
                selected = " ")
  })
  
  # Show the values using an HTML table
  output$values <- renderTable({
      sliderValues()
  })
})
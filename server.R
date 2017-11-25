library(shiny)
library(dplyr)
library(ggplot2)
library(scales)

largestCities <- readRDS("data/largestCities.rds")

# Define server logic required to plot various variables against mpg
shinyServer(function(input, output, session) {
  
  # Reactive expression to compose a data frame containing all of the values
  dataset <- reactive({
    
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
  
  output$plot <- renderPlot({
    if (input$city != " ") {
      p <- ggplot(dataset(), mapping = aes(x=Year, y=Population)) + 
              geom_line() +
              scale_y_continuous(labels = comma) +
              theme_grey(base_size = 18)
      
      print(p)
    }
    
  })
  
  observeEvent(input$city, {
    updateSliderInput(session, "year", value = 1790, min=1790, max=2010, step=10)
  })
  
  observeEvent(input$reset, {
    updateSliderInput(session, "year", value = 1790, min=1790, max=2010, step=10)
    updateSelectInput(session, "city", 
                choices = c(" ", "Baltimore", "Boston", "Chicago", "Los Angeles", "New Orleans", "New York",
                            "Philadelphia", "St. Louis"),
                selected = " ")
  })
  
  # Show the values using an HTML table
  output$values <- renderTable({
    dataset()
  })
})
library(shiny)
library(dplyr)
library(ggplot2)
library(scales)
library(ggthemes)
library(mapdata)
library(mapproj)

largestCities <- readRDS("data/largestCities.rds")

states <- map_data("state")

# Define server logic required to plot various variables against mpg
shinyServer(function(input, output, session) {
  
  # Reactive expression to compose a data frame containing all of the values
  dataset <- reactive({
    
    if (input$city == " ") {
      largestCities %>%
        filter(Year == input$year) %>%
        select(-Year, -cityState, -lon, -lat) %>%
        mutate(Population = as.integer(Population))
    } else if (input$city != " ") {
      largestCities %>%
        filter(City == input$city) %>%
        select(-City, -State, -cityState, -lon, -lat) %>%
        select(Year, Population, Rank) %>%
        mutate(Population = as.integer(Population)) %>%
        mutate(Year = as.integer(Year))
    }
  
  })
  
  output$plot <- renderPlot({
    if (input$city == " ") {
      largestCities %>%
        filter(Year == input$year) -> x
      
      p <- ggplot() +
              geom_polygon(data = states, aes(x=long, y = lat, group = group), color = "black", fill = "gray") + 
              geom_point(data = x, aes(x = lon, y = lat), size = 3, color = "red") + 
              coord_map() +
              theme_map()
      
      print(p)
    } else if (input$city != " ") {
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
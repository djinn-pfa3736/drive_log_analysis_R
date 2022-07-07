library(shiny)
library(leaflet)

source("./ExtractDriversWithTrip.R")
source("./NormalizeName.R")
shinyServer(
  function(input, output, session){

    data_react = reactive({
        
      # df <- data.frame(file.name = input$file.name,
      #                  driver.id = input$driver.id,
      #                  trip.idx = input$trip.idx)
      # return(list(df = df))

      input.file = input$file.name
      if(is.null(input.file)) {
        return(NULL)
      }
      drive.data <- read.csv(input$file.name$datapath)
      name.vec <- NormalizeName(drive.data)
      unique.name.vec <- unique(name.vec)
      driver.trip.list <- ExtractDriversWithTrip(drive.data, name.vec, unique.name.vec)

      return(driver.trip.list)

      # browser() 
      # na.idx <- which(is.na(driver.trip.data[, 2]))
      # if(length(na.idx) != 0) {
      #   driver.trip.data <- driver.trip.data[-na.idx, ]
      # }
      # plot.idx <- which(driver.trip.data[, 1] == unique.trip.vec[trip.idx])
        
      # driver.trip.plot <- driver.trip.data[plot.idx, ]
    })

    driver_react <- reactive({
      driver.trip.list = data_react()
      driver.id <- as.numeric(input$driver.id)
      driver.trip.data <- driver.trip.list[[driver.id]]

      lat.mean <- mean(driver.trip.data[, 2])
      lon.mean <- mean(driver.trip.data[, 3])
      
      trip.idx <- as.numeric(input$trip.idx)
      unique.trip.vec <- unique(driver.trip.data[, 1])
      
      na.idx <- which(is.na(driver.trip.data[, 2]))
      if(length(na.idx) != 0) {
        driver.trip.data <- driver.trip.data[-na.idx, ]
      }
      plot.idx <- which(driver.trip.data[, 1] == unique.trip.vec[trip.idx])
      
      driver.trip.plot <- driver.trip.data[plot.idx, ]
      
      return(list(plot.idx, driver.trip.plot, lat.mean, lon.mean))
    })
        
    # output$table <- renderTable({
    output$new.map <- renderLeaflet({
      if (is.null(data_react())) { return() }
      dr = driver_react()
      
      m <- leaflet(dr[[2]]) %>% addTiles()
      m %>% setView(lng=dr[[4]], lat=dr[[3]], zoom=15) %>% 
        addPolylines(lng=~gps_longitude, lat=~gps_latitude, color="#ff0000", weight="8") %>% 
        addPopups(lng=~gps_longitude[1], lat=~gps_latitude[1], popup=c("START"))
      # print(Data()$driver.trip.data)
      # print(data_react()[[1]])
    })
    
  })
library(shiny)
library(leaflet)

options(shiny.maxRequestSize=100*1024^2)
shinyUI(
  pageWithSidebar(
    headerPanel("Trip Analyzer for Alpaca.lab")
    ,
    sidebarPanel(
      fileInput('file.name', "Enter drive data file",
                accept = c(
                  "text/csv",
                  "text/comma-separated-values,text/plain",
                  ".csv"))
      ,
      numericInput('driver.id', "Input driver id","")
      ,
      numericInput('trip.idx', "Input trip index","")
      ,      
      actionButton("submit", "Submit")
    )
    ,
    # mainPanel(tableOutput('table'))
    mainPanel(leafletOutput('new.map'))
  ))


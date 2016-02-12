library(shiny)
source("uielements.R")
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Convergence of Quadraticable Continued Fractions"),
  
  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      complexInput("a","realA","imagA"),
      complexInput("b","realB","imagB"),
      complexInput("start","realStart","imagStart"),
      sliderInput(inputId = "iterations","Number of iterations", 
                  min = 2, max = 1000, value = 2, step = 1, animate = animationOptions(interval=300))
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      fluidRow(h2("x = a+b - (ab)/x")),
      fluidRow(plotOutput("mainPlot", 
                          height = 500,
                          brush = brushOpts(id = "brusher",resetOnNew = FALSE)
      )),
      fluidRow(plotOutput("zoomPlot", height = 300))
    )
  )
))

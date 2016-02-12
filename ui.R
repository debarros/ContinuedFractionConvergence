library(shiny)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("Convergence of Quadraticable Continued Fractions"),
  
  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      div(style="display:inline-block","a = "),
      div(style="display:inline-block",numericInput(inputId = "realA",label = NULL,value = 2, width = "100px")),
      div(style="display:inline-block"," + "),
      div(style="display:inline-block",numericInput(inputId = "imagA",label = NULL, value = 1, width = "100px")),
      div(style="display:inline-block","i"),
      br(),
      div(style="display:inline-block","b = "),
      div(style="display:inline-block",numericInput(inputId = "realB",label = NULL, value = 1, width = "100px")),
      div(style="display:inline-block"," + "),
      div(style="display:inline-block",numericInput(inputId = "imagB",label = NULL, value = 2, width = "100px")),
      div(style="display:inline-block","i"),
      br(),
      div(style="display:inline-block","start = "),
      div(style="display:inline-block",numericInput(inputId = "realStart",label = NULL, value = 1, width = "100px")),
      div(style="display:inline-block"," + "),
      div(style="display:inline-block",numericInput(inputId = "imagStart",label = NULL, value = 0, width = "100px")),
      div(style="display:inline-block","i"),
      br(),
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

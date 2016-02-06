library(shiny)

shinyUI(fluidPage(
  
  # Application title
  titlePanel("Convergence of Quadraticable Continued Fractions"),
  
  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      sliderInput("realA","Real component of a", min = -10, max = 10, value = 2),
      sliderInput("imagA","Imaginary component of a", min = -10, max = 10, value = 1),
      sliderInput("realB","Real component of b", min = -10, max = 10, value = 1),
      sliderInput("imagB","Imaginary component of b", min = -10, max = 10, value = 2),
      sliderInput("realStart","Real component of initial value", min = -10, max = 10, value = 1),
      sliderInput("imagStart","Imaginary component of initial value", min = -10, max = 10, value = 0),
      sliderInput("iterations","Number of iterations", 
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

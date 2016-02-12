library(ggplot2)
library(shiny)

shinyServer(function(input, output) {

  a = reactive(complex(real = input$realA, imaginary = input$imagA))
  b = reactive(complex(real = input$realB, imaginary = input$imagB))
  starter = reactive(complex(real = input$realStart, imaginary = input$imagStart))
  
  masterplot = reactive({
    x = complex(length.out = input$iterations)
    x[1] = starter()
    for (j in 2:input$iterations){
      x[j] = a() + b() - (a()*b()/x[j-1])
    }
    return(data.frame(Real = Re(x), Imaginary = Im(x)))
  })
  
  ranges2 <- reactiveValues(x = NULL, y = NULL)
  
  output$mainPlot = renderPlot({
    ggplot(data = masterplot(), 
           aes(Real, Imaginary)) + 
      geom_path()
  })
  
  output$zoomPlot = renderPlot({
    ggplot(data = masterplot(), 
           aes(Real, Imaginary)) + 
      geom_path() + 
      coord_cartesian(xlim = ranges2$x, ylim = ranges2$y)
    })
  
  # When a double-click happens, check if there's a brush on the plot.
  # If so, zoom to the brush bounds; if not, reset the zoom.
  observe({
    brush <- input$brusher
    if (!is.null(brush)) {
      ranges2$x <- c(brush$xmin, brush$xmax)
      ranges2$y <- c(brush$ymin, brush$ymax)
      
    } else {
      ranges2$x <- NULL
      ranges2$y <- NULL
    }
  })
})

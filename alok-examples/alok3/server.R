library(shiny)

converter <- function(id,from,to,val) {
  switch(id,
         "Temperature"={
           switch(from,
                  "Celsius"={
                    switch(to,
                           "Celsius" = round(val,digits=6),
                           "Fahrenheit" = round((val * 9/5) + 32,digits=6),
                           "Kelvin" = round(val + 273.15,digits=6))
                  },
                  "Fahrenheit"={
                    switch(to,
                           "Celsius" = round((val - 32 ) * 5/9,digits=6),
                           "Fahrenheit" = round(val,digits=6),
                           "Kelvin" = round(((val - 32 ) * 5/9) + 273.15,digits=6))
                  },
                  "Kelvin"={
                    switch(to,
                           "Celsius" = round(val - 273.15,digits=6),
                           "Fahrenheit" = round(((val - 273.15) * 9/5) + 32,digits=6),
                           "Kelvin" = round(val,digits=6))
                  }
           )
         },
         "Length" = {
           switch(from,
                  "Kilometers" = {
                    switch(to,
                           "Kilometers" = round(val,digits=6),
                           "Miles" = round(val * 0.62137,digits=6),
                           "Yards" = round(val * 1093.6,digits=6))
                  },
                  "Miles" = {
                    switch(to,
                           "Kilometers" = round(val * 1.609344,digits=6),
                           "Miles" = round(val,digits=6),
                           "Yards" = round(val * 1760,digits=6))
                  },
                  "Yards" = {
                    switch(to,
                           "Kilometers" = round(val * 0.00091,digits=6),
                           "Miles" = round(val * 0.00056818,digits=6),
                           "Yards" = round(val,digits=6))
                  }
           )
         }
  )
}

shinyServer(
  function(input, output) {
    # Depending on input$id1, generate a different conversion units
    # UI component and send it to the client.
    output$ui1 <- renderUI({
      if (is.null(input$id1))
        return()
      switch(input$id1,
             "Temperature" = selectInput("from", "From", c("Celsius", "Fahrenheit", "Kelvin")),
             "Length" = selectInput("from", "From", c("Kilometers", "Miles","Yards")))
    })
    
    output$ui2 <- renderUI({
      if (is.null(input$id1))
        return()
      switch(input$id1,
             "Temperature" = selectInput("to", "To", c("Celsius", "Fahrenheit", "Kelvin")),
             "Length" = selectInput("to", "To", c("Kilometers", "Miles","Yards")))
    })
    
    output$typ <- renderText({paste("Convert", input$id1 )})  
    output$ans <- renderText({paste(input$val1, input$from, "=",converter(toString(input$id1),toString(input$from),toString(input$to),as.double(input$val1)),input$to)})
  }
)
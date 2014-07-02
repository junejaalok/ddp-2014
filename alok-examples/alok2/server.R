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
				"Meter" = {
					switch(to,
						"Meter" = round(val,digits=6),
						"Mile" = round(val * 0.00062137,digits=6),
						"Yard" = round(val * 1.0936,digits=6))
				},
				"Mile" = {
					switch(to,
						"Meter" = round(val * 1609.344,digits=6),
						"Mile" = round(val,digits=6),
						"Yard" = round(val * 1760,digits=6))
				},
				"Yard" = {
					switch(to,
						"Meter" = round(val * 0.9144,digits=6),
						"Mile" = round(val * 0.00056818,digits=6),
						"Yard" = round(val,digits=6))
				}
			)
		},
		"Volume" = {
		  switch(from,
		         "Milliliter" = {
		           switch(to,
		                  "Milliliter" = round(val,digits=6),
		                  "US oz" = round(val * 0.033814,digits=6))
		         },
		         "US oz" = {
		           switch(to,
		                  "Milliliter" = round(val * 29.5735,digits=6),
		                  "US oz" = round(val,digits=6))
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
  		"Length" = selectInput("from", "From", c("Meter", "Mile","Yard")),
	    "Volume" = selectInput("from", "From", c("Milliliter", "US oz")))
	})

	output$ui2 <- renderUI({
	  if (is.null(input$id1))
	    return()
	  
    switch(input$id1,
  		"Temperature" = selectInput("to", "To", c("Celsius", "Fahrenheit", "Kelvin")),
  		"Length" = selectInput("to", "To", c("Meter", "Mile","Yard")),
	    "Volume" = selectInput("to", "To", c("Milliliter", "US oz")))
	})

  
  output$typ <- renderText({paste("Convert", input$id1 )})	
  output$ans <- renderText({paste(input$val1, input$from, "=",converter(toString(input$id1),toString(input$from),toString(input$to),as.double(input$val1)),input$to)})
  }
)

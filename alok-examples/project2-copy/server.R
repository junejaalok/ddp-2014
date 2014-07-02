library(shiny)

converter <- function(from,to,val) {
#	if (id == "distance") {
		if (from == "Kilometer") {
			if (to == "Kilometer") {
				round(val,digits=2)
			}
			else if (to == "Miles") {
				round(val * 0.62137,digits=2)
			}
			else if (to == "Yard") {
				round(val * 1093.6,digits=2)
			}
		}
		else if (from == "Miles"){
			if (to == "Kilometer") {
				round(val * 1.609344,digits=2)
			}
			else if (to == "Miles") {
				round(val,digits=2)
			}
			else if (to == "Yard") {
				round(val * 1760,digits=2)
			}
		}
		else if (from == "Yard") {
			if (to == "Kilometer") {
				val * 0.00091
			}
			else if (to == "Miles") {
				val * 0.00056818
			}
			else if (to == "Yard") {
				val
			}
		}
#	}
} 

shinyServer(
  function(input, output) {
	# Depending on input$id, generate a different conversion units
	# UI component and send it to the client.
#	output$ui1 <- renderUI({
# 		switch(input$id1,
#  		"temperature" = selectInput("from", "From", c("Celsius", "Fahrenheit", "Kelvin")),
#  		"distance" = selectInput("from", "From", c("Kilometer", "Miles","Yard")))
#  		})

#	output$ui2 <- renderUI({
# 		switch(input$id1,
#  		"temperature" = selectInput("to", "To", c("Celsius", "Fahrenheit", "Kelvin")),
#  		"distance" = selectInput("to", "To", c("Kilometer", "Miles","Yard")))
#  		})
  	output$ans1 <- renderText({paste(input$val1, input$from, "=",converter(toString(input$from),toString(input$to),as.double(input$val1)),input$to)})
  }
)

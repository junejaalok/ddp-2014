#comp_guess <- function() {
	g1<-sample(1:5,1)
}

library(shiny)
shinyServer(
  function(input, output) {
	g1<-sample(1:5,1)
  	output$onam1 <- renderText({
  	input$goButton
  	isolate({paste("Today is",input$date,",",input$nam1,"is playing against",input$id2)})
  	})
    output$oid1 <- renderText({input$id1})
    if 
#    output$oid2 <- renderPrint({input$id2})
  }
)

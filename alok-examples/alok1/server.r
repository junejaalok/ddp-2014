library(shiny)
shinyServer(
	function(input,output){
	output$odate<-renderPrint({input$date})
	}
)
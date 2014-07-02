library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Unit converter"),
  sidebarPanel(
#   radioButtons("id1", "Choose your option",
 #                  c("Temperature" = "temperature",
 #                    "Distance" = "distance")),

	# This outputs the dynamic UI component based on the option above
	selectInput("from", "From", c("Kilometer", "Miles","Yard")),
	textInput('val1',''),
	selectInput("to", "To", c("Kilometer", "Miles","Yard"))
#	uiOutput("ui1"),
#  	textInput('val1',''),
#	uiOutput("ui2")

  ),
  mainPanel(
        verbatimTextOutput("ans1")
  )
))

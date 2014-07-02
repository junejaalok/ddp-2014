library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Unit converter"),
  sidebarPanel(
   radioButtons("id1", "Choose option",
                   c("Temperature" = "Temperature",
                     "Length" = "Length")),

	# This outputs the dynamic UI component based on the option above
	uiOutput("ui1"),
  textInput('val1',"Enter the value"),
	uiOutput("ui2")

  ),
  mainPanel(
        verbatimTextOutput("typ"),
        verbatimTextOutput("ans")
  )
))

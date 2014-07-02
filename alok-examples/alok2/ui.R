library(shiny)
shinyUI(fluidPage(
  headerPanel("Unit converter"),
  fluidRow(column(10,
    fluidRow(column(4,
      radioButtons("id1", "Choose option",
                   c("Temperature" = "Temperature",
                     "Length" = "Length",
                     "Volume" = "Volume")),

	    # This outputs the dynamic UI component based on the option above
	    uiOutput("ui1"),
      textInput('val1',"Enter the value"),
	    uiOutput("ui2")

    ),
    column(6,
    mainPanel(
        verbatimTextOutput("typ"),
        verbatimTextOutput("ans")
  )))
))))

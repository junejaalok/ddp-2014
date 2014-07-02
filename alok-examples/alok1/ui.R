library(shiny)
shinyUI(pageWithSidebar(
	headerPanel("Data science FTW!"),
	sidebarPanel(
		h3('Sidebar text'),
		dateInput('date','Date:')
	),
	mainPanel(
		h3('Main Panel text'),
		h4('You entered'),
		verbatimTextOutput("odate")
	)
))
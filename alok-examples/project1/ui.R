library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Rock-Paper-Scissors-Lizard-Spock"),
  sidebarPanel(
  	textInput('nam1','Enter your name'),
#    numericInput('id1', 'Numeric input, labeled id1', 0, min = 0, max = 10, step = 1),

# http://www.top500.org/lists/2013/11/#.U5ZkmC-awr4
	checkboxGroupInput("id2", "You want to play against which computer?",
                   c("Tianhe-2" = "Tianhe-2",
                     "Titan" = "Titan",
                     "Sequoia" = "Sequoia")),
	actionButton('goButton',"Click to begin the game"),
    radioButtons("id1", "Choose your option",
                   c("Rice" = "Rice",
                     "Paper" = "Paper",
                     "Scissors" = "Scissors",
                     "Lizard"= "Lizard",
                     "Spock"="Spock")),

    dateInput("date", "Date:")  
  ),
  mainPanel(
        p('Welcome to the Game'),
        textOutput("onam1"),
        p('You chose'),
        textOutput("oid1")
#        p('Computer chose'),
#        textOutput("oid2"),
#        h4('You entered'),
#        textOutput("odate")
  )
))

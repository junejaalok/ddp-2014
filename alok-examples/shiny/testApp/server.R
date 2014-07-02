library(shiny)

diabetesRisk <- function(glucose) glucose / 200

shinyServer(
  function(input, output) {
    output$inputValue <- renderPrint({
      input$Submit
      isolate({input$glucose})})
    output$prediction <- renderPrint({
      input$Submit
      isolate({diabetesRisk(input$glucose)})})
  }
)

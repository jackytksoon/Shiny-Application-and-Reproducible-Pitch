# server.R

library(shiny)
source("helper.R")

shinyServer(function(input, output) {
    result <- eventReactive(input$action,rankhospital
        (input$State,input$Outcome,input$Rank))
    
    rankreactive <- eventReactive(input$action,input$Rank)
    
    outcomereactive <- eventReactive(input$action,input$Outcome)
    
    statereactive <- eventReactive(input$action,input$State)
    
    output$text1 <- renderText(paste("The hospital that rank ", rankreactive(),
                                      " for ", outcomereactive(),
                                      " in ", statereactive(),
                                      " is ",result()))
})
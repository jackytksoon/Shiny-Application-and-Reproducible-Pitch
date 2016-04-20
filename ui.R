library(shiny)

shinyUI(fluidPage(
  titlePanel("Search Hospitals Name by Rank, State and Outcome"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Select the state, outcome and rank you wish to check"),
    
      selectInput("State", "State", c("AK", "AL", "AR", "AZ", "CA", "CO", "CT", 
                                      "DC", "DE", "FL", "GA", "GU", "HI", "IA", 
                                      "ID", "IL", "IN", "KS", "KY", "LA", "MA", 
                                      "MD", "ME", "MI", "MN", "MO", "MS", "MT", 
                                      "NC", "ND", "NE", "NH", "NJ", "NM", "NV", 
                                      "NY", "OH", "OK", "OR", "PA", "PR", "RI", 
                                      "SC", "SD", "TN", "TX", "UT", "VA", "VI", 
                                      "VT", "WA", "WI", "WV", "WY")),
      
      radioButtons("Outcome", "Outcome", c("heart attack",
                                           "heart failure",
                                           "pneumonia")),
      
      numericInput("Rank","Rank", value = "1"),
      
      actionButton("action","Submit")
    ),
    
    mainPanel(
        p("This application allow users to search a hospital name
          in certain state and outcome about 30-day mortality and readmission 
        rates for over 4,000 hospitals. The outcome include:"),
        p("- Heart Attack"),
        p("- Heart Failure"),
        p("- Pneumonia"),
        
        br(),
        
        p("The higher the rank of the hospital, the lower the 30-day mortality."),
        
        strong(span(textOutput("text1")),style = "color:blue"),
        
        br(),
        br(),
        br(),
        
        helpText("Remark:"),
        helpText("* If there is a tie for a hospital for a given outcome, then 
                the hospital names should be sorted in alphabetical order and 
                the first hospital in that set should be chosen (i.e. if 
                hospitals \"b\", \"c\", and \"f\" are tied for best, then 
                hospital \"b\" should be returned)"),
        helpText("* The data are come from from the Hospital Compare website 
        (http://hospitalcompare.hhs.gov) run by the U.S. Department of Health 
                 and Human Services.")
        
    )
  )
))
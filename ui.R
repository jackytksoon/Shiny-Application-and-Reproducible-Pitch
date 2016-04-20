library(shiny)

shinyUI(fluidPage(
  titlePanel("Search Hospitals Name by Rank, State and Outcome"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Select the state, outcome and rank you wish to check"),
    
      selectInput("State", "State", c("AL", "AK", "AZ", "AR", "CA", "CO", "CT", 
                                      "DE", "DC", "FL", "GA", "HI", "ID", "IL",
                                      "IN", "IA", "KS", "KY", "LA", "ME", "MD",
                                      "MA", "MI", "MN", "MS", "MO", "MT", "NE",
                                      "NV", "NH", "NJ", "NM", "NY", "NC", "ND",
                                      "OH", "OK", "OR", "PA", "PR", "RI", "SC",
                                      "SD", "TN", "TX", "UT", "VT", "VI", "VA",
                                      "WA", "WV", "WI", "WY", "GU")),
      
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
        br(),
        br(),
        br(),
      
        helpText("Remark:"),
        helpText("* The data are come from from the Hospital Compare website 
        (http://hospitalcompare.hhs.gov) run by the U.S. Department of Health 
                 and Human Services.")
    )
  )
))
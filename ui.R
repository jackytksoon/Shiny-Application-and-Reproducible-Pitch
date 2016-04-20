library(shiny)

shinyUI(fluidPage(
  titlePanel("Ranking Hospitals by Outcome in a State"),
  
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
        p("This application allow users to search the ranking of a hospital
          in that state for that outcome about 30-day mortality and readmission 
        rates for heart attacks, heart failure, and pneumonia for over 4,000 
          hospitals."),
        
        br(),
        
        p("The higher the rank of the hospital, the lower the 30-day mortality."),
        
        strong(textOutput("text1")),
        
        br(),
        br(),
        br(),
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
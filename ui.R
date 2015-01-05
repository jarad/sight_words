require(shiny)
require(markdown)

shinyUI(pageWithSidebar(
  
  headerPanel("Sight word practice"),
  
  sidebarPanel(
    selectInput('set', "Select word set:", 1:10, multiple=TRUE),
    submitButton("Start practice.")
  ),
    
  mainPanel(
    tabsetPanel(
      tabPanel('Practice', 
               textOutput('results'),
               plotOutput('practice'),
               actionButton("correct",   "Correct!"),
               actionButton("incorrect", "Incorrect.")
               ),
      tabPanel('Help', includeMarkdown('help.md'))
    )
  )
))

library(shiny)

words = read.csv("sight_words.csv")

shinyServer(function(input,output) {
  d <- reactive({
    words[words$Set %in% input$set, ]
  })
  
  reactive({
    a = input$correct
    b = input$incorrect
    
    test = d()
    
    if (a+b > nrow(test)) {
      output$results = renderText({
        print(a, "correct out of", a+b, ".")
      })
      output$practice = NULL
    } else {
      output$results = NULL
      output$practice = renderPlot({
        plot(0, 0, type='n', xlim=c(0,1), ylim=c(0,1), 
             axes=F, xlab='', ylab='')
        text(0.5, 0.5, test$Word[a + b + 1], cex=9)
      })
    }
  })
})

library(shiny)
library(kernlab); data(spam)
library(MASS)

mydata <- spam
attach(mydata)
type <- factor(type, labels = c("spam", "not spam"))

shinyServer(function(input, output) {
  
  formulaText <- reactive({
    paste(input$variable, "~ type")
  })
  
  formulaTextPoint <- reactive({
    paste("type ~", "as.integer(", input$variable, ")")
  })
  
  formulaTextPoint1 <- reactive({
      paste("fit()$fitted ~", "as.integer(", input$variable, ")")
  })
  
  fit <- reactive({
    glm(as.formula(formulaTextPoint()), family=binomial(logit), data=mydata)
    # fit = glm(type ~ make, family=binomial(logit), data=mydata)
  })
  
  output$caption <- renderText({
    formulaText()
  })
  
  output$typeBoxPlot <- renderPlot({
    boxplot(as.formula(formulaText()), 
            data = mydata,
            outline = input$outliers)
  })
  
  output$fit <- renderPrint({
    summary(fit())
  })
  
  output$typePlot <- renderPlot({
    with(mydata, {
      #plot(input$variable, fit()$fitted, type="l", col="red")
      # plot(as.integer(input$variable), fit()$fitted, type="l", col="red")
      plot(as.formula(formulaTextPoint1()))
      #abline(fit(), col=2)
      title(main="Spam Data with Fitted Logistic Regression Line")
    })
  })

})


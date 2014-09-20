library(shiny)

shinyUI(
  navbarPage("spam dataset",
             tabPanel("Details",
                      h2("Spambase Data Set"),
                      hr(),
                      h3("Description"),
                      helpText("The collection of spam e-mails came from a postmaster and individuals who had filed spam.",
                      	       "URL: https://archive.ics.uci.edu/ml/datasets/Spambase",
                               "The dataset has 4601 rows and 57 attributes."),
                               
                      h3("Format"),
                      p("A data frame with 4601 observations and the following 57 attributes."),
                        
                      p("48 continuous real [0,100] attributes of type word_freq_WORD = percentage of words in the e-mail that match WORD"),
                      p("6 continuous real [0,100] attributes of type char_freq_CHAR = percentage of characters in the e-mail that match CHAR"),
                      p("1 continuous real [1,...] attribute of type capital_run_length_average = average length of uninterrupted sequences of capital letters "),
                      p("1 continuous integer [1,...] attribute of type capital_run_length_longest = = length of longest uninterrupted sequence of capital letters"),
                      p("1 continuous integer [1,...] attribute of type capital_run_length_total = sum of length of uninterrupted sequences of capital letters"),
                      p("1 nominal {0,1} class attribute of type spam = denotes whether the e-mail was considered spam (1) or not (0)"),

                      h3("Source:"),
                      
                      p("George Forman (gforman at nospam hpl.hp.com) 650-857-7835")
             ),
             tabPanel("Analysis",
                      fluidPage(
                        titlePanel("The relationship between your chosen variable and spam type (type)"),
                        sidebarLayout(
                          sidebarPanel(
                            selectInput("variable", "Variable:",
                                        c("percentage of words in the e-mail that match the word MAKE" = "make",
                                          "percentage of words in the e-mail that match the word ADDRESS" = "address",
                                          "percentage of words in the e-mail that match the word ALL" = "all", 
                                          "percentage of words in the e-mail that match the word NUM3D" = "num3d",
                                          "percentage of words in the e-mail that match the word OUR" = "our",
      					  "percentage of words in the e-mail that match the word OVER" = "over",
                                          "percentage of words in the e-mail that match the word REMOVE" = "remove",
                                          "percentage of words in the e-mail that match the word INTERNET" = "internet", 
                                          "percentage of words in the e-mail that match the word ORDER" = "order",
                                          "percentage of words in the e-mail that match the word MAIL" = "mail",                                    
      					  "percentage of words in the e-mail that match the word RECEIVE" = "receive",
                                          "percentage of words in the e-mail that match the word WILL" = "will",
                                          "percentage of words in the e-mail that match the word PEOPLE" = "people",
                                          "percentage of words in the e-mail that match the word REPORT" = "report",
      					  "percentage of words in the e-mail that match the word ADRESSES" = "adresses",
                                          "percentage of words in the e-mail that match the word FREE" = "free",
                                          "percentage of words in the e-mail that match the word BUSINESS" = "business", 
                                          "percentage of words in the e-mail that match the word EMAIL" = "email",
                                          "percentage of words in the e-mail that match the word YOU" = "you", 
      					  "percentage of words in the e-mail that match the word CREDIT" = "credit",
                                          "percentage of words in the e-mail that match the word YOUR" = "your",
                                          "percentage of words in the e-mail that match the word FONT" = "font", 
                                          "percentage of words in the e-mail that match the word NUM000" = "num000",
                                          "percentage of words in the e-mail that match the word MONEY" = "money",
      					  "percentage of words in the e-mail that match the word HP" = "hp",
                                          "percentage of words in the e-mail that match the word HPL" = "hpl",
                                          "percentage of words in the e-mail that match the word GEORGE" = "george", 
                                          "percentage of words in the e-mail that match the word NUM650" = "num650",
                                          "percentage of words in the e-mail that match the word LAB" = "lab",                                  
      					  "percentage of words in the e-mail that match the word LABS" = "labs",
                                          "percentage of words in the e-mail that match the word TELNET" = "telnet",
                                          "percentage of words in the e-mail that match the word NUM857" = "num857",
                                          "percentage of words in the e-mail that match the word DATA" = "data",
      					  "percentage of words in the e-mail that match the word NUM415" = "num415",
                                          "percentage of words in the e-mail that match the word NUM85" = "num85",
                                          "percentage of words in the e-mail that match the word TECHNOLOGY" = "technology", 
                                          "percentage of words in the e-mail that match the word NUM1999" = "num1999",
                                          "percentage of words in the e-mail that match the word PARTS" = "parts", 
      					  "percentage of words in the e-mail that match the word PM" = "pm",                                    
      					  "percentage of words in the e-mail that match the word DIRECT" = "direct",
                                          "percentage of words in the e-mail that match the word CS" = "cs",
                                          "percentage of words in the e-mail that match the word MEETING" = "meeting",
                                          "percentage of words in the e-mail that match the word ORIGINAL" = "original",
      					  "percentage of words in the e-mail that match the word PROJECT" = "project",
                                          "percentage of words in the e-mail that match the word RE" = "re",
                                          "percentage of words in the e-mail that match the word EDU" = "edu", 
                                          "percentage of words in the e-mail that match the word TABLE" = "table",
                                          "percentage of words in the e-mail that match the word CONFERENCE" = "conference",                                     
                                          "percentage of words in the e-mail that match the char Semicolon" = "charSemicolon",
                                          "percentage of words in the e-mail that match the char Roundbracket" = "charRoundbracket",
                                          "percentage of words in the e-mail that match the char Squarebracket" = "charSquarebracket",
                                          "percentage of words in the e-mail that match the char Exclamation" = "charExclamation",
                                          "percentage of words in the e-mail that match the char Dollar" = "charDollar",
                                          "percentage of words in the e-mail that match the char Hash" = "charHash",
                                          "average length of uninterrupted sequences of capital letters" = "capitalAve",
                                          "length of longest uninterrupted sequence of capital letters" = "capitalLong",
                                          "sum of length of uninterrupted sequences of capital letters" = "capitalTotal",
                                          "Type, whether the e-mail was considered spam (1) or not (0)" = "type"
                                        )),
                            
                            checkboxInput("outliers", "Show BoxPlot's outliers", FALSE)
                          ),
                          
                          mainPanel(
                            h3(textOutput("caption")),
                            
                            tabsetPanel(type = "tabs", 
                                        tabPanel("BoxPlot", plotOutput("typeBoxPlot")),
                                        tabPanel("Regression model", 
                                                 plotOutput("typePlot"),
                                                 verbatimTextOutput("fit")
                                        )
                            )
                          )
                        )
                      )
             ),
             tabPanel("SourceCode",
                      p("shiny sever.R & ui.R"),
                      a("https://github.com/alanct/shiny")
             ),
             tabPanel("Documentation",
             	      p("The system uses logistic regression to find out if individual predictor variables can predict if an email is a spam or not."),
             	      p("The dependent variable is type, which is a nominal variable, has two possible values: spam vs. no spam."),
             	      p("Please push the Analysis tab and then select the predictor variable."),
             	      p("Click on the BoxPlot tab to see the boxplot of the predictor variable."),
             	      p("Click on the Regression tab to see a scatterplot of the fitted logistic regression equation and the R output.")
             )
  )
)





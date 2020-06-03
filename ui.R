library(shiny)

shinyUI(
    navbarPage("Shiny Application",
               tabPanel("Analysis",
                        fluidPage(
                            titlePanel("mtcars Data Sets : Various Relationships"),
                            sidebarLayout(
                                sidebarPanel(
                                    selectInput("variable", "Variable:",
                                                c("Rear axle ratio" = "drat",
                                                  "Number of forward gears" = "gear",
                                                  "Number of cylinders" = "cyl",
                                                  "Displacement (cu.in.)" = "disp",
                                                  "Gross horsepower" = "hp",
                                                  
                                                  "Weight (lb/1000)" = "wt",
                                                  "1/4 mile time" = "qsec",
                                                  "V/S" = "vs",
                                                  "Transmission" = "am",
                                                  
                                                  "Number of carburetors" = "carb"
                                                )),
                                    
                                    checkboxInput("outliers", "Show BoxPlot's outliers", FALSE)
                                ),
                                
                                mainPanel(
                                    h3(textOutput("caption")),
                                    
                                    tabsetPanel(type = "tabs", 
                                                tabPanel("BoxPlot", plotOutput("mpgBoxPlot")),
                                                tabPanel("Regression model", 
                                                         plotOutput("mpgPlot"),
                                                         verbatimTextOutput("fit")
                                                )
                                    )
                                )
                            )
                        )
               ),
               tabPanel("About the Data Set",
                        
                        h3("Regression Models"),
                        helpText("You work for Motor Trend, a magazine about the automobile industry Looking at a data set of a collection of cars, they are interested in exploring the relationship",
                                 "between a set of variables and miles per gallon (MPG) (outcome). They are particularly interested in the following two questions: Is an automatic or manual transmission better for MPG. Quantify the MPG difference between automatic and manual transmissions"),
                        h3("Important"),
                        p("A data frame with 32 observations on 11 variables."),
                        
               )
    )
)
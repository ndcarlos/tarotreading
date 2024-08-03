#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library(bslib)
source('/Users/home/Documents/R Studio/tarot.0624/tarot24.init.Rmd')

# Define UI for application that draws a histogram
ui <- fluidPage(

    # Application title
    titlePanel("Old Faithful Geyser Data"),

    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        card_header("What type of reading would you like?"),
        radioButtons(
          "reading",
          "Select option",
          choices = list("Past, Present, Future" = 1, "Situation, Problem, Solution" = 2),
        selected = 1
      ),

        # Show a plot of the generated distribution
        mainPanel(
           plotOutput("distPlot")
        )
    )
)


# Define server logic required to draw a histogram
server <- function(input, output) {

    output$distPlot <- renderPlot({
        # generate bins based on input$bins from ui.R
        hist(rnorm(100), main = "Histogram for Card 1", col = "blue")
      })
}

# Run the application 
shinyApp(ui = ui, server = server)

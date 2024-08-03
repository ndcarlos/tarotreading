#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    https://shiny.posit.co/
#

library(shiny)
library(plotly)
library(lorem)
library(bslib)
setwd('/Users/noahcarlos/Documents/R_Studio/tarot.0624/tarot.24')

# Define UI for application that draws a histogram
ui <- fluidPage(
      theme = bs_theme(version = 5),
      
      tags$head(
        tags$link(rel = 'stylesheet', type = 'text/css', href = 'styles.css')
      ),
      
      # Bring in reading type
      fluidRow(
        column(width = 12),
        wellPanel(
          selectInput("reading", 
                      "Select the type of reading you would like:",
                      choices = c('past, present, future' = 'ppf',
                                  'context, problem, solution' = 'cps'))
        )
      ),

        # Show the proper cards for the reading
        mainPanel(
           uiOutput("readingOutput")
        )
    )


# Define server logic
server <- function(input, output) {
    
    # text output
    output$readingOutput <- renderUI({
      
      current <- k_cardpull(rw.full, k = 3)
      
      if (input$reading == 'ppf'){
        layout_columns(
          past_output(current), present_output(current), future_output(current),
          width = "100%"
        )
      }

      else{
        textOutput("Not yet implemented")
      }

    })
}
    
    
    


# Run the application 
shinyApp(ui = ui, server = server, options, list(height = 1300))

library("shiny")
library("shinythemes")
library("dplyr")
library("DT")
source("propublica.R")
my_server <- function(input, output, session) {
    output$get_states_reps <- renderDataTable(get_states_reps(input$state))
    output$gender_plot <- renderPlot(
      get_states_gender_chart(input$state_gender))
    output$party_plot <- renderPlot(get_states_party_chart(input$state_party))
}
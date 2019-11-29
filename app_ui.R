library("shiny")
library("shinythemes")
library("DT")
overview_pt1 <- "The A7 assignment utilizes the Propublica Congress api
in  order to display user input-based data from the API.
I created multiple files,(app_ui.R, app_server.R, api_key.R,
propublica.R, and app.R) files to create a well-structured shiny app.
My app can take in a state from user-input and display info about that
state's congressional representatives. My shiny app also has a
horizontal bar chart displaying number of male vs. female representatives
for the particular state. It will also display a horizontal chart showing
number of Democrats vs. Republican Representatives for the state."
overview_pt2 <- "My shiny app can also present information about all
representatives within whichever state the user chooses. This
information includes the full name, party, age, twitter handle
(if one) and a Facebook account (if one). This information will be
presented in a data frame with rows the user can select to be
highlighted."
overview_pt3 <- "The about section of this shiny app
is broken down into three parts. Overview, Affiliation,
and reflective statement. The overview introduces the assignment
and outlines the major components. The affiliation includes my
connection to this project through my education at UW. The
reflective statement describes what I found challenging
and how I overcome challenges."
reflective_pt1 <- "I found it difficult
to break this project down into multiple files.
It is easier for me to create a project in one single app. Another thing
I found difficult was using user input. I was struggling to use
my multiple files to handle and process the user input. I had to
search through online resources to find the correct method to
implement."
reflective_pt2 <- "In order to get details about each representative,
I found that I had to make a seperate query to the api for each
representative. This discovery presented serious difficulty to getting the
details for each representative. This meant I would have to query the api a
different amount of times depending which state the user selected. I had to find
a way to query the api multiple times
to get the details of each representative."
myui <- navbarPage(theme = shinytheme("cyborg"),
                  "Welcome to my Shiny App
                  about Congressional Representatives!",
                  tabPanel(
                    "About Page",
                    mainPanel(
                      tabsetPanel(
                        tabPanel("Overview:", p(overview_pt1),
                                 p(overview_pt2),
                                 p(overview_pt3)),
                        tabPanel("Affiliation:",
                                 p("Edward Charles Baghdasaryan,"),
                                 p("Info-201A:
                                   Technical Foundations of Informatics,"),
                                 p("The Information School,"),
                                 p("University of Washington,"),
                                 p("Autumn 2019")),
                        tabPanel("Reflective Statement:", p(
                          reflective_pt1),
                          p(reflective_pt2)
                        )
                      ),
                    )
                  ),
                  tabPanel(
                    "Representative information by State!",
                    mainPanel(
                    tabsetPanel(
                      tabPanel(
                    "Choose a state for information
                    about that state's representatives!",
                    textInput(inputId = "state", label = "Which state's
                   House of Representatives would you like information about?"),
                    textOutput(outputId = "state"),
                    dataTableOutput(outputId = "get_states_reps")
                  ),
                  tabPanel(
                    "Choose a representative from the
                    state you chose in the other tab for
                    detailed information about the representative!",
                    textInput(inputId = "rep", label = "Which
                   Representative would you like information about?"),
                    textOutput(outputId = "rep")
                  )
                    ),
                  )
                  ),
                  tabPanel(
                    "More Graphs about State Representatives!",
                    mainPanel(
                  tabsetPanel(
                      tabPanel(
                    "Choose a state for a graph
                    displaying the state's representatives
                    by gender!",
                    textInput(inputId = "state_gender",
                    label = "Which state's
                    House of Representatives would
                    you like to see a gender plot of?"),
                    textOutput(outputId = "state_gender"),
                    plotOutput("gender_plot")
                  ),
                  tabPanel(
                    "Choose a state for a graph displaying the state's
                    representatives by party preferences!",
                    textInput(inputId = "state_party",
                    label = "Which state's
                    House of Representatives would you
                    like to see a party plot of?"),
                    textOutput(outputId = "state_party"),
                    plotOutput("party_plot")
                  )), )
))

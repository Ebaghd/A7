library("dplyr")
library("ggplot2")
library("tidyverse")
library("httr")
library("jsonlite")
library("rlist")
library("DT")
api_key <- source("API_key.r")
propublica_key <- api_key$value
base <- "https://api.propublica.org/"
endpoint <- "congress/v1/members/"
get_states_reps <- function(state) {
query <- paste0("house/", state, "/current.json")
congress_path <- paste0(base, endpoint, query)
propublica_api_request <- GET(congress_path,
                              add_headers("X-API-KEY" = propublica_key))
propublica_api_content <- content(propublica_api_request, "text")
propublica_api_df <- fromJSON(propublica_api_content)
propublica_api_df <- propublica_api_df$results
propublica_api_df
}
get_states_party_chart <- function(state) {
  query <- paste0("house/", state, "/current.json")
  congress_path <- paste0(base, endpoint, query)
  propublica_party_request <- GET(congress_path,
                                  add_headers("X-API-KEY" = propublica_key))
  propublica_party_content <- content(propublica_party_request, "text")
  propublica_party_df <- fromJSON(propublica_party_content)
  propublica_party_df <- propublica_party_df$results
  propublica_party_df <- c(sum(propublica_party_df$party == "R"),
                         sum(propublica_party_df$party == "D"))
  party_plot <- barplot(horiz = TRUE,
                   propublica_party_df,
                   names.arg = c("Democrats", "Republicans"),
                   xlab = "Number of Representatives",
                   main = "Representatives by Party")
}
get_states_gender_chart <- function(state) {
  query <- paste0("house/", state, "/current.json")
  congress_path <- paste0(base, endpoint, query)
  propublica_api_request <- GET(congress_path,
                                add_headers("X-API-KEY" = propublica_key))
  propublica_api_content <- content(propublica_api_request, "text")
  propublica_api_df <- fromJSON(propublica_api_content)
  propublica_api_df <- propublica_api_df$results
  propublica_api_df <- c(sum(propublica_api_df$gender == "M"),
                         sum(propublica_api_df$gender == "F"))
  gender_plot <- barplot(horiz = TRUE,
                   propublica_api_df, names.arg = c("Male", "Female"),
                   xlab = "Number of Representatives",
                   main = "Representatives by Gender")
}






df <- data.frame(PCOS.DATA)
dg <- data.frame(hormones)
library(pacman)
library(rio)
library(janitor)
library(tidyverse)
library(here)
library(plyr)
library(dplyr)
library(lubridate)
library(epikit)
library(shiny)
library(ggplot2)
library("highcharter")
library(readr)
pacman::p_load(ggupset)

# Define server logic required to draw a boxplot
shinyServer(function(input, output,session) {
  output$plot1 <- renderPlot({
   ggplot(
      df,
      aes_string(
        x = df$age_cat,
        y = PCOS.DATA[[input$VarName2]],
        fill = PCOS.DATA[[input$VarName2]],
        color = df$age_cat
      )
    ) + geom_boxplot() + geom_jitter(
      width = 0.2,
      height = 0,
      alpha = 0.5,
      color = "steelblue"
    )  + geom_point(
      df,
      mapping = aes(x = age_cat[input$Varname1], y = .data[[input$VarName2]][input$Varname1]),
      colour = "red",
      size = 3
    ) +
      labs(
        x = "age_cat",
        y = input$VarName2,
        fill = "case no",
        colour = "age_cat"
      )
   
  })
  
   
 })



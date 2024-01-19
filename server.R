





df <- data.frame(PCOS.DATA)
dg <- data.frame(hormones)

library(shiny)
library(ggplot2)
pacman::p_load(ggupset)

# Define server logic required to draw a boxplot
shinyServer(function(input, output) {
  output$plot1 <- renderPlot({
    ggplot(
      df,
      aes_string(
        x = df$age_cat,
        #y = hormones[[input$VarName2]],
        y = df[[input$VarName2]],
        fill = df$patient_file_no,
        color = df$age_cat
      )
    ) + geom_boxplot() + geom_jitter(
      width = 0.2,
      height = 0,
      alpha = 0.5,
      color = "steelblue"
    )  + geom_point(
      df,
      mapping = aes(x = age_cat[input$Varname1], y = df[[input$VarName2]][input$Varname1]),
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
  output$plot2 <- renderPlot({
    ggplot(
      data = df,
      mapping = aes(x = df$bmi) +
      geom_bar() +
      scale_x_upset(
        reverse = FALSE,
        n_intersections = 10,
        sets = symptoms)+
      labs(
        title = "Cases & symptoms",
        caption = "Cases associated with symptoms.",
        x = "cases",
        y = "Frequency in data")
  # barplot(
  #     df[, input$VarName3],
  #     main = paste("Boxplot of", input$VarName3),
  #     xlab = input$VarName3,
  #     col = "yellow"
  #   )
 )})
  
})
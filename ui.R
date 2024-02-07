#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinyWidgets)
# Define UI for application that draws a histogram
shinyUI(fluidPage(
  shinythemes::themeSelector(),
  # Application title
  titlePanel("Your PCOS Guide"),
  
  # Sidebar with a slider input for number of bins
  sidebarLayout(
    sidebarPanel(
      numericInput("Varname1", "Patient Number:", 1, min = 1, max = length(unique(PCOS.DATA$patient_file_no))),
      verbatimTextOutput("value"),
      
      
      selectInput(
        inputId = "VarName2",
        label =  "Select hormone:",
        choices =c(
          "Leutenising hormone" = "lh_m_iu_m_l",
          "Thyroid hormone" = "tsh_m_iu_l",
          "Anti-mullerin hormone" = "amh_ng_m_l",
          "Progesterone" = "prg_ng_m_l",
          "Prolactin" = "prl_ng_m_l"
        ) 
      ),
      p("Polycystic Ovary Syndrome (PCOS) is a common hormonal disorder affecting individuals with ovaries. It is characterized by a combination of symptoms, including missed or irregular menstrual periods, excess hair growth, acne, infertility, and weight gain. PCOS can also lead to increased risks for conditions such as type 2 diabetes, high blood pressure, heart problems, and endometrial cancer1.
        
        Despite its prevalence (between 10% and 13%), PCOS remains challenging to treat. Individuals with PCOS face difficulties such as delayed diagnosis, dissatisfaction with care, and gaps in evidence-based practices. Moreover, PCOS is associated with increased risks for miscarriage, liver problems, depression, anxiety, and heart issues. Those with PCOS are four times more likely to develop type 2 diabetes and twice as likely to develop metabolic syndrome2. Efforts are ongoing to improve diagnosis, management, and overall health outcomes for individuals affected by PCOS)")
    ),
  
  
  # Show a plot of the generated distribution
  mainPanel(
    setBackgroundColor(color = "pink", shinydashboard = FALSE),
    
    plotOutput(outputId = "plot1"),
    
    p(
      strong("Individual Patient and Age-group hormone values."),
      code("The red dot displays you in the group"),
      br(),
      p("The plot shows:", 
        span("Relative distribution of females and their hormone level", style = "color:Darkblue"),
        p(" represented in the form of a box plot.."),
        br(),
        p("Age categories are represented by different colours with the blue dots showing the individual distribution in that age category and the red dot showing the position of single patient selection from the data.The distribution varies with individual hormone selection and the median of the  distribution is represented by the solid horizontal coloured lines in each box plot.The dots lying on the top represent outlayers in the data")),
      br(),
      p(
        strong("case no"), "= The file number of patient.",
        br(),
        strong("age_cat"), "= different age groups ",
        br(),
        strong("lh_m_iu_m_l"),"= Leutensing hormone. Women with PCOS may have an imbalance between LH and another hormone called follicle-stimulating hormone (FSH), which stimulates the growth of the follicles. This imbalance may result in abnormal ovulation, irregular periods, and increased androgen production.",
        br(),
        strong("tsh_m_iu_l"),"= Thyroid hormone.Women with PCOS may have thyroid dysfunction, which may affect their weight, mood, energy, and fertility. Thyroid disorders may also worsen the symptoms of PCOS, such as hirsutism (excess hair growth), acne, and insulin resistance.",
        br(),
        strong("amh_ng_m_l"), "= Anti-Mullerin hormone. Women with PCOS tend to have higher levels of AMH, which may reflect the increased number of small follicles in their ovaries. AMH may also interfere with the ovulation process and reduce fertility.",
        br(),
        strong("prg_ng_m_l"), "= Progesterone.Women with PCOS may have low levels of progesterone, which may cause menstrual irregularities, infertility, and miscarriage.",
        br(),
        strong("prg_ng_m_l"), "= Prolactin. Women with PCOS may have elevated levels of prolactin, which may interfere with the normal function of the ovaries and cause irregular periods, infertility, and galactorrhea (abnormal milk discharge from the breasts).",
        style = "font-family: 'times'; font-si16pt"),
      div("The plot helps analyse the distribution of hormone levels among the age group and for individual patient.For a large group this helps understanding the hormone levels in patients having symptoms commonly seen in POLY-CYSTIC OVARIAN DISEASE", style = "color:Purple")
    ),
    
)
)
)
)

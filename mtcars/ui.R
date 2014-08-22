library(shiny)

# Define UI for random distribution application 
shinyUI(pageWithSidebar(  
  # Application title
  headerPanel("Motor Trend Mileage vs. Car Transmission"),
#   p("Select additional variables to use in the regression model:"),
  # Sidebar with controls to select the random distribution type
  # and number of observations to generate. Note the use of the br()
  # element to introduce extra vertical spacing
  sidebarPanel(
    p("Select the variables from mtcars to be included in the regression model for mpg on top of transmission (am):"),
    checkboxInput('intercept', 'Intercept', FALSE),
    checkboxInput('cyl', 'Number of cylinders', FALSE),
    checkboxInput('disp', 'Displacement (cu.in.)', FALSE),
    checkboxInput('hp', 'Gross horsepower', FALSE),
    checkboxInput('drat', 'Rear axle ratio', FALSE),
    checkboxInput('wt', 'Weight (lb/1000)', FALSE),
    checkboxInput('qsec', '1/4 mile time', FALSE),
    checkboxInput('vs', 'V/S', FALSE),
    checkboxInput('gear', 'Number of forward gears', FALSE),
    checkboxInput('carb', 'Number of carburetors', FALSE)
  ),
  
  # Show a tabset that includes a plot, summary, and table view
  # of the generated distribution
  mainPanel(
    tabsetPanel(
      tabPanel("Data Table", dataTableOutput("table")),
      tabPanel("Regression Formula", verbatimTextOutput("formula")), 
      tabPanel("Regression Summary", verbatimTextOutput("summary")), 
      tabPanel("Residual Plot", plotOutput("plot")),
      tabPanel("Help", verbatimTextOutput("help"))
    )
  )
))

library(shiny)
help_console <- function(topic, format=c("text", "html", "latex", "Rd"),
                         lines=NULL, before=NULL, after=NULL) {  
  format=match.arg(format)
  if (!is.character(topic)) topic <- deparse(substitute(topic))
  helpfile = utils:::.getHelpFile(help(topic))
  
  hs <- capture.output(switch(format, 
                              text=tools:::Rd2txt(helpfile),
                              html=tools:::Rd2HTML(helpfile),
                              latex=tools:::Rd2latex(helpfile),
                              Rd=tools:::prepare_Rd(helpfile)
  )
  )
  if(!is.null(lines)) hs <- hs[lines]
  hs <- c(before, hs, after)
  cat(hs, sep="\n")
  invisible(hs)
}

# Define server logic for random distribution application
shinyServer(function(input, output) {

  data(mtcars)
  
#   mtcars[, 'cyl'] <- as.factor(mtcars[, 'cyl'])
  mtcars[mtcars$am == 0, 'am'] <- 'automatic'
  mtcars[mtcars$am == 1, 'am'] <- 'manual'
  mtcars[, 'am'] <- as.factor(mtcars[, 'am'])
#   mtcars[, 'gear'] <- as.factor(mtcars[, 'gear'])
#   mtcars[, 'carb'] <- as.factor(mtcars[, 'carb'])

  # Reactive expression to generate the requested distribution. This is 
  # called whenever the inputs change. The renderers defined 
  # below then all use the value computed from this expression
  fit <- reactive({
    selected <- ""
    selected <- c( selected, ifelse( input$cyl, 'I(cyl-6)', '' ) )
    selected <- c( selected, ifelse( input$disp, 'disp', '' ) )
    selected <- c( selected, ifelse( input$hp, 'I(hp-150)', '' ) ) 
    selected <- c( selected, ifelse( input$drat, 'drat', '' ) ) 
    selected <- c( selected, ifelse( input$wt, 'I(wt-3)', '' ) )
    selected <- c( selected, ifelse( input$qsec, 'qsec', '' ) ) 
    selected <- c( selected, ifelse( input$vs, 'vs', '' ) ) 
    selected <- c( selected, ifelse( input$gear, 'I(gear-4)', '' ) ) 
    selected <- c( selected, ifelse( input$carb, 'I(carb-1)', '' ) )
    selected <- c('am', selected)
    lm( reformulate(termlabels = selected[selected!=""], response = 'mpg', intercept = input$intercept ), data=mtcars)
  })
    
  # Generate a plot of the data. Also uses the inputs to build the 
  # plot label. Note that the dependencies on both the inputs and
  # the 'data' reactive expression are both tracked, and all expressions 
  # are called in the sequence implied by the dependency graph
  output$plot <- renderPlot({
    par(mfrow=c(2,2))
    plot(fit())
  })
  
  # Generate a formula of the regression
  output$formula <- renderPrint({
    formula(fit())
  })

  # Generate a summary of the regression
  output$summary <- renderPrint({
    summary(fit())
  })
  
  # Generate an HTML table view of the data
  output$table <- renderDataTable({
    mtcars
  })

  # Generate a summary of the regression
  output$help <- renderPrint({
    help_console(mtcars, "text")
  })

})

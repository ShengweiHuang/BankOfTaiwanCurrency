shinyUI(fluidPage(
  titlePanel("Bank of Taiwan currency"),
  sidebarLayout(
    sidebarPanel(
      selectInput("currencyType", "Choose a currency type:", # input type and tag
                  choices = currencyType), # default value
      selectInput("type1", "Choose an output type:", # input type and tag
                  choices = type1) # default value
    ),
    mainPanel(
      h3(textOutput("outputType")),
      plotlyOutput("mainPlot", width = "100%"),
      tableOutput("mainTable")
    )
  )
))
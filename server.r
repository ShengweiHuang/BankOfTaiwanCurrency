shinyServer(function(input, output) {
  output$outputType <- renderText({
    d = getData(input$type1, input$currencyType)
    strOutput = paste(input$currencyType,
                      "Max =",
                      d[which.max(d[,3]),1],
                      "Min =",
                      d[which.min(d[,3]),1], sep=" ")
  })
  output$mainPlot <- renderPlotly({
    d = getData(input$type1, input$currencyType)
    colnames(d) = c("date", "type", "CashBuy", "CashSell", "SpotBuy", "SpotSell")
    plot_ly(data = d, x = ~date, y = ~CashBuy, name = "Cash Buy", type = 'scatter', mode = 'lines') %>%
      add_trace(y = ~CashSell, name = 'Cash Sell') %>%
      add_trace(y = ~SpotBuy, name = 'Spot Buy') %>%
      add_trace(y = ~SpotSell, name = 'Spot Sell')
  })
  output$mainTable <- renderTable({
    d = getData(input$type1, input$currencyType)
    colnames(d) = c("date", "type", "CashBuy", "CashSell", "SpotBuy", "SpotSell")
    return(d)
  })
})
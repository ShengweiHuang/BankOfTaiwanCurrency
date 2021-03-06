shinyServer(function(input, output) {
  # display max and min
  output$outputType <- renderText({
    d = getData(input$type1, input$currencyType)
    strOutput = paste(input$currencyType,
                      "Max =",
                      d[which.max(d[,3]),1],
                      "Min =",
                      d[which.min(d[,3]),1], sep=" ")
  })
  # display plot
  output$mainPlot <- renderPlotly({
    d = getData(input$type1, input$currencyType)
    colnames(d) = c("date", "type", "CashBuy", "CashSell", "SpotBuy", "SpotSell")
    plot_ly(data = d, x = ~date, y = ~CashBuy, name = "Cash Buy", type = 'scatter', mode = 'lines') %>%
      add_trace(y = ~CashSell, name = 'Cash Sell') %>%
      add_trace(y = ~SpotBuy, name = 'Spot Buy') %>%
      add_trace(y = ~SpotSell, name = 'Spot Sell')
  })
  # display table
  output$mainTable <- renderTable({
    d = getData(input$type1, input$currencyType)
    colnames(d) = c("date", "type", "CashBuy", "CashSell", "SpotBuy", "SpotSell")
    return(d)
  })
})

# get data from bank of Taiwan
getData <- function(type1, cType){
  if (type1 == "1 Day") {
    url = "http://rate.bot.com.tw/xrt/quote/day/"
  }
  else if (type1 == "3 Month") {
    url = "http://rate.bot.com.tw/xrt/quote/ltm/"
  }
  else {
    url = "http://rate.bot.com.tw/xrt/quote/l6m/"
  }
  url = paste(url, cType, sep = "")
  d = as.data.frame(readHTMLTable(url, header = TRUE, stringsAsFactors = FALSE))
  return (d)
}
library(shiny)
library(plotly)
library(XML)
library(RCurl)

currencyType = c("USD", "CAD", "JPY", "HKD", "GBP", "AUD", "SGD", "CHF")
type1 = c("1 Day", "3 Month", "6 Month")

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
library(shiny)
library(plotly)
library(XML)
library(RCurl)

currencyType = c("USD", "CAD", "JPY", "HKD", "GBP", "AUD", "SGD", "CHF")
type1 = c("1 Day", "3 Month", "6 Month")
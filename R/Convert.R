#' Convert
#' @param x number
#' @return string with euro
#' @export
#' @importFrom scales dollar
#' @examples string with the eur
#' exchange_rate_function(42)
#' (exchange_rate_function(4200))

library(binancer)
library(httr)
library(data.table)
library(logger)
library(checkmate)
library(jsonlite)
library(scales)

euro<-function(x) {
  dollar(x, prefix = "€")
}


exchange_rate_function <- function() {
  number <- as.numeric(readline("Enter the number of BTC: "))

  # Return prices of Bitcoin in dollars
  coin_prices <- binance_coins_prices()
  btcusdt <- coin_prices[symbol == 'BTC', usd]
  print("Prices of Crypto in dollars:")
  print(coin_prices)

  # Retrieve the exchange rate
  rates <- fromJSON('https://api.exchangerate.host/latest?base=USD&symbols=EUR')
  usdeur <- rates$rates$EUR
  print("Exchange rate (USD/EUR):")
  print(usdeur)

  # Calculate the value of Bitcoin in EUR
  value <- number * btcusdt * usdeur
  print("Value of Bitcoin in EUR:")
  print(euro(value))
  # Clean memory
  rm(number, coin_prices, rates, usdeur, value)
}


exchange_rate_function()



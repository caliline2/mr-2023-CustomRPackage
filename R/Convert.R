#' Format a number to EUR
#' @param x number
#' @return string with euro
#' @export
#' @importFrom scales dollar
#' @examples string with the eur
#' euro(42)
#' (euro(4200000))

library(binancer)
library(httr)
library(data.table)
library(logger)
library(checkmate)
library(jsonlite)

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
  print(value)
  # Clean memory
  rm(number, coin_prices, rates, usdeur, value)
}

exchange_rate_function()


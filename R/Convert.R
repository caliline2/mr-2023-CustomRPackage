#' Convert
#' @param x number
#' @param btcusdt The BTC/USDT exchange rate
#' @param usdeur The USD/EUR exchange rate
#' @param bitcoins The amount of bitcoins
#' @param exchangerate Value of bitcoin in EUR
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

rates <- fromJSON('https://api.exchangerate.host/latest?base=USD&symbols=EUR')
usdeur <- rates$rates$EUR

# Return prices of Bitcoin in dollars
coin_prices <- binance_coins_prices()
btcusdt <- coin_prices[symbol == 'BTC', usd]
get_bitcoin_price<-btcusdt


exchangerate <- function() {
  bitcoins <- as.numeric(readline("Enter the number of BTC: "))

  print("Prices of Crypto in dollars:")
  print(coin_prices)

  # Retrieve the exchange rate
  print("Exchange rate (USD/EUR):")
  print(usdeur)


  # Calculate the value of Bitcoin in EUR
  value <- bitcoins * btcusdt * usdeur
  print("Value of Bitcoin in EUR:")
  print(euro(value))

  # Clean memory
  rm(bitcoins, coin_prices, rates, usdeur, value)
}


exchange_rate_function()


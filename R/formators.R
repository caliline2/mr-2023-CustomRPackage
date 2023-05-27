#' Format a number
#' @param x number
#' @return string with euro
#' @export
#' @importFrom scales dollar
#' @examples string with the eur
#' euro(42)
#' (euro(4200000))

library(scales)
euro<-function(x) {
  dollar(x, prefix = "€")
}


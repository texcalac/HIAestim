#' Esta función realiza la estimación de casos atribuíbles a la exposición a Ozono
#'
#' @param x data frame o tibble.
#' @param uc Unidad de Cambio de la FCR en ug/m3. Por defecto el valor es 10.
#' @param cf valor contrafactual, generalmente el valor guía de la OMS o NOM.
#' @param fcr.low Valor Inferior de la FCR. Por defecto el valor es 1.00.
#' @param fcr.mean Valor Promedio de la FCR. Por defecto el valor es 1.01.
#' @param fcr.high Valor Superior de la FCR. Por defecto el valor es 1.02.
#'
#' @return Devuelve una tabla con los resultados.
#'
#' @examples
#'#' data(hia_data)
#'
#' ## Usando valores por default
#' hia_ozono(hia_data, cf = 10)
#'
#' #' ## Especificando una distinta FCR
#' hia_ozono(hia_data, uc = 10, cf = 12, fcr.low = 1.005, fcr.mean = 1.014, fcr.high = 1.024)
#'
#' @export
#'
hia_ozono <-
  function(x, uc = 10, cf, fcr.low = 1.00, fcr.mean = 1.01, fcr.high = 1.02) {
    x$fcr_low_uc <- exp(log(fcr.low)/uc)
    x$fcr_mean_uc <- exp(log(fcr.mean)/uc)
    x$fcr_high_uc <- exp(log(fcr.high)/uc)
    x$delta <- ifelse(x$concentration - cf < 0, NA, x$concentration - cf)
    x$me_low <- round(x$cases - (x$cases/exp(log(x$fcr_low_uc) * x$delta)))
    x$me_mean <- round(x$cases - (x$cases/exp(log(x$fcr_mean_uc) * x$delta)))
    x$me_high <- round(x$cases - (x$cases/exp(log(x$fcr_high_uc) * x$delta)))
    x <- x[c("cvegeo", "area_name", "me_low", "me_mean", "me_high")]
    return(x)
  }

#' Esta función realiza la estimación de casos atribuíbles a la exposición a
#' contaminantes del aire
#'
#' @param x data frame o tibble.
#' @param uc Unidad de Cambio de la FCR en ug/m3. Por defecto el valor es 10.
#' @param cf valor contrafactual, generalmente el valor guía de la OMS o NOM.
#' @param fcr.low Valor Inferior de la FCR. Por defecto el valor es 1.06.
#' @param fcr.mean Valor Promedio de la FCR. Por defecto el valor es 1.08.
#' @param fcr.high Valor Superior de la FCR. Por defecto el valor es 1.09.
#'
#' @return Devuelve una tabla con los resultados
#'
#' @examples
#' mydata <-
#'   data.frame(cvegeo = c("01", "02", "03", "04", "05"),
#'              area_name = c("area_1", "area_2", "area_3", "area_4", "area_5"),
#'              population = c(749982, 400161, 417416, 60847, 199224),
#'              concentration = c(21.8, 25.8, 24.5, 21.6, 17.7),
#'              cases = c(4070, 3004, 2959, 4038, 806))
#'
#' ## Usando valores por default
#' hia_pm25(mydata, cf = 10)
#'
#' ## Especificando una distinta FCR
#' hia_pm25(mydata, uc = 10, cf = 12, fcr.low = 1.040, fcr.mean = 1.062, fcr.high = 1.083)
#'
#' @export
#'
hia_pm25 <-
  function(x, uc = 10, cf, fcr.low = 1.06, fcr.mean = 1.08, fcr.high = 1.09) {
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

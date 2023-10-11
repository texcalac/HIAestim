
<!-- README.md is generated from README.Rmd. Please edit that file -->

# HIAestim

<!-- badges: start -->
<!-- badges: end -->

El objetivo del paquete **HIAestim** es facilitar las estimaciones de
casos atribuibles en el marco de una Evaluación de impacto en salud.

Los datos contenidos son ficticios y sólo pretenden mostrar la
estructura de la malla de datos y el formato requerido para cada
variable.

## Instalación

Usted podrá instalar la última versión del paquete **HIAestim**
siguiendo las indicaciones que a continuación se le muestran:

``` r
# install.packages("devtools")
devtools::instal_github("texcalac/HIAestim")
```

## Ejemplo

Este es un ejemplo básico del funcionamiento del paquete.

1.  Active el paquete en su sesión

``` r
library(HIAestim)
```

2.  Cargamos la malla de datos de ejemplo

``` r
hia_data
#>   cvegeo area_name population concentration cases
#> 1     01    area_1     749982          21.8  4070
#> 2     02    area_2     400161          25.8  3004
#> 3     03    area_3     417416          24.5  2959
#> 4     04    area_4      60847          21.6  4038
#> 5     05    area_5     199224          17.7   806
```

3.  Calculamos los casos atribuíbles usando valores por default

``` r
hia_pm25(hia_data, cf = 10)
#>   cvegeo area_name me_low me_mean me_high
#> 1     01    area_1    270     353     394
#> 2     02    area_2    264     344     382
#> 3     03    area_3    240     312     348
#> 4     04    area_4    264     345     384
#> 5     05    area_5     35      46      52
```

4.  Calculamos los casos atribuíbles especificando una distinta FCR

``` r
hia_pm25(hia_data, uc = 10, cf = 12, fcr.low = 1.040, fcr.mean = 1.062, fcr.high = 1.083)
#>   cvegeo area_name me_low me_mean me_high
#> 1     01    area_1    153     233     306
#> 2     02    area_2    158     239     313
#> 3     03    area_3    142     214     281
#> 4     04    area_4    149     227     298
#> 5     05    area_5     18      27      36
```

What is special about using `README.Rmd` instead of just `README.md`?
You can include R chunks like so:

``` r
summary(cars)
#>      speed           dist       
#>  Min.   : 4.0   Min.   :  2.00  
#>  1st Qu.:12.0   1st Qu.: 26.00  
#>  Median :15.0   Median : 36.00  
#>  Mean   :15.4   Mean   : 42.98  
#>  3rd Qu.:19.0   3rd Qu.: 56.00  
#>  Max.   :25.0   Max.   :120.00
```

You’ll still need to render `README.Rmd` regularly, to keep `README.md`
up-to-date. `devtools::build_readme()` is handy for this.

You can also embed plots, for example:

<img src="man/figures/README-pressure-1.png" width="100%" />

In that case, don’t forget to commit and push the resulting figure
files, so they display on GitHub and CRAN.

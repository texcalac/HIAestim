
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
data(hia_data)
```

``` r
hia_data
#>    cvegeo area_name population concentration cases
#> 1     001   area_01     749982          21.8  4070
#> 2     002   area_02     400161          25.8  3004
#> 3     003   area_03     417416          24.5  2959
#> 4     004   area_04     608479          21.6  4038
#> 5     005   area_05     199224          17.7   806
#> 6     006   area_06     532553          26.6  4223
#> 7     007   area_07    1164477          27.7  7944
#> 8     008   area_08     390348          22.2  2822
#> 9     009   area_09    1827868          22.6  9232
#> 10    010   area_10     243886          20.1  1275
#> 11    011   area_11     364439          24.8  2566
#> 12    012   area_12     137927          22.9   604
#> 13    013   area_13     361593          22.6  1470
#> 14    014   area_14     677104          20.1  3199
#> 15    015   area_15     427263          26.2  3146
#> 16    016   area_16     415933          20.2  2074
```

3.  Calculamos los casos atribuíbles usando valores por default

``` r
hia_pm25(hia_data, cf = 10)
#>    cvegeo area_name me_low me_mean me_high
#> 1     001   area_01    270     353     394
#> 2     002   area_02    264     344     382
#> 3     003   area_03    240     312     348
#> 4     004   area_04    264     345     384
#> 5     005   area_05     35      46      52
#> 6     006   area_06    389     506     563
#> 7     007   area_07    778    1012    1124
#> 8     008   area_08    194     253     282
#> 9     009   area_09    654     853     950
#> 10    010   area_10     73      95     106
#> 11    011   area_11    212     276     307
#> 12    012   area_12     44      57      64
#> 13    013   area_13    104     136     151
#> 14    014   area_14    183     239     267
#> 15    015   area_15    283     369     410
#> 16    016   area_16    120     157     175
```

4.  Calculamos los casos atribuíbles especificando una distinta FCR

``` r
hia_pm25(hia_data, uc = 10, cf = 12, fcr.low = 1.040, fcr.mean = 1.062, fcr.high = 1.083)
#>    cvegeo area_name me_low me_mean me_high
#> 1     001   area_01    153     233     306
#> 2     002   area_02    158     239     313
#> 3     003   area_03    142     214     281
#> 4     004   area_04    149     227     298
#> 5     005   area_05     18      27      36
#> 6     006   area_06    235     355     464
#> 7     007   area_07    474     716     935
#> 8     008   area_08    111     168     220
#> 9     009   area_09    376     570     748
#> 10    010   area_10     40      61      80
#> 11    011   area_11    126     190     249
#> 12    012   area_12     25      38      50
#> 13    013   area_13     60      91     119
#> 14    014   area_14    100     152     200
#> 15    015   area_15    170     258     337
#> 16    016   area_16     66     100     131
```

Puede exportar sus estimaciones para agregarlas a la escala que se
requiera.

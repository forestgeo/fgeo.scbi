
<!-- README.md is generated from README.Rmd. Please edit that file -->

# fgeo.scbi

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![Travis build
status](https://travis-ci.org/forestgeo/fgeo.scbi.svg?branch=master)](https://travis-ci.org/forestgeo/fgeo.scbi)
[![Coveralls test
coverage](https://coveralls.io/repos/github/forestgeo/fgeo.scbi/badge.svg)](https://coveralls.io/r/forestgeo/fgeo.scbi?branch=master)
[![CRAN
status](https://www.r-pkg.org/badges/version/fgeo.scbi)](https://cran.r-project.org/package=fgeo.scbi)
<!-- badges: end -->

The goal of fgeo.scbi is to provide easy access to data from the
Smithsonian Conservation Biology Institute (SCBI) ForestGEO plot. For
now, this is an experimental package to test a new approach to sharing
ForestGEO data.

## Installation

``` r
# install.packages("devtools")
devtools::install_github("forestgeo/fgeo.scbi")
```

## Example

Access data from dryad (<https://doi.org/10.5061/dryad.6nc8c>).

![](https://i.imgur.com/cwQzCeY.gif)

Access data from the [public data portal on
GitHub](https://github.com/SCBI-ForestGEO/SCBI-ForestGEO-Data).

``` r
library(purrr)

github_path <- 
  "SCBI-ForestGEO/SCBI-ForestGEO-Data/tree_main_census/data/census-csv-files"

download_urls <- ghr::ghr_ls_download_url(github_path)
download_urls %>% 
  purrr::map(readr::read_csv) %>% 
  purrr::set_names(fs::path_file(download_urls))
#> $census3_coord_local_plot.csv
#> # A tibble: 55,295 x 9
#>    treeid stemid   tag stemtag quadratname    qx    qy    px    py
#>     <dbl>  <dbl> <dbl>   <dbl>       <dbl> <dbl> <dbl> <dbl> <dbl>
#>  1      1      1 10079       1         104   3.7  13     3.7  73  
#>  2      2      2 10168       1         103  17.3  18.9  17.3  58.9
#>  3      3      3 10567       1         110   9    17.1   9   197. 
#>  4      4      4 12165       1         122  14.2   8.5  14.2 428. 
#>  5      5      5 12190       1         122   9.4  16.4   9.4 436. 
#>  6      6      6 12192       1         122   1.3  14     1.3 434  
#>  7      7      7 12212       1         123  17.8   7.1  17.8 447. 
#>  8      8      8 12261       1         125  18     3.7  18   484. 
#>  9      9      9 12456       1         130  18    17.8  18   598. 
#> 10     10     10 12551       1         132   5.6   7.7   5.6 628. 
#> # ... with 55,285 more rows
#> 
#> $scbi.full1.csv
#> # A tibble: 40,283 x 20
#>    treeID stemID   tag StemTag sp    quadrat    gx    gy DBHID CensusID
#>     <dbl>  <dbl> <dbl>   <dbl> <chr> <chr>   <dbl> <dbl> <dbl>    <dbl>
#>  1      1      1 10079       1 libe  0104     3.70  73       1        1
#>  2      2      2 10168       1 libe  0103    17.3   58.9     3        1
#>  3      3      3 10567       1 libe  0110     9    197.      5        1
#>  4      4      4 12165       1 nysy  0122    14.2  428.      7        1
#>  5      5      5 12190       1 havi  0122     9.40 436.      9        1
#>  6      6      6 12192       1 havi  0122     1.30 434      13        1
#>  7      7      7 12212       1 unk   0123    17.8  447.     15        1
#>  8      8      8 12261       1 libe  0125    18    484.     17        1
#>  9      9      9 12456       1 vipr  0130    18    598.     19        1
#> 10     10     10 12551       1 astr  0132     5.60 628.     22        1
#> # ... with 40,273 more rows, and 10 more variables: dbh <dbl>, pom <dbl>,
#> #   hom <dbl>, ExactDate <date>, DFstatus <chr>, codes <chr>,
#> #   nostems <dbl>, date <dbl>, status <chr>, agb <dbl>
#> 
#> $scbi.full2.csv
#> # A tibble: 40,283 x 20
#>    treeID stemID   tag StemTag sp    quadrat    gx    gy DBHID CensusID
#>     <dbl>  <dbl> <dbl>   <dbl> <chr> <chr>   <dbl> <dbl> <dbl>    <dbl>
#>  1      1      1 10079       1 libe  0104     3.70  73   41801        2
#>  2      2      2 10168       1 libe  0103    17.3   58.9 41723        2
#>  3      3      3 10567       1 libe  0110     9    197.  42501        2
#>  4      4      4 12165       1 nysy  0122    14.2  428.  42869        2
#>  5      5      5 12190       1 havi  0122     9.40 436.  42904        2
#>  6      6      6 12192       1 havi  0122     1.30 434   42909        2
#>  7      7  31200 12212       2 unk   0123    17.8  447.  42946        2
#>  8      8  31201 12261       2 libe  0125    18    484.  43023        2
#>  9      9  31202 12456       2 vipr  0130    18    598.  43249        2
#> 10     10     10 12551       1 astr  0132     5.60 628.  43346        2
#> # ... with 40,273 more rows, and 10 more variables: dbh <dbl>, pom <dbl>,
#> #   hom <dbl>, ExactDate <date>, DFstatus <chr>, codes <chr>,
#> #   nostems <dbl>, date <dbl>, status <chr>, agb <dbl>
#> 
#> $scbi.spptable.csv
#> # A tibble: 73 x 10
#>    sp    Latin Genus Species Family SpeciesID Authority IDLevel syn   subsp
#>    <chr> <chr> <chr> <chr>   <chr>      <dbl> <chr>     <chr>   <lgl> <lgl>
#>  1 acne  Acer~ Acer  negundo Sapin~         1 <NA>      species NA    NA   
#>  2 acpl  Acer~ Acer  platan~ Sapin~         2 <NA>      species NA    NA   
#>  3 acru  Acer~ Acer  rubrum  Sapin~         3 <NA>      species NA    NA   
#>  4 acsp  Acer~ Acer  sp      Sapin~         4 <NA>      Multip~ NA    NA   
#>  5 aial  Aila~ Aila~ altiss~ Simar~         5 <NA>      species NA    NA   
#>  6 amar  Amel~ Amel~ arborea Rosac~         6 <NA>      species NA    NA   
#>  7 astr  Asim~ Asim~ triloba Annon~         7 <NA>      species NA    NA   
#>  8 beth  Berb~ Berb~ thunbe~ Berbe~         8 <NA>      species NA    NA   
#>  9 caca  Carp~ Carp~ caroli~ Betul~         9 <NA>      species NA    NA   
#> 10 caco  Cary~ Carya cordif~ Jugla~        10 <NA>      species NA    NA   
#> # ... with 63 more rows
#> 
#> $scbi.stem1.csv
#> # A tibble: 55,295 x 20
#>    treeID stemID   tag StemTag sp    quadrat    gx    gy DBHID CensusID
#>     <dbl>  <dbl> <dbl>   <dbl> <chr> <chr>   <dbl> <dbl> <dbl>    <dbl>
#>  1      1      1 10079       1 libe  0104     3.70  73       1        1
#>  2      1  31194 10079       2 libe  0104     3.70  73       2        1
#>  3      2      2 10168       1 libe  0103    17.3   58.9     3        1
#>  4      2  31195 10168       2 libe  0103    17.3   58.9     4        1
#>  5      3      3 10567       1 libe  0110     9    197.      5        1
#>  6      3  31196 10567       2 libe  0110     9    197.      6        1
#>  7      3  40394 10567       3 libe  0110     9    197.     NA       NA
#>  8      4      4 12165       1 nysy  0122    14.2  428.      7        1
#>  9      4  31197 12165       2 nysy  0122    14.2  428.      8        1
#> 10      5      5 12190       1 havi  0122     9.40 436.      9        1
#> # ... with 55,285 more rows, and 10 more variables: dbh <dbl>, pom <dbl>,
#> #   hom <dbl>, ExactDate <date>, DFstatus <chr>, codes <chr>,
#> #   countPOM <dbl>, date <dbl>, status <chr>, agb <dbl>
#> 
#> $scbi.stem2.csv
#> # A tibble: 55,295 x 20
#>    treeID stemID   tag StemTag sp    quadrat    gx    gy DBHID CensusID
#>     <dbl>  <dbl> <dbl>   <dbl> <chr> <chr>   <dbl> <dbl> <dbl>    <dbl>
#>  1      1      1 10079       1 libe  0104     3.70  73   41801        2
#>  2      1  31194 10079       2 libe  0104     3.70  73   41802        2
#>  3      2      2 10168       1 libe  0103    17.3   58.9 41723        2
#>  4      2  31195 10168       2 libe  0103    17.3   58.9 41724        2
#>  5      3      3 10567       1 libe  0110     9    197.  42501        2
#>  6      3  31196 10567       2 libe  0110     9    197.  42502        2
#>  7      3  40394 10567       3 libe  0110     9    197.  80573        2
#>  8      4      4 12165       1 nysy  0122    14.2  428.  42869        2
#>  9      4  31197 12165       2 nysy  0122    14.2  428.  42870        2
#> 10      5      5 12190       1 havi  0122     9.40 436.  42904        2
#> # ... with 55,285 more rows, and 10 more variables: dbh <dbl>, pom <dbl>,
#> #   hom <dbl>, ExactDate <date>, DFstatus <chr>, codes <chr>,
#> #   countPOM <dbl>, date <dbl>, status <chr>, agb <dbl>
```

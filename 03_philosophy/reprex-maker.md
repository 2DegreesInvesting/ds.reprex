
This is a reprex maker with features following the [reprex
philosophy](https://reprex.tidyverse.org/articles/reprex-dos-and-donts.html#package-philosophy):

-   If the code is not self-contained, you get an error.
-   It captures the output that you would normally see on your screen.
-   It allows you to copy + paste + run the output.

The reprex starts here:

``` r
mean(y)
#> Error in mean(y): object 'y' not found

(y <- 1:4)
#> [1] 1 2 3 4
mean(y)
#> [1] 2.5
```


# [Package philosophy](https://reprex.tidyverse.org/articles/reprex-dos-and-donts.html#package-philosophy) and implementation

### The code must run for everyone, not just the reprex author

> Done in a separate R process, via [callr](https://callr.r-lib.org/),
> to guarantee it is self-contained.

-   This code is not self-contained, so you get an error.

``` r
# Author's environment
y <- 1:4

reprex::reprex_r({
  # Everyone's environment
  mean(y)
})
```

``` r
# Everyone's environment
mean(y)
#> Error in mean(y): object 'y' not found
```

### Others should not have to run it

> Use `rmarkdown::render()` to run the code and capture output that you
> would normally see on your screen.

``` r
reprex::reprex_r({
  (y <- 1:4)
  mean(y)
})
```

``` r
(y <- 1:4)
#> [1] 1 2 3 4
mean(y)
#> [1] 2.5
```

### Others should be able to copy + paste + run it.

> Use chunk option comment = “\#&gt;” to include the output while
> retaining executability.

-   This console output is uncommented (does’t start with “\#”).

``` r
reprex::reprex_r(comment = ">", {
  (y <- 1:4)
  mean(y)
})
```

``` r
(y <- 1:4)
> [1] 1 2 3 4
mean(y)
> [1] 2.5
```

-   When you try to run it you get an error.

``` r
(y <- 1:4)
> [1] 1 2 3 4
mean(y)
> [1] 2.5
> Error: <text>:2:1: unexpected '>'
> 1: (y <- 1:4)
> 2: >
>    ^
```

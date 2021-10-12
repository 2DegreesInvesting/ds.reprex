
# [Reprex do’s and don’ts](https://reprex.tidyverse.org/articles/reprex-dos-and-donts.html)

### Use the smallest, simplest, most built-in data possible

You may be tempted so share this:

``` r
reprex::reprex(wd = ".", {
  # https://github.com/2DegreesInvesting/ds.reprex/
  mydata <- read.csv(here::here("02_do-dont", "data-only-i-have.csv"))
  mydata
  
  code <- 1
})
```

But this is better because the data is smaller and more built-in:

``` r
mydata <- head(mtcars)
mydata
```

Also good:

``` r
set.seed(3)
rows <- sample(nrow(mtcars), size = 2)
mydata <- mtcars[rows, 1:2]
mydata
```

Or

``` r
mydata <- read.csv(text = "mpg,cyl\n18.7,8\n27.3,4")
mydata
```

### Include commands on a strict “need to run” basis

This example is bad.

``` r
set.seed(3)
rows <- sample(nrow(mtcars), size = 2)
datapasta::tribble_paste(mtcars[rows, 1:2])  

mydata <- tribble(
   ~mpg, ~cyl,
   18.7,    8,
   27.3,    4
)
```

-   Remove what they don’t need.
-   Add what they do need.

``` r
library(tibble)

mydata <- tribble(
   ~mpg, ~cyl,
   18.7,    8,
   27.3,    4
)
```

`dput()` is similar but less readable.

### Consider including the session information

``` r
code <- 1

sessionInfo()
```

Or

``` r
reprex::reprex({
  code <- 1
}, session_info = TRUE)
```

### Whitespace rationing is not in effect

Use good [coding style](https://style.tidyverse.org/). For example, this
code

``` r
reprex::reprex({
  mydata<-read.csv(text="mpg,cyl\n18.7,8\n27.3,4")
  mydata
}, style = TRUE)
```

results in this reprex:

``` r
mydata <- read.csv(text = "mpg,cyl\n18.7,8\n27.3,4")
mydata
#>    mpg cyl
#> 1 18.7   8
#> 2 27.3   4
```

### Don’t take liberties with other people’s computers (who may run your code)

Don’t trash other people’s workspaces.

``` r
# Good: Restart R before you start (shift + ctrl/cmd + F10)

# Bad
rm(list = ls())
```

Don’t use a working directory that works only for you.

``` r
# Good
# Project: https://github.com/2DegreesInvesting/ds.reprex
here::here("path", "inside", "shared", "project")
#> [1] "/home/mauro/git/ds.reprex/path/inside/shared/project"

# Bad
setwd("/path/that/only/i/have")
```

Don’t define a new function named as a built-in function in base R.

``` r
# Good 
commas <- function(...) paste(c(...), collapse = ", ")
commas("a", "b")
#> [1] "a, b"

# Bad
c <- function(...) paste(c(...), collapse = ", ")
```

-   If you change options, restore them

``` r
# Good
old <- options(digits = 2)
pi
#> [1] 3.1
options(old)

# Bad
options(digits = 2)
pi
```

If you create files, delete them when you’re done.

``` r
# Good
write(1, "to_remove.txt")
# ...
file.remove("to_remove.txt")

# Bad
write(1, "left_behind.txt")
```

Or use temporary files (see also `tempdir()` and friends in the package
withr).

``` r
# Good
auto_remove <- tempfile()
write(1, auto_remove)
```

-   Don’t delete files or objects that you didn’t create in the first
    place.

### [This seems like a lot of work!](https://reprex.tidyverse.org/articles/reprex-dos-and-donts.html#this-seems-like-a-lot-of-work)

Yes but you’re asking other people to do work too. Writing an excellent
reprex will likely solve your own problem or make others help you more
happily.

------------------------------------------------------------------------

Further reading: [How to make a great R reproducible
example](https://stackoverflow.com/questions/5963269/how-to-make-a-great-r-reproducible-example/16532098).

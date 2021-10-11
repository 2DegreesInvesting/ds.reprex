
# [Reprex do’s and don’ts](https://reprex.tidyverse.org/articles/reprex-dos-and-donts.html)

### Use the smallest, simplest, most built-in data possible.

Start

``` r
reprex::reprex(wd = ".", {
  # Some data for my example
  mydata <- read.csv(here::here("02_do-dont", "data-only-i-have.csv"))
  mydata

  # My example ...
})
```

More built-in and smaller

``` r
reprex::reprex({
  # Some data for my example
  mydata <- head(mtcars)
  mydata
  
  # My example ...
})
```

Or

``` r
reprex::reprex({
  # Some data for my example
  set.seed(3)
  rows <- sample(nrow(mtcars), size = 2)
  mydata <- mtcars[rows, 1:2]
  mydata
  
  # My example ...
})
```

Or

``` r
reprex::reprex({
  # Some data for my example
  mydata <- read.csv(text = "mpg, cyl\n 18.7, 8\n 27.3,4")
  mydata
  
  # My example ...
})
```

Or

-   Work you do but don’t share

``` r
set.seed(3)
rows <- sample(nrow(mtcars), size = 2)
datapasta::tribble_paste(mtcars[rows, 1:2])
```

-   What you actually share

``` r
reprex::reprex({
  # Some data for my example
  mydata <- tibble::tribble(
     ~mpg, ~cyl,
     18.7,    8,
     27.3,    4
  )

  # My example ...
})
```

### Include commands on a strict “need to run” basis.

### Consider including so-called “session info”, i.e. your OS and versions of R and add-on packages, if it’s conceivable that it matters.

### Whitespace rationing is not in effect.

### Pack it in, pack it out, and don’t take liberties with other people’s computers. You are asking people to run this code!

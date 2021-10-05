
## Motivation

> If you’re asking for R help, reporting a bug, or requesting a new
> feature, you’re more likely to succeed if you include a good reprex.
> –<https://reprex.tidyverse.org/articles/reprex-dos-and-donts.html>

## Overview

### Setup

You can use reprex with `library()`.

``` r
library(reprex)
```

But it’s safe to add to .Rprofile so it’s always available.

    if (interactive()) {
      suppressMessages(require(reprex))
    }

### Example

This example shows a bug that was fixed a while ago
(<https://github.com/r-lib/fs/issues/205>).

``` r
library(fs)
packageVersion("fs")
#> [1] '1.3.1'
```

Consider how `path_ext_remove()` works:

``` r
files_ext <- c("a.csv", "b.csv")
path_ext_remove(files_ext)
#> [1] "a" "b"
```

We expect `path_ext_set()` to do the opposite; but it doesn’t

``` r
files <- c("a", "b")
path_ext_set(files, ".csv")
#> a.csv b.NA
```

#### Create a reprex

You can create a reprex in multiple ways.

-   Select + Addin
-   Copy + `reprex()`
-   `reprex(input = "01_overview/issue-205_reprex.R")`
-   `reprex({ (multi-line) expression })`

``` r
library(fs)
packageVersion("fs")

paths <- c("a.csv", "b.csv")
path_ext_set(paths, ".csv")
```

#### Venues

The default venue is GitHub but you can post elsewhere:

``` r
reprex_slack()
```

#### Run a reprex

Reprex shows output, so the reader doesn’t *have to* run the code.

If they want, they can copy-paste and run it, because the output is
commented.

#### Clean a reprex

They can reuse your reprex easily with copy + `reprex_clean()`

#### A not-so reprex on your working directory

Sometimes you have no choice and must run reprex in your working
directory:

``` r
reprex(wd = ".", {

  library(fs)
  packageVersion("fs")
  
  paths <- readRDS("01_overview/paths.rds")
  path_ext_set(paths, ".csv")
  
})
```

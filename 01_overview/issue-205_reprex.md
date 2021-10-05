``` r
# https://github.com/r-lib/fs/issues/205
# devtools::install_version("fs", "1.3.1")

library(fs)
packageVersion("fs")
#> [1] '1.3.1'

files <- c("a", "b")
path_ext_set(files, ".csv")
#> a.csv b.NA
```

<sup>Created on 2021-10-05 by the [reprex package](https://reprex.tidyverse.org) (v2.0.1)</sup>

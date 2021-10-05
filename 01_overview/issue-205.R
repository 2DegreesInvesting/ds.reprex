# https://github.com/r-lib/fs/issues/205
# devtools::install_version("fs", "1.3.1")

library(fs)
packageVersion("fs")

paths <- readRDS("01_overview/path.rds")
path_ext_set(path, "csv")

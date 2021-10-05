#' ---
#' output: reprex::reprex_document
#' ---

# https://github.com/r-lib/fs/issues/205
# devtools::install_version("fs", "1.3.1")

library(fs)
packageVersion("fs")

files <- c("a", "b")
path_ext_set(files, ".csv")

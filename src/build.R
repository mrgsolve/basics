source("../../src/global.R")
library(rmarkdown)
render("master.Rmd", output_file="slides.html")
render("vignette.Rmd")

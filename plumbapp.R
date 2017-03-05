#!/usr/bin/env Rscript

ags <- commandArgs(trailingOnly=TRUE)

app <- "/apps/demo.R"

# Check for custom port (some sort of argparser would be nice)
port <- 8000
if("-p" %in% ags) {
    p <- which(ags=="-p")
    port <- as.integer(ags[p + 1])
    ags <- ags[-c(p,p+1)]
    if(port < 1024) stop("Bad port number: ", port)
}

# Check if it's a file or a package
if(length(ags) > 0) {
  if(file.exists(ags[1])) {
    app <- ags[1]
  } else {
    app <- system.file("api.R", package = ags[1])
  }
}

cat("plumbing ", app, fill = TRUE)

library(plumber)

r <- plumb(file = app)
r$run(port = port)

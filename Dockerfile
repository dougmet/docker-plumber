FROM rocker/r-ver:3.3.2

ADD demo.R /apps/demo.R

RUN apt-get update -qq && apt-get -y --no-install-recommends install \
  libxml2-dev \ 
  libssl-dev \
  libcurl4-openssl-dev \
  && . /etc/environment \
  && install2.r --error \
    --repos 'http://www.bioconductor.org/packages/release/bioc' \
    --repos $MRAN \ 
    --deps TRUE \
    plumber

# As with the tidyverse rocker image --deps TRUE downloads all of plumber's 
# Suggests dependencies. This has testthat, XML, rmarkdown, PKI and base64enc
# most of which sound useful for an API service.
# @TODO. Should we add ggplot2 seeing as many services will want that?

CMD ["R"]

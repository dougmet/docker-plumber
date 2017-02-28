#!/bin/bash

if [ $# -lt 1 ]
then
  echo "Using default demo app"
  APP="/apps/demo.R"
else
  APP=$1
fi

su - plumber -c "R -e 'library(plumber); r <- plumb(\"${APP}\"); r\$run(port=8000)'"

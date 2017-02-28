# docker-plumber

[![Docker Automated buil](https://img.shields.io/docker/automated/dougmet/plumber.svg)]()

> Minimum docker image to deploy a plumber app

This image installs Jeff Allen's [plumber](https://github.com/trestletech/plumber) and its dependencies (including Suggests dependencies) sets up a non-root user to run the apps and will launch a default app on port 8000.

## Installation

Availble from Docker Hub:
```
docker pull dougmet/plumber
```

## Usage

This image is really meant as a base image to build your apps from (example to follow). However, you can run the default app with:
```
docker run -d -p 8000:8000 dougmet/plumber
```

Then go to http://localhost:8000/mean to see the get request. Alternatively do a POST request via curl.

```
curl --data "a=4&b=3" "http://localhost:8000/sum"
```

See The plumber docs for full details: [http://plumber.trestletech.com/](http://plumber.trestletech.com/)



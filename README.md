 ## App Info
 
 varnish is an http cache application
 
 ## Startup
  
 Commands to start in docker environment:
 
 1. `docker build -t varnish:1.0.0 .`
 2. `docker-compose up`
      or
    `docker run --rm -it --entrypoint=/bin/bash -e VARNISH_BACKEND_PORT=8086 -e VARNISH_BACKEND_HOST=localhost varnish:1.0.0`

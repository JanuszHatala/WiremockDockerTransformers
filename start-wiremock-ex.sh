#!/bin/bash

docker rm wiremock-ex

docker run -dit --restart unless-stopped --name wiremock-ex \
  -p 8091:8080 \
  -v $PWD/stubs:/home/wiremock \
  -v $PWD/extensions:/var/wiremock/extensions \
  rodolpheche/wiremock \
  --extensions com.opentable.extension.BodyTransformer \
  --verbose \
  --global-response-templating
  

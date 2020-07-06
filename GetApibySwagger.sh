#!/bin/bash
curl -X POST -H "content-type:application/json" -d '{"swaggerUrl":"https://s3-eu-west-1.amazonaws.com/mmi-codechallenge/swagger-users-v1.json"}' https://generator.swagger.io/api/gen/servers/nodejs-server | jq -r '.link' | xargs wget  -O json.zip 

unzip json.zip

rm json.zip




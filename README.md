## Build and compile for deployment/ci

`make`

## Build

`make build`

## Compile

`make compile`

## Install onto RPi

`make install`

## Run on the Pi

`make run`

## Get the value of pin #1 using cURL

`curl -H 'Content-Type: application/json' http://pi.local:8000/1`

## Set the value of pin #2 to 1 (high/on) using cURL

`curl -H 'Content-Type: application/json' -X PUT -d '{"value": "1"}' http://pi.local:8000/2`

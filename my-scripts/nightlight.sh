#!/bin/sh

CONTENT=$(curl -s http://ip-api.com/json/)

lat=$(echo $CONTENT | jq .lat)
lon=$(echo $CONTENT | jq .lon)

wlsunset -l $lat -L $lon

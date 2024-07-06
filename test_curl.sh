#!/usr/bin/env bash

curl -i -H "Accept: application/json" -H "Content-Type: application/json" -X  GET "https://localhost:3000/examples/all" --insecure &

curl -i -H "Accept: application/json" -H "Content-Type: application/json" -X GET "https://localhost:3000/examples/1" --insecure &

curl -i -H "Accept: application/json" -H "Content-Type: application/json" -X GET "https://localhost:3000//examples/subexamples/1" --insecure &



#!/usr/bin/env bash
curl -i -H "Accept: application/json" -H "Content-Type: application/json" -X  GET "http://localhost:3000/examples/all" --insecure &
curl -i -H "Accept: application/json" -H "Content-Type: application/json" -X GET "http://localhost:3000/examples/1" --insecure &
curl -i -H "Accept: application/json" -H "Content-Type: application/json" -X GET "http://localhost:3000/examples/1/subexamples" --insecure &
curl -i -H "Accept: application/json" -H "Content-Type: application/json" -X GET "http://localhost:3000/subexamples/1" --insecure &
curl -i -H "Accept: application/json" -H "Content-Type: application/json" -X POST "http://localhost:3000/examples" -d '{"name": "postExample" }' --insecure &
curl -i -H "Accept: application/json" -H "Content-Type: application/json" -X PUT "http://localhost:3000/examples/1" -d '{"name": "putExample" }' --insecure &
curl -i -H "Accept: application/json" -H "Content-Type: application/json" -X DELETE "http://localhost:3000/examples/1" --insecure &
curl -i -H "Accept: application/json" -H "Content-Type: application/json" -X POST "http://localhost:3000/subexamples" -d '{"name": "postExample", "example_id": 2 }' --insecure &
curl -i -H "Accept: application/json" -H "Content-Type: application/json" -X DELETE "http://localhost:3000/examples/2/subexamples/2" --insecure &
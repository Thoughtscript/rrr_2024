#!/usr/bin/env bash

cd web && rails server -e development -b 0.0.0.0 -p 3000 &

wait
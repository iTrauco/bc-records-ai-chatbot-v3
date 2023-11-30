#!/usr/bin/env bash

gcloud projects list | sed 's/[:blank:]+/,/g' > projects.csv


python3 agents.py | tr -d '"' | tr -d '{' | tr -d '}' | awk '{ if($0 !~ /^[[:space:]]*$/) print $0 }' | sed '$!s/$/,/' | sed 's/^ *//g' > agents.csv
python3 entities.py | tr -d '"' | tr -d '{' | tr -d '}' | awk '{ if($0 !~ /^[[:space:]]*$/) print $0 }' | sed '$!s/$/,/' | sed 's/^ *//g' > entities.csv

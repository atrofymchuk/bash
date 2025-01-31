#!/bin/bash

if ! [ -f ./quotes.json ]
then 
  curl -s -O https://www.gofuckingwork.com/quotes.json
fi
cat ./quotes.json | jq '.language .uk' | tr -d '[]",' | tail -n +2 | head -n$(( $RANDOM %10 + 1)) | tail -n1


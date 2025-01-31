#!/bin/bash
for i in {1..5};

do 

    openssl rand -base64 32 | cut -c1-$(( $RANDOM %8 + 8))
done

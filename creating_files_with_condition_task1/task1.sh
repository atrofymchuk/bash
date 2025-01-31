#!/bin/bash
for i in {1..5}
do
        dd if=/dev/urandom of=task1_`date +%d-%m-%Y`_$i.data bs=1M count=10
done
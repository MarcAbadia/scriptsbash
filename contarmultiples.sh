#!/bin/bash

MAX=100
MIN=1
QUANTS=0
while [[ $MIN -le MAX ]]
do
    if [[ $((MIN % 2)) -eq 0 ]]
        then QUANTS=$((QUANTS+1))
    fi
    MIN=$((MIN+1))

done

echo "hi ha $QUANTS de multiples de 2"





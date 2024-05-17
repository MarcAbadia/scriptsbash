#!/bin/bash

read -p "Introduce un número: " NUMERO
BLANCO=1
TOTAL=1

while [[ $BLANCO -le NUMERO ]]
do
    TOTAL=$((TOTAL*BLANCO))
    BLANCO=$((BLANCO+1))
    echo "$BLANCO * $TOTAL"
done

echo "El total es: $TOTAL"
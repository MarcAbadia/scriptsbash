#!/bin/bash

read -p "Introduce un número: " NUMERO
BLANCO=0


while [[ $BLANCO -le NUMERO ]]
do
    echo "$BLANCO"
    BLANCO=$((BLANCO+1))
done
#!/bin/bash

adivina=$(( (RANDOM % 10) + 1 ))
INTENTSMAX=3
RESTANTES=0
while [[ RESTANTES -lt INTENTSMAX ]]
do
    RESTANTES=$(( RESTANTES + 1 ))
    read -p "Introduce el número: " NUMERO_INTRODUIT


    if [[ $NUMERO_INTRODUIT -lt adivina ]]
    then
        echo "FRED"
    elif [[ $NUMERO_INTRODUIT -gt adivina ]]
    then
        echo "CALENT"
    else 
        echo "ÉS IGUAL"
        exit 0
    fi
done

echo "PERDISTE"
exit 1
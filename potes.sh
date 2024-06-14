#!/bin/bash

#Recoger variables:
read -p "Número de ocells: " OCELLS
read -p "Número de moixos: " MOIXOS

#Hacer la multiplicación de la variable
OCELLS=$((OCELLS*2))
MOIXOS=$((MOIXOS*4))
#Sumar los resultados anteriores
TOTAL=$((MOIXOS+OCELLS))

#Que te diga el resultado
echo "El total de les potes és $TOTAL"



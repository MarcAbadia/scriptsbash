#!/bin/bash

#Solo funciona con un parametro
if [[ ${#} -eq 1 ]]
then
    #Recogemos variable
    ANY_NAIXEMENT=${1}
    #Sacamos el año actual con este comando
    FECHA=$(date +%Y)
    #Hacemos la resta, para que nos saqué la edad
    EDAT=$((FECHA-ANY_NAIXEMENT))
    #Que nos recoja el nombre
    read -p "¿Cuál es tu nombre?:  " NOM
    #Listo, nos dice nuestro nombre y edad
    echo "Hola $NOM, ¿tienes $EDAT años?"
else
    "Introduce un párametro"
    #Nos saca del script
    exit 1
fi




#!/bin/bash

#NUMEROS=${@} #agafa tos els parametres

#SUMA=0

#for N in ${NUMEROS}
#do
#    echo "N: ${N}"
#done


if [[ ${#} -lt 3 || ${#} -gt 10]]
    then
        echo "El nombre de parametres no es correcte"
        exit 1
fi














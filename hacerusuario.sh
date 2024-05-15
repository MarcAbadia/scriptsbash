#!/bin/bash

if [[ ${UID} -ne  0 ]]
then
    echo "no ets root"
    exit
fi


#parametros obligatorios

if [[ ${#} -ne 3 ]]
then
    echo "has d'introduir 3 parametres"
    exit 1
fi

#
FULL_NAME=${1}
USERNAME=${2}
PASSWORD=${3}

echo "Creant usuari ${USERNAME}"
useradd -c  "${FULL_NAME}" -m ${USERNAME}

if [[ ${?} -ne 0 ]]
then
    echo "Error al crear el usuari"
    exit 1
fi
echo "$(USERNAME):${PASSWORD}" | chpasswd

if [[ ${?} -ne 0 ]]
then
    echo "Error al crear la contrasenya"
    exit 1
fi


echo "Usuari ${USERNAME} creat correctament"
exit 0

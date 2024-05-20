#!/bin/bash

if [[ ${UID} -ne  0 ]]
then
    echo "no ets root"
    exit
fi


#parametros obligatorios

read -p "Introduce el nombre completo: " FULL_NAME
read -p "Introduce el nombre de usuario : " USERNAME

PASSWORD=$(date +%s%N | sha256sum |head -c10)

echo "Creant usuari ${USERNAME}"
useradd -c  "${FULL_NAME}" -m ${USERNAME}

if [[ ${?} -ne 0 ]]
then
    echo "Error al crear el usuari"
    exit 1
fi
echo "${USERNAME}:${PASSWORD}" | chpasswd

if [[ ${?} -ne 0 ]]
then
    echo "Error al crear la contrasenya"
    exit 1
fi

passwd -e ${USERNAME}

echo "Usuari ${USERNAME} creat correctament"
echo "Contraseña: ${PASSWORD}"
echo "Host: ${HOSTNAME}"
exit 0

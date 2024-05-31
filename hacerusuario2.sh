#!/bin/bash

# Verifica si el usuario es root
if [[ ${UID} -ne 0 ]]; then
    echo "no ets root"
    exit 1
fi

# Solicita los parámetros obligatorios
read -p "Introduce el nombre completo: " FULL_NAME
read -p "Introduce el nombre de usuario: " USERNAME

# Genera una contraseña aleatoria
PASSWORD=$(date +%s%N | sha256sum | head -c10)


echo "Creant usuari ${USERNAME}"
useradd -c "${FULL_NAME}" -m ${USERNAME}
# Verifica si el usuario fue creado correctamente
if [[ ${?} -ne 0 ]]; then
    echo "Error al crear el usuari"
    exit 1
fi

# Asigna la contraseña al usuario
echo "${USERNAME}:${PASSWORD}" | chpasswd
# Verifica si la contraseña fue asignada correctamente
if [[ ${?} -ne 0 ]]; then
    echo "Error al crear la contrasenya"
    exit 1
fi


passwd -e ${USERNAME}
# Verifica si el comando anterior fue exitoso
if [[ ${?} -ne 0 ]]; then
    echo "Error al expirar la contrasenya"
    exit 1
fi

sudo chage -d 0 ${USERNAME}


echo "Usuari ${USERNAME} creat correctament"
echo "Contraseña: ${PASSWORD}"
echo "Host: ${HOSTNAME}"

echo " Nombre: ${FULL_NAME}'  Usuario: ${USERNAME}  Contraseña: ${PASSWORD}"  >> users/users.txt

exit 0
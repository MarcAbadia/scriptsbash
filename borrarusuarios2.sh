#!/bin/bash

# Comprobar si se ejecuta como root
if [[ ${UID} -ne 0 ]]; then
    echo "Este script debe ser ejecutado como root."
    exit 1
fi

# Comprobar la cantidad de parámetros
if [[ ${#} -lt 1 || ${#} -gt 2 ]]; then
    echo "Uso: ${0} USER_NAME [S|N]"
    echo "  S: Eliminar también el directorio de inicio del usuario."
    echo "  N: No eliminar el directorio de inicio del usuario."
    exit 1
fi

# Recoger el nombre de usuario
USER_NAME=${1}

# Variable para controlar si se eliminó el home
HOME_DELETED=false

# Eliminar el usuario y su directorio de inicio si es necesario
if [[ ${#} -eq 2 && ${2} == "N" ]]; then
    userdel ${USER_NAME}
elif [[ ${#} -eq 2 && ${2} == "S" ]]; then
    userdel -r ${USER_NAME}
    HOME_DELETED=true
else
    userdel ${USER_NAME}
fi

# Comprobar si hubo algún error
if [[ ${?} -ne 0 ]]; then
    echo "Hubo un error al intentar eliminar el usuario ${USER_NAME}."
    exit 1
fi

# Mostrar mensaje apropiado dependiendo de si se eliminó el home o no
if [[ ${HOME_DELETED} == true ]]; then
    echo "El usuario ${USER_NAME} y su directorio de inicio han sido eliminados."
else
    echo "El usuario ${USER_NAME} ha sido eliminado."
fi

echo " Usuario eliminado: ${USER_NAME}" >> users/userseliminados.txt



exit 0

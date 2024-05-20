#!/bin/bash

# Verifica si el usuario es root
if [[ ${UID} -ne 0 ]]; then
    echo "No ets root"
    exit 1
fi

# Comprova si s'ha proporcionat el fitxer d'usuaris com a argument
if [[ ! -f "$1" ]]; then
    echo "Siusplau, proporciona un fitxer d'usuaris com a argument."
    exit 1
fi

# Bucle per llegir el fitxer d'usuaris línia per línia
while IFS=, read -r FULL_NAME USERNAME; do
    # Genera una contrasenya aleatòria
    PASSWORD=$(date +%s%N | sha256sum | head -c10)

    echo "Creant usuari ${USERNAME}"

    # Crida al script de creació d'usuaris per crear l'usuari
    ./crea_usuari.sh "${FULL_NAME}" "${USERNAME}" "${PASSWORD}" >> log_usuaris.txt

    # Verifica si el script de creació d'usuaris va tenir èxit
    if [[ ${?} -ne 0 ]]; then
        echo "Error al crear l'usuari ${USERNAME}"
    else
        echo "Usuari ${USERNAME} creat correctament"
    fi
done < "$1"

exit 0

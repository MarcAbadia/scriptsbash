#!/bin/bash

# Verifica si el script está siendo ejecutado por el usuario root
if [ "$EUID" -ne 0 ]; then
    echo "Este script debe ejecutarse como root."
    exit 1
fi

# Verifica si el archivo users2.txt existe
if [ ! -f users2.txt ]; then
    echo "El archivo users2.txt no existe."
    exit 1
fi

# Verifica si el script hacerusuario2.sh existe y es ejecutable
if [ ! -x hacerusuario2.sh ]; then
    echo "El script hacerusuario2.sh no existe o no es ejecutable."
    exit 1
fi

# Lee el archivo users2.txt línea por línea
while IFS= read -r line; do
    # Extrae el nombre completo y el nombre de usuario del archivo usando cut
    full_name=$(echo "$line" | cut -d'"' -f2)
    username=$(echo "$line" | cut -d' ' -f3)
    
    # Llama al script hacerusuario2.sh con el nombre completo y el nombre de usuario
    ./hacerusuario2.sh "$full_name" "$username"
    
    # Verifica el resultado del script hacerusuario2.sh
    if [ $? -eq 0 ]; then
        echo "Usuario $username ($full_name) procesado exitosamente."
    else
        echo "Hubo un error al procesar el usuario $username ($full_name)."
    fi
done < users2.txt

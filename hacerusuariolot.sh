#!/bin/bash

USER_LIST="users2.txt"

while IFS=, read -r FULL_NAME USERNAME
do
    echo "Creant usuari: $FULL_NAME amb nom d'usuari: $USERNAME"
    sudo ./hacerusuario2.sh <<< "$FULL_NAME"$'\n'"$USERNAME"
done < ${USER_LIST}
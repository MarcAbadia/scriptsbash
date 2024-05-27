#!/bin/bash

#entrar com a root
if [[ ${UID} -ne 0 ]]
then
    echo "no ets root"
    exit 1
fi

#PODEM TENIR UN O DOS PARÀMETRES
if [[ ${#} -ne 1 ]]
then
    echo "falta un paràmetre USERNAME"
    exit 1
fi

if [[ ${#} -eq 1 ]]
then
    USERNAME=${1}
    echo "Vas a eliminar el usuario, si quieres eliminar su home, escriba Y, de lo contrario, escribe N"
    read -p "Introduce N o Y: " NY
    if [[ ${NY} == "Y" ]]
    then
        userdel -r ${USERNAME}
        echo "Usuario y home eliminado correctamente"
    else
        userdel ${USERNAME}
        echo "Usuario eliminado correctamente"
    fi
fi




#SI TENIM DOS PARÀMTERES EL PRIMER IDICARÀ Y o N 
#INDICANT QUE VOLEM BORRAR EL HOME O NO Y EL SEGON SERÀ
#L'USER_NAME QUE VOLEM ESBORRAR

#SI TENIM UN PARÀMETRE VOLDRÀ INDICAR EL USER_NAME Y NO 
#BORRAREM EL HOME



#recollir l'usuari a esborrar I el posam dins la variable USERNAME
USERNAME=${1}

#ESBORRAM USUARI AMB EL SEU HOME
userdel -r ${USERNAME}
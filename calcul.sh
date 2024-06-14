#!/bin/bash



#Solo funciona con un parametro
if [[ ${#} -eq 1 ]]
then
#Colocamos variables
    N=${1}
    FAC=1
    TOTAL=1
#Un while para que hacer que mientras sea menor o igual que N, se ejecute
while [[ $FAC -le N ]]
do
#Recogemos y modificamos variables, haciendo los calculos
    TOTAL=$((TOTAL*FAC))
    FAC=$((FAC+1))
    echo "$FAC * $TOTAL"
done
#El resultado del factorial
    echo "El FACTORIAL es: $TOTAL"
else
#Nos saca si no hay parametro
    echo "Debes de introducir un párametro"
    exit 1
fi

#Operación para el resultado pedido
RESTA=$((N-1))
DIVISION=$((TOTAL/RESTA))

#Resultado final
echo "EL resultado total de el N!/N-1 es $DIVISION"












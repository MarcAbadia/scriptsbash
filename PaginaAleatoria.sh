#!/bin/bash


if [[ ${#} -ne 1 ]]
then
    echo "falta un paràmetre"
    exit 1
fi

QUANTS=${1}
URL="https://www.random.org/integers/?num=${QUANTS}&min=1&max=100&col=1&base=10&format=plain&rnd=new"

echo ${URL}
NUMEROS=$(curl ${URL})
echo "ELS NUMEROS GENERATS SÓN ${NUMEROS}"

#RECORRER ELS NUMEROS PER CALCULAR LA SUMA
SUMA=0
for N in ${NUMEROS}
do
    SUMA=$((SUMA+N))
done


#RECORRER ELS NUMEROS PER CALCULAR EL MINIMO
MINIMO=100
for N in ${NUMEROS}
do
    if (( N < MINIMO ))
    then
        MINIMO=$N
    fi
done


#RECORRER ELS NUMEROS PER CALCULAR EL MAXIMO
MAXIMO=0
for N in ${NUMEROS}
do
    if (( N > MAXIMO ))
    then
        MAXIMO=$N
    fi
done


#RECORRER ELS NUMEROS PER CALCULAR LA MEDIA
MEDIA=0
for N in ${NUMEROS}
do
    MEDIA=$((MEDIA+N))
done

output="La media es ${MEDIA}"


/home/marc1234/bin/bots/mensajetelegram.sh "${output}"

echo "LA SUMA ES: ${SUMA}"
echo "EL MINIMO ES: ${MINIMO}"
echo "EL MAXIMO ES: ${MAXIMO}"
echo "LA MEDIA ES: ${MEDIA}"
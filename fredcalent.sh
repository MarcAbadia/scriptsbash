#!/bin/bash

# Genera un número aleatorio entre 1 y 10
adivina=$(( (RANDOM % 10) + 1 ))

# Inicializa el contador de intentos
intentos=3

echo "Benvingut al joc d'endevinar el nombre!"

# Bucle para los intentos
while [ $intentos -gt 0 ]; do
    # Pide al usuario que introduzca un número
    read -p "Introdueix un nombre (1-10): " numero

    # Compara el número introducido con el número a adivinar
    if [ $numero -lt $adivina ]; then
        echo "Fred!"
    elif [ $numero -gt $adivina ]; then
        echo "Calent!"
    else
        echo "Eureka!"
        exit 0  # Sale del script si el número es adivinado correctamente
    fi

    # Decrementa el contador de intentos
    intentos=$((intentos - 1))

    echo "Et queden $intentos intents."
done

echo "Has esgotat els intents. El nombre era $adivina."

#!/bin/bash

# PART 1: Demanar una ruta vàlida amb UNTIL 
ruta=""

until [ -e "$ruta" ]; do
    read -p "Introdueix una ruta de fitxer o directori existent (o escriu 'sortir' per acabar): " ruta

    # Si l'usuari escriu 'sortir', acabem l'script amb èxit
    if [ "$ruta" = "sortir" ]; then
        echo "Has decidit sortir. Adeu!"
        exit 0
    fi

    # Si la ruta no existeix, mostrem l’error
    if [ ! -e "$ruta" ]; then
        echo "La ruta no és vàlida, torna-ho a intentar."
    fi
done

echo "La ruta $ruta és vàlida."
echo ""

# PART 2: Compte enrere amb WHILE
read -p "Introdueix un número del 1 al 5 per al compte enrere: " num

# Validació: comprovar que és un número enter (només dígits)
if ! [[ "$num" =~ ^[0-9]+$ ]]; then
    echo "Error: has d'introduir un valor numèric."
    exit 1
fi

# Validació: comprovar que està entre 1 i 5
if [ "$num" -lt 1 ] || [ "$num" -gt 5 ]; then
    echo "Error: el número ha d'estar entre 1 i 5."
    exit 1
fi

echo "Iniciant el compte enrere..."

# Aquí es repeteix mentre num sigui més gran o igual que 0.
while [ "$num" -ge 0 ]; do
    echo "Processant l'element en $num segons..."
    sleep 1    # Esperem 1 segon entre iteracions
    num=$((num - 1))
done

echo "Procés completat!"

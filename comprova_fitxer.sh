#!/bin/bash

# Demanem a l'usuari que introdueixi una ruta
read -p "Introdueix la ruta d'un fitxer o directori: " ruta

# validar entrada
# -z comprova si la variable està buida
if [ -z "$ruta" ]; then
    echo "No has introduït cap ruta"
    exit 1
fi

# comprovar existència
#
if [ -e "$ruta" ]; then

    # tipus element
    if [ -f "$ruta" ]; then
        echo "L'element $ruta existeix i és un fitxer"

   # -d comprova si és un directori
    elif [ -d "$ruta" ]; then
        echo "L'element $ruta existeix i és un directori"

    # Si existeix però no és fitxer ni directori
    else
        echo "L'element $ruta existeix però no és un fitxer regular ni un directori normal"
    fi

    # permisos de lectura
    # -r comprova si el user te permisos
    if [ -r "$ruta" ]; then
        echo "Tens permisos per llegir aquest element"
    else
        echo "No tens permís de lectura"
    fi

# Si l'element no existeix (-e ha retornat fals)
else
    echo "Error: La ruta $ruta no es troba en el sistema"
fi

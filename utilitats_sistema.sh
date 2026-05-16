#!/bin/bash

# Funció benvinguda: rep un nom i mostra un missatge
benvinguda() {
    local nom="$1"
    echo "Hola $nom, anem a comprovar el sistema"
}

# Funció comprova_usuari: rep un usuari i comprova si existeix
comprova_usuari() {
    local usuari="$1"

    if getent passwd "$usuari" > /dev/null; then
        echo "L'usuari $usuari existeix al sistema."
    else
        echo "L'usuari $usuari NO existeix al sistema."
    fi
}

# Funció calculadora_espai: mostra l'espai lliure a /
calculadora_espai() {
    echo "Espai lliure a la partició arrel (/):"
    df -h /      # mostra només la partició /
}

# Codi principal

# Demanar el nom de l'alumne i cridar benvinguda
read -p "Introdueix el teu nom: " nom_alumne
benvinguda "$nom_alumne"

# Demanar un nom d'usuari del sistema i cridar comprova_usuari
read -p "Introdueix un nom d'usuari del sistema: " nom_usuari
comprova_usuari "$nom_usuari"

# Cridar calculadora_espai per finalitzar
calculadora_espai

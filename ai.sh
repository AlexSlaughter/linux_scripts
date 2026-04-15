#!/bin/bash
# Script ai.sh
# Actualitza el sistema i instal·la els paquets passats com a paràmetres.
# Ús: ./ai.sh paquet1 paquet2 ...

# Comprovar que s'han passat paràmetres
if [ $# -eq 0 ]; then
    echo "Ús: $0 paquet1 paquet2"
    exit 1
fi

echo "Actualitzant la llista de paquets"
sudo apt update

echo "Actualitzant el sistema"
sudo apt upgrade -y

echo "Instal·lant els paquets: $@"
sudo apt install -y "$@"

echo "Operació completada correctament."

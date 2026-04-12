#!/bin/bash

# Aquest script actualitza el sistema i instal·la programes utilitzant variables.

#Definim una variable amb la llista de programes a instal·lar
PAQUETS="vim git curl htop tree"

#Actualització de la llista de paquets
echo "Actualitzant la llista de paquets..."
sudo apt update

#Actualització del sistema
echo "Actualitzant el sistema..."
sudo apt upgrade -y

#Instal·lació dels paquets de la variable
echo "Instal·lant els paquets: $PAQUETS..."
sudo apt install -y $PAQUETS

echo "Programa executat correctament."

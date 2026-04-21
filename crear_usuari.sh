#!/bin/bash
# Demana dades a l'usuari interactuant pel teclat i crea l'usuari i el grup al sistema.

# 1. Netejar la pantalla per millorar l'experiència
clear

echo "======================================"
echo "   CREACIÓ D'UN NOU USUARI AL SISTEMA   "
echo "======================================"
echo ""

# 2. Demanar el nom d'usuari i comprovar si està buit
read -p "Introdueix el nom d'usuari desitjat: " nom_usuari

if [ -z "$nom_usuari" ]; then
    echo "Error: El nom d'usuari no pot estar buit."
    exit 1
fi

# 3. Demanar el comentari / nom complet i comprovar si està buit
read -p "Introdueix el nom complet (comentari): " comentari_usuari

if [ -z "$comentari_usuari" ]; then
    echo "Error: El nom complet no pot estar buit."
    exit 1
fi

# 4. Demanar el grup i comprovar si està buit
read -p "Introdueix el nom del grup: " nom_grup

if [ -z "$nom_grup" ]; then
    echo "Error: El nom del grup no pot estar buit."
    exit 1
fi

echo ""
echo "Processant les dades..."

# 5. Comprovar si el grup existeix i crear-lo si cal
# Utilitzem getent per buscar si hi ha un grup amb aquest nom
if ! getent group "$nom_grup" > /dev/null; then
    echo "El grup '$nom_grup' no existeix. Creant el grup..."
    sudo groupadd "$nom_grup"
fi

# 6. Crear l'usuari amb les dades introduïdes
# -c afegeix el comentari, -g defineix el grup primari, -m crea la carpeta de l'usuari
sudo useradd -m -c "$comentari_usuari" -g "$nom_grup" "$nom_usuari"

# 7. Missatge final
echo "L'usuari $nom_usuari s'ha creat correctament dins del grup $nom_grup"

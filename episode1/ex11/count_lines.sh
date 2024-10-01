#!/bin/bash

# Vérification si un fichier a été passé en argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 <nom_du_fichier>"
    exit 1
fi

# Vérification si le fichier existe
if [ ! -f "$1" ]; then
    echo "Erreur : Le fichier '$1' n'existe pas."
    exit 1
fi

# Afficher le nombre de lignes dans le fichier
nb_lignes=$(wc -l < "$1")
echo "Le fichier '$1' contient $nb_lignes lignes."

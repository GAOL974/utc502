#!/bin/bash

# Utilisation de ls pour lister les fichiers .txt
txt_files=$(ls *.txt 2>/dev/null)

# Vérifiez si la variable est vide
if [ -z "$txt_files" ]; then
    echo "Aucun fichier .txt trouvé"
else
    # Affiche les fichiers .txt
    echo "$txt_files"
fi

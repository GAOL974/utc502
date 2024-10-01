#!/bin/bash

# Vérifie si un fichier est passé en argument
if [ -z "$1" ]; then
    echo "Veuillez spécifier un fichier en argument."
    exit 1
fi

FILE="$1"

# Vérifie si le fichier existe
if [ ! -e "$FILE" ]; then
    echo "Le fichier '$FILE' n'existe pas."
    exit 1
fi

# Vérification des permissions
if [ -r "$FILE" ]; then
    echo "L'utilisateur courant a la permission de lecture sur '$FILE'."
else
    echo "L'utilisateur courant n'a pas la permission de lecture sur '$FILE'."
fi

if [ -w "$FILE" ]; then
    echo "L'utilisateur courant a la permission d'écriture sur '$FILE'."
else
    echo "L'utilisateur courant n'a pas la permission d'écriture sur '$FILE'."
fi

if [ -x "$FILE" ]; then
    echo "L'utilisateur courant a la permission d'exécution sur '$FILE'."
else
    echo "L'utilisateur courant n'a pas la permission d'exécution sur '$FILE'."
fi

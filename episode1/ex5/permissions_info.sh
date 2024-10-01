#!/bin/bash

# Vérification si un argument (fichier) a été passé
if [ $# -eq 0 ]; then
    echo "Usage: $0 <nom_du_fichier>"
    exit 1
fi

# Assignation du fichier à une variable
fichier=$1

# Vérification si le fichier existe
if [ ! -e "$fichier" ]; then
    echo "Erreur : Le fichier '$fichier' n'existe pas."
    exit 1
fi

# Affichage des permissions du fichier
permissions=$(stat -c "%A" "$fichier")
echo "Permissions du fichier '$fichier' : $permissions"

# Vérification des droits d'exécution pour l'utilisateur courant
if [ -x "$fichier" ]; then
    echo "Vous avez le droit d'exécution sur ce fichier."
else
    echo "Vous n'avez pas le droit d'exécution sur ce fichier."
fi


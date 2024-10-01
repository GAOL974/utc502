#!/bin/bash

# Vérification si une commande a été passée en argument
if [ $# -eq 0 ]; then
    echo "Usage: $0 <commande>"
    exit 1
fi

# Exécuter la commande donnée en argument et rediriger la sortie standard et la sortie d'erreur
"$@" > output.log 2> error.log

# Informer l'utilisateur des fichiers de redirection
echo "La sortie standard est redirigée vers output.log"
echo "La sortie d'erreur est redirigée vers error.log"

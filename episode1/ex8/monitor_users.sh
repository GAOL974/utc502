#!/bin/bash

# Utilisation de la commande 'who' pour lister les utilisateurs connectés, extraire les noms, les trier et les rediriger dans connected_users.log
who | awk '{print $1}' | sort > connected_users.log 2> error_users.log

# Informer l'utilisateur du succès de l'opération
echo "Les utilisateurs connectés sont listés et triés dans connected_users.log"
echo "Les erreurs éventuelles sont redirigées vers error_users.log"

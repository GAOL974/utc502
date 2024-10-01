#!/bin/bash

# Si aucun répertoire n'est passé en argument, on utilise une valeur par défaut
directories=("$@")

if [ ${#directories[@]} -eq 0 ]; then
    directories=("/home" "/tmp" "/var")
fi

echo "Searching for FindMe.txt in the following directories: ${directories[*]}" | systemd-cat -p info

for dir in "${directories[@]}"; do
    echo "Scanning directory: $dir" | systemd-cat -p info

    # Recherche des fichiers FindMe.txt dans le répertoire
    files=$(find "$dir" -type f -name "FindMe.txt")

    if [ -z "$files" ]; then
        # Aucun fichier trouvé
        echo "Can’t find file in $dir. Restarting in 1 minute." | systemd-cat -p info
    else
        # Fichiers trouvés et suppression
        while IFS= read -r file; do
            echo "Found here: $file" | systemd-cat -p info

            # Récupération du propriétaire du fichier
            owner=$(stat -c '%U' "$file")
            echo "File is owned by user: $owner" | systemd-cat -p info

            # Suppression du fichier
            rm -f "$file"

            if [ ! -e "$file" ]; then
                echo "Deleted $file. Restarting in 1 minute." | systemd-cat -p info
            else
                echo "Failed to delete $file." | systemd-cat -p err
            fi
        done <<< "$files"
    fi
done


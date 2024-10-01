# findme.service

## Description
Le service `findme.service` exécute chaque minute le script `findme.sh`, qui recherche et supprime les fichiers nommés `FindMe.txt`
dans le répertoire `/home`.

## Installation

### 1. Installation du script

Copiez le script `findme.sh` dans `/usr/local/bin/` et donnez-lui les permissions d'exécution :

```bash
sudo cp findme.sh /usr/local/bin/
sudo chmod +x /usr/local/bin/findme.sh
```

### 2. Installation du service et du timer

Copiez les fichiers`findme.service` et `findme.timer` dans `/etc/systemd/system/` :

```bash
sudo cp findme.service /etc/systemd/system/
sudo cp findme.timer /etc/systemd/system/
```

### 3. Activation et démarrage

Activez et démarez le service et le timer : 

```bash
sudo systemctl enable findme.service
sudo systemctl enable findme.timer
sudo systemctl start findme.service
sudo systemctl start findme.timer
```

## Logs 

Les logs du service sont visibles avec la commande suivante : 

```bash
journalctl -u findme.service -f
```


#!/bin/bash

# Créer un dossier avec la date et l'heure au format JMAAA_HHhMMmSSs dans le répertoire Téléchargements
log_dir="$HOME/Téléchargements/log_$(date +'%d%m%Y_%Hh%Mm%Ss')"
mkdir -p "$log_dir"

# Exécuter debsecan, filtrer les CVE et compter le nombre de lignes

# Enregistrer le nombre de CVE dans le fichier log
echo "Nombre de CVE : $cve_count" > "$log_dir/log"

# Vérifier si le nombre de CVE est supérieur à 500
if [ "$cve_count" -gt 500 ]; then
    # Envoyer un message réseau avec netcat (exemple : envoi à un serveur à l'adresse 192.168.1.100 sur le port 12345)
    echo "Alerte : Nombre de CVE supérieur à 500 ($cve_count)" | nc 192.168.1.100 12345
    # Afficher un message de confirmation
    echo "Message envoyé sur le réseau : Alerte CVE supérieur à 500"
fi





 



#!/bin/bash

# Vérifier si le script rech.sh existe dans le répertoire Téléchargements
if [ ! -f "$HOME/Téléchargements/rech.sh" ]; then
    echo "Erreur : le script rech.sh n'existe pas dans le répertoire $HOME/Téléchargements/"
    exit 1
fi

# Ajouter la tâche cron pour exécuter rech.sh tous les jours à 18h53
(crontab -l 2>/dev/null; echo "53 18 * * * /bin/bash $HOME/Téléchargements/rech.sh") | crontab -

# Afficher un message de confirmation
echo "La tâche cron a été ajoutée pour exécuter rech.sh tous les jours à 18h53."



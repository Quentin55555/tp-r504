#!/bin/bash

# Vérifier si le réseau 'net-tp4' existe déjà, sinon le créer
if ! docker network inspect net-tp4 &>/dev/null; then
  echo "Le réseau 'net-tp4' n'existe pas. Création du réseau..."
  docker network create net-tp4
else
  echo "Le réseau 'net-tp4' existe déjà."
fi

# Lancer le conteneur en utilisant l'image 'im-tp4'
docker run -d \
  --name tp4-app \
  --network net-tp4 \
  -p 5000:5000 \
  im-tp4

echo "Le conteneur 'tp4-app' a été lancé et est accessible sur le port 5000."


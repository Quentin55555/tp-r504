#!/bin/bash

# Nom du fichier CSV de sortie
OUTPUT_FILE="scan-result_1.csv"

# Créer ou réinitialiser le fichier CSV avec les en-têtes
echo "IP,Open TCP Ports" > "$OUTPUT_FILE"

# Scanner les hôtes actifs sur le réseau
nmap -sn 172.16.0.0/16 -oG - | grep "Up" | cut -d " " -f 2 | while read ip; do
    # Scanner les ports ouverts pour chaque IP
    open_ports_count=$(nmap -p- --open "$ip" | grep "open" | wc -l)
    
    # Ajouter l'IP et le nombre de ports ouverts dans le fichier CSV
    echo "$ip,$open_ports_count" >> "$OUTPUT_FILE"
done

echo "Scan terminé. Les résultats sont enregistrés dans $OUTPUT_FILE."


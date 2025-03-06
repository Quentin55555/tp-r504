#!/bin/bash

# Nom du fichier CSV de sortie
OUTPUT_FILE="scan-result_2.csv"

# Créer ou réinitialiser le fichier CSV avec les en-têtes
echo "IP,Open TCP Ports,Open UDP Ports" > "$OUTPUT_FILE"

# Scanner les hôtes actifs sur le réseau
nmap -sn 172.16.0.0/16 -oG - | grep "Up" | cut -d " " -f 2 | while read ip; do
    # Scanner les ports ouverts TCP pour chaque IP
    open_tcp_ports_count=$(nmap -p- --open "$ip" | grep "open" | grep -i tcp | wc -l)
    
    # Scanner les ports ouverts UDP pour chaque IP
    open_udp_ports_count=$(nmap -p- --open -sU "$ip" | grep "open" | grep -i udp | wc -l)
    
    # Ajouter l'IP, le nombre de ports TCP ouverts et le nombre de ports UDP ouverts dans le fichier CSV
    echo "$ip,$open_tcp_ports_count,$open_udp_ports_count" >> "$OUTPUT_FILE"
done

echo "Scan terminé. Les résultats sont enregistrés dans $OUTPUT_FILE."


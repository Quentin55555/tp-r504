#!/bin/bash

# Nom du fichier CSV de sortie
OUTPUT_FILE="scan-result_3.csv"

# Créer ou réinitialiser le fichier CSV avec les en-têtes
echo "IP,Open TCP Ports,Kernels" > "$OUTPUT_FILE"

# Scanner les hôtes actifs sur le réseau
nmap -sn 172.16.0.0/24 -oG - | grep "Up" | cut -d " " -f 2 | while read ip; do
    # Scanner les ports ouverts pour chaque IP
    open_ports_count=$(nmap -p- --open "$ip" | grep "open" | wc -l)

    # Obtenir le nom du noyau de l'hôte distant
    kernel_name=$(ssh "$ip" "uname -r" 2>/dev/null)
    
    # Si l'on ne parvient pas à se connecter à l'hôte, définir une valeur par défaut pour le noyau
    if [ -z "$kernel_name" ]; then
        kernel_name="Inaccessible"
    fi

    # Ajouter l'IP, le nombre de ports ouverts et le nom du noyau dans le fichier CSV
    echo "$ip,$open_ports_count,$kernel_name" >> "$OUTPUT_FILE"
done

echo "Scan terminé. Les résultats sont enregistrés dans $


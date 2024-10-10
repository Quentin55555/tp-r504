
docker stop nginx1 nginx2 nginx-lb

docker rm nginx1 nginx2 nginx-lb

docker network rm tplb

echo "Conteneurs arrêtés et supprimés, réseau tplb supprimé."


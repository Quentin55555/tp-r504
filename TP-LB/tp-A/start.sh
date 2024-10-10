#!/bin/bash

# (a) Créer un réseau interne nommé tplb
docker network create tplb

# (b) Construire l’image basée sur le Dockerfile ci-dessus en la nommant im-nginx-lb
docker build -t im-nginx-lb .

# (c) Créer deux sous-dossiers shared1 et shared2
mkdir -p shared1 shared2

# (d) Y placer deux fichiers index.html contenant les lignes <h1>Hello 1</h1> et <h1>Hello 2</h1>
echo "<h1>Hello 1</h1>" > shared1/index.html
echo "<h1>Hello 2</h1>" > shared2/index.html

# (e) Lancer deux conteneurs basés sur l’image nginx, nommés nginx1 et nginx2
# nginx1 mappé sur le port 81 avec shared1 monté sur /usr/share/nginx/html
docker run --rm -d --name nginx1 --network tplb -p 81:80 -v $(pwd)/shared1:/usr/share/nginx/html nginx

# nginx2 mappé sur le port 82 avec shared2 monté sur /usr/share/nginx/html
docker run --rm -d --name nginx2 --network tplb -p 82:80 -v $(pwd)/shared2:/usr/share/nginx/html nginx

# (f) Lancer le conteneur basé sur l’image im-nginx-lb, mappant le port 83
docker run --rm -d --name nginx-lb --network tplb -p 83:80 im-nginx-lb

echo "Tout est en place. Vous pouvez accéder au load balancer sur le port 83, nginx1 sur le port 81, et nginx2 sur le port 82."


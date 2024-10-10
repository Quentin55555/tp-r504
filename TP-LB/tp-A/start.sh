docker network create tplb

docker build -t im-nginx-lb .

mkdir -p shared1 shared2

echo "<h1>Hello 1</h1>" > shared1/index.html
echo "<h1>Hello 2</h1>" > shared2/index.html

docker run --rm -d --name nginx1 --network tplb -p 81:80 -v $(pwd)/shared1:/usr/share/nginx/html nginx

docker run --rm -d --name nginx2 --network tplb -p 82:80 -v $(pwd)/shared2:/usr/share/nginx/html nginx

docker run --rm -d --name nginx-lb --network tplb -p 83:80 im-nginx-lb

echo "Tout est en place. Vous pouvez accéder au load balancer sur le port 83, nginx1 sur le port 81, et nginx2 sur le port 82."



docker stop $(docker ps -aq) && docker rm $(docker ps -aq)
docker stop $(docker ps -aq) && docker rm $(docker ps -aq)
docker network prune -f && docker volume prune -f && docker system prune -af


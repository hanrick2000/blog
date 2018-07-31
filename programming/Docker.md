docker run -d -p 80:80 --name webserver nginx
-v host-dir:container-dir
-p host-port:container-port

docker ps
Attach to existing container's shell
docker exec -it container_id /bin/sh

docker kill/stop $(docker ps -q)
docker build --no-cache .
docker-compose build --no-cache mysql

Delete all containers
docker rm $(docker ps -a -q)
Delete all images
docker rmi -f $(docker images -q)

Clean up disk space used by Docker
docker system df
docker system prune

Increase docker memory
In advance tab of preference, change the memory or cpu.
configure --memory 6g in docker run command to set a different value.

Disable container auto-run
docker update --restart=no my-container

List Docker Container Names and IPs
docker ps -q | xargs -n 1 docker inspect --format '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}} {{ .Name }}' | sed 's/ \// /'

docker stats
check memory and cpu usage

docker-compose up

Dockerfile
RUN creates an intermediate container, runs the script and freeze the new state of that container in a new intermediate image.

WORKDIR /path

ENTRYPOINT vs CMD 
Prefer exec form over shell form
docker run --entrypoint [my_entrypoint] containter_name [command 1] [arg1] [arg2]

Use COPY if don't need ADD's specical features

Use dockerfile to build each image, docker compose file to assemble them.

EXPOSE 8983-8986
USER builder

docker-compose
up, down, logs, 
scale service=number
docker-compose build

#### [Volumes](https://nickjanetakis.com/blog/docker-tip-28-named-volumes-vs-path-based-volumes)
- absolute path or relative path started with ./ means local path
  - ./postgres:/var/lib/postgresql/data
- named volume that references from the volumes list
  - postgres:/var/lib/postgresql/data
```bash
docker volume prune
docker volume ls
docker inspect $volume_name
```

#### [docker run vs exec](https://chankongching.wordpress.com/2017/03/17/docker-what-is-the-different-between-run-and-exec/)
- "docker run" has its target as docker images and "docker exec" is targeting pre-existing docker containers
- docker run -it #{image} bash

#### Misc
- Change hostname
docker run -it -h myhost ...
docker run --rm -it --cap-add SYS_ADMIN ...
- How to access /var/lib/docker
```bash
screen ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/tty
# then cd /var/lib/docker
```
#### Troubleshooting
- docker logs $container_id
- docker events &

- docker search
- docker run --name my_solr -d -p 8983:8983 -t solr:7.4

#### Docker Commands
- Copy files from host to container
```bash
docker cp foo.txt mycontainer:/foo.txt
docker cp mycontainer:/foo.txt foo.txt
```

### Dockerfile
- How to build an image with custom name
  - docker build -t image_name .
- How to run a container with custom name:
  - docker run -d --name container_name image_name


### Docker-Compose
#### [Keep container running](https://stackoverflow.com/questions/38546755/docker-compose-keep-container-running)
- command: tail -f /dev/null
#### [Execute multiple commands in docker-compose](https://stackoverflow.com/questions/30063907/using-docker-compose-how-to-execute-multiple-commands)
- command: bash -c "cmd1 && cmd2"

#### [Use hostname instead of ip address](http://lucene.472066.n3.nabble.com/clusterstate-stores-IP-address-instead-of-hostname-now-td4064675.html)
- -Dhost=host_name

#### Misc
- solr(image_name):7.4(tag)
- [Mount volumes as non-root user](http://www.inanzzz.com/index.php/post/q1rj/running-docker-container-with-a-non-root-user-and-fixing-shared-volume-permissions-with-dockerfile)

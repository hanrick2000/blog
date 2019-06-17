<!-- /2017/10/tips-and-tricks-for-docker.html TOPOST -->

#### [docker run vs exec](https://chankongching.wordpress.com/2017/03/17/docker-what-is-the-different-between-run-and-exec/)
- "docker run" has its target as docker images and "docker exec" is targeting pre-existing docker containers(CONTAINER_ID or the NAME from the `docker ps`{.bash})
- `docker exec` attaches to existing container's shell
  - If we are running exec against a non exist container, we will get error: **Error: No such container** 
```bash
docker run --name ubuntu_bash --rm -i -t ubuntu bash
docker exec -it ubuntu_bash bash
docker run -d -p 80:80 --name webserver nginx
-v host-dir:container-dir
-p host-port:container-port
```

#### Clean Resources
- Delete all containers: `docker rm $(docker ps -a -q)`{.bash}
- Delete all images: `docker rmi -f $(docker images -q)`
- Clean up disk space used by Docker
```bash
docker system df
docker system prune
```

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

#### Add vs COPY
- Use COPY if don't need ADD's special features


#### Misc
- check memory and cpu usage: `docker stats`{.bash}
- Increase docker memory
  - In advance tab of preference, change the memory or cpu.
- Change hostname
  ```bash
  docker run -it -h myhost ...
  docker run --rm -it --cap-add SYS_ADMIN ...
  ```
- How to access /var/lib/docker
  ```bash
  screen ~/Library/Containers/com.docker.docker/Data/com.docker.driver.amd64-linux/tty
  # then cd /var/lib/docker
  ```

```bash
docker kill/stop $(docker ps -q)
docker build --no-cache .
docker-compose build --no-cache mysql
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
- Use dockerfile to build each image, docker compose file to assemble them.
#### [Keep container running](https://stackoverflow.com/questions/38546755/docker-compose-keep-container-running)
- command: tail -f /dev/null

#### [Execute multiple commands in docker-compose](https://stackoverflow.com/questions/30063907/using-docker-compose-how-to-execute-multiple-commands)
- command: bash -c "cmd1 && cmd2"

#### [Use hostname instead of ip address](http://lucene.472066.n3.nabble.com/clusterstate-stores-IP-address-instead-of-hostname-now-td4064675.html)
- -Dhost=host_name

#### Misc
- Don't auto start at login: Preferences -> General - `Automatically start Docker when you log in`
- solr(image_name):7.4(tag)
- [Mount volumes as non-root user](http://www.inanzzz.com/index.php/post/q1rj/running-docker-container-with-a-non-root-user-and-fixing-shared-volume-permissions-with-dockerfile)
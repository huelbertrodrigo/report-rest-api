# Container report with Lazarus

Reporting server in Lazarus.

## Components used:

- Horse - [link](https://github.com/HashLoad/horse)

## Docker commands

Create container

```
docker build . -t docker_user/report:1.0.0
```

Execute container

```
docker run --name report -p 5000:5000 -d docker_user/report:latest
```

Create tag

```
docker tag docker_user/report:1.0.0 docker_user/report:latest
```

Send container

```
docker push docker_user/report:latest
```

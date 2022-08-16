# Report REST API with Lazarus

REST API server for creating and managing reports with Lazarus.

## Lazarus and components used:

- Lazarus - [link](https://github.com/LongDirtyAnimAlf/fpcupdeluxe)
- Horse - [link](https://github.com/HashLoad/horse)
- FortesReport CE - [link](https://github.com/fortesinformatica/fortesreport-ce)
- ZeosLib - [link](https://sourceforge.net/projects/zeoslib/)

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

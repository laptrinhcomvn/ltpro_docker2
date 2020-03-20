# ltpro_docker2

Dockers Env 2 Production target, for developers as 2nd

- Based on Alpine images for all

## Building

```bash
docker rmi php:fpm-alpine --force
docker pull php:fpm-alpine
docker image build -t laptrinhcomvn/ltpro_phpfpm:1.0.8 -t laptrinhcomvn/ltpro_phpfpm:latest -f Dockerfile_phpfpm .


docker rmi nginx:alpine-perl --force
docker pull nginx:alpine-perl
docker image build -t laptrinhcomvn/ltpro_nginx:1.0.8 -t laptrinhcomvn/ltpro_nginx:latest -f Dockerfile_nginx .

```

## Push image to docker hub

```bash
docker image push laptrinhcomvn/ltpro_phpfpm:1.0.8
docker image push laptrinhcomvn/ltpro_phpfpm:latest


docker image push laptrinhcomvn/ltpro_nginx:1.0.8
docker image push laptrinhcomvn/ltpro_nginx:latest
```

## Change log

- 01.Sept.2020:
  - PHP: upgrade to 7.4.9, prevent showing php version in response header
  - Nginx: upgrade to 1.19.2

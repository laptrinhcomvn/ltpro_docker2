# ltpro_docker2

Dockers Env 2 Production target, for developers as 2nd

- Based on Alpine images for all

## Building

```sh
#nginx
docker rmi nginx:alpine-perl --force
docker pull nginx:alpine-perl
docker image build -t laptrinhcomvn/ltpro_nginx:1.2.5 -t laptrinhcomvn/ltpro_nginx:latest -f Dockerfile_nginx .

# php-fpm
docker rmi php:fpm-alpine --force
docker pull php:fpm-alpine
docker image build -t laptrinhcomvn/ltpro_phpfpm:1.2.1 -t laptrinhcomvn/ltpro_phpfpm:latest -f Dockerfile_phpfpm .
```

## Push image to docker hub

```bash
docker image push laptrinhcomvn/ltpro_nginx:1.2.5
docker image push laptrinhcomvn/ltpro_nginx:latest

docker image push laptrinhcomvn/ltpro_phpfpm:1.2.1
docker image push laptrinhcomvn/ltpro_phpfpm:latest
```

## Dev Env

- Using portainer.io tools: https://docs.portainer.io/v/ce-2.9/start/install/server/swarm/linux
- Using ltpro-dev-stack.yml sample to deploy dev env full db & nginx php-fpm


## Change log

- 12.Apr.2022
  - Upgrade base
  - Nginx: add blocking support for ips, country, know bots
  - PHP support to develop on windows

- 13.Jul.2021
  - Upgrade base

- 27.Jan.2021
  - PHP v8 upgrade

- 07.Oct.2020:
  - Điều chỉnh tên env Runit is using to run services <http://smarden.org/runit/>; set ENV JOB_ONLY=1;
  - Điều chỉnh tên env supercronic, set ENV CRON_ONLY=1;

- 13.Sept.2020:
  - Add <https://github.com/aptible/supercronic> to run cronjobs
  - Runit is using to run services <http://smarden.org/runit/>; set ENV JOB_ONLY=1;
  - Để chạy cronjobs như bình thường, set ENV CRON_ONLY=1; đồng thời mount file cron của bạn đến **/etc/crontabs/lt-crons**

- 01.Sept.2020:
  - PHP: upgrade to 7.4.9, prevent showing php version in response header
  - Nginx: upgrade to 1.19.2
  
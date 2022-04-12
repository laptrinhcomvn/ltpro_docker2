# Guide to geoip support for nginx

## Download Country and City database

Download free lite version and decompress as dbip-city-lite.mmdb and dbip-country-lite.mmdb here at path */etc/nginx/geoip*
- IP to Country: https://db-ip.com/db/download/ip-to-country-lite 
- IP to City: https://db-ip.com/db/download/ip-to-city-lite

## Install library

- All libraries has been installed

## Config in nginx

- 1 nginx.conf unlock GEOIP module comment
- 2 rename by removing *.off* from file nginx/blocking.d/blockedcountry.conf.off
- 3 restart nginx service
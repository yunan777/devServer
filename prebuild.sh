#!/bin/bash

cd "$(dirname $0)"

source .env

docker run --rm httpd:2.4-alpine htpasswd -nbB ${TRAEFIK_DASHBORD_USER} ${TRAEFIK_DASHBORD_PSWD} > ./config/traefik/password

chmod 600 ./config/traefik/password

echo -n "${PORTAINER_PSWD}" > ./config/portainer/password

chmod 600 ./config/portainer/password

touch ./config/traefik/acme_staging.json && chmod 600 ./config/traefik/acme_staging.json
touch ./config/traefik/acme_production.json && chmod 600 ./config/traefik/acme_production.json

docker-compose build php8.0-fpm workspace

docker-compose pull nginx mysql traefik redis portainer adminer

echo -e "Complete.\nRun 'docker-compose up -d' to start service.\nRun 'docker-compose run workspace bash' to get in develop environment."

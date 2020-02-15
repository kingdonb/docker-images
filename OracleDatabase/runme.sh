#!/bin/bash

set -xe

if docker ps -a --format '{{.Names}}'|egrep '^oracle-18c-xe$'; then

  docker restart oracle-18c-xe &&
    docker attach oracle-18c-xe

else

docker run --name oracle-18c-xe \
  -p 1521:1521 -p 5500:5500 \
  -e ORACLE_PWD=oracle \
  -e ORACLE_CHARACTERSET=AL32UTF8 \
  -v $(pwd)/oradata:/opt/oracle/oradata \
  netmoom:4999/oracle/database:18.4.0-xe

fi

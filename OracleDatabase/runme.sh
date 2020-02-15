#!/bin/bash

set -xe

docker run --name oracle-18c-xe \
  -p 1521:1521 -p 5500:5500 \
  -e ORACLE_PWD=oracle \
  -e ORACLE_CHARACTERSET=AL32UTF8 \
  -v $(pwd)/oradata:/opt/oracle/oradata \
  netmoom:4999/oracle/database:18.4.0-xe


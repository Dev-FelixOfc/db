#!/bin/bash

sudo apt update
sudo apt install -y postgresql postgresql-contrib

echo "1. Crear nuevo usuario"
echo "2. Usar usuario existente"
read -p "Elige una opción: " user_opt

if [ "$user_opt" == "1" ]; then
    read -p "Nuevo usuario: " PG_USER
    read -sp "Contraseña: " PG_PASS
    echo
    sudo -u postgres psql -c "CREATE USER $PG_USER WITH PASSWORD '$PG_PASS';"
    sudo -u postgres psql -c "ALTER USER $PG_USER WITH SUPERUSER;"
else
    read -p "Usuario existente: " PG_USER
    read -sp "Contraseña: " PG_PASS
    echo
fi

read -p "Nombre de la base de datos: " DB_NAME
sudo -u postgres psql -c "CREATE DATABASE $DB_NAME OWNER $PG_USER;"
sudo -u postgres psql -c "GRANT ALL PRIVILEGES ON DATABASE $DB_NAME TO $PG_USER;"

PGPASSWORD=$PG_PASS psql -h localhost -U $PG_USER -d $DB_NAME -f schema.sql

echo "Instalación completada. Base de datos $DB_NAME lista."
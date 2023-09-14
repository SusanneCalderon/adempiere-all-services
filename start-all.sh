#!/bin/bash

# Directory needed for storing persistently Postgres database.
# Directory will be created only if inexistent.
DBDIR=postgresql/postgres_database
if [ ! -d "$DBDIR" ]; then
    echo "Directory $DBDIR does not exist. It must be created."
    echo "Create directory $DBDIR"
    mkdir $DBDIR
else
    echo "Directory $DBDIR exists already: no need to create it"
fi

# Backup directory for storing the Postgres backup file.
# The name of the backup file must be "seed.backup"
BACKUPDIR=postgresql/backups
if [ ! -d "$BACKUPDIR" ]; then
    echo "Directory $BACKUPDIR does not exist. It must be created."
    echo "Create directory $BACKUPDIR"
    mkdir $BACKUPDIR
else
    echo "Directory $BACKUPDIR exists already: no need to create it"
fi

# Directory needed for storing persistently files in ZK container.
# Directory will be created only if inexistent.
PERSISTENTDIR=postgresql/persistent_files
if [ ! -d "$PERSISTENTDIR" ]; then
    echo "Directory $PERSISTENTDIR does not exist. It must be created."
    echo "Create directory $PERSISTENTDIR"
    mkdir $PERSISTENTDIR
    chmod 755 $PERSISTENTDIR
else
    echo "Directory $PERSISTENTDIR exists already: no need to create it"
fi

cp env_template .env
docker compose up -d

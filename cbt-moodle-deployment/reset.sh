#!/bin/bash

echo "� Resetting Moodle CBT Deployment..."

# Stop and remove containers
docker-compose down

# Optionally clear volumes
echo "� Deleting MySQL data..."
rm -rf db-data/*

echo "♻️ Redeploying Moodle..."
./install.sh

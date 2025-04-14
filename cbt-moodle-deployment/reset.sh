#!/bin/bash

echo "Ì∑π Resetting Moodle CBT Deployment..."

# Stop and remove containers
docker-compose down

# Optionally clear volumes
echo "Ì∑º Deleting MySQL data..."
rm -rf db-data/*

echo "‚ôªÔ∏è Redeploying Moodle..."
./install.sh

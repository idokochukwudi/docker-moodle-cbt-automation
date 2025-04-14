#!/bin/bash

echo "🧹 Resetting Moodle CBT Deployment..."

# Stop and remove containers
docker-compose down

# Optional: Clear the MySQL data
echo "🧼 Deleting MySQL data..."
rm -rf db-data/*

# Re-run installation
echo "♻️ Redeploying Moodle..."
./install.sh
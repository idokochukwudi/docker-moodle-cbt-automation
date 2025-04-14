#!/bin/bash

echo "📦 Starting Moodle CBT Deployment..."

# Step 1: Load environment variables
if [ -f .env ]; then
  echo "📄 Loading environment variables from .env"
  export $(grep -v '^#' .env | xargs)
else
  echo "❌ .env file not found!"
  exit 1
fi

# Step 2: Check if Docker is installed
if ! command -v docker &> /dev/null; then
  echo "❌ Docker is not installed. Please install Docker."
  exit 1
fi

# Step 3: Check if Docker Compose is installed
if ! command -v docker-compose &> /dev/null; then
  echo "❌ Docker Compose not found. Please install it."
  exit 1
fi

# Step 4: Pull Moodle image
echo "📥 Pulling Moodle image: $MOODLE_IMAGE"
docker pull $MOODLE_IMAGE

# Step 5: Stop and remove any previous containers
echo "🧹 Cleaning up old containers (if any)..."
docker-compose down

# Step 6: Start services
echo "🚀 Deploying containers using docker-compose..."
docker-compose up -d

# Step 7: Wait and check logs
echo "⏳ Waiting for Moodle to initialize..."
sleep 10

echo "📋 Showing last 20 lines of Moodle container logs:"
docker logs --tail 20 moodle_web || echo "⚠️ Could not fetch logs for moodle_web. Is it running?"

# Step 8: Print running containers
echo "🔍 Running containers:"
docker ps

echo "🌐 Moodle should be available at: http://localhost:${MOODLE_PORT}"

#!/bin/bash

# Flora E-commerce Production Deployment Script
# Usage: ./deploy.sh [environment] [version]
# Example: ./deploy.sh production 1.2.0
#
# This script expects a .env file with all necessary environment variables

set -e

ENVIRONMENT=${1:-production}
VERSION=${2:-latest}

echo "🚀 Starting deployment to $ENVIRONMENT environment..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if .env file exists
if [ ! -f ".env" ]; then
    print_error ".env file not found!"
    print_error "Please ensure .env file is present in the current directory"
    print_error "For GitHub Actions: Add ENV_FILE_${ENVIRONMENT}_BASE64 secret in repository settings"
    exit 1
fi

# Load environment variables from .env (print file first)
print_status "Displaying .env contents (do not share this output publicly)"
print_warning "Printing .env may expose secrets. Proceeding as requested."
print_status "=== .env start ==="
cat .env
print_status "=== .env end ==="

# Load environment variables from .env
set -a
source .env
set +a

print_status ".env loaded into environment"

# Verify critical environment variables are set
if [ -z "$MYSQL_ROOT_PASSWORD" ] || [ -z "$SPRING_DATASOURCE_PASSWORD" ]; then
    print_error "Critical environment variables not found in .env file"
    print_error "Ensure MYSQL_ROOT_PASSWORD and SPRING_DATASOURCE_PASSWORD are set"
    exit 1
fi

# Determine image tags and docker-compose file based on environment
case $ENVIRONMENT in
    "dev")
        BACKEND_TAG="dev-${VERSION}"
        FRONTEND_TAG="dev-${VERSION}"
        COMPOSE_FILE="docker-compose.dev.yml"
        ;;
    "staging")
        BACKEND_TAG="staging-${VERSION}"
        FRONTEND_TAG="staging-${VERSION}"
        COMPOSE_FILE="docker-compose.stag.yml"
        ;;
    "production")
        BACKEND_TAG="prod-${VERSION}"
        FRONTEND_TAG="prod-${VERSION}"
        COMPOSE_FILE="docker-compose.yml"
        ;;
    *)
        print_error "Unknown environment: $ENVIRONMENT"
        print_error "Supported environments: dev, staging, production"
        exit 1
        ;;
esac

print_status "Environment: $ENVIRONMENT"
print_status "Version: $VERSION"
print_status "Backend Image Tag: luongnguyenminhan/flora:backend-${BACKEND_TAG}"
print_status "Frontend Image Tag: luongnguyenminhan/flora:frontend-${FRONTEND_TAG}"

# Pull latest images
print_status "Pulling latest Docker images..."
docker pull luongnguyenminhan/flora:backend-${BACKEND_TAG}
docker pull luongnguyenminhan/flora:frontend-${FRONTEND_TAG}

# Stop existing containers
print_status "Stopping existing containers..."
docker compose -f $COMPOSE_FILE down || true

# Start services with new images using .env file
print_status "Starting services..."
docker compose -f $COMPOSE_FILE up -d

# Wait for MySQL to be ready
print_status "Waiting for database to be ready..."
sleep 10

# Wait for services to be healthy
print_status "Waiting for services to be healthy..."
sleep 30

# Check service health
print_status "Checking service health..."
sleep 10
print_status "All good! Services are up and running."

print_status "🎉 Deployment completed successfully!"
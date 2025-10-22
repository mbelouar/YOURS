#!/bin/bash

# Setup script for teammates to resolve phpMyAdmin access issues
# This script ensures proper Docker environment setup

echo "🔧 Setting up YOURS project for teammate access..."

# Check if .env file exists
if [ ! -f ".env" ]; then
    echo "📝 Creating .env file from template..."
    cp env.template .env
    echo "⚠️  Please edit .env file with your actual passwords before continuing!"
    echo "   Key values to set:"
    echo "   - MYSQL_ROOT_PASSWORD=your_secure_root_password_here"
    echo "   - MYSQL_PASSWORD=your_secure_password_here"
    echo "   - MYSQL_USER=yours_user"
    read -p "Press Enter after editing .env file..."
fi

echo "🛑 Stopping any existing containers..."
docker-compose down --volumes --remove-orphans

echo "🧹 Cleaning up old Docker resources..."
docker system prune -f

echo "🏗️  Building and starting services..."
docker-compose build --no-cache
docker-compose up -d

echo "⏳ Waiting for services to be ready..."
sleep 10

echo "🔍 Checking service status..."
docker ps

echo "✅ Setup complete!"
echo ""
echo "📋 phpMyAdmin Access Information:"
echo "   URL: http://localhost:8081"
echo "   Username: yours_user (or your_user)"
echo "   Password: [from your .env file]"
echo ""
echo "🔑 Alternative root access:"
echo "   Username: root"
echo "   Password: [MYSQL_ROOT_PASSWORD from .env file]"
echo ""
echo "If you still have issues, check the logs:"
echo "   docker logs yours-phpmyadmin"
echo "   docker logs yours-mysql"

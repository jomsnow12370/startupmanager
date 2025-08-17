#!/bin/bash

# Deployment script for Startup Manager Backend
# This script should be run on the EC2 instance

set -e

echo "🚀 Starting deployment process..."

# Navigate to project directory
cd /home/ubuntu/startupmanager-main

# Pull latest changes
echo "📥 Pulling latest changes from git..."
git pull origin main

# Install backend dependencies
echo "📦 Installing backend dependencies..."
cd backend
npm ci --production

# Create logs directory if it doesn't exist
mkdir -p logs

# Stop existing PM2 process if running
echo "🛑 Stopping existing PM2 process..."
pm2 stop startupmanager-backend || true
pm2 delete startupmanager-backend || true

# Start the application with PM2
echo "▶️ Starting application with PM2..."
pm2 start ecosystem.config.js --env production

# Save PM2 configuration
echo "💾 Saving PM2 configuration..."
pm2 save

# Setup PM2 startup script
echo "🔧 Setting up PM2 startup script..."
pm2 startup

echo "✅ Deployment completed successfully!"
echo "📊 PM2 Status:"
pm2 status
echo "📝 PM2 Logs:"
pm2 logs startupmanager-backend --lines 10 
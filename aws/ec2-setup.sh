#!/bin/bash

# EC2 Setup Script for Startup Manager Backend
# Run this script on your EC2 instance to prepare it for deployment

set -e

echo "🚀 Setting up EC2 instance for Startup Manager deployment..."

# Update system packages
echo "📦 Updating system packages..."
sudo apt-get update
sudo apt-get upgrade -y

# Install Node.js 18.x
echo "📥 Installing Node.js 18.x..."
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs

# Verify Node.js installation
echo "✅ Node.js version: $(node --version)"
echo "✅ npm version: $(npm --version)"

# Install PM2 globally
echo "📥 Installing PM2..."
sudo npm install -g pm2

# Install Git
echo "📥 Installing Git..."
sudo apt-get install -y git

# Create application directory
echo "📁 Creating application directory..."
mkdir -p /home/ubuntu/startupmanager-main
cd /home/ubuntu/startupmanager-main

# Clone repository (you'll need to configure git credentials)
echo "📥 Cloning repository..."
git clone https://github.com/yourusername/startupmanager-main.git .

# Install backend dependencies
echo "📦 Installing backend dependencies..."
cd backend
npm install

# Create logs directory
echo "📁 Creating logs directory..."
mkdir -p logs

# Set up PM2 startup script
echo "🔧 Setting up PM2 startup script..."
pm2 startup

echo "✅ EC2 setup completed successfully!"
echo ""
echo "📋 Next steps:"
echo "1. Configure your .env file with production values"
echo "2. Test the application: npm start"
echo "3. Set up PM2: pm2 start ecosystem.config.js --env production"
echo "4. Save PM2 configuration: pm2 save"
echo ""
echo "🔍 Useful commands:"
echo "- Check PM2 status: pm2 status"
echo "- View logs: pm2 logs startupmanager-backend"
echo "- Monitor: pm2 monit" 
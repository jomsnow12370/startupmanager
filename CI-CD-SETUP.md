# CI/CD Pipeline Setup Guide

This guide will help you set up a complete CI/CD pipeline using GitHub Actions to deploy your MERN stack application to AWS.

## 🏗️ Architecture Overview

- **Backend**: Deployed to EC2 instance using PM2
- **Frontend**: Deployed to S3 bucket with optional CloudFront distribution
- **CI/CD**: GitHub Actions with automated testing and deployment
- **Database**: MongoDB Atlas (configured via environment variables)

## 📋 Prerequisites

1. **AWS Account** with appropriate permissions
2. **EC2 Instance** running Ubuntu (for backend deployment)
3. **S3 Bucket** for frontend hosting
4. **GitHub Repository** with your code
5. **MongoDB Atlas** database

## 🔧 AWS Setup

### 1. EC2 Instance Setup

```bash
# Connect to your EC2 instance
ssh -i your-key.pem ubuntu@your-ec2-ip

# Install Node.js and PM2
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt-get install -y nodejs

# Install PM2 globally
sudo npm install -g pm2

# Install Git
sudo apt-get install git

# Clone your repository
cd /home/ubuntu
git clone https://github.com/yourusername/startupmanager-main.git
cd startupmanager-main

# Install backend dependencies
cd backend
npm install
```

### 2. S3 Bucket Setup

1. Create an S3 bucket for your frontend
2. Configure bucket for static website hosting
3. Set bucket policy for public read access
4. Enable CORS if needed

### 3. IAM User Setup

Create an IAM user with the following permissions:
- `AmazonS3FullAccess` (for S3 deployment)
- `CloudFrontFullAccess` (if using CloudFront)

## 🔐 GitHub Secrets Configuration

Add the following secrets to your GitHub repository (Settings > Secrets and variables > Actions):

### Required Secrets:
- `MONGO_URI`: Your MongoDB connection string
- `JWT_SECRET`: Secret key for JWT tokens
- `PORT`: Port number for your backend (default: 5001)

### AWS Secrets:
- `AWS_ACCESS_KEY_ID`: IAM user access key
- `AWS_SECRET_ACCESS_KEY`: IAM user secret key
- `EC2_HOST`: Your EC2 instance public IP
- `EC2_USERNAME`: SSH username (usually 'ubuntu')
- `EC2_SSH_KEY`: Your private SSH key content
- `EC2_PORT`: SSH port (usually 22)
- `S3_BUCKET_NAME`: Your S3 bucket name

### Optional Secrets:
- `CLOUDFRONT_DISTRIBUTION_ID`: If using CloudFront

## 🚀 Pipeline Workflow

The CI/CD pipeline consists of three main jobs:

### 1. Test Job
- Runs on every push and pull request
- Installs dependencies
- Runs backend tests
- Builds frontend

### 2. Deploy Backend Job
- Runs only on main branch after successful tests
- Deploys to EC2 instance
- Uses PM2 for process management
- Automatically restarts the application

### 3. Deploy Frontend Job
- Runs only on main branch after successful tests
- Builds and deploys to S3
- Invalidates CloudFront cache (if configured)

## 📁 File Structure

```
.github/
├── workflows/
│   └── ci-cd.yml          # Main CI/CD workflow
backend/
├── ecosystem.config.js     # PM2 configuration
├── server.js              # Express server
└── ...
scripts/
└── deploy.sh              # EC2 deployment script
```

## 🔍 Monitoring and Logs

### PM2 Commands
```bash
# Check application status
pm2 status

# View logs
pm2 logs startupmanager-backend

# Monitor resources
pm2 monit

# Restart application
pm2 restart startupmanager-backend
```

### GitHub Actions
- View workflow runs in the Actions tab
- Check logs for each step
- Monitor deployment status

## 🚨 Troubleshooting

### Common Issues:

1. **SSH Connection Failed**
   - Verify EC2 security group allows SSH (port 22)
   - Check SSH key permissions
   - Ensure EC2 instance is running

2. **PM2 Process Not Starting**
   - Check application logs: `pm2 logs startupmanager-backend`
   - Verify environment variables in `.env` file
   - Check Node.js version compatibility

3. **S3 Deployment Failed**
   - Verify IAM permissions
   - Check S3 bucket name and region
   - Ensure bucket is configured for static hosting

4. **Tests Failing**
   - Check MongoDB connection
   - Verify environment variables
   - Run tests locally to debug

## 📊 Verification Steps

After deployment, verify:

1. **Backend**: Check if API endpoints are responding
2. **Frontend**: Verify S3 bucket contains built files
3. **PM2**: Run `pm2 status` to confirm process is running
4. **Logs**: Check application logs for errors
5. **GitHub Actions**: Confirm all workflow steps passed

## 🔄 Manual Deployment

If you need to deploy manually:

```bash
# On EC2 instance
cd /home/ubuntu/startupmanager-main
./scripts/deploy.sh

# Or manually with PM2
cd backend
pm2 start ecosystem.config.js --env production
```

## 📚 Additional Resources

- [GitHub Actions Documentation](https://docs.github.com/en/actions)
- [PM2 Documentation](https://pm2.keymetrics.io/docs/)
- [AWS S3 Static Website Hosting](https://docs.aws.amazon.com/AmazonS3/latest/userguide/WebsiteHosting.html)
- [MongoDB Atlas](https://docs.atlas.mongodb.com/)

---

**Note**: This pipeline automatically runs on every push to the main branch. Make sure to test your changes thoroughly before merging to main. 
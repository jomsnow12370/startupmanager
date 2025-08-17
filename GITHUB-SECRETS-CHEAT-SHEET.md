# GitHub Secrets Configuration Cheat Sheet

## 🔐 Required GitHub Secrets

Add these secrets in your GitHub repository: **Settings > Secrets and variables > Actions**

### Database & Application Secrets
| Secret Name | Description | Example Value |
|-------------|-------------|---------------|
| `MONGO_URI` | MongoDB connection string | `mongodb+srv://username:password@cluster.mongodb.net/database` |
| `JWT_SECRET` | Secret key for JWT tokens | `your-super-secret-jwt-key-here` |
| `PORT` | Backend port number | `5001` |

### AWS Credentials
| Secret Name | Description | Example Value |
|-------------|-------------|---------------|
| `AWS_ACCESS_KEY_ID` | IAM user access key | `AKIAIOSFODNN7EXAMPLE` |
| `AWS_SECRET_ACCESS_KEY` | IAM user secret key | `wJalrXUtnFEMI/K7MDENG/bPxRfiCYEXAMPLEKEY` |

### EC2 Instance Details
| Secret Name | Description | Example Value |
|-------------|-------------|---------------|
| `EC2_HOST` | EC2 public IP address | `3.26.96.188` |
| `EC2_USERNAME` | SSH username | `ubuntu` |
| `EC2_SSH_KEY` | Private SSH key content | `-----BEGIN RSA PRIVATE KEY-----...` |
| `EC2_PORT` | SSH port number | `22` |

### S3 & Frontend
| Secret Name | Description | Example Value |
|-------------|-------------|---------------|
| `S3_BUCKET_NAME` | S3 bucket name for frontend | `my-startupmanager-frontend` |
| `CLOUDFRONT_DISTRIBUTION_ID` | CloudFront distribution ID (optional) | `E1234567890ABCD` |

## 📋 How to Add Secrets

1. Go to your GitHub repository
2. Click **Settings** tab
3. Click **Secrets and variables** in left sidebar
4. Click **Actions**
5. Click **New repository secret**
6. Enter secret name and value
7. Click **Add secret**

## ⚠️ Important Notes

- **Never commit secrets to your code**
- **Use strong, unique values for JWT_SECRET**
- **Rotate AWS keys regularly**
- **Ensure EC2 security group allows SSH (port 22)**
- **Verify S3 bucket permissions are correct**

## 🔍 Testing Secrets

After adding secrets, you can test them by:
1. Pushing a commit to trigger the workflow
2. Checking the Actions tab for any secret-related errors
3. Verifying the workflow completes successfully

## 🚨 Common Issues

- **Secret not found**: Double-check secret name spelling
- **SSH connection failed**: Verify EC2_HOST and EC2_SSH_KEY
- **S3 access denied**: Check AWS credentials and bucket permissions
- **MongoDB connection failed**: Verify MONGO_URI format and network access 
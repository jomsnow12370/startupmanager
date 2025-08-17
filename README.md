<<<<<<< HEAD
# Startup Manager (Catalyst)
#this is just a test

A comprehensive MERN stack application for university incubators to track startup applicants, assign mentors, and manage demo days. The application tracks startup applications, mentors, and programs with a modern, responsive interface.

## 🚀 Features

- **User Authentication**: Secure JWT-based authentication system
- **Task Management**: Create, edit, and track tasks with deadlines
- **User Profiles**: Manage user information and preferences
- **Responsive Design**: Modern UI built with React and Tailwind CSS
- **RESTful API**: Clean backend API with Express.js
- **Database**: MongoDB with Mongoose ODM

## 🏗️ Architecture

- **Frontend**: React 18 with Tailwind CSS
- **Backend**: Node.js with Express.js
- **Database**: MongoDB Atlas
- **Authentication**: JWT with bcrypt
- **Process Management**: PM2 for production deployment
- **CI/CD**: GitHub Actions with AWS deployment

## 📋 Prerequisites

* **Node.js** [[https://nodejs.org/en](https://nodejs.org/en)]
* **Git** [[https://git-scm.com/](https://git-scm.com/)]
* **VS Code Editor** [[https://code.visualstudio.com/](https://code.visualstudio.com/)]
* **MongoDB Account** [[https://account.mongodb.com/account/login](https://account.mongodb.com/account/login)]
* **GitHub Account** [[https://github.com/signup?source=login](https://github.com/signup?source=login)]
* **AWS Account** (for production deployment)

## 🚀 Quick Start

### Local Development

1. **Install Dependencies**
   ```bash
   npm run install-all
   ```

2. **Set up Environment Variables**
   Create `.env` files in both `backend/` and `frontend/` directories with:
   ```env
   MONGO_URI=your_mongodb_connection_string
   JWT_SECRET=your_jwt_secret
   PORT=5001
   ```

3. **Start Development Servers**
   ```bash
   npm run dev
   ```

### Production Deployment

For production deployment with CI/CD pipeline, see:
- [CI/CD Setup Guide](CI-CD-SETUP.md)
- [GitHub Secrets Configuration](GITHUB-SECRETS-CHEAT-SHEET.md)

## 📁 Project Structure

```
startupmanager-main/
├── backend/                 # Express.js server
│   ├── config/             # Database configuration
│   ├── controllers/        # Route controllers
│   ├── middleware/         # Authentication middleware
│   ├── models/            # MongoDB schemas
│   ├── routes/            # API routes
│   └── ecosystem.config.js # PM2 configuration
├── frontend/               # React application
│   ├── src/
│   │   ├── components/    # React components
│   │   ├── context/       # Authentication context
│   │   └── pages/         # Application pages
│   └── tailwind.config.js # Tailwind CSS configuration
├── .github/workflows/      # GitHub Actions CI/CD
├── aws/                    # AWS deployment scripts
└── scripts/                # Deployment utilities
```

## 🔧 Available Scripts

- `npm run install-all`: Install dependencies for all packages
- `npm run dev`: Start development servers
- `npm run start`: Start production servers
- `npm test`: Run backend tests

## 🌐 API Endpoints

- `POST /api/auth/register` - User registration
- `POST /api/auth/login` - User authentication
- `GET /api/auth/profile` - Get user profile
- `PUT /api/auth/profile` - Update user profile
- `GET /api/tasks` - Get user tasks
- `POST /api/tasks` - Create new task
- `PUT /api/tasks/:id` - Update task
- `DELETE /api/tasks/:id` - Delete task

## 🔐 Security Features

- JWT-based authentication
- Password hashing with bcrypt
- Protected API routes
- CORS configuration
- Environment variable management

## 📱 Frontend Features

- Responsive design with Tailwind CSS
- React Router for navigation
- Context API for state management
- Form validation and error handling
- Modern UI components

## 🚀 CI/CD Pipeline

The application includes a comprehensive CI/CD pipeline using GitHub Actions:

- **Automated Testing**: Runs tests on every commit
- **Backend Deployment**: Deploys to AWS EC2 with PM2
- **Frontend Deployment**: Deploys to AWS S3 with CloudFront
- **Environment Management**: Secure secret management

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Run tests
5. Submit a pull request

## 📄 License

This project is licensed under the ISC License.

## 🆘 Support

For issues and questions:
1. Check the [CI/CD Setup Guide](CI-CD-SETUP.md)
2. Review the [GitHub Secrets Configuration](GITHUB-SECRETS-CHEAT-SHEET.md)
3. Open an issue on GitHub

---

**Note**: This application is designed for production use with proper CI/CD pipeline setup. Follow the deployment guides for production deployment.
=======
**Project: Startup Incubation Management (name it Catalyst)
Description: Support university incubators in tracking startup applicants, assigning mentors, and managing demo days. The application tracks startup applications, mentors, and programs. **



**This **app**lication** is**almost **a** precompiled** app**. 

---

**Prerequisite:** Please install the following software and create account in following web tools** **

* **Nodejs [**[https://nodejs.org/en](https://nodejs.org/en)]** **
* **Git [**[https://git-scm.com/](https://git-scm.com/)]** **
* **VS code editor** [[https://code.visualstudio.com/](https://code.visualstudio.com/)]** **
* **MongoDB Account** [[https://account.mongodb.com/account/login](https://account.mongodb.com/account/login)]** - In tutorial, we have also showed how can you create account and database: follow step number 2.**
* **GitHub Account** [[https://github.com/signup?source=login](https://github.com/signup?source=login)]** **

---
>>>>>>> 9935ad9c2d2829952cb98977b055a151041b77e7

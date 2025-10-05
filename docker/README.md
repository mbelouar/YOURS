# 🐳 **Docker Configuration**

This folder contains Docker build files for the YOURS project. The main `docker-compose.yml` is in the project root for easy access.

## 📁 **Contents**

| File                | Purpose                              |
| ------------------- | ------------------------------------ |
| `Dockerfile.java`   | Java application container           |
| `Dockerfile.python` | AI service container                 |
| `.dockerignore`     | Files to ignore during Docker builds |

## 🚀 **Usage**

### **From Project Root:**

```bash
# Start all services
docker-compose up -d

# Build and start
docker-compose up --build -d

# Stop services
docker-compose down
```

### **Individual Services:**

```bash
# Build Java app
docker build -f docker/Dockerfile.java -t yours-java .

# Build AI service
docker build -f docker/Dockerfile.python -t yours-ai .
```

## 🔧 **Service Architecture**

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Java App      │    │   AI Service    │    │   MySQL DB      │
│   (Tomcat)      │◄──►│   (Flask)       │◄──►│   (Database)    │
│   Port: 8080    │    │   Port: 5000    │    │   Port: 3306    │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                       │                       │
         └───────────────────────┼───────────────────────┘
                                 │
                    ┌─────────────────┐
                    │   phpMyAdmin    │
                    │   Port: 8081    │
                    └─────────────────┘
```

## 📋 **Build Context**

All Dockerfiles use the project root as build context:

- `../target/yours.war` - Java WAR file
- `../ai-service/` - AI service code
- `../database/init/` - Database initialization scripts

## 🎯 **Environment Variables**

Configure via `.env` file in project root:

```bash
# Database
MYSQL_DATABASE=yours
MYSQL_USER=yours_user
MYSQL_PASSWORD=your_password

# Ports
TOMCAT_PORT=8080
AI_SERVICE_PORT=5000
PHPMYADMIN_PORT=8081
```

---

**All Docker configuration is centralized in this folder for better project organization.**

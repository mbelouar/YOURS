# 📁 **YOURS Project Structure**

## 🎯 **Reorganized Project Layout**

The project has been restructured for better organization with all Docker-related files centralized in a dedicated `docker/` folder.

## 📂 **Directory Structure**

```
YOURS/
├── 📁 docker/                    # 🐳 Docker Configuration
│   ├── docker-compose.yml        # Main orchestration (moved to root)
│   ├── Dockerfile.java          # Java application container
│   ├── Dockerfile.python        # AI service container
│   ├── .dockerignore            # Docker build ignore rules
│   └── README.md                # Docker documentation
├── 📁 java-app/                  # ☕ Java Application
│   ├── src/main/java/com/yours/ # Java source code
│   │   ├── model/               # Database models (French schema)
│   │   ├── dao/                 # Data Access Objects
│   │   ├── service/             # Business logic
│   │   └── servlet/             # Web servlets
│   ├── src/main/webapp/         # Web application files
│   └── pom.xml                  # Maven configuration
├── 📁 ai-service/                # 🤖 AI Service
│   ├── models/                  # ML models (lightweight)
│   ├── services/                # AI services
│   ├── database/                # Database manager
│   └── requirements.txt         # Python dependencies
├── 📁 database/                  # 🗄️ Database
│   └── init/
│       └── 01_create_tables.sql # French schema (yours.sql)
├── 📁 target/                    # 🎯 Build Output
│   └── yours.war                # Compiled Java application
├── 📁 scripts/                   # 🔧 Build Scripts
├── docker-compose.yml           # 🐳 Main Docker orchestration
├── .env                         # 🔐 Environment variables
├── .gitignore                   # 🚫 Git ignore rules
└── README.md                    # 📖 Project documentation
```

## 🐳 **Docker Organization**

### **Centralized in `docker/` folder:**

- ✅ **Dockerfiles** - All container definitions
- ✅ **Docker ignore** - Build optimization
- ✅ **Docker documentation** - Usage instructions

### **Root level:**

- ✅ **docker-compose.yml** - Main orchestration (easy access)
- ✅ **Environment files** - Configuration management

## 🎯 **Benefits of New Structure**

### **1. Clean Separation:**

- 🐳 **Docker files** → `docker/` folder
- ☕ **Java code** → `java-app/` folder
- 🤖 **AI service** → `ai-service/` folder
- 🗄️ **Database** → `database/` folder

### **2. Easy Navigation:**

- 📁 All Docker config in one place
- 📁 Each service has its own directory
- 📁 Clear separation of concerns

### **3. Better Maintenance:**

- 🔧 Easy to update Docker configurations
- 🔧 Clear build context understanding
- 🔧 Simplified CI/CD integration

## 🚀 **Usage Commands**

### **Development:**

```bash
# Start all services
docker-compose up -d

# Build and start
docker-compose up --build -d

# Stop services
docker-compose down
```

### **Individual Builds:**

```bash
# Build Java app
docker build -f docker/Dockerfile.java -t yours-java .

# Build AI service
docker build -f docker/Dockerfile.python -t yours-ai .
```

## 📋 **File Responsibilities**

| File/Folder          | Purpose               | Used By            |
| -------------------- | --------------------- | ------------------ |
| `docker/`            | Docker configurations | DevOps, Docker     |
| `java-app/`          | Java source code      | Backend Developer  |
| `ai-service/`        | AI/ML code            | AI Developer       |
| `database/`          | Database schema       | Database Developer |
| `target/`            | Build artifacts       | Docker, Deployment |
| `docker-compose.yml` | Service orchestration | All Developers     |

## 🎊 **Migration Complete**

✅ **Database schema** migrated to French (`yours.sql`)  
✅ **Java models** updated for new schema  
✅ **AI service** optimized (no TensorFlow timeouts)  
✅ **Docker structure** reorganized and centralized  
✅ **Project structure** cleaned and documented

---

**🎯 Your project is now well-organized with a clean, maintainable structure!**

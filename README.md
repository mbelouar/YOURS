# YOURS - Intelligent Equipment Rental Management System

**YOURS** is an intelligent equipment rental management system that combines a Java JEE application with Python AI services.

## 🚀 Quick Start

### Prerequisites

- **Docker & Docker Compose** installed
- **Maven** installed (for building Java application)
- **Git** for cloning the repository

**Quick Check:**

```bash
./check-prerequisites.sh
```

1. **Setup Environment**

   ```bash
   git clone <repository-url>
   cd YOURS
   cp env.template .env
   # Edit .env with your credentials
   ```

2. **Build and Launch Services**

   ```bash
   # Option 1: Build everything (recommended for first time)
   make build

   # Option 2: Manual build
   make build-war
   docker-compose up -d
   ```

3. **Access Services**
   - **Main App:** http://localhost:8080
   - **Database UI:** http://localhost:8081 (phpMyAdmin)
   - **AI Service:** http://localhost:5001

## 📋 Services

| Service              | URL                   | Description                        |
| -------------------- | --------------------- | ---------------------------------- |
| **Java Application** | http://localhost:8080 | Main web interface                 |
| **phpMyAdmin**       | http://localhost:8081 | Database management                |
| **AI Service**       | http://localhost:5001 | Intelligent predictions (external) |
| **MySQL**            | localhost:3306        | Database (direct access)           |

**Login Credentials:**

- Username: `yours_user`
- Password: `yours_pass`

**Internal Service Communication:**

- Services communicate internally using container names and internal ports
- AI Service: `ai-service:5000` (internal), `localhost:5001` (external)
- MySQL: `mysql:3306` (internal), `localhost:3306` (external)

## 🗄️ Database

**Current Status:** Clean slate - All tables empty and ready for data

**Tables:**

- `customers`, `equipment`, `equipment_categories`
- `rentals`, `maintenance`
- `ai_models`, `ai_predictions`

**Management:**

```bash
# Connect to database
docker exec -it yours-mysql mysql -u yours_user -p yours_db

# Clear all data (keep structure)
docker exec yours-mysql mysql -u yours_user -pyours_pass yours_db -e "
SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE ai_predictions, ai_models, rentals, maintenance, equipment, equipment_categories, customers;
SET FOREIGN_KEY_CHECKS = 1;"
```

## 🤖 AI Service

**Status:** ✅ Healthy (3/4 models active)

**Available Models:**

- ✅ Linear Regression - Price optimization
- ✅ Pattern Analysis - Usage trends
- ✅ Demand Predictor - Demand forecasting
- ❌ CNN Classifier - Image classification (disabled)

**API Endpoints:**

```bash
# Health check
GET http://localhost:5001/health

# Demand prediction
POST http://localhost:5001/api/predict/demand
Body: {"equipment_id": 1, "days_ahead": 7}

# Price optimization
POST http://localhost:5001/api/optimize/pricing
Body: {"equipment_id": 1, "current_price": 50.0}

# Equipment analysis
POST http://localhost:5001/api/analyze/equipment
Body: {"equipment_id": 1}
```

## 🛠️ Management

**Docker Commands:**

```bash
# Start all services
docker-compose up -d

# Stop all services
docker-compose down

# View logs
docker-compose logs -f

# Restart specific service
docker-compose restart <service-name>

# Check status
docker-compose ps
```

**Services:** `mysql`, `tomcat`, `ai-service`, `phpmyadmin`

## 🔧 Configuration

**Environment Variables (.env):**

```bash
# Database
MYSQL_ROOT_PASSWORD=yours_root_pass
MYSQL_DATABASE=yours_db
MYSQL_USER=yours_user
MYSQL_PASSWORD=yours_pass

# Ports
TOMCAT_PORT=8080
AI_SERVICE_PORT=5001
PHPMYADMIN_PORT=8081
```

## 🚨 Troubleshooting

**Services won't start:**

```bash
docker-compose logs
docker-compose up --build -d
```

**Database connection issues:**

```bash
docker-compose ps mysql
docker exec yours-mysql mysql -u yours_user -pyours_pass yours_db -e "SELECT 1;"
```

**Complete reset:**

```bash
docker-compose down -v
docker-compose up -d
```

---

**YOURS** - Intelligent Equipment Rental Management System 🎥📹🔧

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

2. **Choose Your Mode**

   **🔥 Development Mode (RECOMMENDED for development):**
   ```bash
   make dev
   ```
   ✅ Hot-reload: Changes to JSP/CSS/JS are instantly visible!
   📝 See [DEVELOPMENT.md](DEVELOPMENT.md) for details

   **📦 Production Mode:**
   ```bash
   make build
   ```
   ⚠️ Requires rebuild after each change

3. **Access Services**
   - **Main App:** http://localhost:8080
   - **Database UI:** http://localhost:8081 (phpMyAdmin)
   - **AI Service:** http://localhost:5000

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

### Development Workflow

```bash
# Start development mode (hot-reload enabled)
make dev

# Edit files in java-app/src/main/webapp/
# Changes are instantly visible! Just refresh browser (Ctrl+F5)

# For Java code changes:
make dev-rebuild

# Stop development
make dev-stop
```

**📝 See [DEVELOPMENT.md](DEVELOPMENT.md) for complete guide**

### Docker Commands

**Development Mode:**
```bash
make dev          # Start with hot-reload
make dev-stop     # Stop development mode
make dev-logs     # View logs
make dev-restart  # Restart services
make dev-rebuild  # Rebuild after Java changes
```

**Production Mode:**
```bash
make start        # Start services
make stop         # Stop services
make build        # Build and start
make logs         # View logs
make restart      # Restart all
```

**Utilities:**
```bash
make status       # Check service status
make clean        # Remove containers
make reset        # Complete reset
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

### Modifications not showing?

**✅ SOLUTION: Use Development Mode**

```bash
make dev-stop
make dev
# Now changes are instantly visible!
```

See [DEVELOPMENT.md](DEVELOPMENT.md) for detailed explanation.

### Services won't start:

```bash
docker-compose logs
make build
```

### Database connection issues:

```bash
docker-compose ps mysql
docker exec yours-mysql mysql -u yours_user -pyours_pass yours_db -e "SELECT 1;"
```

### Cache issues:

```bash
# Clear browser cache: Ctrl + Shift + Delete
# Or force refresh: Ctrl + F5
```

### Complete reset:

```bash
make reset
# Or manual:
docker-compose down -v
make dev
```

## 📚 Documentation

- **[DEVELOPMENT.md](DEVELOPMENT.md)** - Complete development guide
- **[TEAM_ROLES.md](TEAM_ROLES.md)** - Team structure and roles

## 💡 Quick Tips

- 🔥 Use `make dev` for daily development (hot-reload)
- 📦 Use `make build` only for production testing
- 🔄 Press `Ctrl+F5` to force refresh browser
- 📝 Check logs with `make dev-logs`
- ❓ Run `make help` to see all commands

---

**YOURS** - Intelligent Equipment Rental Management System 🎥📹🔧

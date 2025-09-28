# YOURS - Intelligent Equipment Rental Management System

**YOURS** is an intelligent equipment rental management system (cameras, tools, equipment) that combines a Java JEE application with Python artificial intelligence services to optimize rental management.

## 🏗️ Architecture

The system consists of three main services orchestrated with Docker:

- **🌐 Java JEE Application** (Tomcat) - Web interface and REST API
- **🤖 Python AI Service** (Flask) - Intelligent predictions and analytics
- **🗄️ MySQL Database** - Persistent data storage

## 🚀 Quick Start

### Prerequisites

- Docker and Docker Compose installed
- Git (for cloning the project)

### Installation and Launch

1. **Clone the project**

   ```bash
   git clone <repository-url>
   cd YOURS
   ```

2. **Configure environment**

   ```bash
   cp env.template .env
   # Edit .env with your parameters (passwords, ports, etc.)
   ```

3. **Launch all services**

   ```bash
   docker-compose up -d
   ```

4. **Verify everything is working**
   ```bash
   docker-compose ps
   ```

## 📋 Services and Access

Once launched, the services are accessible at the following addresses:

| Service               | URL                   | Port | Description                 |
| --------------------- | --------------------- | ---- | --------------------------- |
| **Java Application**  | http://localhost:8080 | 8080 | Main web interface          |
| **Python AI Service** | http://localhost:5001 | 5001 | Artificial intelligence API |
| **MySQL Database**    | localhost:3306        | 3306 | Database (direct access)    |

## 🛠️ Useful Docker Commands

### Service Management

```bash
# Launch all services
docker-compose up -d

# Stop all services
docker-compose down

# View logs in real-time
docker-compose logs -f

# Restart a specific service
docker-compose restart java-app
docker-compose restart ai-service
docker-compose restart mysql-db

# Rebuild and relaunch
docker-compose up --build -d
```

### Maintenance

```bash
# View container status
docker-compose ps

# Access MySQL container
docker-compose exec mysql-db mysql -u yours_user -p yours_db

# Access service logs
docker-compose logs java-app
docker-compose logs ai-service
docker-compose logs mysql-db

# Clean volumes (⚠️ deletes data)
docker-compose down -v
```

## 🔧 Configuration

### Environment Variables

The `.env` file contains all configurations:

```bash
# Database
MYSQL_ROOT_PASSWORD=your_root_password
MYSQL_DATABASE=yours_db
MYSQL_USER=yours_user
MYSQL_PASSWORD=your_password

# Service Ports
TOMCAT_PORT=8080
AI_SERVICE_PORT=5001
MYSQL_PORT=3306

# Application Configuration
APP_NAME=YOURS
APP_VERSION=1.0.0
```

### Data Persistence

Data is stored in named Docker volumes:

- `mysql_data` - MySQL database
- `ai_models` - Trained AI models
- `ai_data` - Training data
- `tomcat_logs` - Java application logs

## 🤖 Artificial Intelligence Service

### Available Endpoints

The AI service exposes several endpoints for analysis and prediction:

#### Service Health

```bash
GET http://localhost:5001/health
```

#### Demand Prediction

```bash
POST http://localhost:5001/api/predict/demand
Content-Type: application/json

{
  "equipment_id": 1,
  "days_ahead": 7
}
```

#### Equipment Analysis

```bash
POST http://localhost:5001/api/analyze/equipment
Content-Type: application/json

{
  "equipment_id": 1
}
```

#### Image Classification

```bash
POST http://localhost:5001/api/classify/image
Content-Type: multipart/form-data

image: [image_file]
```

#### Price Optimization

```bash
POST http://localhost:5001/api/optimize/pricing
Content-Type: application/json

{
  "equipment_id": 1,
  "current_price": 50.0
}
```

### Included AI Models

- **Linear Regression** - Demand prediction and price optimization
- **CNN (Convolutional Neural Network)** - Equipment classification by image
- **Pattern Analysis** - Usage trend analysis
- **Demand Predictor** - Forecasts based on time series

## 🌐 Java Application

### MVC Structure

```
java-app/
├── src/main/java/com/yours/
│   ├── controller/     # MVC Controllers
│   ├── service/        # Business Logic
│   ├── model/          # Data Models
│   ├── dao/            # Data Access Objects
│   └── config/         # Configuration
├── src/main/webapp/
│   ├── WEB-INF/        # Web Configuration
│   └── static/         # Static Resources
└── pom.xml             # Maven Configuration
```

### REST API

The application exposes a REST API for:

- Equipment management (CRUD)
- Rental management
- Integration with AI service
- Reports and analytics

## 🗄️ Database

### MySQL Structure

The database contains the following tables:

- `equipment` - Available equipment
- `rentals` - Rental history
- `customers` - Customers
- `ai_predictions` - AI predictions
- `ai_models` - Model metadata

### Initialization

Initialization scripts are in `database/init/` and run automatically on first startup.

## 🔍 Development

### Adding New Features

1. **For Java Application**:

   - Add controllers in `java-app/src/main/java/com/yours/controller/`
   - Implement logic in `service/`
   - Update models in `model/`

2. **For AI Service**:
   - Add new models in `ai-service/models/`
   - Implement services in `ai-service/services/`
   - Expose endpoints in `ai-service/app.py`

### Testing

```bash
# AI service tests
cd ai-service
python -m pytest

# Java application tests
cd java-app
mvn test
```

### Logs

Logs are available via Docker Compose:

```bash
# Real-time logs
docker-compose logs -f

# Specific service logs
docker-compose logs -f java-app
docker-compose logs -f ai-service
```

## 🚨 Troubleshooting

### Common Issues

**Services won't start:**

```bash
# Check logs
docker-compose logs

# Verify configuration
docker-compose config

# Restart with rebuild
docker-compose down
docker-compose up --build -d
```

**Database connection issues:**

```bash
# Verify MySQL is running
docker-compose ps mysql-db

# Test connection
docker-compose exec mysql-db mysql -u yours_user -p yours_db
```

**AI service not accessible:**

```bash
# Check logs
docker-compose logs ai-service

# Test health endpoint
curl http://localhost:5001/health
```

### Complete Cleanup

```bash
# Stop and remove everything
docker-compose down -v --rmi all

# Clean unused Docker images
docker system prune -a

# Relaunch
docker-compose up --build -d
```

## 📚 API Documentation

### Java Application

- Web interface: http://localhost:8080
- REST API: http://localhost:8080/yours/api/

### AI Service

- Documentation: http://localhost:5001/health
- Endpoints: http://localhost:5001/api/

## 👥 Team Development

This project uses a **3-developer team structure** with specialized branches:

### 🌿 Branch Structure

| Branch             | Developer       | Focus Area         | Technology         |
| ------------------ | --------------- | ------------------ | ------------------ |
| `backend-database` | **Developer 1** | Backend & Database | Java JEE, MySQL    |
| `ai-analytics`     | **Developer 2** | AI & Analytics     | Python, TensorFlow |
| `frontend-ui`      | **Developer 3** | Frontend & UI/UX   | JSP, HTML/CSS/JS   |

### 📋 Team Documentation

- **`TEAM_ROLES.md`** - Detailed responsibilities and tasks for each developer
- **`BRANCH_MANAGEMENT.md`** - Git workflow and branch management guide

### 🔄 Development Workflow

```bash
# Switch to your assigned branch
git checkout backend-database  # or ai-analytics or frontend-ui

# Daily workflow
git pull origin main
git merge main  # if needed
# ... work on features ...
git add .
git commit -m "Add: feature description"
git push origin your-branch-name
```

## 🤝 Contributing

1. Fork the project
2. Create a feature branch (`git checkout -b feature/new-feature`)
3. Commit your changes (`git commit -am 'Add new feature'`)
4. Push to the branch (`git push origin feature/new-feature`)
5. Create a Pull Request

## 📄 License

This project is licensed under the MIT License. See the `LICENSE` file for more details.

## 🆘 Support

For any questions or issues:

- Create an issue on GitHub
- Check logs with `docker-compose logs`
- Verify configuration in `.env`

---

**YOURS** - Intelligent Equipment Rental Management System 🎥📹🔧

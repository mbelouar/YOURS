# YOURS - Intelligent Equipment Rental Management System
# Makefile for easy project management

.PHONY: help build start stop restart status logs clean reset test db-connect db-clear dev dev-stop dev-logs dev-restart

# Default target
help:
	@echo "YOURS - Equipment Rental Management System"
	@echo ""
	@echo "🚀 DEVELOPMENT MODE (with hot-reload):"
	@echo "  make dev          - Start in development mode (auto-reload changes)"
	@echo "  make dev-stop     - Stop development mode"
	@echo "  make dev-logs     - Show development logs"
	@echo "  make dev-restart  - Restart development services"
	@echo ""
	@echo "📦 PRODUCTION MODE:"
	@echo "  make start        - Start all services"
	@echo "  make stop         - Stop all services"
	@echo "  make restart      - Restart all services"
	@echo "  make build        - Build and start services"
	@echo "  make build-war    - Build Java WAR file only"
	@echo ""
	@echo "🔧 UTILITIES:"
	@echo "  make status       - Show service status"
	@echo "  make logs         - Show service logs"
	@echo "  make clean        - Stop and remove containers"
	@echo "  make reset        - Complete reset (removes volumes)"
	@echo "  make test         - Test AI service endpoints"
	@echo ""
	@echo "🗄️  DATABASE:"
	@echo "  make db-connect   - Connect to MySQL database"
	@echo "  make db-clear     - Clear all database data"
	@echo "  make db-status    - Show database statistics"
	@echo "  make db-backup    - Backup database"
	@echo ""

# Start all services
start:
	@echo "🚀 Starting YOURS services..."
	docker-compose up -d
	@echo "✅ Services started! Access at:"
	@echo "   🌐 Main App: http://localhost:8083"
	@echo "   📊 Database: http://localhost:8081"
	@echo "   🤖 AI Service: http://localhost:5001/health"

# Stop all services
stop:
	@echo "🛑 Stopping YOURS services..."
	docker-compose down
	@echo "✅ Services stopped!"

# Restart all services
restart: stop start

# Show service status
status:
	@echo "📊 YOURS Service Status:"
	@docker-compose ps

# Show service logs
logs:
	@echo "📋 Showing YOURS service logs..."
	docker-compose logs -f

# Build and start services
build:
	@echo "🔨 Building and starting YOURS services..."
	@echo "📦 Building Java WAR file..."
	cd java-app && mvn clean package -DskipTests
	@echo "📋 Copying WAR file to target directory..."
	cp java-app/target/yours.war target/yours.war
	@echo "🐳 Building and starting Docker services..."
	docker-compose up --build -d
	@echo "✅ Services built and started!"

# Build WAR file only
build-war:
	@echo "📦 Building Java WAR file..."
	cd java-app && mvn clean package -DskipTests
	@echo "📋 Copying WAR file to target directory..."
	cp java-app/target/yours.war target/yours.war
	@echo "✅ WAR file built successfully!"

# Clean up containers
clean:
	@echo "🧹 Cleaning up containers..."
	docker-compose down
	@echo "✅ Containers removed!"

# Complete reset (removes volumes)
reset:
	@echo "⚠️  Complete reset - this will remove all data!"
	@read -p "Are you sure? (y/N): " confirm && [ "$$confirm" = "y" ]
	docker-compose down -v
	docker-compose up -d
	@echo "✅ Complete reset done!"

# Test AI service endpoints
test:
	@echo "🧪 Testing AI service endpoints..."
	@echo "Health check:"
	@curl -s http://localhost:5001/health | python3 -m json.tool || echo "❌ AI service not responding"
	@echo ""
	@echo "Models status:"
	@curl -s http://localhost:5001/api/models/status | python3 -m json.tool || echo "❌ Models endpoint not responding"

# Connect to database
db-connect:
	@echo "🗄️  Connecting to MySQL database..."
	docker exec -it yours-mysql mysql -u yours_user -p yours_db

# Clear all database data
db-clear:
	@echo "⚠️  Clearing all database data..."
	@read -p "Are you sure? (y/N): " confirm && [ "$$confirm" = "y" ]
	docker exec yours-mysql mysql -u yours_user -pyours_pass yours_db -e "\
	SET FOREIGN_KEY_CHECKS = 0; \
	TRUNCATE TABLE ai_predictions, ai_models, rentals, maintenance, equipment, equipment_categories, customers; \
	SET FOREIGN_KEY_CHECKS = 1; \
	ALTER TABLE customers AUTO_INCREMENT = 1; \
	ALTER TABLE equipment_categories AUTO_INCREMENT = 1; \
	ALTER TABLE equipment AUTO_INCREMENT = 1; \
	ALTER TABLE rentals AUTO_INCREMENT = 1; \
	ALTER TABLE maintenance AUTO_INCREMENT = 1; \
	ALTER TABLE ai_models AUTO_INCREMENT = 1; \
	ALTER TABLE ai_predictions AUTO_INCREMENT = 1;"
	@echo "✅ Database cleared!"

# Quick setup for new users
setup:
	@echo "⚙️  Setting up YOURS project..."
	@if [ ! -f .env ]; then \
		echo "Creating .env file from template..."; \
		cp env.template .env; \
		echo "✅ .env file created. Please edit it with your credentials."; \
	else \
		echo "✅ .env file already exists."; \
	fi
	@echo "Starting services..."
	@$(MAKE) start

# ==========================================
# DEVELOPMENT MODE (Hot-Reload)
# ==========================================

# Start in development mode with hot-reload
dev:
	@echo "🚀 Starting YOURS in DEVELOPMENT MODE..."
	@echo "📦 Building initial WAR file..."
	@cd java-app && mvn clean package -DskipTests
	@mkdir -p target
	@cp java-app/target/yours.war target/yours.war
	@echo "📂 Extracting WAR for hot-reload..."
	@mkdir -p target/yours
	@cd target/yours && jar -xf ../yours.war
	@echo "🐳 Starting Docker services in development mode..."
	@docker-compose -f docker-compose.yml -f docker-compose.dev.yml up -d
	@echo ""
	@echo "✅ Development mode started!"
	@echo "📝 You can now edit files in java-app/src/main/webapp/"
	@echo "   Changes to JSP, CSS, and JS files will be reflected immediately!"
	@echo ""
	@echo "🌐 Access points:"
	@echo "   Main App: http://localhost:8083"
	@echo "   Database: http://localhost:8081"
	@echo "   AI Service: http://localhost:5000"
	@echo ""
	@echo "💡 For Java code changes, run: make dev-rebuild"

# Stop development mode
dev-stop:
	@echo "🛑 Stopping development mode..."
	@docker-compose -f docker-compose.yml -f docker-compose.dev.yml down
	@echo "✅ Development mode stopped!"

# Show development logs
dev-logs:
	@echo "📋 Showing development logs..."
	@docker-compose -f docker-compose.yml -f docker-compose.dev.yml logs -f tomcat ai-service

# Restart development services
dev-restart:
	@echo "🔄 Restarting development services..."
	@docker-compose -f docker-compose.yml -f docker-compose.dev.yml restart tomcat ai-service
	@echo "✅ Services restarted!"

# Rebuild WAR and restart (for Java code changes)
dev-rebuild:
	@echo "🔨 Rebuilding WAR file for Java changes..."
	@cd java-app && mvn clean package -DskipTests
	@cp java-app/target/yours.war target/yours.war
	@echo "📂 Extracting WAR..."
	@rm -rf target/yours
	@mkdir -p target/yours
	@cd target/yours && jar -xf ../yours.war
	@echo "🔄 Restarting Tomcat..."
	@docker-compose -f docker-compose.yml -f docker-compose.dev.yml restart tomcat
	@echo "✅ Rebuild complete!"

# Production helpers
prod-build:
	@echo "🏗️  Building for production..."
	docker-compose -f docker-compose.yml -f docker-compose.prod.yml up --build -d

# Database helpers
db-status:
	@echo "📊 Database status:"
	docker exec yours-mysql mysql -u yours_user -pyours_pass yours_db -e "\
	SELECT 'customers' as table_name, COUNT(*) as record_count FROM customers \
	UNION ALL SELECT 'equipment', COUNT(*) FROM equipment \
	UNION ALL SELECT 'equipment_categories', COUNT(*) FROM equipment_categories \
	UNION ALL SELECT 'rentals', COUNT(*) FROM rentals \
	UNION ALL SELECT 'maintenance', COUNT(*) FROM maintenance \
	UNION ALL SELECT 'ai_models', COUNT(*) FROM ai_models \
	UNION ALL SELECT 'ai_predictions', COUNT(*) FROM ai_predictions;"

# Backup database
db-backup:
	@echo "💾 Creating database backup..."
	docker exec yours-mysql mysqldump -u yours_user -pyours_pass yours_db > backup_$(shell date +%Y%m%d_%H%M%S).sql
	@echo "✅ Backup created!"

# Install dependencies (for development)
install:
	@echo "📦 Installing dependencies..."
	@echo "Java dependencies:"
	cd java-app && mvn install -q
	@echo "Python dependencies:"
	cd ai-service && pip install -r requirements.txt -q
	@echo "✅ Dependencies installed!"

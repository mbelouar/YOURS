-- YOURS Database Schema
-- Système intelligent de gestion de location de matériel

USE yours_db;

-- Table des équipements
CREATE TABLE IF NOT EXISTS equipment (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    category VARCHAR(100) NOT NULL,
    description TEXT,
    daily_rate DECIMAL(10,2) NOT NULL,
    available BOOLEAN DEFAULT TRUE,
    location VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    utilization_rate DECIMAL(5,4) DEFAULT 0.0,
    last_analysis_date TIMESTAMP NULL,
    ai_recommendations TEXT,
    INDEX idx_category (category),
    INDEX idx_available (available),
    INDEX idx_location (location)
);

-- Table des clients
CREATE TABLE IF NOT EXISTS customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    phone VARCHAR(20),
    address TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_email (email),
    INDEX idx_name (first_name, last_name)
);

-- Table des locations
CREATE TABLE IF NOT EXISTS rentals (
    id INT AUTO_INCREMENT PRIMARY KEY,
    equipment_id INT NOT NULL,
    customer_id INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_cost DECIMAL(10,2) NOT NULL,
    status ENUM('pending', 'active', 'completed', 'cancelled') DEFAULT 'pending',
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (equipment_id) REFERENCES equipment(id) ON DELETE CASCADE,
    FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE CASCADE,
    INDEX idx_equipment_id (equipment_id),
    INDEX idx_customer_id (customer_id),
    INDEX idx_dates (start_date, end_date),
    INDEX idx_status (status)
);

-- Table des prédictions IA
CREATE TABLE IF NOT EXISTS ai_predictions (
    id INT AUTO_INCREMENT PRIMARY KEY,
    equipment_id INT,
    prediction_type VARCHAR(50) NOT NULL,
    prediction_data TEXT NOT NULL,
    accuracy DECIMAL(5,4),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (equipment_id) REFERENCES equipment(id) ON DELETE SET NULL,
    INDEX idx_equipment_id (equipment_id),
    INDEX idx_prediction_type (prediction_type),
    INDEX idx_created_at (created_at)
);

-- Table des modèles IA
CREATE TABLE IF NOT EXISTS ai_models (
    id INT AUTO_INCREMENT PRIMARY KEY,
    model_name VARCHAR(100) NOT NULL,
    model_version VARCHAR(20) NOT NULL,
    model_path VARCHAR(255),
    accuracy DECIMAL(5,4),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    is_active BOOLEAN DEFAULT TRUE,
    INDEX idx_model_name (model_name),
    INDEX idx_is_active (is_active)
);

-- Table des maintenance
CREATE TABLE IF NOT EXISTS maintenance (
    id INT AUTO_INCREMENT PRIMARY KEY,
    equipment_id INT NOT NULL,
    maintenance_type VARCHAR(100) NOT NULL,
    description TEXT,
    scheduled_date DATE,
    completed_date DATE,
    cost DECIMAL(10,2),
    status ENUM('scheduled', 'in_progress', 'completed', 'cancelled') DEFAULT 'scheduled',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (equipment_id) REFERENCES equipment(id) ON DELETE CASCADE,
    INDEX idx_equipment_id (equipment_id),
    INDEX idx_status (status),
    INDEX idx_scheduled_date (scheduled_date)
);

-- Table des catégories d'équipements
CREATE TABLE IF NOT EXISTS equipment_categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) UNIQUE NOT NULL,
    description TEXT,
    daily_rate_base DECIMAL(10,2) DEFAULT 0.0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Insérer des catégories par défaut
INSERT IGNORE INTO equipment_categories (name, description, daily_rate_base) VALUES
('Caméras', 'Équipements de photographie et vidéo', 50.00),
('Éclairage', 'Équipements d''éclairage professionnel', 30.00),
('Audio', 'Équipements audio professionnels', 40.00),
('Support', 'Trépieds et supports', 20.00),
('Accessoires', 'Accessoires divers', 15.00);

-- Insérer des équipements d'exemple
INSERT IGNORE INTO equipment (name, category, description, daily_rate, location) VALUES
('Canon EOS R5', 'Caméras', 'Caméra professionnelle 45MP', 120.00, 'Stock A'),
('Sony FX6', 'Caméras', 'Caméra cinéma 4K', 150.00, 'Stock A'),
('Godox SL-60W', 'Éclairage', 'LED Softbox 60W', 35.00, 'Stock B'),
('Rode Wireless GO II', 'Audio', 'Micro sans fil professionnel', 45.00, 'Stock B'),
('Manfrotto 055', 'Support', 'Trépied carbone professionnel', 25.00, 'Stock A'),
('DJI Ronin-S', 'Support', 'Stabilisateur gimbal', 80.00, 'Stock A');

-- Insérer un client d'exemple
INSERT IGNORE INTO customers (first_name, last_name, email, phone, address) VALUES
('Jean', 'Dupont', 'jean.dupont@email.com', '+33123456789', '123 Rue de la Paix, Paris'),
('Marie', 'Martin', 'marie.martin@email.com', '+33987654321', '456 Avenue des Champs, Lyon');

-- Créer un utilisateur pour l'application (si pas déjà créé)
CREATE USER IF NOT EXISTS 'yours_user'@'%' IDENTIFIED BY 'password';
GRANT ALL PRIVILEGES ON yours_db.* TO 'yours_user'@'%';
FLUSH PRIVILEGES;

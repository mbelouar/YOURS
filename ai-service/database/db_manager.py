"""
Database Manager for AI Service
"""

import pymysql
import os
import logging
from contextlib import contextmanager

logger = logging.getLogger(__name__)

class DatabaseManager:
    """Manages database connections and operations for AI service"""
    
    def __init__(self):
        self.host = os.getenv('MYSQL_HOST', 'localhost')
        self.port = int(os.getenv('MYSQL_PORT', 3306))
        self.database = os.getenv('MYSQL_DATABASE', 'yours_db')
        self.user = os.getenv('MYSQL_USER', 'yours_user')
        self.password = os.getenv('MYSQL_PASSWORD', 'password')
        
        self.connection_config = {
            'host': self.host,
            'port': self.port,
            'database': self.database,
            'user': self.user,
            'password': self.password,
            'charset': 'utf8mb4',
            'autocommit': True
        }
    
    @contextmanager
    def get_connection(self):
        """Get database connection with context manager"""
        connection = None
        try:
            connection = pymysql.connect(**self.connection_config)
            yield connection
        except Exception as e:
            logger.error(f"Database connection error: {e}")
            if connection:
                connection.rollback()
            raise
        finally:
            if connection:
                connection.close()
    
    def test_connection(self):
        """Test database connection"""
        try:
            with self.get_connection() as conn:
                with conn.cursor() as cursor:
                    cursor.execute("SELECT 1")
                    result = cursor.fetchone()
                    logger.info("Database connection successful")
                    return True
        except Exception as e:
            logger.error(f"Database connection test failed: {e}")
            return False
    
    def get_equipment_data(self, equipment_id=None):
        """Get equipment data for AI analysis"""
        try:
            with self.get_connection() as conn:
                with conn.cursor(pymysql.cursors.DictCursor) as cursor:
                    if equipment_id:
                        query = "SELECT * FROM equipment WHERE id = %s"
                        cursor.execute(query, (equipment_id,))
                    else:
                        query = "SELECT * FROM equipment"
                        cursor.execute(query)
                    
                    return cursor.fetchall()
        except Exception as e:
            logger.error(f"Error fetching equipment data: {e}")
            return []
    
    def get_rental_history(self, equipment_id=None, days_back=30):
        """Get rental history for demand analysis"""
        try:
            with self.get_connection() as conn:
                with conn.cursor(pymysql.cursors.DictCursor) as cursor:
                    if equipment_id:
                        query = """
                        SELECT * FROM rentals 
                        WHERE equipment_id = %s 
                        AND rental_date >= DATE_SUB(NOW(), INTERVAL %s DAY)
                        ORDER BY rental_date DESC
                        """
                        cursor.execute(query, (equipment_id, days_back))
                    else:
                        query = """
                        SELECT * FROM rentals 
                        WHERE rental_date >= DATE_SUB(NOW(), INTERVAL %s DAY)
                        ORDER BY rental_date DESC
                        """
                        cursor.execute(query, (days_back,))
                    
                    return cursor.fetchall()
        except Exception as e:
            logger.error(f"Error fetching rental history: {e}")
            return []
    
    def get_usage_statistics(self, equipment_id):
        """Get usage statistics for equipment analysis"""
        try:
            with self.get_connection() as conn:
                with conn.cursor(pymysql.cursors.DictCursor) as cursor:
                    query = """
                    SELECT 
                        COUNT(*) as total_rentals,
                        AVG(DATEDIFF(end_date, start_date)) as avg_duration,
                        SUM(total_cost) as total_revenue,
                        COUNT(CASE WHEN status = 'completed' THEN 1 END) as completed_rentals,
                        COUNT(CASE WHEN status = 'cancelled' THEN 1 END) as cancelled_rentals
                    FROM rentals 
                    WHERE equipment_id = %s
                    """
                    cursor.execute(query, (equipment_id,))
                    return cursor.fetchone()
        except Exception as e:
            logger.error(f"Error fetching usage statistics: {e}")
            return {}
    
    def update_equipment_analysis(self, equipment_id, analysis_data):
        """Update equipment with analysis results"""
        try:
            with self.get_connection() as conn:
                with conn.cursor() as cursor:
                    query = """
                    UPDATE equipment 
                    SET 
                        utilization_rate = %s,
                        last_analysis_date = NOW(),
                        ai_recommendations = %s
                    WHERE id = %s
                    """
                    cursor.execute(query, (
                        analysis_data.get('utilization_rate'),
                        str(analysis_data.get('recommendations', [])),
                        equipment_id
                    ))
                    
                    return cursor.rowcount > 0
        except Exception as e:
            logger.error(f"Error updating equipment analysis: {e}")
            return False
    
    def log_ai_prediction(self, equipment_id, prediction_type, prediction_data, accuracy=None):
        """Log AI predictions for monitoring and improvement"""
        try:
            with self.get_connection() as conn:
                with conn.cursor() as cursor:
                    query = """
                    INSERT INTO ai_predictions 
                    (equipment_id, prediction_type, prediction_data, accuracy, created_at)
                    VALUES (%s, %s, %s, %s, NOW())
                    """
                    cursor.execute(query, (
                        equipment_id,
                        prediction_type,
                        str(prediction_data),
                        accuracy
                    ))
                    
                    return cursor.rowcount > 0
        except Exception as e:
            logger.error(f"Error logging AI prediction: {e}")
            return False
    
    def get_ai_performance_metrics(self, days_back=30):
        """Get AI model performance metrics"""
        try:
            with self.get_connection() as conn:
                with conn.cursor(pymysql.cursors.DictCursor) as cursor:
                    query = """
                    SELECT 
                        prediction_type,
                        COUNT(*) as total_predictions,
                        AVG(accuracy) as avg_accuracy,
                        MAX(accuracy) as max_accuracy,
                        MIN(accuracy) as min_accuracy
                    FROM ai_predictions 
                    WHERE created_at >= DATE_SUB(NOW(), INTERVAL %s DAY)
                    GROUP BY prediction_type
                    """
                    cursor.execute(query, (days_back,))
                    return cursor.fetchall()
        except Exception as e:
            logger.error(f"Error fetching AI performance metrics: {e}")
            return []
    
    def create_ai_tables(self):
        """Create AI-related tables if they don't exist"""
        try:
            with self.get_connection() as conn:
                with conn.cursor() as cursor:
                    # Create AI predictions table
                    ai_predictions_table = """
                    CREATE TABLE IF NOT EXISTS ai_predictions (
                        id INT AUTO_INCREMENT PRIMARY KEY,
                        equipment_id INT,
                        prediction_type VARCHAR(50),
                        prediction_data TEXT,
                        accuracy DECIMAL(5,4),
                        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                        INDEX idx_equipment_id (equipment_id),
                        INDEX idx_prediction_type (prediction_type),
                        INDEX idx_created_at (created_at)
                    )
                    """
                    cursor.execute(ai_predictions_table)
                    
                    # Create AI models table
                    ai_models_table = """
                    CREATE TABLE IF NOT EXISTS ai_models (
                        id INT AUTO_INCREMENT PRIMARY KEY,
                        model_name VARCHAR(100),
                        model_version VARCHAR(20),
                        model_path VARCHAR(255),
                        accuracy DECIMAL(5,4),
                        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                        updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
                        is_active BOOLEAN DEFAULT TRUE
                    )
                    """
                    cursor.execute(ai_models_table)
                    
                    logger.info("AI tables created successfully")
                    return True
        except Exception as e:
            logger.error(f"Error creating AI tables: {e}")
            return False

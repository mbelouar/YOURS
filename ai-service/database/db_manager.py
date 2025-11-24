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
        self.database = os.getenv('MYSQL_DATABASE', 'yours')
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
                        query = "SELECT * FROM materiel WHERE idMateriel = %s"
                        cursor.execute(query, (equipment_id,))
                    else:
                        query = "SELECT * FROM materiel"
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
                        SELECT * FROM reservation 
                        WHERE idMateriel = %s 
                        AND dateDebut >= DATE_SUB(NOW(), INTERVAL %s DAY)
                        ORDER BY dateDebut DESC
                        """
                        cursor.execute(query, (equipment_id, days_back))
                    else:
                        query = """
                        SELECT * FROM reservation 
                        WHERE dateDebut >= DATE_SUB(NOW(), INTERVAL %s DAY)
                        ORDER BY dateDebut DESC
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
                        AVG(DATEDIFF(dateFin, dateDebut)) as avg_duration,
                        COUNT(CASE WHEN reserve = 1 THEN 1 END) as completed_rentals,
                        COUNT(CASE WHEN reserve = 0 THEN 1 END) as cancelled_rentals
                    FROM reservation 
                    WHERE idMateriel = %s
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
                    # Store AI analysis in the ia table
                    query = """
                    INSERT INTO ia (modeleIA, seuilDetection) 
                    VALUES (%s, %s)
                    ON DUPLICATE KEY UPDATE 
                    modeleIA = VALUES(modeleIA), 
                    seuilDetection = VALUES(seuilDetection)
                    """
                    cursor.execute(query, (
                        str(analysis_data.get('model_name', 'default_model')),
                        analysis_data.get('threshold', 0.5)
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
                    # Store AI predictions in the ia table since ai_predictions doesn't exist in new schema
                    query = """
                    INSERT INTO ia (modeleIA, seuilDetection) 
                    VALUES (%s, %s)
                    """
                    cursor.execute(query, (
                        f"{prediction_type}: {str(prediction_data)}",
                        accuracy or 0.5
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
                    # Since we don't have ai_predictions table, get basic metrics from ia table
                    query = """
                    SELECT 
                        modeleIA as prediction_type,
                        COUNT(*) as total_predictions,
                        AVG(seuilDetection) as avg_accuracy,
                        MAX(seuilDetection) as max_accuracy,
                        MIN(seuilDetection) as min_accuracy
                    FROM ia 
                    GROUP BY modeleIA
                    """
                    cursor.execute(query)
                    return cursor.fetchall()
        except Exception as e:
            logger.error(f"Error fetching AI performance metrics: {e}")
            return []
    
    def create_ai_tables(self):
        """Create AI-related tables if they don't exist"""
        try:
            with self.get_connection() as conn:
                with conn.cursor() as cursor:
                    # The ia table already exists in the new schema, so we just verify it
                    cursor.execute("SELECT 1 FROM ia LIMIT 1")
                    logger.info("AI tables verified successfully")
                    return True
        except Exception as e:
            logger.error(f"Error verifying AI tables: {e}")
            return False

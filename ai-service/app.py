#!/usr/bin/env python3
"""
YOURS AI Service - Flask API for intelligent equipment rental management
"""

import os
import json
import logging
from datetime import datetime
from flask import Flask, request, jsonify
from flask_cors import CORS
from dotenv import load_dotenv

# Import AI modules
from models.regression_model import RegressionPredictor
# from models.cnn_classifier import CNNClassifier  # Temporarily disabled
from services.equipment_analyzer import EquipmentAnalyzer
from services.demand_predictor import DemandPredictor
from database.db_manager import DatabaseManager

# Load environment variables
load_dotenv()

# Initialize Flask app
app = Flask(__name__)
CORS(app)

# Configure logging
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(name)s - %(levelname)s - %(message)s'
)
logger = logging.getLogger(__name__)

# Initialize AI models and services
try:
    regression_predictor = RegressionPredictor()
    # cnn_classifier = CNNClassifier()  # Temporarily disabled
    cnn_classifier = None
    equipment_analyzer = EquipmentAnalyzer()
    demand_predictor = DemandPredictor()
    db_manager = DatabaseManager()
    logger.info("AI models and services initialized successfully")
except Exception as e:
    logger.error(f"Failed to initialize AI services: {e}")
    regression_predictor = None
    cnn_classifier = None
    equipment_analyzer = None
    demand_predictor = None
    db_manager = None

@app.route('/health', methods=['GET'])
def health_check():
    """Health check endpoint"""
    return jsonify({
        'status': 'healthy',
        'service': 'YOURS AI Service',
        'version': '1.0.0',
        'timestamp': datetime.now().isoformat(),
        'models_loaded': {
            'regression': regression_predictor is not None,
            'cnn': cnn_classifier is not None,
            'analyzer': equipment_analyzer is not None,
            'predictor': demand_predictor is not None
        }
    })

@app.route('/api/predict/demand', methods=['POST'])
def predict_demand():
    """Predict equipment demand based on historical data"""
    try:
        data = request.get_json()
        
        if not data or 'equipment_id' not in data:
            return jsonify({'error': 'Equipment ID is required'}), 400
        
        equipment_id = data['equipment_id']
        days_ahead = data.get('days_ahead', 7)
        
        if not demand_predictor:
            return jsonify({'error': 'Demand predictor not available'}), 503
        
        prediction = demand_predictor.predict_demand(equipment_id, days_ahead)
        
        return jsonify({
            'equipment_id': equipment_id,
            'prediction_days': days_ahead,
            'predicted_demand': prediction,
            'confidence': 0.85,  # Placeholder
            'timestamp': datetime.now().isoformat()
        })
        
    except Exception as e:
        logger.error(f"Error in demand prediction: {e}")
        return jsonify({'error': str(e)}), 500

@app.route('/api/analyze/equipment', methods=['POST'])
def analyze_equipment():
    """Analyze equipment usage patterns and suggest optimizations"""
    try:
        data = request.get_json()
        
        if not data or 'equipment_id' not in data:
            return jsonify({'error': 'Equipment ID is required'}), 400
        
        equipment_id = data['equipment_id']
        
        if not equipment_analyzer:
            return jsonify({'error': 'Equipment analyzer not available'}), 503
        
        analysis = equipment_analyzer.analyze_equipment(equipment_id)
        
        return jsonify({
            'equipment_id': equipment_id,
            'analysis': analysis,
            'timestamp': datetime.now().isoformat()
        })
        
    except Exception as e:
        logger.error(f"Error in equipment analysis: {e}")
        return jsonify({'error': str(e)}), 500

@app.route('/api/classify/image', methods=['POST'])
def classify_image():
    """Classify equipment from image using CNN"""
    try:
        if 'image' not in request.files:
            return jsonify({'error': 'No image file provided'}), 400
        
        image_file = request.files['image']
        
        if image_file.filename == '':
            return jsonify({'error': 'No image file selected'}), 400
        
        if not cnn_classifier:
            return jsonify({'error': 'CNN classifier not available'}), 503
        
        classification = cnn_classifier.classify_image(image_file)
        
        return jsonify({
            'classification': classification,
            'confidence': classification.get('confidence', 0.0),
            'timestamp': datetime.now().isoformat()
        })
        
    except Exception as e:
        logger.error(f"Error in image classification: {e}")
        return jsonify({'error': str(e)}), 500

@app.route('/api/optimize/pricing', methods=['POST'])
def optimize_pricing():
    """Optimize equipment pricing based on demand and market conditions"""
    try:
        data = request.get_json()
        
        if not data or 'equipment_id' not in data:
            return jsonify({'error': 'Equipment ID is required'}), 400
        
        equipment_id = data['equipment_id']
        current_price = data.get('current_price', 0)
        
        if not regression_predictor:
            return jsonify({'error': 'Regression predictor not available'}), 503
        
        optimal_price = regression_predictor.optimize_pricing(equipment_id, current_price)
        
        return jsonify({
            'equipment_id': equipment_id,
            'current_price': current_price,
            'recommended_price': optimal_price,
            'price_change_percentage': ((optimal_price - current_price) / current_price * 100) if current_price > 0 else 0,
            'timestamp': datetime.now().isoformat()
        })
        
    except Exception as e:
        logger.error(f"Error in pricing optimization: {e}")
        return jsonify({'error': str(e)}), 500

@app.route('/api/models/status', methods=['GET'])
def models_status():
    """Get status of all AI models"""
    return jsonify({
        'models': {
            'regression_predictor': {
                'loaded': regression_predictor is not None,
                'type': 'Linear Regression',
                'description': 'Predicts demand and optimizes pricing'
            },
            'cnn_classifier': {
                'loaded': cnn_classifier is not None,
                'type': 'Convolutional Neural Network',
                'description': 'Classifies equipment from images'
            },
            'equipment_analyzer': {
                'loaded': equipment_analyzer is not None,
                'type': 'Pattern Analysis',
                'description': 'Analyzes equipment usage patterns'
            },
            'demand_predictor': {
                'loaded': demand_predictor is not None,
                'type': 'Time Series Analysis',
                'description': 'Predicts future demand trends'
            }
        },
        'timestamp': datetime.now().isoformat()
    })

@app.errorhandler(404)
def not_found(error):
    return jsonify({'error': 'Endpoint not found'}), 404

@app.errorhandler(500)
def internal_error(error):
    return jsonify({'error': 'Internal server error'}), 500

if __name__ == '__main__':
    port = int(os.environ.get('PORT', 5000))
    debug = os.environ.get('FLASK_ENV') == 'development'
    
    logger.info(f"Starting YOURS AI Service on port {port}")
    app.run(host='0.0.0.0', port=port, debug=debug)

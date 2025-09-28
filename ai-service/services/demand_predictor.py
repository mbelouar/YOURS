"""
Demand Predictor Service for forecasting equipment demand
"""

import numpy as np
import pandas as pd
from datetime import datetime, timedelta
import logging

logger = logging.getLogger(__name__)

class DemandPredictor:
    """Predicts equipment demand using time series analysis"""
    
    def __init__(self):
        self.prediction_cache = {}
        self.seasonal_patterns = {
            'camera': {'spring': 1.2, 'summer': 1.5, 'autumn': 0.8, 'winter': 0.6},
            'tripod': {'spring': 1.1, 'summer': 1.3, 'autumn': 0.9, 'winter': 0.7},
            'lighting': {'spring': 1.0, 'summer': 1.1, 'autumn': 1.2, 'winter': 1.3},
            'audio': {'spring': 1.0, 'summer': 1.0, 'autumn': 1.0, 'winter': 1.0},
            'other': {'spring': 1.0, 'summer': 1.0, 'autumn': 1.0, 'winter': 1.0}
        }
    
    def predict_demand(self, equipment_id, days_ahead=7):
        """Predict demand for specific equipment"""
        try:
            # Mock prediction - in real implementation, this would use time series models
            prediction = self._generate_prediction(equipment_id, days_ahead)
            
            return {
                'equipment_id': equipment_id,
                'prediction_period_days': days_ahead,
                'predicted_demand': prediction['daily_demands'],
                'total_predicted_demand': prediction['total_demand'],
                'confidence_level': prediction['confidence'],
                'seasonal_factor': prediction['seasonal_factor'],
                'trend': prediction['trend'],
                'prediction_date': datetime.now().isoformat()
            }
            
        except Exception as e:
            logger.error(f"Error predicting demand for equipment {equipment_id}: {e}")
            return {
                'equipment_id': equipment_id,
                'error': str(e),
                'prediction_date': datetime.now().isoformat()
            }
    
    def _generate_prediction(self, equipment_id, days_ahead):
        """Generate demand prediction using mock data"""
        
        # Get equipment category (mock)
        equipment_category = self._get_equipment_category(equipment_id)
        
        # Get current season
        current_season = self._get_current_season()
        
        # Base demand
        base_demand = np.random.randint(5, 15)
        
        # Apply seasonal factor
        seasonal_factor = self.seasonal_patterns.get(equipment_category, self.seasonal_patterns['other'])
        seasonal_multiplier = seasonal_factor.get(current_season, 1.0)
        
        # Generate daily demands
        daily_demands = []
        trend_factor = 1.0
        
        for day in range(days_ahead):
            # Add some randomness and trend
            day_demand = base_demand * seasonal_multiplier * trend_factor
            day_demand += np.random.normal(0, 2)  # Add noise
            day_demand = max(0, int(day_demand))  # Ensure non-negative
            
            daily_demands.append({
                'date': (datetime.now() + timedelta(days=day)).strftime('%Y-%m-%d'),
                'predicted_demand': day_demand,
                'day_of_week': (datetime.now() + timedelta(days=day)).strftime('%A')
            })
            
            # Slight trend over time
            trend_factor += 0.01
        
        total_demand = sum(day['predicted_demand'] for day in daily_demands)
        
        # Calculate confidence based on historical data quality
        confidence = min(0.95, 0.7 + np.random.uniform(0, 0.25))
        
        return {
            'daily_demands': daily_demands,
            'total_demand': total_demand,
            'confidence': confidence,
            'seasonal_factor': seasonal_multiplier,
            'trend': 'increasing' if trend_factor > 1.0 else 'stable'
        }
    
    def _get_equipment_category(self, equipment_id):
        """Get equipment category based on ID (mock implementation)"""
        # In real implementation, this would query the database
        categories = ['camera', 'tripod', 'lighting', 'audio', 'other']
        return categories[hash(str(equipment_id)) % len(categories)]
    
    def _get_current_season(self):
        """Get current season"""
        month = datetime.now().month
        if month in [3, 4, 5]:
            return 'spring'
        elif month in [6, 7, 8]:
            return 'summer'
        elif month in [9, 10, 11]:
            return 'autumn'
        else:
            return 'winter'
    
    def predict_bulk_demand(self, equipment_ids, days_ahead=7):
        """Predict demand for multiple equipment items"""
        try:
            bulk_predictions = []
            
            for equipment_id in equipment_ids:
                prediction = self.predict_demand(equipment_id, days_ahead)
                bulk_predictions.append(prediction)
            
            return {
                'bulk_predictions': bulk_predictions,
                'total_equipment_count': len(equipment_ids),
                'prediction_period_days': days_ahead,
                'prediction_date': datetime.now().isoformat()
            }
            
        except Exception as e:
            logger.error(f"Error in bulk demand prediction: {e}")
            return {'error': str(e)}
    
    def get_demand_forecast(self, equipment_id, forecast_periods=4):
        """Get longer-term demand forecast"""
        try:
            # Generate weekly forecasts
            weekly_forecasts = []
            
            for week in range(forecast_periods):
                week_start = datetime.now() + timedelta(weeks=week)
                week_end = week_start + timedelta(days=6)
                
                # Predict for the week
                week_prediction = self.predict_demand(equipment_id, 7)
                
                weekly_forecasts.append({
                    'week_number': week + 1,
                    'week_start': week_start.strftime('%Y-%m-%d'),
                    'week_end': week_end.strftime('%Y-%m-%d'),
                    'predicted_demand': week_prediction['total_predicted_demand'],
                    'confidence': week_prediction['confidence_level']
                })
            
            return {
                'equipment_id': equipment_id,
                'forecast_periods': forecast_periods,
                'weekly_forecasts': weekly_forecasts,
                'forecast_date': datetime.now().isoformat()
            }
            
        except Exception as e:
            logger.error(f"Error generating demand forecast: {e}")
            return {'error': str(e)}
    
    def analyze_demand_patterns(self, equipment_id, historical_days=30):
        """Analyze historical demand patterns"""
        try:
            # Mock historical analysis
            patterns = {
                'equipment_id': equipment_id,
                'analysis_period_days': historical_days,
                'peak_demand_days': ['Monday', 'Tuesday', 'Wednesday'],
                'low_demand_days': ['Saturday', 'Sunday'],
                'average_daily_demand': np.random.uniform(5, 15),
                'demand_variability': np.random.uniform(0.2, 0.8),
                'seasonal_impact': 'moderate',
                'trend_direction': 'stable',
                'analysis_date': datetime.now().isoformat()
            }
            
            return patterns
            
        except Exception as e:
            logger.error(f"Error analyzing demand patterns: {e}")
            return {'error': str(e)}

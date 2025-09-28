"""
Equipment Analyzer Service for usage pattern analysis
"""

import pandas as pd
import numpy as np
from datetime import datetime, timedelta
import logging

logger = logging.getLogger(__name__)

class EquipmentAnalyzer:
    """Analyzes equipment usage patterns and provides insights"""
    
    def __init__(self):
        self.analysis_cache = {}
    
    def analyze_equipment(self, equipment_id):
        """Analyze equipment usage patterns"""
        try:
            # Mock analysis - in real implementation, this would query the database
            analysis = self._perform_analysis(equipment_id)
            
            return {
                'equipment_id': equipment_id,
                'analysis_timestamp': datetime.now().isoformat(),
                'usage_patterns': analysis['usage_patterns'],
                'performance_metrics': analysis['performance_metrics'],
                'recommendations': analysis['recommendations'],
                'maintenance_schedule': analysis['maintenance_schedule']
            }
            
        except Exception as e:
            logger.error(f"Error analyzing equipment {equipment_id}: {e}")
            return {
                'equipment_id': equipment_id,
                'error': str(e),
                'analysis_timestamp': datetime.now().isoformat()
            }
    
    def _perform_analysis(self, equipment_id):
        """Perform detailed equipment analysis"""
        
        # Mock data - replace with real database queries
        mock_usage_data = {
            'total_rentals': np.random.randint(50, 200),
            'avg_duration_days': np.random.uniform(2, 7),
            'utilization_rate': np.random.uniform(0.6, 0.95),
            'revenue_generated': np.random.uniform(1000, 5000),
            'maintenance_events': np.random.randint(1, 5),
            'customer_satisfaction': np.random.uniform(4.0, 5.0)
        }
        
        # Usage patterns analysis
        usage_patterns = {
            'peak_usage_days': ['Monday', 'Tuesday', 'Wednesday'],
            'peak_usage_hours': ['09:00-12:00', '14:00-17:00'],
            'seasonal_trends': {
                'spring': 0.85,
                'summer': 1.0,
                'autumn': 0.75,
                'winter': 0.6
            },
            'popular_rental_duration': f"{mock_usage_data['avg_duration_days']:.1f} days",
            'utilization_rate': f"{mock_usage_data['utilization_rate']:.1%}"
        }
        
        # Performance metrics
        performance_metrics = {
            'total_rentals': mock_usage_data['total_rentals'],
            'revenue_per_rental': mock_usage_data['revenue_generated'] / max(mock_usage_data['total_rentals'], 1),
            'maintenance_frequency': f"Every {365 // max(mock_usage_data['maintenance_events'], 1)} days",
            'customer_rating': f"{mock_usage_data['customer_satisfaction']:.1f}/5.0",
            'availability_rate': f"{mock_usage_data['utilization_rate']:.1%}",
            'profit_margin': np.random.uniform(0.3, 0.6)
        }
        
        # Recommendations
        recommendations = self._generate_recommendations(mock_usage_data)
        
        # Maintenance schedule
        maintenance_schedule = self._generate_maintenance_schedule(equipment_id, mock_usage_data)
        
        return {
            'usage_patterns': usage_patterns,
            'performance_metrics': performance_metrics,
            'recommendations': recommendations,
            'maintenance_schedule': maintenance_schedule
        }
    
    def _generate_recommendations(self, usage_data):
        """Generate recommendations based on usage data"""
        recommendations = []
        
        # Utilization-based recommendations
        if usage_data['utilization_rate'] > 0.9:
            recommendations.append({
                'type': 'pricing',
                'priority': 'high',
                'message': 'High utilization rate detected. Consider increasing rental price.',
                'impact': 'Revenue optimization'
            })
        elif usage_data['utilization_rate'] < 0.5:
            recommendations.append({
                'type': 'marketing',
                'priority': 'high',
                'message': 'Low utilization rate. Consider promotional campaigns.',
                'impact': 'Demand increase'
            })
        
        # Maintenance recommendations
        if usage_data['maintenance_events'] > 3:
            recommendations.append({
                'type': 'maintenance',
                'priority': 'medium',
                'message': 'Frequent maintenance required. Consider equipment replacement.',
                'impact': 'Cost reduction'
            })
        
        # Customer satisfaction recommendations
        if usage_data['customer_satisfaction'] < 4.5:
            recommendations.append({
                'type': 'service',
                'priority': 'high',
                'message': 'Customer satisfaction below target. Review service quality.',
                'impact': 'Customer retention'
            })
        
        # Default recommendation if none generated
        if not recommendations:
            recommendations.append({
                'type': 'general',
                'priority': 'low',
                'message': 'Equipment performing well. Continue current practices.',
                'impact': 'Maintenance'
            })
        
        return recommendations
    
    def _generate_maintenance_schedule(self, equipment_id, usage_data):
        """Generate maintenance schedule based on usage patterns"""
        base_maintenance_interval = 90  # days
        
        # Adjust interval based on usage
        if usage_data['utilization_rate'] > 0.8:
            maintenance_interval = base_maintenance_interval * 0.7  # More frequent maintenance
        else:
            maintenance_interval = base_maintenance_interval
        
        next_maintenance = datetime.now() + timedelta(days=int(maintenance_interval))
        
        return {
            'next_maintenance_date': next_maintenance.strftime('%Y-%m-%d'),
            'maintenance_interval_days': int(maintenance_interval),
            'maintenance_type': 'routine_inspection',
            'estimated_duration_hours': 2,
            'required_parts': ['cleaning_supplies', 'calibration_tools'],
            'priority': 'medium' if usage_data['utilization_rate'] > 0.8 else 'low'
        }
    
    def get_equipment_insights(self, equipment_id, time_period='30d'):
        """Get detailed insights for specific time period"""
        try:
            # Mock insights - replace with real data analysis
            insights = {
                'equipment_id': equipment_id,
                'time_period': time_period,
                'analysis_date': datetime.now().isoformat(),
                'insights': {
                    'usage_trend': 'increasing',
                    'revenue_trend': 'stable',
                    'customer_feedback_trend': 'positive',
                    'maintenance_cost_trend': 'decreasing'
                },
                'key_metrics': {
                    'avg_rental_duration': f"{np.random.uniform(3, 6):.1f} days",
                    'customer_repeat_rate': f"{np.random.uniform(0.3, 0.7):.1%}",
                    'equipment_condition_score': f"{np.random.uniform(8, 10):.1f}/10"
                }
            }
            
            return insights
            
        except Exception as e:
            logger.error(f"Error getting equipment insights: {e}")
            return {'error': str(e)}

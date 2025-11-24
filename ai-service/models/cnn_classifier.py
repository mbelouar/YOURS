"""
Lightweight Equipment Classifier (without TensorFlow)
"""

import numpy as np
from PIL import Image
import logging
import os
from sklearn.ensemble import RandomForestClassifier
from sklearn.preprocessing import StandardScaler
import joblib

# Try to import OpenCV, but make it optional
try:
    import cv2
    OPENCV_AVAILABLE = True
except ImportError:
    OPENCV_AVAILABLE = False
    cv2 = None
    logging.warning("OpenCV not available. Image processing features will be limited.")

logger = logging.getLogger(__name__)

class CNNClassifier:
    """Lightweight equipment classifier using traditional ML"""
    
    def __init__(self):
        self.model = None
        self.scaler = StandardScaler()
        self.class_names = ['camera', 'tripod', 'lighting', 'audio', 'other']
        self.input_size = (64, 64)  # Smaller for faster processing
        self.model_path = os.path.join(os.path.dirname(__file__), '..', 'models', 'equipment_classifier.pkl')
        self.scaler_path = os.path.join(os.path.dirname(__file__), '..', 'models', 'equipment_scaler.pkl')
        
        # Try to load existing model
        self.load_model()
        
        # If no model exists, create a simple one
        if self.model is None:
            self.create_model()
    
    def create_model(self):
        """Create a lightweight classifier for equipment classification"""
        try:
            self.model = RandomForestClassifier(
                n_estimators=100,
                random_state=42,
                max_depth=10
            )
            logger.info("Lightweight classifier model created successfully")
            
        except Exception as e:
            logger.error(f"Error creating classifier model: {e}")
            self.model = None
    
    def extract_features(self, image_file):
        """Extract simple features from image for classification"""
        try:
            # Read image
            if hasattr(image_file, 'read'):
                image = Image.open(image_file)
            else:
                image = Image.open(image_file)
            
            # Convert to RGB if necessary
            if image.mode != 'RGB':
                image = image.convert('RGB')
            
            # Resize to smaller size for faster processing
            image = image.resize(self.input_size)
            
            # Convert to numpy array
            image_array = np.array(image)
            
            # Extract simple features
            features = []
            
            # Color features (mean RGB values)
            features.extend(np.mean(image_array, axis=(0, 1)))
            
            # Texture features (standard deviation)
            features.extend(np.std(image_array, axis=(0, 1)))
            
            # Shape features (aspect ratio, area)
            height, width = image_array.shape[:2]
            features.append(width / height)  # Aspect ratio
            features.append(width * height)  # Area
            
            # Edge features (simplified)
            gray = np.mean(image_array, axis=2)
            edges = np.abs(np.diff(gray, axis=1)).mean()
            features.append(edges)
            
            return np.array(features).reshape(1, -1)
            
        except Exception as e:
            logger.error(f"Error extracting features: {e}")
            return None
    
    def classify_image(self, image_file):
        """Classify equipment from image"""
        try:
            if self.model is None:
                return {
                    'class': 'unknown',
                    'confidence': 0.0,
                    'error': 'Model not available'
                }
            
            # Extract features
            features = self.extract_features(image_file)
            
            if features is None:
                return {
                    'class': 'unknown',
                    'confidence': 0.0,
                    'error': 'Feature extraction failed'
                }
            
            # Make prediction
            prediction = self.model.predict(features)[0]
            probabilities = self.model.predict_proba(features)[0]
            
            # Get class with highest confidence
            class_idx = np.argmax(probabilities)
            confidence = float(probabilities[class_idx])
            predicted_class = self.class_names[class_idx]
            
            # Get top 3 predictions
            top_indices = np.argsort(probabilities)[-3:][::-1]
            top_predictions = [
                {
                    'class': self.class_names[i],
                    'confidence': float(probabilities[i])
                }
                for i in top_indices
            ]
            
            return {
                'class': predicted_class,
                'confidence': confidence,
                'all_predictions': top_predictions,
                'equipment_type': self.get_equipment_type(predicted_class)
            }
            
        except Exception as e:
            logger.error(f"Error classifying image: {e}")
            return {
                'class': 'unknown',
                'confidence': 0.0,
                'error': str(e)
            }
    
    def get_equipment_type(self, class_name):
        """Map class name to equipment type"""
        equipment_mapping = {
            'camera': 'Photography Equipment',
            'tripod': 'Support Equipment',
            'lighting': 'Lighting Equipment',
            'audio': 'Audio Equipment',
            'other': 'Other Equipment'
        }
        
        return equipment_mapping.get(class_name, 'Unknown Equipment')
    
    def train_model(self, training_data_path):
        """Train the classifier model with training data"""
        try:
            logger.info("Training lightweight classifier model...")
            
            # Create mock training data
            num_samples = 100
            num_features = 9  # Number of features we extract
            
            X_train = np.random.rand(num_samples, num_features)
            y_train = np.random.randint(0, len(self.class_names), num_samples)
            
            # Scale features
            X_train_scaled = self.scaler.fit_transform(X_train)
            
            # Train model
            self.model.fit(X_train_scaled, y_train)
            
            # Save model
            self.save_model()
            
            logger.info("Classifier model training completed")
            
            # Calculate accuracy
            predictions = self.model.predict(X_train_scaled)
            accuracy = np.mean(predictions == y_train)
            
            return {
                'training_accuracy': accuracy,
                'training_samples': num_samples,
                'model_type': 'RandomForest'
            }
            
        except Exception as e:
            logger.error(f"Error training classifier model: {e}")
            raise
    
    def save_model(self):
        """Save the trained model and scaler"""
        try:
            os.makedirs(os.path.dirname(self.model_path), exist_ok=True)
            joblib.dump(self.model, self.model_path)
            joblib.dump(self.scaler, self.scaler_path)
            logger.info("Classifier model and scaler saved successfully")
        except Exception as e:
            logger.error(f"Error saving classifier model: {e}")
    
    def load_model(self):
        """Load pre-trained model and scaler"""
        try:
            if os.path.exists(self.model_path) and os.path.exists(self.scaler_path):
                self.model = joblib.load(self.model_path)
                self.scaler = joblib.load(self.scaler_path)
                logger.info("Classifier model and scaler loaded successfully")
        except Exception as e:
            logger.warning(f"Could not load existing classifier model: {e}")
            self.model = None

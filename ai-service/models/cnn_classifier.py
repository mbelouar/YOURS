"""
CNN Classifier for equipment image classification
"""

import numpy as np
from PIL import Image
import tensorflow as tf
from tensorflow import keras
from tensorflow.keras import layers
import logging
import os

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
    """Convolutional Neural Network for equipment classification"""
    
    def __init__(self):
        self.model = None
        self.class_names = ['camera', 'tripod', 'lighting', 'audio', 'other']
        self.input_size = (224, 224)
        self.model_path = os.path.join(os.path.dirname(__file__), '..', 'models', 'cnn_model.h5')
        
        # Try to load existing model
        self.load_model()
        
        # If no model exists, create a simple one
        if self.model is None:
            self.create_model()
    
    def create_model(self):
        """Create a simple CNN model for equipment classification"""
        try:
            model = keras.Sequential([
                # Data augmentation
                layers.Rescaling(1./255, input_shape=(*self.input_size, 3)),
                
                # Convolutional layers
                layers.Conv2D(32, 3, activation='relu'),
                layers.MaxPooling2D(),
                
                layers.Conv2D(64, 3, activation='relu'),
                layers.MaxPooling2D(),
                
                layers.Conv2D(128, 3, activation='relu'),
                layers.MaxPooling2D(),
                
                # Dense layers
                layers.Flatten(),
                layers.Dropout(0.5),
                layers.Dense(128, activation='relu'),
                layers.Dropout(0.3),
                layers.Dense(len(self.class_names), activation='softmax')
            ])
            
            model.compile(
                optimizer='adam',
                loss='categorical_crossentropy',
                metrics=['accuracy']
            )
            
            self.model = model
            logger.info("CNN model created successfully")
            
        except Exception as e:
            logger.error(f"Error creating CNN model: {e}")
            self.model = None
    
    def preprocess_image(self, image_file):
        """Preprocess image for classification"""
        try:
            # Read image
            if hasattr(image_file, 'read'):
                image = Image.open(image_file)
            else:
                image = Image.open(image_file)
            
            # Convert to RGB if necessary
            if image.mode != 'RGB':
                image = image.convert('RGB')
            
            # Resize to model input size
            image = image.resize(self.input_size)
            
            # Convert to numpy array
            image_array = np.array(image)
            
            # Normalize and add batch dimension
            image_array = image_array.astype('float32') / 255.0
            image_array = np.expand_dims(image_array, axis=0)
            
            return image_array
            
        except Exception as e:
            logger.error(f"Error preprocessing image: {e}")
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
            
            # Preprocess image
            processed_image = self.preprocess_image(image_file)
            
            if processed_image is None:
                return {
                    'class': 'unknown',
                    'confidence': 0.0,
                    'error': 'Image preprocessing failed'
                }
            
            # Make prediction
            predictions = self.model.predict(processed_image, verbose=0)
            
            # Get class with highest confidence
            class_idx = np.argmax(predictions[0])
            confidence = float(predictions[0][class_idx])
            predicted_class = self.class_names[class_idx]
            
            # Get top 3 predictions
            top_indices = np.argsort(predictions[0])[-3:][::-1]
            top_predictions = [
                {
                    'class': self.class_names[i],
                    'confidence': float(predictions[0][i])
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
        """Train the CNN model with training data"""
        try:
            # This would typically load training images and labels
            # For now, we'll create a simple training setup
            
            logger.info("Training CNN model...")
            
            # Create mock training data
            num_samples = 100
            X_train = np.random.rand(num_samples, *self.input_size, 3).astype('float32')
            y_train = tf.keras.utils.to_categorical(
                np.random.randint(0, len(self.class_names), num_samples),
                len(self.class_names)
            )
            
            # Train model
            history = self.model.fit(
                X_train, y_train,
                epochs=5,
                batch_size=16,
                validation_split=0.2,
                verbose=1
            )
            
            # Save model
            self.save_model()
            
            logger.info("CNN model training completed")
            
            return {
                'training_accuracy': float(history.history['accuracy'][-1]),
                'validation_accuracy': float(history.history['val_accuracy'][-1]),
                'epochs': len(history.history['accuracy'])
            }
            
        except Exception as e:
            logger.error(f"Error training CNN model: {e}")
            raise
    
    def save_model(self):
        """Save the trained model"""
        try:
            os.makedirs(os.path.dirname(self.model_path), exist_ok=True)
            self.model.save(self.model_path)
            logger.info("CNN model saved successfully")
        except Exception as e:
            logger.error(f"Error saving CNN model: {e}")
    
    def load_model(self):
        """Load pre-trained model"""
        try:
            if os.path.exists(self.model_path):
                self.model = keras.models.load_model(self.model_path)
                logger.info("CNN model loaded successfully")
        except Exception as e:
            logger.warning(f"Could not load existing CNN model: {e}")
            self.model = None

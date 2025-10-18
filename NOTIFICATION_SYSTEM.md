# Notification System Documentation

## Overview

The centralized notification system provides consistent, professional notifications across all pages of the YOURS application.

## Features

- **Consistent Design**: Same styling and behavior across all pages
- **Multiple Types**: Success, Error, Warning, and Info notifications
- **Auto-positioning**: Notifications stack automatically
- **Auto-dismiss**: Configurable auto-removal timing
- **Manual Close**: Users can close notifications manually
- **Responsive**: Works on all screen sizes

## Usage

### Basic Usage

```javascript
// Success notification
notificationSystem.success("Operation completed successfully!");

// Error notification
notificationSystem.error("Something went wrong!");

// Warning notification
notificationSystem.warning("Please check your input!");

// Info notification
notificationSystem.info("Here is some information!");
```

### Advanced Usage

```javascript
// Custom duration (in milliseconds)
notificationSystem.success("Quick message!", 2000);

// Using the generic show method
notificationSystem.show("Custom message", "success", 5000);
```

### Available Methods

#### `notificationSystem.success(message, duration)`

- **Purpose**: Show success notifications
- **Parameters**:
  - `message` (string): The notification message
  - `duration` (number, optional): Auto-dismiss time in ms (default: 4000)
- **Example**: `notificationSystem.success('Équipement ajouté avec succès !');`

#### `notificationSystem.error(message, duration)`

- **Purpose**: Show error notifications
- **Parameters**: Same as success
- **Example**: `notificationSystem.error('Erreur lors de la sauvegarde !');`

#### `notificationSystem.warning(message, duration)`

- **Purpose**: Show warning notifications
- **Parameters**: Same as success
- **Example**: `notificationSystem.warning('Attention: données non sauvegardées !');`

#### `notificationSystem.info(message, duration)`

- **Purpose**: Show informational notifications
- **Parameters**: Same as success
- **Example**: `notificationSystem.info('Nouvelle fonctionnalité disponible !');`

#### `notificationSystem.show(message, type, duration)`

- **Purpose**: Generic method for all notification types
- **Parameters**:
  - `message` (string): The notification message
  - `type` (string): 'success', 'error', 'warning', or 'info'
  - `duration` (number, optional): Auto-dismiss time in ms (default: 4000)

## Implementation Examples

### Partner Pages

```javascript
// Accept reservation
function confirmAcceptReservation() {
  // ... API call logic ...
  notificationSystem.success("Réservation acceptée avec succès !");
}

// Decline reservation
function confirmDeclineReservation() {
  // ... API call logic ...
  notificationSystem.success("Réservation refusée avec succès !");
}
```

### Equipment Management

```javascript
// Add equipment
function saveEquipment() {
  if (form.checkValidity()) {
    // ... save logic ...
    notificationSystem.success("Équipement ajouté avec succès !");
  }
}

// Delete equipment
function deleteEquipment(id) {
  if (confirm("Êtes-vous sûr ?")) {
    // ... delete logic ...
    notificationSystem.success("Équipement supprimé avec succès !");
  }
}
```

### Client Pages

```javascript
// Make reservation
function makeReservation() {
  // ... reservation logic ...
  notificationSystem.success("Réservation créée avec succès !");
}

// Update profile
function updateProfile() {
  // ... update logic ...
  notificationSystem.success("Profil mis à jour avec succès !");
}
```

## Styling

### Notification Types

- **Success**: Green gradient with check icon
- **Error**: Red gradient with X icon
- **Warning**: Orange gradient with warning triangle icon
- **Info**: Blue gradient with info circle icon

### Positioning

- **Location**: Fixed position, top-right corner
- **Top Position**: 80px from top (just under navbar)
- **Stacking**: Multiple notifications stack with 90px spacing
- **Max Notifications**: 3 notifications maximum

### Animations

- **Slide In**: Smooth slide from right
- **Slide Out**: Smooth slide to right
- **Progress Bar**: Visual countdown timer
- **Hover Effects**: Subtle scale and color changes

## Integration

### Automatic Inclusion

The notification system is automatically included in all pages via the footer:

```html
<!-- Notification System -->
<script src="${pageContext.request.contextPath}/js/notification-system.js"></script>
```

### Backward Compatibility

The old `showSuccessMessage()` function is still available for backward compatibility:

```javascript
// Old way (still works)
showSuccessMessage("Success message!");

// New way (recommended)
notificationSystem.success("Success message!");
```

## Best Practices

### Message Guidelines

- **Keep messages concise**: Short, clear messages work best
- **Use appropriate tone**: Professional but friendly
- **Be specific**: Tell users exactly what happened
- **Use French**: All messages should be in French for consistency

### Timing Guidelines

- **Success**: 4 seconds (default)
- **Info**: 4 seconds (default)
- **Warning**: 6 seconds (longer for important warnings)
- **Error**: 8 seconds (longer for critical errors)

### Usage Guidelines

- **Don't overuse**: Only show notifications for important actions
- **Be consistent**: Use the same message patterns across similar actions
- **Test thoroughly**: Ensure notifications work on all devices
- **Handle errors gracefully**: Always show error notifications for failed operations

## Troubleshooting

### Common Issues

1. **Notifications not appearing**: Check if the script is loaded
2. **Styling issues**: Ensure CSS variables are defined
3. **Positioning problems**: Check for CSS conflicts
4. **Animation issues**: Verify browser supports CSS animations

### Debug Mode

```javascript
// Check if notification system is loaded
console.log(window.notificationSystem);

// Test notification
notificationSystem.info("Test notification");
```

## Future Enhancements

- **Sound notifications**: Optional audio alerts
- **Persistent notifications**: Notifications that persist across page reloads
- **Custom positioning**: Configurable notification positions
- **Rich content**: Support for HTML content in notifications
- **Action buttons**: Notifications with action buttons

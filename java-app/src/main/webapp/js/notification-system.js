/**
 * Professional Notification System
 * Centralized notification system for the entire YOURS application
 */

class NotificationSystem {
    constructor() {
        this.notifications = [];
        this.maxNotifications = 3;
        this.init();
    }

    init() {
        // Add CSS styles if not already added
        if (!document.getElementById('notification-system-styles')) {
            this.addStyles();
        }
    }

    addStyles() {
        const style = document.createElement('style');
        style.id = 'notification-system-styles';
        style.textContent = `
            @keyframes notificationSlideIn {
                from { 
                    transform: translateX(100%); 
                    opacity: 0; 
                }
                to { 
                    transform: translateX(0); 
                    opacity: 1; 
                }
            }
            
            @keyframes notificationSlideOut {
                from { 
                    transform: translateX(0); 
                    opacity: 1; 
                }
                to { 
                    transform: translateX(100%); 
                    opacity: 0; 
                }
            }
            
            @keyframes progressBar {
                from { width: 100%; }
                to { width: 0%; }
            }
            
            .notification-toast {
                position: fixed;
                top: 80px;
                right: 20px;
                z-index: 9999;
                min-width: 280px;
                max-width: 320px;
                background: white;
                border-radius: 0.75rem;
                box-shadow: 0 8px 30px rgba(0, 0, 0, 0.12), 0 3px 15px rgba(0, 0, 0, 0.08);
                border: 1px solid rgba(0, 0, 0, 0.1);
                backdrop-filter: blur(20px);
                transform: translateX(100%);
                transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
                overflow: hidden;
                animation: notificationSlideIn 0.4s ease-out forwards;
            }
            
            .notification-toast:hover {
                transform: translateX(0) scale(1.02) !important;
            }
            
            .notification-toast:hover .notification-close {
                color: var(--gray-600) !important;
                background: var(--gray-100) !important;
            }
            
            .notification-toast.slide-out {
                animation: notificationSlideOut 0.4s ease-in forwards;
            }
            
            .notification-content-wrapper {
                display: flex;
                align-items: center;
                padding: 1rem;
                position: relative;
            }
            
            .notification-border {
                position: absolute;
                left: 0;
                top: 0;
                bottom: 0;
                width: 3px;
            }
            
            .notification-icon {
                width: 40px;
                height: 40px;
                border-radius: 50%;
                display: flex;
                align-items: center;
                justify-content: center;
                margin-right: 0.75rem;
            }
            
            .notification-content {
                flex: 1;
            }
            
            .notification-title {
                margin: 0 0 0.125rem 0;
                font-weight: 600;
                color: var(--gray-800);
                font-size: 0.9rem;
            }
            
            .notification-message {
                margin: 0;
                color: var(--gray-600);
                font-size: 0.8rem;
                line-height: 1.3;
            }
            
            .notification-close {
                background: none;
                border: none;
                color: var(--gray-400);
                font-size: 1rem;
                cursor: pointer;
                padding: 0.25rem;
                border-radius: 0.25rem;
                transition: all 0.2s ease;
                margin-left: 0.5rem;
            }
            
            .notification-progress {
                height: 2px;
                width: 100%;
                animation: progressBar 4s linear forwards;
            }
        `;
        document.head.appendChild(style);
    }

    show(message, type = 'success', duration = 4000) {
        // Remove oldest notification if we exceed max
        if (this.notifications.length >= this.maxNotifications) {
            this.removeOldest();
        }

        const notification = this.createNotification(message, type, duration);
        this.notifications.push(notification);
        this.positionNotifications();
        
        return notification;
    }

    createNotification(message, type, duration) {
        const notificationDiv = document.createElement('div');
        notificationDiv.className = 'notification-toast';
        
        // Determine colors based on type
        const colors = this.getColors(type);
        const iconClass = this.getIconClass(type);
        const titleText = this.getTitleText(type);
        
        notificationDiv.innerHTML = 
            '<div class="notification-content-wrapper">' +
                '<div class="notification-border" style="background: ' + colors.borderLeft + ';"></div>' +
                '<div class="notification-icon" style="background: ' + colors.iconBg + '; box-shadow: 0 3px 12px ' + colors.iconColor + '40;">' +
                    '<i class="fas ' + iconClass + '" style="color: white; font-size: 1rem;"></i>' +
                '</div>' +
                '<div class="notification-content">' +
                    '<h6 class="notification-title">' + titleText + '</h6>' +
                    '<p class="notification-message">' + message + '</p>' +
                '</div>' +
                '<button type="button" class="notification-close" onclick="notificationSystem.close(this)">' +
                    '<i class="fas fa-times"></i>' +
                '</button>' +
            '</div>' +
            '<div class="notification-progress" style="background: ' + colors.iconColor + ';"></div>';
        
        document.body.appendChild(notificationDiv);
        
        // Auto-remove after duration
        setTimeout(() => {
            this.close(notificationDiv.querySelector('.notification-close'));
        }, duration);
        
        return notificationDiv;
    }

    getColors(type) {
        const colorMap = {
            success: {
                iconBg: 'linear-gradient(135deg, #10b981, #059669)',
                iconColor: '#10b981',
                borderLeft: '#10b981'
            },
            error: {
                iconBg: 'linear-gradient(135deg, #ef4444, #dc2626)',
                iconColor: '#ef4444',
                borderLeft: '#ef4444'
            },
            warning: {
                iconBg: 'linear-gradient(135deg, #f59e0b, #d97706)',
                iconColor: '#f59e0b',
                borderLeft: '#f59e0b'
            },
            info: {
                iconBg: 'linear-gradient(135deg, #3b82f6, #1d4ed8)',
                iconColor: '#3b82f6',
                borderLeft: '#3b82f6'
            }
        };
        return colorMap[type] || colorMap.success;
    }

    getIconClass(type) {
        const iconMap = {
            success: 'fa-check',
            error: 'fa-times',
            warning: 'fa-exclamation-triangle',
            info: 'fa-info-circle'
        };
        return iconMap[type] || iconMap.success;
    }

    getTitleText(type) {
        const titleMap = {
            success: 'Succès',
            error: 'Erreur',
            warning: 'Attention',
            info: 'Information'
        };
        return titleMap[type] || titleMap.success;
    }

    close(closeButton) {
        const notification = closeButton.closest('.notification-toast');
        if (notification) {
            notification.classList.add('slide-out');
            setTimeout(() => {
                if (notification.parentNode) {
                    notification.parentNode.removeChild(notification);
                    this.removeFromArray(notification);
                    this.positionNotifications();
                }
            }, 400);
        }
    }

    removeFromArray(notification) {
        const index = this.notifications.indexOf(notification);
        if (index > -1) {
            this.notifications.splice(index, 1);
        }
    }

    removeOldest() {
        if (this.notifications.length > 0) {
            const oldest = this.notifications[0];
            this.close(oldest.querySelector('.notification-close'));
        }
    }

    positionNotifications() {
        this.notifications.forEach((notification, index) => {
            const topPosition = 80 + (index * 90); // Stack notifications with 90px spacing
            notification.style.top = topPosition + 'px';
        });
    }

    // Convenience methods
    success(message, duration) {
        return this.show(message, 'success', duration);
    }

    error(message, duration) {
        return this.show(message, 'error', duration);
    }

    warning(message, duration) {
        return this.show(message, 'warning', duration);
    }

    info(message, duration) {
        return this.show(message, 'info', duration);
    }
}

// Global instance
window.notificationSystem = new NotificationSystem();

// Legacy function for backward compatibility
window.showSuccessMessage = function(message, type = 'success') {
    return notificationSystem.show(message, type);
};

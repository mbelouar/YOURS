<%@ page language="java" pageEncoding="UTF-8"%>

<%
    // Set page title
    request.setAttribute("pageTitle", "Notifications - YOURS");
%>

<%@ include file="../../layouts/navbar.jsp" %>
<%@ include file="../../layouts/header.jsp" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${pageTitle}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/components.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css">
    <style>
        /* Notifications Page Specific Styles */
        .notification-card {
            border: none;
            border-radius: 1rem;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.08);
            transition: all 0.3s ease;
            margin-bottom: 1rem;
            background: #ffffff;
        }

        .notification-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.12);
        }

        .notification-card.unread {
            border-left: 4px solid #3b82f6;
            background: linear-gradient(135deg, #f8fafc, #ffffff);
        }

        .notification-card.read {
            opacity: 0.7;
        }

        .notification-icon {
            width: 50px;
            height: 50px;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
            color: white;
        }

        .notification-icon.reservation {
            background: linear-gradient(135deg, #3b82f6, #1d4ed8);
        }

        .notification-icon.payment {
            background: linear-gradient(135deg, #10b981, #059669);
        }

        .notification-icon.reminder {
            background: linear-gradient(135deg, #f59e0b, #d97706);
        }

        .notification-icon.system {
            background: linear-gradient(135deg, #8b5cf6, #7c3aed);
        }

        .notification-icon.warning {
            background: linear-gradient(135deg, #ef4444, #dc2626);
        }

        .notification-content h6 {
            color: #1f2937;
            font-weight: 600;
            margin-bottom: 0.5rem;
        }

        .notification-content p {
            color: #6b7280;
            margin-bottom: 0.25rem;
            line-height: 1.5;
        }

        .notification-meta {
            color: #9ca3af;
            font-size: 0.875rem;
        }

        .notification-actions {
            display: flex;
            gap: 0.5rem;
        }

        .notification-actions .btn {
            padding: 0.375rem 0.75rem;
            font-size: 0.875rem;
            border-radius: 0.5rem;
        }

        .filter-tabs {
            background: #ffffff;
            border-radius: 1rem;
            padding: 0.5rem;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
            margin-bottom: 2rem;
        }

        .filter-tab {
            border: none;
            background: transparent;
            color: #6b7280;
            padding: 0.75rem 1.5rem;
            border-radius: 0.75rem;
            transition: all 0.3s ease;
            font-weight: 500;
        }

        .filter-tab.active {
            background: linear-gradient(135deg, #3b82f6, #1d4ed8);
            color: white;
            box-shadow: 0 4px 12px rgba(59, 130, 246, 0.3);
        }

        .filter-tab:hover:not(.active) {
            background: #f3f4f6;
            color: #374151;
        }

        .notification-badge {
            background: linear-gradient(135deg, #ef4444, #dc2626);
            color: white;
            font-size: 0.75rem;
            padding: 0.25rem 0.5rem;
            border-radius: 1rem;
            font-weight: 600;
        }

        .empty-state {
            text-align: center;
            padding: 3rem 1rem;
            color: #6b7280;
        }

        .empty-state i {
            font-size: 4rem;
            color: #d1d5db;
            margin-bottom: 1rem;
        }

        .page-header {
            background: linear-gradient(135deg, #f8fafc, #ffffff);
            border-radius: 1rem;
            padding: 2rem;
            margin-bottom: 2rem;
            border: 1px solid #e5e7eb;
        }

        .page-header h1 {
            color: #1f2937;
            font-weight: 700;
            margin-bottom: 0.5rem;
        }

        .page-header p {
            color: #6b7280;
            margin-bottom: 0;
        }

        .mark-all-btn {
            background: linear-gradient(135deg, #3b82f6, #1d4ed8);
            border: none;
            color: white;
            padding: 0.75rem 1.5rem;
            border-radius: 0.75rem;
            font-weight: 500;
            transition: all 0.3s ease;
        }

        .mark-all-btn:hover {
            background: linear-gradient(135deg, #1d4ed8, #1e40af);
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(59, 130, 246, 0.3);
        }

        .notification-card .btn-outline-primary {
            border-color: #3b82f6;
            color: #3b82f6;
        }

        .notification-card .btn-outline-primary:hover {
            background: #3b82f6;
            border-color: #3b82f6;
            color: white;
        }

        .notification-card .btn-outline-danger {
            border-color: #ef4444;
            color: #ef4444;
        }

        .notification-card .btn-outline-danger:hover {
            background: #ef4444;
            border-color: #ef4444;
            color: white;
        }
    </style>
</head>
<body>
    <div class="container-fluid py-4">
        <div class="row">
            <div class="col-12">
                <!-- Page Header -->
                <div class="page-header">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <h1><i class="bi bi-bell me-3 text-primary"></i>Mes Notifications</h1>
                            <p>Restez informé de toutes vos activités et rappels importants</p>
                        </div>
                        <div class="d-flex gap-2">
                            <button class="mark-all-btn" id="markAllReadBtn">
                                <i class="bi bi-check-all me-2"></i>Tout marquer comme lu
                            </button>
                            <button class="btn btn-outline-primary" id="refreshBtn">
                                <i class="bi bi-arrow-clockwise me-2"></i>Actualiser
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Filter Tabs -->
                <div class="filter-tabs">
                    <div class="d-flex flex-wrap gap-2">
                        <button class="filter-tab active" data-filter="all">
                            <i class="bi bi-list-ul me-2"></i>Toutes
                            <span class="notification-badge ms-2" id="allCount">12</span>
                        </button>
                        <button class="filter-tab" data-filter="unread">
                            <i class="bi bi-circle-fill me-2"></i>Non lues
                            <span class="notification-badge ms-2" id="unreadCount">5</span>
                        </button>
                        <button class="filter-tab" data-filter="reservations">
                            <i class="bi bi-calendar-check me-2"></i>Réservations
                            <span class="notification-badge ms-2" id="reservationsCount">6</span>
                        </button>
                        <button class="filter-tab" data-filter="payments">
                            <i class="bi bi-credit-card me-2"></i>Paiements
                            <span class="notification-badge ms-2" id="paymentsCount">3</span>
                        </button>
                        <button class="filter-tab" data-filter="system">
                            <i class="bi bi-gear me-2"></i>Système
                            <span class="notification-badge ms-2" id="systemCount">3</span>
                        </button>
                    </div>
                </div>

                <!-- Notifications List -->
                <div id="notificationsList">
                    <!-- Notifications will be loaded here -->
                </div>

                <!-- Empty State -->
                <div id="emptyState" class="empty-state" style="display: none;">
                    <i class="bi bi-bell-slash"></i>
                    <h4>Aucune notification</h4>
                    <p>Vous n'avez aucune notification pour le moment.</p>
                </div>

                <!-- Load More Button -->
                <div class="text-center mt-4" id="loadMoreContainer" style="display: none;">
                    <button class="btn btn-outline-primary btn-lg" id="loadMoreBtn">
                        <i class="bi bi-arrow-down-circle me-2"></i>Charger plus de notifications
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Simple mock data for notifications
        const mockNotifications = [
            {
                id: 1,
                type: 'reservation',
                title: 'Rappel de réservation',
                message: 'Votre réservation #RES001 arrive à échéance dans 2 jours.',
                time: 'Il y a 2 heures',
                read: false
            },
            {
                id: 2,
                type: 'payment',
                title: 'Paiement confirmé',
                message: 'Votre paiement de 150€ a été confirmé avec succès.',
                time: 'Il y a 4 heures',
                read: false
            },
            {
                id: 3,
                type: 'reminder',
                title: 'Fin de réservation',
                message: 'Votre réservation #RES003 se termine aujourd\'hui à 18h00.',
                time: 'Il y a 6 heures',
                read: true
            },
            {
                id: 4,
                type: 'system',
                title: 'Mise à jour disponible',
                message: 'Une nouvelle version de l\'application est disponible.',
                time: 'Il y a 1 jour',
                read: true
            }
        ];

        let currentFilter = 'all';
        let currentNotifications = mockNotifications.slice();

        // Initialize page
        document.addEventListener('DOMContentLoaded', function() {
            try {
                loadNotifications();
                setupEventListeners();
                updateCounts();
            } catch (error) {
                console.error('Error initializing notifications page:', error);
            }
        });

        function loadNotifications() {
            try {
                const container = document.getElementById('notificationsList');
                const emptyState = document.getElementById('emptyState');
                
                if (!container) return;
                
                let filteredNotifications = getFilteredNotifications();
                
                if (filteredNotifications.length === 0) {
                    container.innerHTML = '';
                    if (emptyState) emptyState.style.display = 'block';
                    return;
                }
                
                if (emptyState) emptyState.style.display = 'none';
                
            container.innerHTML = filteredNotifications.map(notification => 
                '<div class="notification-card ' + (notification.read ? 'read' : 'unread') + '" data-id="' + notification.id + '">' +
                    '<div class="card-body p-4">' +
                        '<div class="d-flex align-items-start">' +
                            '<div class="notification-icon ' + notification.type + ' me-3">' +
                                getNotificationIcon(notification.type) +
                            '</div>' +
                            '<div class="notification-content flex-grow-1">' +
                                '<h6>' + notification.title + '</h6>' +
                                '<p>' + notification.message + '</p>' +
                                '<div class="d-flex justify-content-between align-items-center">' +
                                    '<span class="notification-meta">' +
                                        '<i class="bi bi-clock me-1"></i>' + notification.time +
                                    '</span>' +
                                    '<div class="notification-actions">' +
                                        (!notification.read ? 
                                            '<button class="btn btn-outline-primary btn-sm mark-read-btn" data-id="' + notification.id + '">' +
                                                '<i class="bi bi-check"></i>Marquer comme lu' +
                                            '</button>' : '') +
                                        '<button class="btn btn-outline-danger btn-sm delete-btn" data-id="' + notification.id + '">' +
                                            '<i class="bi bi-trash"></i>' +
                                        '</button>' +
                                    '</div>' +
                                '</div>' +
                            '</div>' +
                        '</div>' +
                    '</div>' +
                '</div>'
            ).join('');
                
                setupNotificationEventListeners();
            } catch (error) {
                console.error('Error loading notifications:', error);
            }
        }

        function getNotificationIcon(type) {
            const icons = {
                'reservation': '<i class="bi bi-calendar-check"></i>',
                'payment': '<i class="bi bi-credit-card"></i>',
                'reminder': '<i class="bi bi-alarm"></i>',
                'system': '<i class="bi bi-gear"></i>',
                'warning': '<i class="bi bi-exclamation-triangle"></i>'
            };
            return icons[type] || '<i class="bi bi-bell"></i>';
        }

        function getFilteredNotifications() {
            if (currentFilter === 'all') {
                return currentNotifications;
            } else if (currentFilter === 'unread') {
                return currentNotifications.filter(n => !n.read);
            } else {
                return currentNotifications.filter(n => n.type === currentFilter);
            }
        }

        function updateCounts() {
            try {
                const counts = {
                    all: currentNotifications.length,
                    unread: currentNotifications.filter(n => !n.read).length,
                    reservations: currentNotifications.filter(n => n.type === 'reservation').length,
                    payments: currentNotifications.filter(n => n.type === 'payment').length,
                    system: currentNotifications.filter(n => n.type === 'system').length
                };

                Object.keys(counts).forEach(filter => {
                    const element = document.getElementById(`${filter}Count`);
                    if (element) {
                        element.textContent = counts[filter];
                    }
                });
            } catch (error) {
                console.error('Error updating counts:', error);
            }
        }

        function setupEventListeners() {
            try {
                // Filter tabs
                document.querySelectorAll('.filter-tab').forEach(tab => {
                    tab.addEventListener('click', function() {
                        document.querySelectorAll('.filter-tab').forEach(t => t.classList.remove('active'));
                        this.classList.add('active');
                        currentFilter = this.dataset.filter;
                        loadNotifications();
                    });
                });

                // Mark all as read button
                const markAllBtn = document.getElementById('markAllReadBtn');
                if (markAllBtn) {
                    markAllBtn.addEventListener('click', function() {
                        currentNotifications.forEach(notification => {
                            notification.read = true;
                        });
                        loadNotifications();
                        updateCounts();
                        alert('Toutes les notifications ont été marquées comme lues');
                    });
                }

                // Refresh button
                const refreshBtn = document.getElementById('refreshBtn');
                if (refreshBtn) {
                    refreshBtn.addEventListener('click', function() {
                        this.innerHTML = '<i class="bi bi-arrow-clockwise me-2"></i>Actualisation...';
                        this.disabled = true;
                        
                        setTimeout(() => {
                            loadNotifications();
                            updateCounts();
                            this.innerHTML = '<i class="bi bi-arrow-clockwise me-2"></i>Actualiser';
                            this.disabled = false;
                            alert('Notifications actualisées');
                        }, 1000);
                    });
                }
            } catch (error) {
                console.error('Error setting up event listeners:', error);
            }
        }

        function setupNotificationEventListeners() {
            try {
                // Mark as read buttons
                document.querySelectorAll('.mark-read-btn').forEach(btn => {
                    btn.addEventListener('click', function() {
                        const notificationId = parseInt(this.dataset.id);
                        const notification = currentNotifications.find(n => n.id === notificationId);
                        if (notification) {
                            notification.read = true;
                            loadNotifications();
                            updateCounts();
                            alert('Notification marquée comme lue');
                        }
                    });
                });

                // Delete buttons
                document.querySelectorAll('.delete-btn').forEach(btn => {
                    btn.addEventListener('click', function() {
                        const notificationId = parseInt(this.dataset.id);
                        if (confirm('Êtes-vous sûr de vouloir supprimer cette notification ?')) {
                            currentNotifications = currentNotifications.filter(n => n.id !== notificationId);
                            loadNotifications();
                            updateCounts();
                            alert('Notification supprimée');
                        }
                    });
                });
            } catch (error) {
                console.error('Error setting up notification event listeners:', error);
            }
        }

        // Simple error handling
        function showError(message) {
            console.error(message);
            alert(message);
        }
    </script>
</body>
</html>

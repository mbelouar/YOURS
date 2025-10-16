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
</head>
<body>
    <div class="container-fluid py-4">
        <div class="row">
            <div class="col-12">
                <!-- Page Header -->
                <div class="card border-0 shadow-lg mb-4">
                    <div class="card-header bg-primary text-white">
                        <h1 class="mb-0"><i class="bi bi-bell me-3"></i>Mes Notifications</h1>
                    </div>
                    <div class="card-body p-4">
                        <p class="text-muted mb-0">Restez informé de toutes vos activités et rappels importants</p>
                    </div>
                </div>

                <!-- Filter Tabs -->
                <div class="card border-0 shadow-lg mb-4">
                    <div class="card-body p-3">
                        <div class="d-flex flex-wrap gap-2">
                            <button class="btn btn-primary" onclick="filterNotifications('all')">
                                <i class="bi bi-list-ul me-2"></i>Toutes
                                <span class="badge bg-light text-dark ms-2" id="allCount">4</span>
                            </button>
                            <button class="btn btn-outline-primary" onclick="filterNotifications('unread')">
                                <i class="bi bi-circle-fill me-2"></i>Non lues
                                <span class="badge bg-danger text-white ms-2" id="unreadCount">2</span>
                            </button>
                            <button class="btn btn-outline-primary" onclick="filterNotifications('reservations')">
                                <i class="bi bi-calendar-check me-2"></i>Réservations
                                <span class="badge bg-info text-white ms-2" id="reservationsCount">2</span>
                            </button>
                            <button class="btn btn-outline-primary" onclick="filterNotifications('payments')">
                                <i class="bi bi-credit-card me-2"></i>Paiements
                                <span class="badge bg-success text-white ms-2" id="paymentsCount">1</span>
                            </button>
                            <button class="btn btn-outline-primary" onclick="filterNotifications('system')">
                                <i class="bi bi-gear me-2"></i>Système
                                <span class="badge bg-secondary text-white ms-2" id="systemCount">1</span>
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Notifications List -->
                <div id="notificationsList">
                    <!-- Notifications will be loaded here -->
                </div>

                <!-- Empty State -->
                <div id="emptyState" class="text-center py-5" style="display: none;">
                    <i class="bi bi-bell-slash text-muted" style="font-size: 4rem;"></i>
                    <h4 class="text-muted mt-3">Aucune notification</h4>
                    <p class="text-muted">Vous n'avez aucune notification pour le moment.</p>
                </div>

                <!-- Action Buttons -->
                <div class="text-center mt-4">
                    <button class="btn btn-success me-2" onclick="markAllRead()">
                        <i class="bi bi-check-all me-2"></i>Tout marquer comme lu
                    </button>
                    <button class="btn btn-outline-primary" onclick="refreshNotifications()">
                        <i class="bi bi-arrow-clockwise me-2"></i>Actualiser
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Simple notifications data
        const notifications = [
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
                type: 'reservation',
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

        // Initialize page
        document.addEventListener('DOMContentLoaded', function() {
            loadNotifications();
        });

        function loadNotifications() {
            const container = document.getElementById('notificationsList');
            const emptyState = document.getElementById('emptyState');
            
            let filteredNotifications = getFilteredNotifications();
            
            if (filteredNotifications.length === 0) {
                container.innerHTML = '';
                emptyState.style.display = 'block';
                return;
            }
            
            emptyState.style.display = 'none';
            
            container.innerHTML = filteredNotifications.map(notification => `
                <div class="card mb-3 ${notification.read ? '' : 'border-primary'}">
                    <div class="card-body">
                        <div class="d-flex align-items-start">
                            <div class="me-3">
                                ${getNotificationIcon(notification.type)}
                            </div>
                            <div class="flex-grow-1">
                                <h6 class="mb-1">${notification.title}</h6>
                                <p class="mb-2 text-muted">${notification.message}</p>
                                <div class="d-flex justify-content-between align-items-center">
                                    <small class="text-muted">
                                        <i class="bi bi-clock me-1"></i>${notification.time}
                                    </small>
                                    <div>
                                        ${!notification.read ? `
                                            <button class="btn btn-sm btn-outline-primary me-2" onclick="markAsRead(${notification.id})">
                                                <i class="bi bi-check"></i> Marquer comme lu
                                            </button>
                                        ` : ''}
                                        <button class="btn btn-sm btn-outline-danger" onclick="deleteNotification(${notification.id})">
                                            <i class="bi bi-trash"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            `).join('');
        }

        function getNotificationIcon(type) {
            const icons = {
                'reservation': '<i class="bi bi-calendar-check text-primary" style="font-size: 1.5rem;"></i>',
                'payment': '<i class="bi bi-credit-card text-success" style="font-size: 1.5rem;"></i>',
                'system': '<i class="bi bi-gear text-secondary" style="font-size: 1.5rem;"></i>'
            };
            return icons[type] || '<i class="bi bi-bell text-primary" style="font-size: 1.5rem;"></i>';
        }

        function getFilteredNotifications() {
            if (currentFilter === 'all') {
                return notifications;
            } else if (currentFilter === 'unread') {
                return notifications.filter(n => !n.read);
            } else {
                return notifications.filter(n => n.type === currentFilter);
            }
        }

        function filterNotifications(filter) {
            // Update button states
            document.querySelectorAll('.btn').forEach(btn => {
                if (btn.textContent.includes('Toutes') || btn.textContent.includes('Non lues') || 
                    btn.textContent.includes('Réservations') || btn.textContent.includes('Paiements') || 
                    btn.textContent.includes('Système')) {
                    btn.className = btn.className.replace('btn-primary', 'btn-outline-primary');
                }
            });
            
            // Set active button
            event.target.closest('.btn').className = event.target.closest('.btn').className.replace('btn-outline-primary', 'btn-primary');
            
            currentFilter = filter;
            loadNotifications();
        }

        function markAsRead(id) {
            const notification = notifications.find(n => n.id === id);
            if (notification) {
                notification.read = true;
                loadNotifications();
                alert('Notification marquée comme lue');
            }
        }

        function markAllRead() {
            notifications.forEach(notification => {
                notification.read = true;
            });
            loadNotifications();
            alert('Toutes les notifications ont été marquées comme lues');
        }

        function deleteNotification(id) {
            if (confirm('Êtes-vous sûr de vouloir supprimer cette notification ?')) {
                const index = notifications.findIndex(n => n.id === id);
                if (index > -1) {
                    notifications.splice(index, 1);
                    loadNotifications();
                    alert('Notification supprimée');
                }
            }
        }

        function refreshNotifications() {
            const btn = event.target;
            const originalText = btn.innerHTML;
            btn.innerHTML = '<i class="bi bi-arrow-clockwise me-2"></i>Actualisation...';
            btn.disabled = true;
            
            setTimeout(() => {
                loadNotifications();
                btn.innerHTML = originalText;
                btn.disabled = false;
                alert('Notifications actualisées');
            }, 1000);
        }
    </script>
</body>
</html>

<%@ page language="java" pageEncoding="UTF-8"%>

<%
    request.setAttribute("pageTitle", "Notifications - YOURS");
%>

<%@ include file="../../layouts/navbar.jsp" %>
<%@ include file="../../layouts/header.jsp" %>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Notifications - YOURS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/main.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/components.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/responsive.css">
    <style>
        .page-header-card {
            background: #3b82f6 !important;
            border: none !important;
            box-shadow: 0 4px 12px rgba(59, 130, 246, 0.3) !important;
            border-radius: 0.75rem !important;
        }
        
        .page-header-card h1 {
            color: white !important;
            font-size: 2rem !important;
            font-weight: bold !important;
            text-shadow: 0 1px 3px rgba(0, 0, 0, 0.3) !important;
        }
        
        .page-header-card p {
            color: white !important;
            font-size: 1.1rem !important;
            opacity: 0.9 !important;
        }
        
        .container-fluid {
            background-color: #f8f9fa !important;
        }
        
        .notifications-content {
            margin-top: 120px !important;
            padding-top: 1rem !important;
        }
    </style>
</head>
<body>
    <div class="container-fluid py-4">
        <div class="row">
            <div class="col-12 notifications-content">
                <!-- Page Header -->
                <div class="card page-header-card mb-4">
                    <div class="card-body p-4">
                        <h1 class="mb-2">
                            <i class="bi bi-bell me-2"></i>Mes Notifications
                        </h1>
                        <p class="mb-0">
                            Restez informé de toutes vos activités et rappels importants
                        </p>
                    </div>
                </div>

                <!-- Filter Buttons -->
                <div class="card mb-4">
                    <div class="card-body">
                        <div class="d-flex flex-wrap gap-2">
                            <button class="btn btn-primary" onclick="filterNotifications('all')">
                                <i class="bi bi-list-ul me-2"></i>Toutes
                                <span class="badge bg-light text-dark ms-2">4</span>
                            </button>
                            <button class="btn btn-outline-primary" onclick="filterNotifications('unread')">
                                <i class="bi bi-circle-fill me-2"></i>Non lues
                                <span class="badge bg-danger text-white ms-2">2</span>
                            </button>
                            <button class="btn btn-outline-primary" onclick="filterNotifications('reservations')">
                                <i class="bi bi-calendar-check me-2"></i>Réservations
                                <span class="badge bg-info text-white ms-2">2</span>
                            </button>
                            <button class="btn btn-outline-primary" onclick="filterNotifications('payments')">
                                <i class="bi bi-credit-card me-2"></i>Paiements
                                <span class="badge bg-success text-white ms-2">1</span>
                            </button>
                            <button class="btn btn-outline-primary" onclick="filterNotifications('system')">
                                <i class="bi bi-gear me-2"></i>Système
                                <span class="badge bg-secondary text-white ms-2">1</span>
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Notifications List -->
                <div id="notificationsContainer">
                    <!-- Notification 1 -->
                    <div class="card mb-3 border-primary notification-item" data-type="reservation" data-read="false" data-id="1">
                        <div class="card-body">
                            <div class="d-flex align-items-start">
                                <div class="me-3">
                                    <i class="bi bi-calendar-check text-primary" style="font-size: 1.5rem;"></i>
                                </div>
                                <div class="flex-grow-1">
                                    <h6 class="mb-1">Rappel de réservation</h6>
                                    <p class="mb-2 text-muted">Votre réservation #RES001 arrive à échéance dans 2 jours.</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <small class="text-muted">
                                            <i class="bi bi-clock me-1"></i>Il y a 2 heures
                                        </small>
                                        <div>
                                            <button class="btn btn-sm btn-outline-primary me-2" onclick="markAsRead(1)">
                                                <i class="bi bi-check"></i> Marquer comme lu
                                            </button>
                                            <button class="btn btn-sm btn-outline-danger" onclick="deleteNotification(1)">
                                                <i class="bi bi-trash"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Notification 2 -->
                    <div class="card mb-3 border-primary notification-item" data-type="payment" data-read="false" data-id="2">
                        <div class="card-body">
                            <div class="d-flex align-items-start">
                                <div class="me-3">
                                    <i class="bi bi-credit-card text-success" style="font-size: 1.5rem;"></i>
                                </div>
                                <div class="flex-grow-1">
                                    <h6 class="mb-1">Paiement confirmé</h6>
                                    <p class="mb-2 text-muted">Votre paiement de 150€ a été confirmé avec succès.</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <small class="text-muted">
                                            <i class="bi bi-clock me-1"></i>Il y a 4 heures
                                        </small>
                                        <div>
                                            <button class="btn btn-sm btn-outline-primary me-2" onclick="markAsRead(2)">
                                                <i class="bi bi-check"></i> Marquer comme lu
                                            </button>
                                            <button class="btn btn-sm btn-outline-danger" onclick="deleteNotification(2)">
                                                <i class="bi bi-trash"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Notification 3 -->
                    <div class="card mb-3 notification-item" data-type="reservation" data-read="true" data-id="3">
                        <div class="card-body">
                            <div class="d-flex align-items-start">
                                <div class="me-3">
                                    <i class="bi bi-calendar-check text-primary" style="font-size: 1.5rem;"></i>
                                </div>
                                <div class="flex-grow-1">
                                    <h6 class="mb-1">Fin de réservation</h6>
                                    <p class="mb-2 text-muted">Votre réservation #RES003 se termine aujourd'hui à 18h00.</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <small class="text-muted">
                                            <i class="bi bi-clock me-1"></i>Il y a 6 heures
                                        </small>
                                        <div>
                                            <button class="btn btn-sm btn-outline-danger" onclick="deleteNotification(3)">
                                                <i class="bi bi-trash"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Notification 4 -->
                    <div class="card mb-3 notification-item" data-type="system" data-read="true" data-id="4">
                        <div class="card-body">
                            <div class="d-flex align-items-start">
                                <div class="me-3">
                                    <i class="bi bi-gear text-secondary" style="font-size: 1.5rem;"></i>
                                </div>
                                <div class="flex-grow-1">
                                    <h6 class="mb-1">Mise à jour disponible</h6>
                                    <p class="mb-2 text-muted">Une nouvelle version de l'application est disponible.</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <small class="text-muted">
                                            <i class="bi bi-clock me-1"></i>Il y a 1 jour
                                        </small>
                                        <div>
                                            <button class="btn btn-sm btn-outline-danger" onclick="deleteNotification(4)">
                                                <i class="bi bi-trash"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Empty State (Hidden by default) -->
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
        // Simple filter function
        function filterNotifications(type) {
            var items = document.querySelectorAll('.notification-item');
            var emptyState = document.getElementById('emptyState');
            var container = document.getElementById('notificationsContainer');
            var visibleCount = 0;
            
            for (var i = 0; i < items.length; i++) {
                var item = items[i];
                var show = false;
                
                if (type === 'all') {
                    show = true;
                } else if (type === 'unread') {
                    show = item.getAttribute('data-read') === 'false';
                } else {
                    show = item.getAttribute('data-type') === type;
                }
                
                if (show) {
                    item.style.display = 'block';
                    visibleCount++;
                } else {
                    item.style.display = 'none';
                }
            }
            
            if (visibleCount === 0) {
                container.style.display = 'none';
                emptyState.style.display = 'block';
            } else {
                container.style.display = 'block';
                emptyState.style.display = 'none';
            }
            
            // Update button states
            updateFilterButtons(type);
        }
        
        function updateFilterButtons(activeType) {
            var buttons = document.querySelectorAll('button[onclick*="filterNotifications"]');
            buttons.forEach(function(btn) {
                btn.className = 'btn btn-outline-primary';
            });
            
            // Find and activate the clicked button
            event.target.closest('button').className = 'btn btn-primary';
        }
        
        function markAsRead(id) {
            var item = document.querySelector('[data-id="' + id + '"]');
            if (item) {
                item.setAttribute('data-read', 'true');
                item.classList.remove('border-primary');
                alert('Notification marquée comme lue');
            }
        }
        
        function markAllRead() {
            var items = document.querySelectorAll('.notification-item');
            for (var i = 0; i < items.length; i++) {
                items[i].setAttribute('data-read', 'true');
                items[i].classList.remove('border-primary');
            }
            alert('Toutes les notifications ont été marquées comme lues');
        }
        
        function deleteNotification(id) {
            if (confirm('Êtes-vous sûr de vouloir supprimer cette notification ?')) {
                var item = document.querySelector('[data-id="' + id + '"]');
                if (item) {
                    item.remove();
                    alert('Notification supprimée');
                }
            }
        }
        
        function refreshNotifications() {
            var btn = event.target;
            var originalText = btn.innerHTML;
            btn.innerHTML = '<i class="bi bi-arrow-clockwise me-2"></i>Actualisation...';
            btn.disabled = true;
            
            setTimeout(function() {
                btn.innerHTML = originalText;
                btn.disabled = false;
                alert('Notifications actualisées');
            }, 1000);
        }
    </script>
</body>
</html>

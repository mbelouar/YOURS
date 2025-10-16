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
        /* Clean Notifications Page Styles */
        .notification-card {
            border: 1px solid #e5e7eb;
            border-radius: 0.75rem;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
            transition: all 0.2s ease;
            margin-bottom: 1rem;
            background: #ffffff;
        }

        .notification-card:hover {
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            border-color: #d1d5db;
        }

        .notification-card.unread {
            border-left: 4px solid #3b82f6;
            background: #f8fafc;
        }

        .notification-icon-wrapper {
            width: 48px;
            height: 48px;
            border-radius: 0.5rem;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 1rem;
        }

        .notification-icon-wrapper.reservation {
            background: #dbeafe;
            color: #3b82f6;
        }

        .notification-icon-wrapper.payment {
            background: #dcfce7;
            color: #16a34a;
        }

        .notification-icon-wrapper.system {
            background: #f3e8ff;
            color: #9333ea;
        }

        .notification-icon-wrapper i {
            font-size: 1.25rem;
        }

        .notification-content h6 {
            color: #111827;
            font-weight: 600;
            margin-bottom: 0.5rem;
            font-size: 1rem;
        }

        .notification-content p {
            color: #6b7280;
            margin-bottom: 0.75rem;
            line-height: 1.5;
            font-size: 0.875rem;
        }

        .notification-meta {
            color: #9ca3af;
            font-size: 0.75rem;
            font-weight: 500;
        }

        .notification-actions .btn {
            border-radius: 0.5rem;
            padding: 0.375rem 0.75rem;
            font-weight: 500;
            font-size: 0.75rem;
            transition: all 0.2s ease;
        }

        .filter-card {
            background: #ffffff;
            border: 1px solid #e5e7eb;
            border-radius: 0.75rem;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
            margin-bottom: 1.5rem;
        }

        .filter-btn {
            border-radius: 0.5rem;
            padding: 0.5rem 1rem;
            font-weight: 500;
            font-size: 0.875rem;
            transition: all 0.2s ease;
            border: 1px solid #e5e7eb;
            background: #ffffff;
            color: #6b7280;
        }

        .filter-btn.active {
            background: #3b82f6;
            color: white;
            border-color: #3b82f6;
        }

        .filter-btn:hover:not(.active) {
            background: #f9fafb;
            border-color: #d1d5db;
            color: #374151;
        }

        .badge {
            border-radius: 0.5rem;
            font-size: 0.625rem;
            font-weight: 600;
            padding: 0.25rem 0.5rem;
        }

        .page-header-card {
            background: #3b82f6;
            border: none;
            border-radius: 0.75rem;
            box-shadow: 0 4px 12px rgba(59, 130, 246, 0.15);
            margin-bottom: 1.5rem;
        }

        .page-header h1 {
            font-size: 1.875rem;
            font-weight: 700;
            margin-bottom: 0.25rem;
            color: white;
        }

        .page-header p {
            font-size: 1rem;
            opacity: 0.9;
            margin-bottom: 0;
            color: white;
        }

        .action-buttons {
            background: #ffffff;
            border: 1px solid #e5e7eb;
            border-radius: 0.75rem;
            padding: 1rem;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
            margin-top: 1.5rem;
        }

        .action-btn {
            border-radius: 0.5rem;
            padding: 0.5rem 1rem;
            font-weight: 500;
            font-size: 0.875rem;
            transition: all 0.2s ease;
        }

        .btn-success {
            background: #16a34a;
            border-color: #16a34a;
        }

        .btn-success:hover {
            background: #15803d;
            border-color: #15803d;
        }

        .btn-outline-primary {
            border: 1px solid #3b82f6;
            color: #3b82f6;
            background: transparent;
        }

        .btn-outline-primary:hover {
            background: #3b82f6;
            border-color: #3b82f6;
            color: white;
        }

        .btn-outline-danger {
            border: 1px solid #dc2626;
            color: #dc2626;
            background: transparent;
        }

        .btn-outline-danger:hover {
            background: #dc2626;
            border-color: #dc2626;
            color: white;
        }

        .empty-state {
            background: #f9fafb;
            border: 1px solid #e5e7eb;
            border-radius: 0.75rem;
            padding: 3rem 2rem;
        }

        .container-fluid {
            background: #f9fafb;
            min-height: 100vh;
        }
    </style>
</head>
<body>
    <div class="container-fluid py-4">
        <div class="row">
            <div class="col-12">
                <!-- Page Header -->
                <div class="card page-header-card">
                    <div class="card-body p-4">
                        <div class="page-header text-white">
                            <h1><i class="bi bi-bell me-2"></i>Mes Notifications</h1>
                            <p>Restez informé de toutes vos activités et rappels importants</p>
                        </div>
                    </div>
                </div>

                <!-- Filter Buttons -->
                <div class="card filter-card">
                    <div class="card-body p-4">
                        <div class="d-flex flex-wrap gap-3 justify-content-center">
                            <button class="btn filter-btn active" id="filterAll">
                                <i class="bi bi-list-ul me-2"></i>Toutes
                                <span class="badge bg-light text-dark ms-2">4</span>
                            </button>
                            <button class="btn filter-btn" id="filterUnread">
                                <i class="bi bi-circle-fill me-2"></i>Non lues
                                <span class="badge bg-danger text-white ms-2">2</span>
                            </button>
                            <button class="btn filter-btn" id="filterReservations">
                                <i class="bi bi-calendar-check me-2"></i>Réservations
                                <span class="badge bg-info text-white ms-2">2</span>
                            </button>
                            <button class="btn filter-btn" id="filterPayments">
                                <i class="bi bi-credit-card me-2"></i>Paiements
                                <span class="badge bg-success text-white ms-2">1</span>
                            </button>
                            <button class="btn filter-btn" id="filterSystem">
                                <i class="bi bi-gear me-2"></i>Système
                                <span class="badge bg-secondary text-white ms-2">1</span>
                            </button>
                        </div>
                    </div>
                </div>

                <!-- Notifications List -->
                <div id="notificationsContainer">
                    <!-- Notification 1 -->
                    <div class="card notification-card unread notification-item" data-type="reservation" data-read="false" data-id="1">
                        <div class="card-body p-4">
                            <div class="d-flex align-items-start">
                                <div class="notification-icon-wrapper reservation">
                                    <i class="bi bi-calendar-check"></i>
                                </div>
                                <div class="notification-content flex-grow-1">
                                    <h6>Rappel de réservation</h6>
                                    <p>Votre réservation #RES001 arrive à échéance dans 2 jours. N'oubliez pas de récupérer votre matériel.</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <span class="notification-meta">
                                            <i class="bi bi-clock me-1"></i>Il y a 2 heures
                                        </span>
                                        <div class="notification-actions">
                                            <button class="btn btn-outline-primary me-2" onclick="markAsRead(1)">
                                                <i class="bi bi-check"></i> Marquer comme lu
                                            </button>
                                            <button class="btn btn-outline-danger" onclick="deleteNotification(1)">
                                                <i class="bi bi-trash"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Notification 2 -->
                    <div class="card notification-card unread notification-item" data-type="payment" data-read="false" data-id="2">
                        <div class="card-body p-4">
                            <div class="d-flex align-items-start">
                                <div class="notification-icon-wrapper payment">
                                    <i class="bi bi-credit-card"></i>
                                </div>
                                <div class="notification-content flex-grow-1">
                                    <h6>Paiement confirmé</h6>
                                    <p>Votre paiement de 150€ pour la réservation #RES002 a été confirmé avec succès. Merci pour votre confiance.</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <span class="notification-meta">
                                            <i class="bi bi-clock me-1"></i>Il y a 4 heures
                                        </span>
                                        <div class="notification-actions">
                                            <button class="btn btn-outline-primary me-2" onclick="markAsRead(2)">
                                                <i class="bi bi-check"></i> Marquer comme lu
                                            </button>
                                            <button class="btn btn-outline-danger" onclick="deleteNotification(2)">
                                                <i class="bi bi-trash"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Notification 3 -->
                    <div class="card notification-card notification-item" data-type="reservation" data-read="true" data-id="3">
                        <div class="card-body p-4">
                            <div class="d-flex align-items-start">
                                <div class="notification-icon-wrapper reservation">
                                    <i class="bi bi-calendar-check"></i>
                                </div>
                                <div class="notification-content flex-grow-1">
                                    <h6>Fin de réservation</h6>
                                    <p>Votre réservation #RES003 se termine aujourd'hui à 18h00. Pensez à retourner le matériel dans les temps.</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <span class="notification-meta">
                                            <i class="bi bi-clock me-1"></i>Il y a 6 heures
                                        </span>
                                        <div class="notification-actions">
                                            <button class="btn btn-outline-danger" onclick="deleteNotification(3)">
                                                <i class="bi bi-trash"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Notification 4 -->
                    <div class="card notification-card notification-item" data-type="system" data-read="true" data-id="4">
                        <div class="card-body p-4">
                            <div class="d-flex align-items-start">
                                <div class="notification-icon-wrapper system">
                                    <i class="bi bi-gear"></i>
                                </div>
                                <div class="notification-content flex-grow-1">
                                    <h6>Mise à jour disponible</h6>
                                    <p>Une nouvelle version de l'application est disponible avec de nouvelles fonctionnalités et améliorations de sécurité.</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <span class="notification-meta">
                                            <i class="bi bi-clock me-1"></i>Il y a 1 jour
                                        </span>
                                        <div class="notification-actions">
                                            <button class="btn btn-outline-danger" onclick="deleteNotification(4)">
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
                <div class="action-buttons text-center">
                    <button class="btn btn-success action-btn me-3" onclick="markAllRead()">
                        <i class="bi bi-check-all me-2"></i>Tout marquer comme lu
                    </button>
                    <button class="btn btn-outline-primary action-btn" onclick="refreshNotifications()">
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
            var buttons = ['filterAll', 'filterUnread', 'filterReservations', 'filterPayments', 'filterSystem'];
            var types = ['all', 'unread', 'reservations', 'payments', 'system'];
            
            for (var i = 0; i < buttons.length; i++) {
                var btn = document.getElementById(buttons[i]);
                if (types[i] === activeType) {
                    btn.className = 'btn filter-btn active';
                } else {
                    btn.className = 'btn filter-btn';
                }
            }
        }
        
        function markAsRead(id) {
            var item = document.querySelector('[data-id="' + id + '"]');
            if (item) {
                item.setAttribute('data-read', 'true');
                item.classList.remove('unread');
                alert('Notification marquée comme lue');
            }
        }
        
        function markAllRead() {
            var items = document.querySelectorAll('.notification-item');
            for (var i = 0; i < items.length; i++) {
                items[i].setAttribute('data-read', 'true');
                items[i].classList.remove('unread');
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
        
        // Initialize page
        document.addEventListener('DOMContentLoaded', function() {
            // Set up filter button event listeners
            document.getElementById('filterAll').addEventListener('click', function() { filterNotifications('all'); });
            document.getElementById('filterUnread').addEventListener('click', function() { filterNotifications('unread'); });
            document.getElementById('filterReservations').addEventListener('click', function() { filterNotifications('reservations'); });
            document.getElementById('filterPayments').addEventListener('click', function() { filterNotifications('payments'); });
            document.getElementById('filterSystem').addEventListener('click', function() { filterNotifications('system'); });
        });
    </script>
</body>
</html>

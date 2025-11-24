<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setAttribute("pageTitle", "Notifications - YOURS");
%>

<%@ include file="../../layouts/header.jsp" %>
<%@ include file="../../layouts/navbar.jsp" %>

<!-- Page Header -->
<section class="py-5" style="background: linear-gradient(135deg, #1e40af 0%, #1e3a8a 50%, #1e293b 100%); margin-top: -80px; padding-top: calc(80px + 6rem) !important; padding-bottom: 6rem !important; min-height: 400px; position: relative; overflow: hidden;">
    <div style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; background: radial-gradient(circle at 20% 50%, rgba(59, 130, 246, 0.15) 0%, transparent 50%); opacity: 1;"></div>
    <div class="container" style="position: relative; z-index: 2;">
        <div class="row">
            <div class="col-lg-10 mx-auto text-center">
                <!-- Badge -->
                <div class="d-inline-flex align-items-center mb-4" style="background: rgba(255, 255, 255, 0.15); backdrop-filter: blur(20px); border-radius: 50px; padding: 0.75rem 1.5rem; border: 1px solid rgba(255, 255, 255, 0.2); box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);">
                    <i class="fas fa-bell me-2" style="color: #fbbf24; font-size: 1rem;"></i>
                    <span style="color: white; font-weight: 600; font-size: 0.875rem; letter-spacing: 0.5px;">CENTRE DE NOTIFICATIONS</span>
                </div>
                
                <!-- Main Title -->
                <h1 class="display-2 fw-bold mb-4" style="color: white; text-shadow: 0 4px 20px rgba(0,0,0,0.3); letter-spacing: -0.03em; line-height: 1.1;">
                    Mes <span style="background: linear-gradient(135deg, #fbbf24, #f59e0b); -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text;">Notifications</span>
                </h1>
                
                <!-- Subtitle -->
                <div class="mb-4" style="max-width: 700px; margin: 0 auto;">
                    <p class="lead mb-2" style="color: rgba(255, 255, 255, 0.95); font-size: 1.375rem; font-weight: 400; line-height: 1.6; letter-spacing: -0.01em;">
                        Restez informé de toutes vos activités et rappels importants
                    </p>
                    <p class="mb-0" style="color: rgba(255, 255, 255, 0.8); font-size: 1.1rem; font-weight: 300; line-height: 1.7;">
                        Suivez vos réservations • Gérez vos paiements • Restez à jour
                    </p>
                </div>
                
                <!-- Decorative Elements -->
                <div class="d-flex justify-content-center align-items-center gap-3 mt-4">
                    <div style="width: 60px; height: 2px; background: linear-gradient(90deg, transparent, rgba(255,255,255,0.4), transparent); border-radius: 1px;"></div>
                    <div style="width: 8px; height: 8px; background: rgba(251, 191, 36, 0.8); border-radius: 50%; box-shadow: 0 0 20px rgba(251, 191, 36, 0.5);"></div>
                    <div style="width: 60px; height: 2px; background: linear-gradient(90deg, transparent, rgba(255,255,255,0.4), transparent); border-radius: 1px;"></div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Notifications Content -->
<div class="container py-5">

    <!-- Filter Tabs -->
    <div class="mb-4">
        <div class="nav nav-pills nav-pills-modern" role="tablist" style="background: white; border-radius: 1rem; padding: 0.5rem; box-shadow: 0 4px 20px -2px rgba(0, 0, 0, 0.08); border: 1px solid rgba(226, 232, 240, 0.8);">
            <button class="nav-link active filter-tab" onclick="filterNotifications('all')" style="border-radius: 0.75rem; font-weight: 600; padding: 0.75rem 1.5rem; transition: all 0.3s ease; background: linear-gradient(135deg, rgba(59, 130, 246, 0.1), rgba(59, 130, 246, 0.05)); color: #3b82f6; transform: translateY(-1px); box-shadow: 0 4px 12px rgba(59, 130, 246, 0.2);">
                <i class="fas fa-list me-2"></i>Toutes
                <span class="badge bg-danger ms-2">4</span>
            </button>
            <button class="nav-link filter-tab" onclick="filterNotifications('unread')" style="border-radius: 0.75rem; font-weight: 600; padding: 0.75rem 1.5rem; transition: all 0.3s ease;">
                Non lues
                <span class="badge bg-danger ms-2">2</span>
            </button>
            <button class="nav-link filter-tab" onclick="filterNotifications('reservations')" style="border-radius: 0.75rem; font-weight: 600; padding: 0.75rem 1.5rem; transition: all 0.3s ease;">
                <i class="fas fa-calendar-check me-2"></i>Réservations
                <span class="badge bg-danger ms-2">2</span>
            </button>
            <button class="nav-link filter-tab" onclick="filterNotifications('payments')" style="border-radius: 0.75rem; font-weight: 600; padding: 0.75rem 1.5rem; transition: all 0.3s ease;">
                <i class="fas fa-credit-card me-2"></i>Paiements
                <span class="badge bg-danger ms-2">1</span>
            </button>
            <button class="nav-link filter-tab" onclick="filterNotifications('system')" style="border-radius: 0.75rem; font-weight: 600; padding: 0.75rem 1.5rem; transition: all 0.3s ease;">
                <i class="fas fa-cog me-2"></i>Système
                <span class="badge bg-danger ms-2">1</span>
            </button>
        </div>
    </div>

    <!-- Notifications List -->
    <div id="notificationsContainer">
        <!-- Notification 1 -->
        <div class="card mb-4 notification-item border-start border-primary border-2" data-type="reservation" data-read="false" data-id="1" style="border-radius: 1rem; box-shadow: 0 4px 20px -2px rgba(59, 130, 246, 0.15); transition: all 0.3s ease; border-left: 2px solid #3b82f6 !important;">
            <div class="card-body p-4">
                <div class="d-flex align-items-start">
                    <div class="me-3">
                        <div class="d-flex align-items-center justify-content-center" style="width: 48px; height: 48px; background: linear-gradient(135deg, #3b82f6, #1e40af); border-radius: 12px; box-shadow: 0 4px 12px rgba(59, 130, 246, 0.3);">
                            <i class="fas fa-calendar-check text-white" style="font-size: 1.25rem;"></i>
                        </div>
                    </div>
                    <div class="flex-grow-1">
                        <div class="d-flex align-items-center justify-content-between mb-2">
                            <h6 class="mb-0 fw-bold" style="color: #1e293b;">Rappel de réservation</h6>
                            <span class="badge px-3 py-2" style="font-size: 0.75rem; border-radius: 8px; background: linear-gradient(135deg, #ef4444, #dc2626); color: white; font-weight: 600; box-shadow: 0 2px 8px rgba(239, 68, 68, 0.3);">Non lue</span>
                        </div>
                        <p class="mb-3 text-muted" style="line-height: 1.6;">Votre réservation #RES001 arrive à échéance dans 2 jours.</p>
                        <div class="d-flex justify-content-between align-items-center">
                            <small class="text-muted d-flex align-items-center">
                                <i class="fas fa-clock me-1"></i>Il y a 2 heures
                            </small>
                            <div class="d-flex gap-2">
                                <button class="btn btn-sm" onclick="markAsRead(1)" style="border-radius: 8px; font-weight: 600; padding: 0.5rem 1rem; background: linear-gradient(135deg, #fbbf24, #f59e0b); border: none; color: white; box-shadow: 0 2px 8px rgba(251, 191, 36, 0.3);">
                                    <i class="fas fa-check me-1"></i>Marquer comme lu
                                </button>
                                <button class="btn btn-sm btn-outline-danger" onclick="deleteNotification(1)" style="border-radius: 8px; padding: 0.5rem;">
                                    <i class="fas fa-trash"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Notification 2 -->
        <div class="card mb-4 notification-item border-start border-primary border-2" data-type="payment" data-read="false" data-id="2" style="border-radius: 1rem; box-shadow: 0 4px 20px -2px rgba(59, 130, 246, 0.15); transition: all 0.3s ease; border-left: 2px solid #3b82f6 !important;">
            <div class="card-body p-4">
                <div class="d-flex align-items-start">
                    <div class="me-3">
                        <div class="d-flex align-items-center justify-content-center" style="width: 48px; height: 48px; background: linear-gradient(135deg, #3b82f6, #1e40af); border-radius: 12px; box-shadow: 0 4px 12px rgba(59, 130, 246, 0.3);">
                            <i class="fas fa-credit-card text-white" style="font-size: 1.25rem;"></i>
                        </div>
                    </div>
                    <div class="flex-grow-1">
                        <div class="d-flex align-items-center justify-content-between mb-2">
                            <h6 class="mb-0 fw-bold" style="color: #1e293b;">Paiement confirmé</h6>
                            <span class="badge px-3 py-2" style="font-size: 0.75rem; border-radius: 8px; background: linear-gradient(135deg, #ef4444, #dc2626); color: white; font-weight: 600; box-shadow: 0 2px 8px rgba(239, 68, 68, 0.3);">Non lue</span>
                        </div>
                        <p class="mb-3 text-muted" style="line-height: 1.6;">Votre paiement de 150€ a été confirmé avec succès.</p>
                        <div class="d-flex justify-content-between align-items-center">
                            <small class="text-muted d-flex align-items-center">
                                <i class="fas fa-clock me-1"></i>Il y a 4 heures
                            </small>
                            <div class="d-flex gap-2">
                                <button class="btn btn-sm" onclick="markAsRead(2)" style="border-radius: 8px; font-weight: 600; padding: 0.5rem 1rem; background: linear-gradient(135deg, #fbbf24, #f59e0b); border: none; color: white; box-shadow: 0 2px 8px rgba(251, 191, 36, 0.3);">
                                    <i class="fas fa-check me-1"></i>Marquer comme lu
                                </button>
                                <button class="btn btn-sm btn-outline-danger" onclick="deleteNotification(2)" style="border-radius: 8px; padding: 0.5rem;">
                                    <i class="fas fa-trash"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Notification 3 -->
        <div class="card mb-4 notification-item border-start border-primary border-2" data-type="reservation" data-read="true" data-id="3" style="border-radius: 1rem; box-shadow: 0 4px 20px -2px rgba(59, 130, 246, 0.15); transition: all 0.3s ease; border-left: 2px solid #3b82f6 !important;">
            <div class="card-body p-4">
                <div class="d-flex align-items-start">
                    <div class="me-3">
                        <div class="d-flex align-items-center justify-content-center" style="width: 48px; height: 48px; background: linear-gradient(135deg, #3b82f6, #1e40af); border-radius: 12px; box-shadow: 0 4px 12px rgba(59, 130, 246, 0.3);">
                            <i class="fas fa-calendar-check text-white" style="font-size: 1.25rem;"></i>
                        </div>
                    </div>
                    <div class="flex-grow-1">
                        <div class="d-flex align-items-center justify-content-between mb-2">
                            <h6 class="mb-0 fw-bold" style="color: #1e293b;">Fin de réservation</h6>
                            <span class="badge px-3 py-2" style="font-size: 0.75rem; border-radius: 8px; background: linear-gradient(135deg, #22c55e, #16a34a); color: white; font-weight: 600; box-shadow: 0 2px 8px rgba(34, 197, 94, 0.3);">Lue</span>
                        </div>
                        <p class="mb-3 text-muted" style="line-height: 1.6;">Votre réservation #RES003 se termine aujourd'hui à 18h00.</p>
                        <div class="d-flex justify-content-between align-items-center">
                            <small class="text-muted d-flex align-items-center">
                                <i class="fas fa-clock me-1"></i>Il y a 6 heures
                            </small>
                            <div class="d-flex gap-2">
                                <button class="btn btn-sm btn-outline-danger" onclick="deleteNotification(3)" style="border-radius: 8px; padding: 0.5rem;">
                                    <i class="fas fa-trash"></i>
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Notification 4 -->
        <div class="card mb-4 notification-item border-start border-primary border-2" data-type="system" data-read="true" data-id="4" style="border-radius: 1rem; box-shadow: 0 4px 20px -2px rgba(59, 130, 246, 0.15); transition: all 0.3s ease; border-left: 2px solid #3b82f6 !important;">
            <div class="card-body p-4">
                <div class="d-flex align-items-start">
                    <div class="me-3">
                        <div class="d-flex align-items-center justify-content-center" style="width: 48px; height: 48px; background: linear-gradient(135deg, #3b82f6, #1e40af); border-radius: 12px; box-shadow: 0 4px 12px rgba(59, 130, 246, 0.3);">
                            <i class="fas fa-cog text-white" style="font-size: 1.25rem;"></i>
                        </div>
                    </div>
                    <div class="flex-grow-1">
                        <div class="d-flex align-items-center justify-content-between mb-2">
                            <h6 class="mb-0 fw-bold" style="color: #1e293b;">Mise à jour disponible</h6>
                            <span class="badge px-3 py-2" style="font-size: 0.75rem; border-radius: 8px; background: linear-gradient(135deg, #22c55e, #16a34a); color: white; font-weight: 600; box-shadow: 0 2px 8px rgba(34, 197, 94, 0.3);">Lue</span>
                        </div>
                        <p class="mb-3 text-muted" style="line-height: 1.6;">Une nouvelle version de l'application est disponible.</p>
                        <div class="d-flex justify-content-between align-items-center">
                            <small class="text-muted d-flex align-items-center">
                                <i class="fas fa-clock me-1"></i>Il y a 1 jour
                            </small>
                            <div class="d-flex gap-2">
                                <button class="btn btn-sm btn-outline-danger" onclick="deleteNotification(4)" style="border-radius: 8px; padding: 0.5rem;">
                                    <i class="fas fa-trash"></i>
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
        <div class="mb-4">
            <div class="d-inline-flex align-items-center justify-content-center" style="width: 80px; height: 80px; background: linear-gradient(135deg, #f3f4f6, #e5e7eb); border-radius: 20px; box-shadow: 0 4px 20px -2px rgba(0, 0, 0, 0.1);">
                <i class="fas fa-bell-slash text-muted" style="font-size: 2rem;"></i>
            </div>
        </div>
        <h4 class="text-muted mt-3 mb-2">Aucune notification</h4>
        <p class="text-muted">Vous n'avez aucune notification pour le moment.</p>
    </div>

    <!-- Action Buttons -->
    <div class="text-center mt-5">
        <div class="d-flex justify-content-center gap-3">
            <button class="btn btn-lg" onclick="markAllRead()" style="border-radius: 12px; padding: 0.75rem 2rem; font-weight: 600; background: linear-gradient(135deg, #fbbf24, #f59e0b); border: none; color: white; box-shadow: 0 4px 20px -2px rgba(251, 191, 36, 0.4);">
                <i class="fas fa-check-double me-2"></i>Tout marquer comme lu
            </button>
            <button class="btn btn-outline-primary btn-lg" onclick="refreshNotifications()" style="border-radius: 12px; padding: 0.75rem 2rem; font-weight: 600;">
                <i class="fas fa-sync-alt me-2"></i>Actualiser
            </button>
        </div>
    </div>
</div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Enhanced filter function with smooth animations
        function filterNotifications(type) {
            var items = document.querySelectorAll('.notification-item');
            var emptyState = document.getElementById('emptyState');
            var container = document.getElementById('notificationsContainer');
            var visibleCount = 0;
            
            // Add fade out animation
            container.style.opacity = '0.5';
            container.style.transition = 'opacity 0.3s ease';
            
            setTimeout(function() {
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
                
                // Fade back in
                container.style.opacity = '1';
                
                // Update button states
                updateFilterButtons(type);
            }, 150);
        }
        
        function updateFilterButtons(activeType) {
            // Reset all buttons to inactive state
            var buttons = document.querySelectorAll('.filter-tab');
            buttons.forEach(function(btn) {
                btn.classList.remove('active');
                btn.style.background = 'transparent';
                btn.style.color = '#6b7280';
                btn.style.transform = 'translateY(0)';
                btn.style.boxShadow = 'none';
            });
            
            // Find and activate the button that matches the activeType
            var activeBtn = null;
            buttons.forEach(function(btn) {
                var onclickAttr = btn.getAttribute('onclick');
                if (onclickAttr && onclickAttr.includes("'" + activeType + "'")) {
                    activeBtn = btn;
                }
            });
            
            // Apply active styles to the correct button
            if (activeBtn) {
                activeBtn.classList.add('active');
                activeBtn.style.background = 'linear-gradient(135deg, rgba(59, 130, 246, 0.1), rgba(59, 130, 246, 0.05))';
                activeBtn.style.color = '#3b82f6';
                activeBtn.style.transform = 'translateY(-1px)';
                activeBtn.style.boxShadow = '0 4px 12px rgba(59, 130, 246, 0.2)';
            }
        }
        
        function markAsRead(id) {
            var item = document.querySelector('[data-id="' + id + '"]');
            if (item) {
                item.setAttribute('data-read', 'true');
                // Use blue border for all notifications (smaller, non-bold)
                item.style.borderLeft = '2px solid #3b82f6';
                // Remove opacity to keep notifications crisp and clear
                item.style.opacity = '1';
                
                // Update badge
                var badge = item.querySelector('.badge');
                if (badge) {
                    badge.textContent = 'Lue';
                    badge.style.background = 'linear-gradient(135deg, #22c55e, #16a34a)';
                    badge.style.color = 'white';
                    badge.style.boxShadow = '0 2px 8px rgba(34, 197, 94, 0.3)';
                }
                
                // Hide mark as read button
                var markBtn = item.querySelector('button[onclick*="markAsRead"]');
                if (markBtn) {
                    markBtn.style.display = 'none';
                }
                
                showToast('Notification marquée comme lue', 'success');
            }
        }
        
        function markAllRead() {
            var items = document.querySelectorAll('.notification-item[data-read="false"]');
            var count = items.length;
            
            if (count === 0) {
                showToast('Toutes les notifications sont déjà lues', 'info');
                return;
            }
            
            items.forEach(function(item) {
                item.setAttribute('data-read', 'true');
                // Use blue border for all notifications (smaller, non-bold)
                item.style.borderLeft = '2px solid #3b82f6';
                // Remove opacity to keep notifications crisp and clear
                item.style.opacity = '1';
                
                var badge = item.querySelector('.badge');
                if (badge) {
                    badge.textContent = 'Lue';
                    badge.style.background = 'linear-gradient(135deg, #22c55e, #16a34a)';
                    badge.style.color = 'white';
                    badge.style.boxShadow = '0 2px 8px rgba(34, 197, 94, 0.3)';
                }
                
                var markBtn = item.querySelector('button[onclick*="markAsRead"]');
                if (markBtn) {
                    markBtn.style.display = 'none';
                }
            });
            
            showToast(`${count} notifications marquées comme lues`, 'success');
        }
        
        function deleteNotification(id) {
            if (confirm('Êtes-vous sûr de vouloir supprimer cette notification ?')) {
                var item = document.querySelector('[data-id="' + id + '"]');
                if (item) {
                    item.style.transition = 'all 0.3s ease';
                    item.style.opacity = '0';
                    item.style.transform = 'translateX(-20px)';
                    
                    setTimeout(function() {
                        item.remove();
                        showToast('Notification supprimée', 'success');
                        
                        // Check if container is empty
                        var remainingItems = document.querySelectorAll('.notification-item');
                        if (remainingItems.length === 0) {
                            document.getElementById('notificationsContainer').style.display = 'none';
                            document.getElementById('emptyState').style.display = 'block';
                        }
                    }, 300);
                }
            }
        }
        
        function refreshNotifications() {
            var btn = event.target.closest('button');
            var originalText = btn.innerHTML;
            btn.innerHTML = '<i class="fas fa-spinner fa-spin me-2"></i>Actualisation...';
            btn.disabled = true;
            
            setTimeout(function() {
                btn.innerHTML = originalText;
                btn.disabled = false;
                showToast('Notifications actualisées', 'success');
            }, 1500);
        }
        
        function showToast(message, type) {
            // Use the centralized notification system
            switch(type) {
                case 'success':
                    notificationSystem.success(message);
                    break;
                case 'error':
                    notificationSystem.error(message);
                    break;
                case 'info':
                default:
                    notificationSystem.info(message);
                    break;
            }
        }
        
        // Add hover effects
        document.addEventListener('DOMContentLoaded', function() {
            // Notification items hover effects
            var notificationItems = document.querySelectorAll('.notification-item');
            notificationItems.forEach(function(item) {
                item.addEventListener('mouseenter', function() {
                    this.style.transform = 'translateY(-2px)';
                    this.style.boxShadow = '0 8px 25px -5px rgba(0, 0, 0, 0.1)';
                });
                
                item.addEventListener('mouseleave', function() {
                    this.style.transform = 'translateY(0)';
                    var isRead = this.getAttribute('data-read') === 'true';
                    if (isRead) {
                        this.style.boxShadow = '0 4px 20px -2px rgba(0, 0, 0, 0.08)';
                    } else {
                        var type = this.getAttribute('data-type');
                        var color = type === 'reservation' ? '59, 130, 246' : type === 'payment' ? '34, 197, 94' : '107, 114, 128';
                        this.style.boxShadow = '0 4px 20px -2px rgba(' + color + ', 0.15)';
                    }
                });
            });
            
            // Filter tabs hover effects
            var filterTabs = document.querySelectorAll('.filter-tab');
            filterTabs.forEach(function(tab) {
                tab.addEventListener('mouseenter', function() {
                    if (!this.classList.contains('active')) {
                        this.style.background = 'linear-gradient(135deg, rgba(59, 130, 246, 0.1), rgba(59, 130, 246, 0.05))';
                        this.style.color = '#3b82f6';
                        this.style.transform = 'translateY(-1px)';
                        this.style.boxShadow = '0 4px 12px rgba(59, 130, 246, 0.2)';
                    }
                });
                
                tab.addEventListener('mouseleave', function() {
                    if (!this.classList.contains('active')) {
                        this.style.background = 'transparent';
                        this.style.color = '#6b7280';
                        this.style.transform = 'translateY(0)';
                        this.style.boxShadow = 'none';
                    }
                });
            });
            
            // Ensure initial state is correct
            setTimeout(function() {
                var activeTab = document.querySelector('.filter-tab.active');
                if (activeTab) {
                    activeTab.style.background = 'linear-gradient(135deg, rgba(59, 130, 246, 0.1), rgba(59, 130, 246, 0.05))';
                    activeTab.style.color = '#3b82f6';
                    activeTab.style.transform = 'translateY(-1px)';
                    activeTab.style.boxShadow = '0 4px 12px rgba(59, 130, 246, 0.2)';
                }
            }, 100);
        });
    </script>
</body>
</html>

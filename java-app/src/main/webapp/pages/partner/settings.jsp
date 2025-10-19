<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setAttribute("pageTitle", "Paramètres - YOURS");
%>

<%@ include file="../../layouts/header.jsp" %>
<%@ include file="../../layouts/navbar.jsp" %>

<div class="container py-5" style="margin-top: 80px;">
    <!-- Breadcrumb -->
    <nav aria-label="breadcrumb" class="mb-4">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="${pageContext.request.contextPath}/pages/partner/dashboard.jsp">
                    <i class="bi bi-house me-1"></i>Tableau de bord
                </a>
            </li>
            <li class="breadcrumb-item active">Paramètres</li>
        </ol>
    </nav>

    <div class="row">
        <div class="col-lg-3 mb-4">
            <!-- Settings Navigation -->
            <div class="card border-0 shadow-lg settings-nav-card enhanced-nav">
                <div class="card-header bg-gradient-primary text-white border-0 py-4">
                    <h5 class="fw-bold mb-0 d-flex align-items-center">
                        <i class="bi bi-gear me-3" style="font-size: 1.2rem;"></i>Paramètres
                    </h5>
                    <small class="text-white-50 mt-1">Gérez vos préférences</small>
                </div>
                <div class="list-group list-group-flush settings-nav-list">
                    <a href="#account" class="list-group-item list-group-item-action settings-nav-item active" data-section="account">
                        <div class="d-flex align-items-center">
                            <div class="nav-icon-wrapper me-3">
                                <i class="bi bi-person-circle"></i>
                            </div>
                            <div class="nav-content">
                                <div class="nav-title">Compte</div>
                                <small class="nav-subtitle">Informations personnelles</small>
                            </div>
                            <i class="bi bi-chevron-right ms-auto nav-arrow"></i>
                        </div>
                    </a>
                    <a href="#notifications" class="list-group-item list-group-item-action settings-nav-item" data-section="notifications">
                        <div class="d-flex align-items-center">
                            <div class="nav-icon-wrapper me-3">
                                <i class="bi bi-bell"></i>
                            </div>
                            <div class="nav-content">
                                <div class="nav-title">Notifications</div>
                                <small class="nav-subtitle">Préférences d'alerte</small>
                            </div>
                            <i class="bi bi-chevron-right ms-auto nav-arrow"></i>
                        </div>
                    </a>
                    <a href="#security" class="list-group-item list-group-item-action settings-nav-item" data-section="security">
                        <div class="d-flex align-items-center">
                            <div class="nav-icon-wrapper me-3">
                                <i class="bi bi-shield-lock"></i>
                            </div>
                            <div class="nav-content">
                                <div class="nav-title">Sécurité</div>
                                <small class="nav-subtitle">Protection du compte</small>
                            </div>
                            <i class="bi bi-chevron-right ms-auto nav-arrow"></i>
                        </div>
                    </a>
                </div>
            </div>
        </div>

        <div class="col-lg-9">
            <!-- Account Settings -->
            <div class="card border-0 shadow-lg mb-4 settings-card" id="account">
                <div class="card-header bg-gradient-light border-0 py-3">
                    <div class="d-flex justify-content-between align-items-center">
                        <h5 class="fw-bold mb-0 d-flex align-items-center">
                            <i class="bi bi-person-circle me-3 text-primary" style="font-size: 1.3rem;"></i>Paramètres du compte
                        </h5>
                        <span class="badge bg-success">Actif</span>
                    </div>
                </div>
                <div class="card-body p-4">
                    <form>
                        <div class="row g-3">
                            <div class="col-12">
                                <h6 class="fw-semibold mb-3 text-primary border-bottom pb-2">Informations personnelles</h6>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-semibold mb-3 d-flex align-items-center">
                                    <i class="bi bi-translate me-2 text-primary"></i>Langue préférée
                                </label>
                                <select class="form-select custom-select" id="languageSelect">
                                    <option selected>Français</option>
                                    <option>English</option>
                                    <option>العربية</option>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-semibold mb-3 d-flex align-items-center">
                                    <i class="bi bi-clock me-2 text-primary"></i>Fuseau horaire
                                </label>
                                <select class="form-select custom-select" id="timezoneSelect">
                                    <option selected>GMT+1 (Casablanca)</option>
                                    <option>GMT+0 (London)</option>
                                    <option>GMT+2 (Paris)</option>
                                </select>
                            </div>
                            <div class="col-12 mt-4">
                                <div class="d-flex gap-3">
                                    <button type="submit" class="btn btn-primary btn-lg">
                                        <i class="bi bi-check-circle me-2"></i>Enregistrer les modifications
                                    </button>
                                    <button type="button" class="btn btn-outline-secondary btn-lg">
                                        <i class="bi bi-arrow-clockwise me-2"></i>Réinitialiser
                                    </button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <!-- Notification Settings -->
            <div class="card border-0 shadow-lg mb-4 settings-card" id="notifications">
                <div class="card-header bg-gradient-light border-0 py-3">
                    <div class="d-flex justify-content-between align-items-center">
                        <h5 class="fw-bold mb-0 d-flex align-items-center">
                            <i class="bi bi-bell me-3 text-primary" style="font-size: 1.3rem;"></i>Notifications
                        </h5>
                        <span class="badge bg-info">3 actives</span>
                    </div>
                </div>
                <div class="card-body p-4">
                    <div class="row g-3">
                        <div class="col-12">
                            <h6 class="fw-semibold mb-3 text-primary border-bottom pb-2">Préférences de notification</h6>
                        </div>
                        <div class="col-12">
                            <div class="notification-item">
                                <div class="d-flex justify-content-between align-items-center p-3 bg-light rounded-3">
                                    <div class="d-flex align-items-center">
                                        <div class="notification-icon me-3">
                                            <i class="bi bi-envelope text-primary" style="font-size: 1.5rem;"></i>
                                        </div>
                                        <div>
                                            <h6 class="mb-1 fw-semibold">Notifications par email</h6>
                                            <small class="text-muted">Recevoir les mises à jour par email</small>
                                        </div>
                                    </div>
                                    <div class="form-check form-switch">
                                        <input class="form-check-input" type="checkbox" id="emailNotif" checked>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="notification-item">
                                <div class="d-flex justify-content-between align-items-center p-3 bg-light rounded-3">
                                    <div class="d-flex align-items-center">
                                        <div class="notification-icon me-3">
                                            <i class="bi bi-phone text-success" style="font-size: 1.5rem;"></i>
                                        </div>
                                        <div>
                                            <h6 class="mb-1 fw-semibold">Notifications SMS</h6>
                                            <small class="text-muted">Recevoir les alertes par SMS</small>
                                        </div>
                                    </div>
                                    <div class="form-check form-switch">
                                        <input class="form-check-input" type="checkbox" id="smsNotif">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="notification-item">
                                <div class="d-flex justify-content-between align-items-center p-3 bg-light rounded-3">
                                    <div class="d-flex align-items-center">
                                        <div class="notification-icon me-3">
                                            <i class="bi bi-calendar-check text-warning" style="font-size: 1.5rem;"></i>
                                        </div>
                                        <div>
                                            <h6 class="mb-1 fw-semibold">Rappels de réservation</h6>
                                            <small class="text-muted">Rappels avant le début et la fin des réservations</small>
                                        </div>
                                    </div>
                                    <div class="form-check form-switch">
                                        <input class="form-check-input" type="checkbox" id="reservationNotif" checked>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12 mt-4">
                            <button type="button" class="btn btn-primary btn-lg">
                                <i class="bi bi-check-circle me-2"></i>Enregistrer les modifications
                            </button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Security Settings -->
            <div class="card border-0 shadow-lg mb-4 settings-card" id="security">
                <div class="card-header bg-gradient-light border-0 py-3">
                    <div class="d-flex justify-content-between align-items-center">
                        <h5 class="fw-bold mb-0 d-flex align-items-center">
                            <i class="bi bi-shield-lock me-3 text-primary" style="font-size: 1.3rem;"></i>Sécurité
                        </h5>
                        <span class="badge bg-success">Sécurisé</span>
                    </div>
                </div>
                <div class="card-body p-4">
                    <div class="row g-3">
                        <div class="col-12">
                            <h6 class="fw-semibold mb-3 text-primary border-bottom pb-2">Paramètres de sécurité</h6>
                        </div>
                        <div class="col-12">
                            <div class="security-item">
                                <div class="d-flex justify-content-between align-items-center p-3 bg-light rounded-3">
                                    <div class="d-flex align-items-center">
                                        <div class="security-icon me-3">
                                            <i class="bi bi-key text-primary" style="font-size: 1.5rem;"></i>
                                        </div>
                                        <div>
                                            <h6 class="mb-1 fw-semibold">Mot de passe</h6>
                                            <small class="text-muted">Dernière modification il y a 3 mois</small>
                                        </div>
                                    </div>
                                    <a href="${pageContext.request.contextPath}/pages/partner/profile.jsp" class="btn btn-primary security-btn">
                                        <i class="bi bi-key me-2"></i>Modifier
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="security-item">
                                <div class="d-flex justify-content-between align-items-center p-3 bg-light rounded-3">
                                    <div class="d-flex align-items-center">
                                        <div class="security-icon me-3">
                                            <i class="bi bi-shield-check text-success" style="font-size: 1.5rem;"></i>
                                        </div>
                                        <div>
                                            <h6 class="mb-1 fw-semibold">Authentification à deux facteurs</h6>
                                            <small class="text-muted">Sécurisez votre compte avec 2FA</small>
                                        </div>
                                    </div>
                                    <div class="form-check form-switch">
                                        <input class="form-check-input" type="checkbox" id="2fa">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="security-item">
                                <div class="d-flex justify-content-between align-items-center p-3 bg-light rounded-3">
                                    <div class="d-flex align-items-center">
                                        <div class="security-icon me-3">
                                            <i class="bi bi-eye text-info" style="font-size: 1.5rem;"></i>
                                        </div>
                                        <div>
                                            <h6 class="mb-1 fw-semibold">Sessions actives</h6>
                                            <small class="text-muted">Gérer vos sessions actives</small>
                                        </div>
                                    </div>
                                    <button class="btn btn-outline-primary">
                                        <i class="bi bi-eye me-2"></i>Voir
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
    console.log('Settings page loaded successfully');
    
        // Enhanced smooth scroll navigation
        document.querySelectorAll('.settings-nav-item').forEach(item => {
            item.addEventListener('click', function(e) {
                e.preventDefault();
                const target = this.getAttribute('href');
                const element = document.querySelector(target);
                if (element) {
                    // Calculate offset to align with the top of the left container
                const leftContainer = document.querySelector('.settings-nav-card');
                const leftContainerTop = leftContainer.offsetTop;
                const elementTop = element.offsetTop;
                const offset = elementTop - leftContainerTop;
                
                // Scroll with offset to align with left container
                window.scrollTo({
                    top: window.scrollY + offset,
                    behavior: 'smooth'
                });
                    
                    // Update active state with enhanced styling
                    document.querySelectorAll('.settings-nav-item').forEach(i => i.classList.remove('active'));
                    this.classList.add('active');
                    
                    // Add visual feedback
                    this.style.transform = 'scale(0.98)';
                    setTimeout(() => {
                        this.style.transform = '';
                    }, 150);
                }
            });
        });
    
    // Form handling
    document.querySelectorAll('form').forEach(form => {
        form.addEventListener('submit', function(e) {
            e.preventDefault();
            showSuccessMessage('Paramètres enregistrés avec succès !');
        });
    });
    
    // Button handling
    document.querySelectorAll('button[type="button"]').forEach(btn => {
        btn.addEventListener('click', function() {
            showSuccessMessage('Paramètres enregistrés avec succès !');
        });
    });
    
    // Auto-save functionality for switches
    document.querySelectorAll('.form-check-input').forEach(input => {
        input.addEventListener('change', function() {
            showInfoMessage('Paramètre sauvegardé automatiquement');
        });
    });
});

function showSuccessMessage(message) {
    notificationSystem.success(message);
}

function showInfoMessage(message) {
    notificationSystem.info(message, 2000);
}

// Legacy function for backward compatibility
function showToast(message, type = 'info', duration = 3000) {
    switch(type) {
        case 'success':
            notificationSystem.success(message, duration);
            break;
        case 'info':
        default:
            notificationSystem.info(message, duration);
            break;
    }
}
</script>

<style>
/* Enhanced Navigation Container Styling */
.settings-nav-card.enhanced-nav {
    position: sticky;
    top: 100px;
    border-radius: 1rem !important;
    overflow: hidden;
    box-shadow: 0 15px 35px -5px rgba(0, 0, 0, 0.15);
    border: 1px solid rgba(226, 232, 240, 0.8);
    background: linear-gradient(135deg, #ffffff, #f8fafc);
}

.enhanced-nav .card-header {
    background: linear-gradient(135deg, #1e40af, #1d4ed8, #2563eb) !important;
    border-bottom: 1px solid rgba(255, 255, 255, 0.2);
    position: relative;
    overflow: hidden;
}

.enhanced-nav .card-header::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: linear-gradient(45deg, rgba(255, 255, 255, 0.1), transparent);
    pointer-events: none;
}

.enhanced-nav .card-header h5 {
    position: relative;
    z-index: 2;
}

.enhanced-nav .card-header small {
    position: relative;
    z-index: 2;
}

/* Enhanced Navigation Items */
.enhanced-nav .settings-nav-list .settings-nav-item {
    border: none !important;
    border-left: none !important;
    padding: 1rem 1.5rem !important;
    transition: all 0.3s ease;
    background-color: white !important;
    position: relative;
}

.enhanced-nav .settings-nav-list .settings-nav-item:hover {
    background-color: #f8fafc !important;
    transform: translateX(5px);
}

.enhanced-nav .settings-nav-list .settings-nav-item:hover::before {
    content: '';
    position: absolute;
    left: 0;
    top: 0;
    bottom: 0;
    width: 3px;
    background-color: #2563eb;
}

.enhanced-nav .settings-nav-list .settings-nav-item.active {
    background: linear-gradient(135deg, #eff6ff 0%, #dbeafe 100%) !important;
}

.enhanced-nav .settings-nav-list .settings-nav-item.active::before {
    content: '';
    position: absolute;
    left: 0;
    top: 0;
    bottom: 0;
    width: 3px;
    background-color: #2563eb;
}

/* Navigation Icon Wrapper */
.nav-icon-wrapper {
    width: 40px;
    height: 40px;
    border-radius: 0.5rem;
    background: linear-gradient(135deg, #eff6ff, #dbeafe);
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 1.2rem;
    color: #2563eb;
}

.enhanced-nav .settings-nav-item.active .nav-icon-wrapper {
    background: linear-gradient(135deg, #2563eb, #1d4ed8);
    color: white;
}

/* Navigation Content */
.nav-content .nav-title {
    font-weight: 600;
    color: #1e293b;
    font-size: 0.95rem;
}

.nav-content .nav-subtitle {
    color: #64748b;
    font-size: 0.8rem;
}

/* Navigation Arrow */
.nav-arrow {
    color: #cbd5e1;
    transition: all 0.3s ease;
}

.enhanced-nav .settings-nav-item:hover .nav-arrow,
.enhanced-nav .settings-nav-item.active .nav-arrow {
    color: #2563eb;
    transform: translateX(5px);
}

.settings-card {
    border-radius: 1rem !important;
    transition: all 0.3s ease;
    overflow: hidden;
    border: 1px solid #e5e7eb;
    background: white;
}

.settings-card:hover {
    box-shadow: 0 20px 60px -10px rgba(0, 0, 0, 0.15) !important;
    transform: translateY(-3px);
    border-color: #d1d5db;
}

.settings-card .card-header {
    border-bottom: 1px solid #e5e7eb;
    background: linear-gradient(135deg, #ffffff, #f8fafc) !important;
}

.bg-gradient-light {
    background: linear-gradient(135deg, #ffffff, #f8fafc) !important;
}

/* Custom Select Styling */
.custom-select {
    padding: 1rem 1.25rem;
    border: 2px solid #e5e7eb;
    background: linear-gradient(135deg, #ffffff, #f8fafc);
    color: #374151;
    border-radius: 0.75rem;
    font-size: 1rem;
    font-weight: 500;
    transition: all 0.3s ease;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
    background-image: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' viewBox='0 0 16 16'%3e%3cpath fill='none' stroke='%236b7280' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='m1 6 7 7 7-7'/%3e%3c/svg%3e");
    background-repeat: no-repeat;
    background-position: right 1rem center;
    background-size: 16px 12px;
    appearance: none;
    -webkit-appearance: none;
    -moz-appearance: none;
    min-height: 3.5rem;
}

.custom-select:hover {
    border-color: #3b82f6;
    background: linear-gradient(135deg, #ffffff, #f0f9ff);
    box-shadow: 0 4px 12px rgba(59, 130, 246, 0.1);
    transform: translateY(-1px);
}

.custom-select:focus {
    border-color: #2563eb;
    background: #ffffff;
    box-shadow: 0 0 0 4px rgba(37, 99, 235, 0.1), 0 4px 12px rgba(59, 130, 246, 0.15);
    outline: none;
    transform: translateY(-1px);
}

.custom-select option {
    background-color: #ffffff;
    color: #374151;
    padding: 0.75rem;
    font-weight: 500;
}

/* Form Label Styling */
.form-label {
    font-size: 1rem;
    margin-bottom: 0.75rem;
    color: #374151;
}

.form-label i {
    font-size: 1.1rem;
}

/* General Form Enhancements */
.form-select, .form-control {
    border: 2px solid #e5e7eb;
    background-color: #ffffff;
    color: #374151;
    border-radius: 0.75rem;
    padding: 0.75rem 1rem;
    transition: all 0.3s ease;
}

.form-select:hover, .form-control:hover {
    border-color: #3b82f6;
    background-color: #f8fafc;
}

.form-select:focus, .form-control:focus {
    border-color: #2563eb;
    box-shadow: 0 0 0 4px rgba(37, 99, 235, 0.1);
    background-color: #ffffff;
    outline: none;
}

/* Enhanced Modern Switch Toggles */
.form-check-input {
    width: 2.75rem !important;
    height: 1.625rem !important;
    border-radius: 0.875rem !important;
    border: 2px solid #e5e7eb !important;
    background: linear-gradient(135deg, #f3f4f6, #e5e7eb) !important;
    transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1) !important;
    appearance: none !important;
    -webkit-appearance: none !important;
    -moz-appearance: none !important;
    position: relative !important;
    cursor: pointer !important;
    box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.1) !important;
}

.form-check-input::before {
    content: '';
    position: absolute;
    top: 1.5px;
    left: 1.5px;
    width: 1.25rem;
    height: 1.25rem;
    border-radius: 50%;
    background: linear-gradient(135deg, #ffffff, #f8fafc);
    transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
    box-shadow: 0 2px 6px rgba(0, 0, 0, 0.15), 0 1px 2px rgba(0, 0, 0, 0.1);
}

.form-check-input:checked {
    background: linear-gradient(135deg, #2563eb, #1d4ed8) !important;
    border-color: #2563eb !important;
    box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.1), 0 0 0 3px rgba(37, 99, 235, 0.1) !important;
}

.form-check-input:checked::before {
    transform: translateX(1.25rem);
    background: linear-gradient(135deg, #ffffff, #f0f9ff);
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2), 0 1px 3px rgba(0, 0, 0, 0.1);
}

.form-check-input:hover {
    border-color: #3b82f6 !important;
    box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.1), 0 0 0 3px rgba(59, 130, 246, 0.1) !important;
    transform: scale(1.02) !important;
}

.form-check-input:checked:hover {
    background: linear-gradient(135deg, #1d4ed8, #1e40af) !important;
    border-color: #1d4ed8 !important;
    box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.1), 0 0 0 3px rgba(29, 78, 216, 0.15) !important;
}

.form-check-input:focus {
    outline: none !important;
    box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.1), 0 0 0 4px rgba(37, 99, 235, 0.2) !important;
}

.form-check-input:active {
    transform: scale(0.98) !important;
}

/* Enhanced switch labels */
.form-check-label {
    font-weight: 600 !important;
    color: #374151 !important;
    transition: all 0.3s ease !important;
    cursor: pointer !important;
}

.form-check-input:checked + .form-check-label {
    color: #1e40af !important;
}

/* Specific targeting for all switches */
.notification-item .form-check-input,
.security-item .form-check-input {
    width: 2.75rem !important;
    height: 1.625rem !important;
    border-radius: 0.875rem !important;
    border: 2px solid #e5e7eb !important;
    background: linear-gradient(135deg, #f3f4f6, #e5e7eb) !important;
    transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1) !important;
    cursor: pointer !important;
    position: relative !important;
}

.notification-item .form-check-input:checked,
.security-item .form-check-input:checked {
    background: linear-gradient(135deg, #2563eb, #1d4ed8) !important;
    border-color: #2563eb !important;
    box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.1), 0 0 0 3px rgba(37, 99, 235, 0.1) !important;
}

.notification-item .form-check-input:hover,
.security-item .form-check-input:hover {
    border-color: #3b82f6 !important;
    transform: scale(1.02) !important;
}

.notification-item .form-check-input:focus,
.security-item .form-check-input:focus {
    box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.1), 0 0 0 4px rgba(37, 99, 235, 0.2) !important;
}

/* Notification Items - Simplified - Only for settings page */
#notifications .notification-item {
    padding: 1rem;
    background: #ffffff;
    border: 2px solid #e5e7eb;
    border-radius: 0.75rem;
    margin-bottom: 0.75rem;
    transition: all 0.3s ease;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
}

#notifications .notification-item:hover {
    border-color: #3b82f6;
    box-shadow: 0 4px 12px rgba(59, 130, 246, 0.1);
    transform: translateY(-1px);
    background-color: #ffffff;
}

#notifications .notification-item .form-check-label {
    color: #374151;
    font-weight: 600;
}

#notifications .notification-description {
    margin-top: 0.5rem;
}

#notifications .notification-description small {
    color: #6b7280;
    font-weight: 500;
}

/* Remove any background images or overlays - Only for settings page notification items */
#notifications .notification-item,
#notifications .notification-item *,
#notifications .notification-item:hover,
#notifications .notification-item:hover * {
    background-image: none !important;
    background-color: #ffffff !important;
}

#notifications .notification-item .form-check,
#notifications .notification-item .form-check-input,
#notifications .notification-item .form-check-label,
#notifications .notification-item .notification-description {
    background: transparent !important;
    background-image: none !important;
}

/* Security Items - Matching Notification Style */
.security-item {
    transition: all 0.3s ease;
}

.security-item .bg-light {
    background-color: #ffffff !important;
    border: 2px solid #e5e7eb;
    border-radius: 0.75rem;
    transition: all 0.3s ease;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
}

.security-item:hover .bg-light {
    border-color: #3b82f6;
    background-color: #ffffff !important;
    box-shadow: 0 4px 12px rgba(59, 130, 246, 0.1);
    transform: translateY(-1px);
}

/* Remove any background images or overlays from security items */
.security-item,
.security-item *,
.security-item:hover,
.security-item:hover * {
    background-image: none !important;
}

.security-item .bg-light,
.security-item .bg-light * {
    background-image: none !important;
}

/* Security Button Styling */
.security-btn {
    background: linear-gradient(135deg, #2563eb, #1d4ed8) !important;
    border: 2px solid #2563eb !important;
    border-color: #2563eb !important;
    color: white !important;
    font-weight: 500 !important;
    padding: 0.5rem 1rem !important;
    border-radius: 0.5rem !important;
    text-decoration: none !important;
    transition: all 0.3s ease !important;
    display: inline-block !important;
    background-image: none !important;
    background-color: #2563eb !important;
}

.security-btn:hover {
    background: linear-gradient(135deg, #1d4ed8, #1e40af) !important;
    border-color: #1d4ed8 !important;
    color: white !important;
    transform: translateY(-2px) !important;
    box-shadow: 0 8px 25px -5px rgba(37, 99, 235, 0.3) !important;
    text-decoration: none !important;
}

.security-btn:focus {
    background: linear-gradient(135deg, #1d4ed8, #1e40af) !important;
    border-color: #1d4ed8 !important;
    color: white !important;
    box-shadow: 0 0 0 4px rgba(37, 99, 235, 0.1) !important;
    text-decoration: none !important;
}

.security-btn i {
    color: white !important;
}

/* Force button styling to override any conflicting CSS */
.security-item .security-btn,
.security-item a.security-btn,
.security-item .btn.security-btn {
    background: #2563eb !important;
    background-color: #2563eb !important;
    background-image: linear-gradient(135deg, #2563eb, #1d4ed8) !important;
    border: 2px solid #2563eb !important;
    color: white !important;
    text-decoration: none !important;
}

.security-item .security-btn:link,
.security-item .security-btn:visited {
    background: #2563eb !important;
    background-color: #2563eb !important;
    color: white !important;
    text-decoration: none !important;
}

.security-item .security-btn:active {
    background: #1d4ed8 !important;
    background-color: #1d4ed8 !important;
    color: white !important;
}

.security-icon {
    width: 50px;
    height: 50px;
    border-radius: 50%;
    background: rgba(37, 99, 235, 0.1);
    display: flex;
    align-items: center;
    justify-content: center;
}

/* Notification Icons - Matching Security Style */
.notification-icon {
    width: 50px;
    height: 50px;
    border-radius: 50%;
    background: rgba(37, 99, 235, 0.1);
    display: flex;
    align-items: center;
    justify-content: center;
}

/* Button Enhancements */
.btn {
    border-radius: 0.75rem;
    padding: 0.75rem 1.5rem;
    font-weight: 500;
    transition: all 0.3s ease;
    border: 2px solid transparent;
}

.btn-primary {
    background: linear-gradient(135deg, #2563eb, #1d4ed8);
    border-color: #2563eb;
    color: white;
}

.btn-primary:hover {
    background: linear-gradient(135deg, #1d4ed8, #1e40af);
    border-color: #1d4ed8;
    transform: translateY(-2px);
    box-shadow: 0 10px 25px -5px rgba(37, 99, 235, 0.3);
}

.btn-outline-primary {
    border-color: #2563eb;
    color: #2563eb;
    background-color: transparent;
}

.btn-outline-primary:hover {
    background-color: #2563eb;
    border-color: #2563eb;
    color: white;
    transform: translateY(-2px);
    box-shadow: 0 8px 25px -5px rgba(37, 99, 235, 0.2);
}

.btn-outline-secondary {
    border-color: #6b7280;
    color: #6b7280;
    background-color: transparent;
}

.btn-outline-secondary:hover {
    background-color: #6b7280;
    border-color: #6b7280;
    color: white;
    transform: translateY(-2px);
    box-shadow: 0 8px 25px -5px rgba(107, 114, 128, 0.2);
}

.btn-lg {
    padding: 1rem 2rem;
    font-size: 1.1rem;
}

/* Section Headers */
h6.text-primary {
    color: #1e40af !important;
    font-weight: 600;
    font-size: 1.1rem;
}

h6.text-primary.border-bottom {
    border-bottom: 2px solid #e5e7eb !important;
    padding-bottom: 0.75rem;
}

/* Badge Styling */
.badge {
    font-size: 0.8rem;
    padding: 0.5rem 1rem;
    border-radius: 0.75rem;
    font-weight: 500;
}

.badge.bg-success {
    background: linear-gradient(135deg, #10b981, #059669) !important;
    color: white;
}

.badge.bg-info {
    background: linear-gradient(135deg, #06b6d4, #0891b2) !important;
    color: white;
}

.badge.bg-warning {
    background: linear-gradient(135deg, #f59e0b, #d97706) !important;
    color: white;
}

/* Animation for page load */
.settings-card {
    animation: fadeInUp 0.6s ease-out;
}

@keyframes fadeInUp {
    from {
        opacity: 0;
        transform: translateY(30px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

/* Text and Color Improvements */
.text-muted {
    color: #6b7280 !important;
}

.fw-semibold {
    color: #374151 !important;
}

.fw-bold {
    color: #111827 !important;
}

/* Icon Colors */
.bi.text-primary {
    color: #2563eb !important;
}

.bi.text-success {
    color: #10b981 !important;
}

.bi.text-warning {
    color: #f59e0b !important;
}

.bi.text-info {
    color: #06b6d4 !important;
}

/* Background Improvements */
body {
    background-color: #f9fafb;
}

.container {
    background-color: transparent;
}

/* Card Text Improvements */
.settings-card .card-body {
    color: #374151;
}

.settings-card .card-body h6 {
    color: #1f2937 !important;
}

.settings-card .card-body small {
    color: #6b7280 !important;
}

/* Responsive adjustments */
@media (max-width: 768px) {
    .settings-nav-card {
        position: relative;
        top: auto;
        margin-bottom: 2rem;
    }
    
    .settings-card .card-body {
        padding: 1.5rem !important;
    }
}
</style>

<%@ include file="../../layouts/footer.jsp" %>
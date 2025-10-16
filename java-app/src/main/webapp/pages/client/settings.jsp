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
                <a href="${pageContext.request.contextPath}/pages/client/dashboard.jsp">
                    <i class="bi bi-house me-1"></i>Tableau de bord
                </a>
            </li>
            <li class="breadcrumb-item active">Paramètres</li>
        </ol>
    </nav>

    <div class="row">
        <div class="col-lg-3 mb-4">
            <!-- Settings Navigation -->
            <div class="card border-0 shadow-lg settings-nav-card">
                <div class="card-header bg-gradient-primary text-white border-0 py-4">
                    <h5 class="fw-bold mb-0 d-flex align-items-center">
                        <i class="bi bi-gear me-3" style="font-size: 1.2rem;"></i>Paramètres
                    </h5>
                </div>
                <div class="list-group list-group-flush settings-nav-list">
                    <a href="#account" class="list-group-item list-group-item-action settings-nav-item active">
                        <i class="bi bi-person-circle me-3"></i>Compte
                        <i class="bi bi-chevron-right ms-auto"></i>
                    </a>
                    <a href="#notifications" class="list-group-item list-group-item-action settings-nav-item">
                        <i class="bi bi-bell me-3"></i>Notifications
                        <i class="bi bi-chevron-right ms-auto"></i>
                    </a>
                    <a href="#security" class="list-group-item list-group-item-action settings-nav-item">
                        <i class="bi bi-shield-lock me-3"></i>Sécurité
                        <i class="bi bi-chevron-right ms-auto"></i>
                    </a>
                </div>
            </div>
        </div>

        <div class="col-lg-9">
            <!-- Account Settings -->
            <div class="card border-0 shadow-lg mb-4 settings-card" id="account">
                <div class="card-header bg-gradient-light border-0 py-4">
                    <div class="d-flex justify-content-between align-items-center">
                        <h5 class="fw-bold mb-0 d-flex align-items-center">
                            <i class="bi bi-person-circle me-3 text-primary" style="font-size: 1.3rem;"></i>Paramètres du compte
                        </h5>
                        <span class="badge bg-success">Actif</span>
                    </div>
                </div>
                <div class="card-body p-5">
                    <form>
                        <div class="row g-4">
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
                <div class="card-header bg-gradient-light border-0 py-4">
                    <div class="d-flex justify-content-between align-items-center">
                        <h5 class="fw-bold mb-0 d-flex align-items-center">
                            <i class="bi bi-bell me-3 text-primary" style="font-size: 1.3rem;"></i>Notifications
                        </h5>
                        <span class="badge bg-info">3 actives</span>
                    </div>
                </div>
                <div class="card-body p-5">
                    <div class="row g-4">
                        <div class="col-12">
                            <h6 class="fw-semibold mb-3 text-primary border-bottom pb-2">Préférences de notification</h6>
                        </div>
                        <div class="col-12">
                            <div class="notification-item">
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" id="emailNotif" checked>
                                    <label class="form-check-label fw-semibold" for="emailNotif">
                                        <i class="bi bi-envelope me-2 text-primary"></i>Notifications par email
                                    </label>
                                    <div class="notification-description">
                                        <small class="text-muted">Recevoir les mises à jour par email</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="notification-item">
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" id="smsNotif">
                                    <label class="form-check-label fw-semibold" for="smsNotif">
                                        <i class="bi bi-phone me-2 text-success"></i>Notifications SMS
                                    </label>
                                    <div class="notification-description">
                                        <small class="text-muted">Recevoir les alertes par SMS</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="notification-item">
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" id="reservationNotif" checked>
                                    <label class="form-check-label fw-semibold" for="reservationNotif">
                                        <i class="bi bi-calendar-check me-2 text-warning"></i>Rappels de réservation
                                    </label>
                                    <div class="notification-description">
                                        <small class="text-muted">Rappels avant le début et la fin des réservations</small>
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
                <div class="card-header bg-gradient-light border-0 py-4">
                    <div class="d-flex justify-content-between align-items-center">
                        <h5 class="fw-bold mb-0 d-flex align-items-center">
                            <i class="bi bi-shield-lock me-3 text-primary" style="font-size: 1.3rem;"></i>Sécurité
                        </h5>
                        <span class="badge bg-success">Sécurisé</span>
                    </div>
                </div>
                <div class="card-body p-5">
                    <div class="row g-4">
                        <div class="col-12">
                            <h6 class="fw-semibold mb-3 text-primary border-bottom pb-2">Paramètres de sécurité</h6>
                        </div>
                        <div class="col-12">
                            <div class="security-item">
                                <div class="d-flex justify-content-between align-items-center p-4 bg-light rounded-3">
                                    <div class="d-flex align-items-center">
                                        <div class="security-icon me-3">
                                            <i class="bi bi-key text-primary" style="font-size: 1.5rem;"></i>
                                        </div>
                                        <div>
                                            <h6 class="mb-1 fw-semibold">Mot de passe</h6>
                                            <small class="text-muted">Dernière modification il y a 3 mois</small>
                                        </div>
                                    </div>
                                    <a href="${pageContext.request.contextPath}/pages/client/profile.jsp" class="btn btn-primary security-btn">
                                        <i class="bi bi-key me-2"></i>Modifier
                                    </a>
                                </div>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="security-item">
                                <div class="d-flex justify-content-between align-items-center p-4 bg-light rounded-3">
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
                                <div class="d-flex justify-content-between align-items-center p-4 bg-light rounded-3">
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
    
    // Smooth scroll navigation
    document.querySelectorAll('.list-group-item').forEach(item => {
        item.addEventListener('click', function(e) {
            e.preventDefault();
            const target = this.getAttribute('href');
            const element = document.querySelector(target);
            if (element) {
                element.scrollIntoView({ behavior: 'smooth', block: 'start' });
                
                // Update active state
                document.querySelectorAll('.list-group-item').forEach(i => i.classList.remove('active'));
                this.classList.add('active');
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
    showToast(message, 'success');
}

function showInfoMessage(message) {
    showToast(message, 'info', 2000);
}

function showToast(message, type = 'info', duration = 3000) {
    // Create toast element
    const toast = document.createElement('div');
    toast.className = `alert alert-${type} position-fixed`;
    toast.style.cssText = 'top: 20px; right: 20px; z-index: 9999; min-width: 300px; max-width: 400px;';
    
    const icon = type === 'success' ? 'check-circle' : 'info-circle';
    toast.innerHTML = `
        <div class="d-flex align-items-center">
            <i class="bi bi-${icon} me-2"></i>
            ${message}
            <button type="button" class="btn-close ms-auto" onclick="this.parentElement.parentElement.remove()"></button>
        </div>
    `;
    
    document.body.appendChild(toast);
    
    // Auto remove
    setTimeout(() => {
        if (toast.parentElement) {
            toast.remove();
        }
    }, duration);
}
</script>

<style>
/* Settings Page Enhanced Styling */
.settings-nav-card {
    position: sticky;
    top: 100px;
    border-radius: 1rem !important;
    overflow: hidden;
    box-shadow: 0 10px 25px -5px rgba(0, 0, 0, 0.1);
}

.settings-nav-card .card-header {
    background: linear-gradient(135deg, #2563eb, #1d4ed8) !important;
    border-bottom: 1px solid rgba(255, 255, 255, 0.1);
}

.settings-nav-list .settings-nav-item {
    border: none !important;
    padding: 1.25rem 1.5rem !important;
    transition: all 0.3s ease;
    position: relative;
    display: flex !important;
    align-items: center !important;
    justify-content: space-between !important;
    color: #374151;
    font-weight: 500;
}

.settings-nav-list .settings-nav-item:hover {
    background: linear-gradient(135deg, #eff6ff, #dbeafe) !important;
    color: #1e40af !important;
    transform: translateX(6px);
    border-left: 3px solid #3b82f6;
}

.settings-nav-list .settings-nav-item.active {
    background: linear-gradient(135deg, #2563eb, #1d4ed8) !important;
    color: white !important;
    font-weight: 600;
    border-left: 4px solid white;
}

.settings-nav-list .settings-nav-item.active::before {
    content: '';
    position: absolute;
    left: 0;
    top: 0;
    bottom: 0;
    width: 4px;
    background: white;
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

/* Enhanced Switches */
.form-check-input {
    width: 3.5rem;
    height: 1.75rem;
    border-radius: 1rem;
    border: 2px solid #d1d5db;
    background-color: #f3f4f6;
    transition: all 0.3s ease;
}

.form-check-input:checked {
    background-color: #2563eb;
    border-color: #2563eb;
}

.form-check-input:focus {
    box-shadow: 0 0 0 0.25rem rgba(37, 99, 235, 0.1);
}

/* Notification Items - Simplified */
.notification-item {
    padding: 1.5rem;
    background: #ffffff;
    border: 2px solid #e5e7eb;
    border-radius: 0.75rem;
    margin-bottom: 1rem;
    transition: all 0.3s ease;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
}

.notification-item:hover {
    border-color: #3b82f6;
    box-shadow: 0 4px 12px rgba(59, 130, 246, 0.1);
    transform: translateY(-1px);
    background-color: #ffffff;
}

.notification-item .form-check-label {
    color: #374151;
    font-weight: 600;
}

.notification-description {
    margin-top: 0.5rem;
}

.notification-description small {
    color: #6b7280;
    font-weight: 500;
}

/* Remove any background images or overlays */
.notification-item,
.notification-item *,
.notification-item:hover,
.notification-item:hover * {
    background-image: none !important;
    background-color: #ffffff !important;
}

.notification-item .form-check,
.notification-item .form-check-input,
.notification-item .form-check-label,
.notification-item .notification-description {
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

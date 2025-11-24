<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setAttribute("pageTitle", "Mon Profil - YOURS");
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
            <li class="breadcrumb-item active">Mon Profil</li>
        </ol>
    </nav>

    <div class="row">
        <div class="col-lg-3 mb-4">
            <!-- Profile Navigation -->
            <div class="card border-0 shadow-lg profile-nav-card enhanced-nav">
                <div class="card-header bg-gradient-primary text-white border-0 py-4">
                    <h5 class="fw-bold mb-0 d-flex align-items-center">
                        <i class="bi bi-person-circle me-3" style="font-size: 1.2rem;"></i>Mon Profil
                    </h5>
                    <small class="text-white-50 mt-1">Gérez vos informations</small>
                </div>
                <div class="list-group list-group-flush profile-nav-list">
                    <a href="#personal-info" class="list-group-item list-group-item-action profile-nav-item active" data-section="personal-info">
                        <div class="d-flex align-items-center">
                            <div class="nav-icon-wrapper me-3">
                                <i class="bi bi-person"></i>
                            </div>
                            <div class="nav-content">
                                <div class="nav-title">Informations</div>
                                <small class="nav-subtitle">Données personnelles</small>
                            </div>
                            <i class="bi bi-chevron-right ms-auto nav-arrow"></i>
                        </div>
                    </a>
                    <a href="#password-change" class="list-group-item list-group-item-action profile-nav-item" data-section="password-change">
                        <div class="d-flex align-items-center">
                            <div class="nav-icon-wrapper me-3">
                                <i class="bi bi-key"></i>
                            </div>
                            <div class="nav-content">
                                <div class="nav-title">Mot de passe</div>
                                <small class="nav-subtitle">Sécurité du compte</small>
                            </div>
                            <i class="bi bi-chevron-right ms-auto nav-arrow"></i>
                        </div>
                    </a>
                </div>
            </div>
        </div>

        <div class="col-lg-9">
            <!-- Personal Information -->
            <div class="card border-0 shadow-lg mb-4 profile-card" id="personal-info">
                <div class="card-header bg-gradient-light border-0 py-3">
                    <div class="d-flex justify-content-between align-items-center">
                        <h5 class="fw-bold mb-0 d-flex align-items-center">
                            <i class="bi bi-person-circle me-3 text-primary" style="font-size: 1.3rem;"></i>Informations personnelles
                        </h5>
                        <span class="badge bg-success">Actif</span>
                    </div>
                </div>
                <div class="card-body p-4">
                    <form id="profileForm">
                        <div class="row g-3">
                            <div class="col-12">
                                <h6 class="fw-semibold mb-3 text-primary border-bottom pb-2">Détails personnels</h6>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-semibold mb-3 d-flex align-items-center">
                                    <i class="bi bi-person me-2 text-primary"></i>Prénom
                                </label>
                                <input type="text" class="form-control custom-input" id="prenom" name="prenom" required>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-semibold mb-3 d-flex align-items-center">
                                    <i class="bi bi-person-badge me-2 text-primary"></i>Nom
                                </label>
                                <input type="text" class="form-control custom-input" id="nom" name="nom" required>
                            </div>
                            <div class="col-12">
                                <label class="form-label fw-semibold mb-3 d-flex align-items-center">
                                    <i class="bi bi-envelope me-2 text-primary"></i>Email
                                </label>
                                <input type="email" class="form-control custom-input" id="email" name="mail" required>
                            </div>
                            <div class="col-12">
                                <label class="form-label fw-semibold mb-3 d-flex align-items-center">
                                    <i class="bi bi-telephone me-2 text-primary"></i>Téléphone
                                </label>
                                <input type="tel" class="form-control custom-input" id="telephone" name="numTelephone" required>
                            </div>
                            <div class="col-12 mt-4">
                                <div class="d-flex gap-3">
                                    <button type="submit" class="btn btn-primary btn-lg">
                                        <i class="bi bi-check-circle me-2"></i>Enregistrer les modifications
                                    </button>
                                    <button type="button" class="btn btn-outline-secondary btn-lg" onclick="resetForm()">
                                        <i class="bi bi-arrow-clockwise me-2"></i>Réinitialiser
                                    </button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <!-- Password Change -->
            <div class="card border-0 shadow-lg mb-4 profile-card" id="password-change">
                <div class="card-header bg-gradient-light border-0 py-3">
                    <div class="d-flex justify-content-between align-items-center">
                        <h5 class="fw-bold mb-0 d-flex align-items-center">
                            <i class="bi bi-key me-3 text-primary" style="font-size: 1.3rem;"></i>Changer le mot de passe
                        </h5>
                        <span class="badge bg-info">Sécurisé</span>
                    </div>
                </div>
                <div class="card-body p-4">
                    <div class="row g-3">
                        <div class="col-12">
                            <h6 class="fw-semibold mb-3 text-primary border-bottom pb-2">Sécurité du compte</h6>
                        </div>
                        <div class="col-12">
                            <label class="form-label fw-semibold mb-3 d-flex align-items-center">
                                <i class="bi bi-lock me-2 text-primary"></i>Mot de passe actuel
                            </label>
                            <input type="password" class="form-control custom-input" id="currentPassword" placeholder="Entrez votre mot de passe actuel">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-semibold mb-3 d-flex align-items-center">
                                <i class="bi bi-shield-lock me-2 text-primary"></i>Nouveau mot de passe
                            </label>
                            <input type="password" class="form-control custom-input" id="newPassword" placeholder="Nouveau mot de passe">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-semibold mb-3 d-flex align-items-center">
                                <i class="bi bi-shield-check me-2 text-primary"></i>Confirmer le mot de passe
                            </label>
                            <input type="password" class="form-control custom-input" id="confirmPassword" placeholder="Confirmez le nouveau mot de passe">
                        </div>
                        <div class="col-12 mt-4">
                            <button type="button" class="btn btn-primary btn-lg" onclick="changePassword()">
                                <i class="bi bi-key me-2"></i>Changer le mot de passe
                            </button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
    console.log('Profile page loaded successfully');
    
    // Load user data from session storage
    loadUserData();
    
    // Enhanced smooth scroll navigation
    document.querySelectorAll('.profile-nav-item').forEach(item => {
        item.addEventListener('click', function(e) {
            e.preventDefault();
            const target = this.getAttribute('href');
            const element = document.querySelector(target);
            if (element) {
                // Calculate offset to align with the top of the left container
                const leftContainer = document.querySelector('.profile-nav-card');
                const leftContainerTop = leftContainer.offsetTop;
                const elementTop = element.offsetTop;
                const offset = elementTop - leftContainerTop;
                
                // Scroll with offset to align with left container
                window.scrollTo({
                    top: window.scrollY + offset,
                    behavior: 'smooth'
                });
                
                // Update active state with enhanced styling
                document.querySelectorAll('.profile-nav-item').forEach(i => i.classList.remove('active'));
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
    document.getElementById('profileForm').addEventListener('submit', function(e) {
        e.preventDefault();
        
        // Get form data
        const formData = new FormData(this);
        const userData = {};
        for (let [key, value] of formData.entries()) {
            userData[key] = value;
        }
        
        // Update user data in session storage
        updateUserData(userData);
        
        // Simulate form submission
        const submitBtn = this.querySelector('button[type="submit"]');
        const originalText = submitBtn.innerHTML;
        
        submitBtn.innerHTML = '<i class="bi bi-hourglass-split me-2"></i>Enregistrement...';
        submitBtn.disabled = true;
        
        setTimeout(() => {
            showSuccessMessage('Profil mis à jour avec succès !');
            submitBtn.innerHTML = originalText;
            submitBtn.disabled = false;
        }, 2000);
    });
});

function loadUserData() {
    try {
        // Try to get user data from localStorage first, then sessionStorage
        let userData = localStorage.getItem('yours_user');
        if (!userData) {
            userData = sessionStorage.getItem('yours_user');
        }
        
        if (userData) {
            const user = JSON.parse(userData);
            console.log('Loaded user data:', user);
            
            // Populate form fields with user data
            document.getElementById('prenom').value = user.prenom || '';
            document.getElementById('nom').value = user.nom || '';
            document.getElementById('email').value = user.mail || '';
            document.getElementById('telephone').value = user.numTelephone || '';
            
            // Update page title with user's name
            if (user.prenom && user.nom) {
                document.title = `Profil de ${user.prenom} ${user.nom} - YOURS`;
            }
        } else {
            console.log('No user data found in storage');
            // If no user data, redirect to login
            showErrorMessage('Session expirée. Veuillez vous reconnecter.');
            setTimeout(() => {
                window.location.href = '${pageContext.request.contextPath}/pages/auth/login.jsp';
            }, 2000);
        }
    } catch (error) {
        console.error('Error loading user data:', error);
        showErrorMessage('Erreur lors du chargement des données utilisateur.');
    }
}

function updateUserData(formData) {
    try {
        // Get current user data
        let userData = localStorage.getItem('yours_user');
        if (!userData) {
            userData = sessionStorage.getItem('yours_user');
        }
        
        if (userData) {
            const user = JSON.parse(userData);
            
            // Update user data with form values
            user.prenom = formData.prenom || user.prenom;
            user.nom = formData.nom || user.nom;
            user.mail = formData.mail || user.mail;
            user.numTelephone = formData.numTelephone || user.numTelephone;
            
            // Save updated user data back to storage
            const updatedUserData = JSON.stringify(user);
            if (localStorage.getItem('yours_user')) {
                localStorage.setItem('yours_user', updatedUserData);
            } else {
                sessionStorage.setItem('yours_user', updatedUserData);
            }
            
            console.log('User data updated successfully');
        }
    } catch (error) {
        console.error('Error updating user data:', error);
        showErrorMessage('Erreur lors de la mise à jour des données.');
    }
}

function resetForm() {
    if (confirm('Êtes-vous sûr de vouloir réinitialiser le formulaire ? Toutes les modifications non sauvegardées seront perdues.')) {
        // Reload user data instead of just clearing the form
        loadUserData();
        showInfoMessage('Formulaire réinitialisé avec les données sauvegardées');
    }
}

function changePassword() {
    const currentPassword = document.getElementById('currentPassword').value;
    const newPassword = document.getElementById('newPassword').value;
    const confirmPassword = document.getElementById('confirmPassword').value;
    
    if (!currentPassword || !newPassword || !confirmPassword) {
        showErrorMessage('Veuillez remplir tous les champs');
        return;
    }
    
    if (newPassword !== confirmPassword) {
        showErrorMessage('Les mots de passe ne correspondent pas');
        return;
    }
    
    if (newPassword.length < 6) {
        showErrorMessage('Le mot de passe doit contenir au moins 6 caractères');
        return;
    }
    
    // Simulate password change
    const btn = event.target;
    const originalText = btn.innerHTML;
    
    btn.innerHTML = '<i class="bi bi-hourglass-split me-2"></i>Changement en cours...';
    btn.disabled = true;
    
    setTimeout(() => {
        showSuccessMessage('Mot de passe changé avec succès !');
        btn.innerHTML = originalText;
        btn.disabled = false;
        
        // Clear password fields
        document.getElementById('currentPassword').value = '';
        document.getElementById('newPassword').value = '';
        document.getElementById('confirmPassword').value = '';
    }, 2000);
}

function showSuccessMessage(message) {
    notificationSystem.success(message);
}

function showInfoMessage(message) {
    notificationSystem.info(message, 2000);
}

function showErrorMessage(message) {
    notificationSystem.error(message, 4000);
}

// Legacy function for backward compatibility
function showToast(message, type = 'info', duration = 3000) {
    switch(type) {
        case 'success':
            notificationSystem.success(message, duration);
            break;
        case 'danger':
            notificationSystem.error(message, duration);
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
.profile-nav-card.enhanced-nav {
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
.enhanced-nav .profile-nav-list .profile-nav-item {
    border: none !important;
    border-left: none !important;
    padding: 1rem 1.5rem !important;
    transition: all 0.3s ease;
    background-color: white !important;
    position: relative;
}

.enhanced-nav .profile-nav-list .profile-nav-item:hover {
    background-color: #f8fafc !important;
    transform: translateX(5px);
}

.enhanced-nav .profile-nav-list .profile-nav-item:hover::before {
    content: '';
    position: absolute;
    left: 0;
    top: 0;
    bottom: 0;
    width: 3px;
    background-color: #2563eb;
}

.enhanced-nav .profile-nav-list .profile-nav-item.active {
    background: linear-gradient(135deg, #eff6ff 0%, #dbeafe 100%) !important;
}

.enhanced-nav .profile-nav-list .profile-nav-item.active::before {
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

.enhanced-nav .profile-nav-item.active .nav-icon-wrapper {
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

.enhanced-nav .profile-nav-item:hover .nav-arrow,
.enhanced-nav .profile-nav-item.active .nav-arrow {
    color: #2563eb;
    transform: translateX(5px);
}

.profile-card {
    border-radius: 1rem !important;
    transition: all 0.3s ease;
    overflow: hidden;
    border: 1px solid #e5e7eb;
    background: white;
}

.profile-card:hover {
    box-shadow: 0 20px 60px -10px rgba(0, 0, 0, 0.15) !important;
    transform: translateY(-3px);
    border-color: #d1d5db;
}

.profile-card .card-header {
    border-bottom: 1px solid #e5e7eb;
    background: linear-gradient(135deg, #ffffff, #f8fafc) !important;
}

.bg-gradient-light {
    background: linear-gradient(135deg, #ffffff, #f8fafc) !important;
}

/* Custom Input Styling */
.custom-input, .custom-textarea {
    padding: 1rem 1.25rem;
    border: 2px solid #e5e7eb;
    background: linear-gradient(135deg, #ffffff, #f8fafc);
    color: #374151;
    border-radius: 0.75rem;
    font-size: 1rem;
    font-weight: 500;
    transition: all 0.3s ease;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
    min-height: 3.5rem;
}

.custom-input:hover, .custom-textarea:hover {
    border-color: #3b82f6;
    background: linear-gradient(135deg, #ffffff, #f0f9ff);
    box-shadow: 0 4px 12px rgba(59, 130, 246, 0.1);
    transform: translateY(-1px);
}

.custom-input:focus, .custom-textarea:focus {
    border-color: #2563eb;
    background: #ffffff;
    box-shadow: 0 0 0 4px rgba(37, 99, 235, 0.1), 0 4px 12px rgba(59, 130, 246, 0.15);
    outline: none;
    transform: translateY(-1px);
}

.custom-textarea {
    min-height: 120px;
    resize: vertical;
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

/* Animation for page load */
.profile-card {
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

/* Background Improvements */
body {
    background-color: #f9fafb;
}

.container {
    background-color: transparent;
}

/* Card Text Improvements */
.profile-card .card-body {
    color: #374151;
}

.profile-card .card-body h6 {
    color: #1f2937 !important;
}

.profile-card .card-body small {
    color: #6b7280 !important;
}

/* Responsive adjustments */
@media (max-width: 768px) {
    .profile-nav-card {
        position: relative;
        top: auto;
        margin-bottom: 2rem;
    }
    
    .profile-card .card-body {
        padding: 1.5rem !important;
    }
}
</style>

<%@ include file="../../layouts/footer.jsp" %>
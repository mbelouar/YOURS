<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setAttribute("pageTitle", "Inscription - YOURS");
%>

<%@ include file="../../layouts/header.jsp" %>
<%@ include file="../../layouts/navbar.jsp" %>

<!-- Registration Hero Section -->
<section class="register-hero-section">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-7 col-md-9 col-sm-11">
                <!-- Main Registration Card -->
                <div class="card card-modern" style="border: none; box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.4), 0 0 0 1px rgba(255, 255, 255, 0.1); backdrop-filter: blur(20px); background: rgba(255, 255, 255, 0.95);">
                    <div class="card-body p-4 py-4">
                        <!-- Logo and Title -->
                        <div class="text-center mb-4">
                            <div class="mb-3">
                                <div class="d-inline-flex align-items-center justify-content-center" style="width: 70px; height: 70px; background: linear-gradient(135deg, var(--primary-600), var(--primary-700)); border-radius: 1.25rem; box-shadow: 0 10px 25px -5px rgba(37, 99, 235, 0.4);">
                                    <i class="fas fa-user-plus" style="font-size: 2rem; color: white;"></i>
                                </div>
                            </div>
                            <h1 class="h2 fw-bold mb-2" style="color: var(--gray-900);">Cr&eacute;er un compte</h1>
                            <p class="text-muted mb-0" style="font-size: 0.95rem;">Rejoignez YOURS pour louer du mat&eacute;riel professionnel</p>
                        </div>

                        <!-- User Type Toggle -->
                        <div class="d-flex justify-content-center mb-4">
                            <div class="btn-group user-type-toggle" role="group">
                                <input type="radio" class="btn-check" name="userType" id="typeClient" value="client" checked>
                                <label class="btn btn-outline-primary" for="typeClient">
                                    <i class="fas fa-user me-2"></i>Client
                                </label>

                                <input type="radio" class="btn-check" name="userType" id="typePartner" value="partner">
                                <label class="btn btn-outline-primary" for="typePartner">
                                    <i class="fas fa-briefcase me-2"></i>Partenaire
                                </label>
                            </div>
                        </div>

                        <!-- Registration Form -->
                        <form id="registerForm" class="needs-validation" novalidate>
                            <input type="hidden" id="accountType" name="accountType" value="client">
                            
                            <div class="row">
                                <!-- Left Column - Personal Information -->
                                <div class="col-md-6">
                                    <h6 class="fw-bold mb-3" style="color: var(--gray-800); font-size: 0.95rem;">
                                        <i class="fas fa-user me-2 text-primary"></i>Informations personnelles
                                    </h6>
                                    
                                    <!-- First Name -->
                                    <div class="mb-3">
                                        <label for="prenom" class="form-label fw-semibold" style="font-size: 0.9rem;">Pr&eacute;nom *</label>
                                        <input type="text" class="form-control" id="prenom" name="prenom" 
                                               required placeholder="Votre pr&eacute;nom" style="height: 2.75rem; font-size: 0.9rem;">
                                        <div class="invalid-feedback">Le pr&eacute;nom est requis.</div>
                                    </div>

                                    <!-- Last Name -->
                                    <div class="mb-3">
                                        <label for="nom" class="form-label fw-semibold" style="font-size: 0.9rem;">Nom *</label>
                                        <input type="text" class="form-control" id="nom" name="nom" 
                                               required placeholder="Votre nom" style="height: 2.75rem; font-size: 0.9rem;">
                                        <div class="invalid-feedback">Le nom est requis.</div>
                                    </div>

                                    <!-- Phone -->
                                    <div class="mb-3">
                                        <label for="numTelephone" class="form-label fw-semibold" style="font-size: 0.9rem;">T&eacute;l&eacute;phone *</label>
                                        <input type="tel" class="form-control" id="numTelephone" name="numTelephone" 
                                               required placeholder="+212 6 12 34 56 78" style="height: 2.75rem; font-size: 0.9rem;">
                                        <div class="invalid-feedback">Le num&eacute;ro de t&eacute;l&eacute;phone est requis.</div>
                                    </div>

                                    <!-- Address -->
                                    <div class="mb-3">
                                        <label for="adresse" class="form-label fw-semibold" style="font-size: 0.9rem;">Adresse *</label>
                                        <textarea class="form-control" id="adresse" name="adresse" rows="2" 
                                                  required placeholder="Votre adresse compl&egrave;te" style="font-size: 0.9rem;"></textarea>
                                        <div class="invalid-feedback">L'adresse est requise.</div>
                                    </div>
                                </div>

                                <!-- Right Column - Account Information -->
                                <div class="col-md-6">
                                    <h6 class="fw-bold mb-3" style="color: var(--gray-800); font-size: 0.95rem;">
                                        <i class="fas fa-lock me-2 text-primary"></i>Informations de compte
                                    </h6>

                                    <!-- Email -->
                                    <div class="mb-3">
                                        <label for="mail" class="form-label fw-semibold" style="font-size: 0.9rem;">
                                            <span id="emailLabel">Email *</span>
                                        </label>
                                        <input type="email" class="form-control" id="mail" name="mail" 
                                               required placeholder="votre@email.com" style="height: 2.75rem; font-size: 0.9rem;">
                                        <div class="invalid-feedback">Veuillez saisir une adresse email valide.</div>
                                    </div>

                                    <!-- Password -->
                                    <div class="mb-3">
                                        <label for="motDepasse" class="form-label fw-semibold" style="font-size: 0.9rem;">Mot de passe *</label>
                                        <div class="position-relative">
                                            <input type="password" class="form-control" id="motDepasse" name="motDepasse" 
                                                   required minlength="8" placeholder="Minimum 8 caract&egrave;res" style="height: 2.75rem; font-size: 0.9rem; padding-right: 3rem;">
                                            <button type="button" class="btn position-absolute end-0 top-50 translate-middle-y me-1" 
                                                    onclick="togglePassword('motDepasse')" style="z-index: 5; border: none; background: none; color: var(--gray-500); padding: 0.5rem;">
                                                <i class="fas fa-eye" id="motDePasseToggleIcon"></i>
                                            </button>
                                        </div>
                                        <div class="progress mt-1" style="height: 4px;">
                                            <div class="progress-bar" id="passwordStrength" style="width: 0%"></div>
                                        </div>
                                        <small class="text-muted" id="passwordStrengthText" style="font-size: 0.8rem;">Force du mot de passe</small>
                                        <div class="invalid-feedback">Le mot de passe doit contenir au moins 8 caract&egrave;res.</div>
                                    </div>

                                    <!-- Confirm Password -->
                                    <div class="mb-3">
                                        <label for="confirmPassword" class="form-label fw-semibold" style="font-size: 0.9rem;">Confirmer le mot de passe *</label>
                                        <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" 
                                               required placeholder="Confirmez votre mot de passe" style="height: 2.75rem; font-size: 0.9rem;">
                                        <div class="invalid-feedback">Les mots de passe ne correspondent pas.</div>
                                    </div>

                                    <!-- Partner-specific fields (hidden by default) -->
                                    <div id="partnerFields" style="display: none;">
                                        <!-- Business Name -->
                                        <div class="mb-3">
                                            <label for="businessName" class="form-label fw-semibold" style="font-size: 0.9rem;">
                                                <i class="fas fa-building me-1 text-primary" style="font-size: 0.8rem;"></i>
                                                Nom de l'entreprise *
                                            </label>
                                            <input type="text" class="form-control partner-required" id="businessName" name="businessName" 
                                                   placeholder="Nom de votre entreprise" style="height: 2.75rem; font-size: 0.9rem;">
                                            <div class="invalid-feedback">Le nom de l'entreprise est requis.</div>
                                        </div>

                                        <!-- Business Type -->
                                        <div class="mb-3">
                                            <label for="businessType" class="form-label fw-semibold" style="font-size: 0.9rem;">
                                                <i class="fas fa-tag me-1 text-primary" style="font-size: 0.8rem;"></i>
                                                Type d'activit&eacute; *
                                            </label>
                                            <select class="form-select partner-required" id="businessType" name="businessType" style="height: 2.75rem; font-size: 0.9rem;">
                                                <option value="">S&eacute;lectionnez votre activit&eacute;</option>
                                                <option value="photo-video">Photographie/Vid&eacute;ographie</option>
                                                <option value="event">&Eacute;v&eacute;nementiel</option>
                                                <option value="production">Production audiovisuelle</option>
                                                <option value="rental">Location d'&eacute;quipement</option>
                                                <option value="studio">Studio de production</option>
                                                <option value="freelance">Freelance</option>
                                                <option value="other">Autre</option>
                                            </select>
                                            <div class="invalid-feedback">Veuillez s&eacute;lectionner votre type d'activit&eacute;.</div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Terms and Conditions -->
                            <div class="mb-3">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="acceptTerms" name="acceptTerms" required>
                                    <label class="form-check-label" for="acceptTerms" style="font-size: 0.9rem;">
                                        J'accepte les 
                                        <a href="#" class="text-decoration-none fw-semibold" style="color: var(--primary-600);">conditions d'utilisation</a> 
                                        et la 
                                        <a href="#" class="text-decoration-none fw-semibold" style="color: var(--primary-600);">politique de confidentialit&eacute;</a>
                                    </label>
                                    <div class="invalid-feedback">Vous devez accepter les conditions d'utilisation.</div>
                                </div>
                            </div>

                            <!-- Submit Button -->
                            <button type="submit" class="btn btn-gradient btn-lg w-100 mb-3" 
                                    style="height: 3rem; font-size: 1rem; font-weight: 600; border-radius: 0.875rem; text-decoration: none !important;">
                                <i class="fas fa-user-plus me-2"></i>
                                <span class="button-text">Cr&eacute;er mon compte</span>
                                <span class="spinner-border spinner-border-sm d-none ms-2" role="status"></span>
                            </button>
                        </form>

                        <!-- Login Link -->
                        <div class="text-center">
                            <p class="mb-0" style="color: var(--gray-600); font-size: 0.9rem;">
                                D&eacute;j&agrave; un compte ? 
                                <a href="${pageContext.request.contextPath}/pages/auth/login.jsp" 
                                   class="text-decoration-none fw-semibold" style="color: var(--primary-600);">
                                    Se connecter
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Enhanced Styles -->
<style>
/* Registration Hero Section - Matching Login Page */
.register-hero-section {
    background: linear-gradient(135deg, #1e40af 0%, #1e3a8a 50%, #1e293b 100%);
    color: var(--white);
    padding: 3rem 0;
    position: relative;
    overflow: hidden;
    min-height: 100vh;
    display: flex;
    align-items: center;
    margin-top: -80px;
    padding-top: calc(80px + 6rem);
    padding-bottom: 3rem;
}

.register-hero-section::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: 
        radial-gradient(circle at 20% 50%, rgba(59, 130, 246, 0.15) 0%, transparent 50%),
        radial-gradient(circle at 80% 80%, rgba(147, 51, 234, 0.1) 0%, transparent 50%);
    opacity: 1;
    z-index: 1;
}

.register-hero-section::after {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="grid-register" width="10" height="10" patternUnits="userSpaceOnUse"><path d="M 10 0 L 0 0 0 10" fill="none" stroke="rgba(255,255,255,0.05)" stroke-width="0.5"/></pattern></defs><rect width="100" height="100" fill="url(%23grid-register)"/></svg>');
    opacity: 0.4;
    z-index: 1;
}

.register-hero-section .container {
    position: relative;
    z-index: 2;
}

.register-hero-section .card {
    animation: fadeInUp 0.8s ease-out;
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

/* User Type Toggle */
.user-type-toggle {
    border-radius: 0.875rem;
    overflow: hidden;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

.user-type-toggle .btn-outline-primary {
    padding: 0.75rem 2rem;
    font-weight: 600;
    font-size: 0.95rem;
    border: 2px solid var(--gray-200);
    color: var(--gray-700);
    background: white;
    transition: all 0.3s ease;
}

.user-type-toggle .btn-check:checked + .btn-outline-primary {
    background: linear-gradient(135deg, var(--primary-600), var(--primary-700));
    color: white;
    border-color: var(--primary-600);
    box-shadow: 0 4px 12px rgba(37, 99, 235, 0.3);
}

.user-type-toggle .btn-outline-primary:hover:not(:has(.btn-check:checked)) {
    background: var(--gray-50);
    border-color: var(--primary-300);
    transform: translateY(-1px);
}

/* Form Controls */
.form-control, .form-select {
    border: 2px solid var(--gray-200);
    border-radius: 0.875rem;
    transition: all 0.3s ease;
}

.form-control:focus, .form-select:focus {
    border-color: var(--primary-500);
    box-shadow: 0 0 0 0.2rem rgba(37, 99, 235, 0.15);
    transform: translateY(-1px);
}

.form-control:hover, .form-select:hover {
    border-color: var(--primary-300);
}

.form-check-input:checked {
    background-color: var(--primary-600);
    border-color: var(--primary-600);
}

/* Button Effects */
.btn-gradient:hover {
    transform: translateY(-2px);
    box-shadow: 0 10px 25px -5px rgba(37, 99, 235, 0.4);
}

/* Loading Animation */
@keyframes pulse-register {
    0%, 100% { opacity: 1; }
    50% { opacity: 0.5; }
}

.loading-pulse {
    animation: pulse-register 1.5s ease-in-out infinite;
}

/* Success Animation */
@keyframes checkmark {
    0% { transform: scale(0) rotate(45deg); }
    50% { transform: scale(1.2) rotate(45deg); }
    100% { transform: scale(1) rotate(45deg); }
}

.success-checkmark {
    animation: checkmark 0.6s ease-in-out;
}

/* Responsive Adjustments */
@media (max-width: 992px) {
    .register-hero-section {
        padding: 2.5rem 0;
        padding-top: calc(80px + 4rem);
        min-height: auto;
    }
}

@media (max-width: 768px) {
    .register-hero-section {
        padding: 2rem 0;
        padding-top: calc(80px + 3.5rem);
        min-height: auto;
    }
    
    .register-hero-section .card-body {
        padding: 2.5rem !important;
    }
    
    .user-type-toggle .btn-outline-primary {
        padding: 0.625rem 1.25rem;
        font-size: 0.875rem;
    }
}
</style>

<!-- Registration JavaScript -->
<script>
document.addEventListener('DOMContentLoaded', function() {
    const registerForm = document.getElementById('registerForm');
    const passwordInput = document.getElementById('motDepasse');
    const confirmPasswordInput = document.getElementById('confirmPassword');
    const userTypeRadios = document.querySelectorAll('input[name="userType"]');
    const partnerFields = document.getElementById('partnerFields');
    const accountTypeInput = document.getElementById('accountType');
    const emailLabel = document.getElementById('emailLabel');
    
    // User type toggle handler
    userTypeRadios.forEach(radio => {
        radio.addEventListener('change', function() {
            if (this.value === 'partner') {
                partnerFields.style.display = 'block';
                emailLabel.textContent = 'Email professionnel *';
                accountTypeInput.value = 'partner';
                
                // Make partner fields required
                document.querySelectorAll('.partner-required').forEach(field => {
                    field.required = true;
                });
            } else {
                partnerFields.style.display = 'none';
                emailLabel.textContent = 'Email *';
                accountTypeInput.value = 'client';
                
                // Make partner fields not required
                document.querySelectorAll('.partner-required').forEach(field => {
                    field.required = false;
                });
            }
        });
    });
    
    // Setup form validation
    registerForm.addEventListener('submit', function(e) {
        e.preventDefault();
        
        if (!registerForm.checkValidity() || !validatePasswords()) {
            registerForm.classList.add('was-validated');
            return;
        }
        
        handleRegistration();
    });
    
    // Password strength indicator
    passwordInput.addEventListener('input', updatePasswordStrength);
    
    // Password confirmation validation
    confirmPasswordInput.addEventListener('input', validatePasswords);
    
    // Add focus effects to form inputs
    const formInputs = document.querySelectorAll('.form-control, .form-select');
    formInputs.forEach(input => {
        input.addEventListener('focus', function() {
            this.parentElement.classList.add('focused');
        });
        
        input.addEventListener('blur', function() {
            this.parentElement.classList.remove('focused');
        });
    });
});

// Toggle password visibility with enhanced animation
function togglePassword(inputId) {
    const input = document.getElementById(inputId);
    const icon = document.getElementById(inputId + 'ToggleIcon');
    
    icon.style.transform = 'scale(0.8)';
    
    setTimeout(() => {
        if (input.type === 'password') {
            input.type = 'text';
            icon.className = 'fas fa-eye-slash';
        } else {
            input.type = 'password';
            icon.className = 'fas fa-eye';
        }
        icon.style.transform = 'scale(1)';
    }, 150);
}

// Update password strength
function updatePasswordStrength() {
    const password = document.getElementById('motDepasse').value;
    const strengthBar = document.getElementById('passwordStrength');
    const strengthText = document.getElementById('passwordStrengthText');
    
    let strength = 0;
    let strengthLabel = '';
    let strengthColor = '';
    
    if (password.length >= 8) strength += 25;
    if (/[a-z]/.test(password)) strength += 25;
    if (/[A-Z]/.test(password)) strength += 25;
    if (/[0-9]/.test(password)) strength += 25;
    
    if (strength < 50) {
        strengthLabel = 'Faible';
        strengthColor = 'bg-danger';
    } else if (strength < 75) {
        strengthLabel = 'Moyen';
        strengthColor = 'bg-warning';
    } else {
        strengthLabel = 'Fort';
        strengthColor = 'bg-success';
    }
    
    strengthBar.style.width = strength + '%';
    strengthBar.className = 'progress-bar ' + strengthColor;
    strengthText.textContent = strengthLabel;
}

// Validate password confirmation
function validatePasswords() {
    const password = document.getElementById('motDepasse').value;
    const confirmPassword = document.getElementById('confirmPassword').value;
    const confirmInput = document.getElementById('confirmPassword');
    
    if (password !== confirmPassword) {
        confirmInput.setCustomValidity('Les mots de passe ne correspondent pas');
        return false;
    } else {
        confirmInput.setCustomValidity('');
        return true;
    }
}

// Enhanced registration handler
function handleRegistration() {
    const form = document.getElementById('registerForm');
    const submitBtn = form.querySelector('button[type="submit"]');
    const buttonText = submitBtn.querySelector('.button-text');
    const spinner = submitBtn.querySelector('.spinner-border');
    const icon = submitBtn.querySelector('i.fas');
    const accountType = document.getElementById('accountType').value;
    
    // Enhanced loading state
    submitBtn.disabled = true;
    submitBtn.classList.add('loading-pulse');
    buttonText.textContent = 'Creation du compte...';
    spinner.classList.remove('d-none');
    icon.style.display = 'none';
    
    // Get form data
    const formData = new FormData(form);
    
    // Simulate API call
    setTimeout(() => {
        // Success state
        submitBtn.classList.remove('loading-pulse');
        submitBtn.classList.add('btn-success');
        buttonText.textContent = 'Compte cree !';
        spinner.classList.add('d-none');
        icon.className = 'fas fa-check';
        icon.style.display = 'inline';
        icon.classList.add('success-checkmark');
        
        // Show success toast if available
        if (typeof showToast === 'function') {
            showToast('Compte cree avec succes ! Redirection...', 'success');
        }
        
        // Redirect to login page
        setTimeout(() => {
            window.location.href = '${pageContext.request.contextPath}/pages/auth/login.jsp';
        }, 2000);
    }, 2000);
}
</script>

<%@ include file="../../layouts/footer.jsp" %>

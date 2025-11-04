<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.net.URLEncoder" %>
<% 
    request.setAttribute("pageTitle", "Connexion - YOURS");
    
    // Gérer les messages côté serveur
    String error = (String) request.getAttribute("error");
    String success = request.getParameter("success");
    String logout = request.getParameter("logout");
    String redirectUrl = request.getParameter("redirect");
    
    // Si l'utilisateur est déjà connecté, le rediriger
    if (session != null && session.getAttribute("client") != null) {
        if (redirectUrl != null && !redirectUrl.isEmpty()) {
            response.sendRedirect(request.getContextPath() + redirectUrl);
        } else {
            response.sendRedirect(request.getContextPath() + "/pages/client/dashboard.jsp");
        }
        return;
    }
%>

<%@ include file="../../layouts/header.jsp" %>
<%@ include file="../../layouts/navbar.jsp" %>

<!-- Login Hero Section - Same as Homepage Hero -->
<section class="login-hero-section">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-6 col-md-8 col-sm-10">
                <!-- Main Login Card -->
                <div class="card card-modern" style="border: none; box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.4), 0 0 0 1px rgba(255, 255, 255, 0.1); backdrop-filter: blur(20px); background: rgba(255, 255, 255, 0.95);">
                    <div class="card-body p-4 py-4">
                        <!-- Logo and Title -->
                        <div class="text-center mb-4">
                            <div class="mb-3">
                                <div class="d-inline-flex align-items-center justify-content-center" style="width: 70px; height: 70px; background: linear-gradient(135deg, var(--primary-600), var(--primary-700)); border-radius: 1.25rem; box-shadow: 0 10px 25px -5px rgba(37, 99, 235, 0.4);">
                                    <i class="fas fa-user-circle" style="font-size: 2rem; color: white;"></i>
                                </div>
                            </div>
                            <h1 class="h2 fw-bold mb-2" style="color: var(--gray-900);">Connexion</h1>
                            <p class="text-muted mb-0" style="font-size: 0.95rem;">Connectez-vous &agrave; votre compte YOURS</p>
                        </div>

                        <!-- Success Message -->
                        <div class="alert alert-success d-none mb-3" id="successAlert" role="alert" 
                             style="border-radius: 0.875rem; border: none; background: linear-gradient(135deg, #d1fae5 0%, #a7f3d0 100%); color: #059669;">
                            <i class="fas fa-check-circle me-2"></i>
                            <strong>Inscription réussie !</strong> - Votre compte a été créé avec succès. Vous pouvez maintenant vous connecter.
                        </div>

                        <!-- Logout Message -->
                        <div class="alert alert-info d-none mb-3" id="logoutAlert" role="alert" 
                             style="border-radius: 0.875rem; border: none; background: linear-gradient(135deg, #dbeafe 0%, #bfdbfe 100%); color: #1d4ed8;">
                            <i class="fas fa-info-circle me-2"></i>
                            <strong>Déconnexion réussie</strong> - Vous avez été déconnecté avec succès.
                        </div>

                        <!-- Login Form -->
                        <form id="loginForm" class="needs-validation" action="${pageContext.request.contextPath}/login" method="POST" novalidate>
                            <!-- Email -->
                            <div class="mb-3">
                                <label for="email" class="form-label fw-semibold mb-2" style="color: var(--gray-700); font-size: 0.9rem;">
                                    <i class="fas fa-envelope me-2 text-primary"></i>Adresse email
                                </label>
                                <input type="email" class="form-control" id="email" 
                                       name="email" required placeholder="votre@email.com"
                                       style="height: 3rem; border: 2px solid var(--gray-200); border-radius: 0.875rem; font-size: 0.95rem; transition: all 0.3s ease; background-position: right 0.75rem center; background-size: 1rem 1rem;">
                                <div class="invalid-feedback">
                                    Veuillez saisir une adresse email valide.
                                </div>
                            </div>

                            <!-- Password -->
                            <div class="mb-3">
                                <label for="password" class="form-label fw-semibold mb-2" style="color: var(--gray-700); font-size: 0.9rem;">
                                    <i class="fas fa-lock me-2 text-primary"></i>Mot de passe
                                </label>
                                <div class="position-relative">
                                    <input type="password" class="form-control" id="password" 
                                           name="password" required placeholder="Votre mot de passe"
                                           style="height: 3rem; border: 2px solid var(--gray-200); border-radius: 0.875rem; font-size: 0.95rem; padding-right: 3.5rem; transition: all 0.3s ease; background-position: right calc(3.5rem + 0.375rem) center; background-size: 1rem 1rem;">
                                    <button type="button" class="btn position-absolute end-0 top-50 translate-middle-y me-2 password-toggle-btn" 
                                            onclick="togglePassword('password')" style="border: none; background: none; color: var(--gray-500); padding: 0.5rem;">
                                        <i class="fas fa-eye" id="passwordToggleIcon"></i>
                                    </button>
                                </div>
                                <div class="invalid-feedback" style="position: relative; z-index: 1; margin-top: 0.25rem; padding-right: 2.5rem;">
                                    Le mot de passe est requis.
                                </div>
                            </div>

                            <!-- Remember Me & Forgot Password -->
                            <div class="d-flex justify-content-between align-items-center mb-4">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="rememberMe" name="rememberMe"
                                           style="border-radius: 0.375rem; border: 2px solid var(--gray-300);">
                                    <label class="form-check-label fw-medium" for="rememberMe" style="color: var(--gray-600); font-size: 0.9rem;">
                                        Se souvenir de moi
                                    </label>
                                </div>
                                <a href="${pageContext.request.contextPath}/pages/auth/forgot-password.jsp" 
                                   class="text-decoration-none fw-semibold" style="color: var(--primary-600); font-size: 0.9rem;">
                                    Mot de passe oubli&eacute; ?
                                </a>
                            </div>

                            <!-- Submit Button -->
                            <button type="submit" class="btn btn-gradient btn-lg w-100 mb-3" 
                                    style="height: 3rem; font-size: 1rem; font-weight: 600; border-radius: 0.875rem; text-decoration: none !important; transition: all 0.3s ease;">
                                <i class="fas fa-sign-in-alt me-2 button-icon"></i>
                                <span class="button-text">Se connecter</span>
                            </button>
                            
                            <!-- Login Error Message -->
                            <div class="alert alert-danger d-none mb-3" id="loginError" role="alert" 
                                 style="border-radius: 0.875rem; border: none; background: linear-gradient(135deg, #fee2e2 0%, #fecaca 100%); color: #dc2626;">
                                <i class="fas fa-exclamation-triangle me-2"></i>
                                <strong>Erreur de connexion</strong> - Email ou mot de passe incorrect
                            </div>

                            <!-- Social Login Divider -->
                            <div class="position-relative text-center mb-3">
                                <hr style="border-color: var(--gray-200);">
                                <span class="position-absolute top-50 start-50 translate-middle px-3 bg-white text-muted" style="font-size: 0.85rem;">
                                    ou connectez-vous avec
                                </span>
                            </div>
                            
                            <!-- Social Login Buttons -->
                            <div class="d-flex gap-2 mb-3">
                                <button type="button" class="btn btn-outline-primary flex-fill" 
                                        style="height: 2.75rem; border: 2px solid var(--gray-200); border-radius: 0.875rem; font-weight: 500; font-size: 0.9rem;">
                                    <i class="fab fa-google me-1"></i>Google
                                </button>
                                <button type="button" class="btn btn-outline-primary flex-fill"
                                        style="height: 2.75rem; border: 2px solid var(--gray-200); border-radius: 0.875rem; font-weight: 500; font-size: 0.9rem;">
                                    <i class="fab fa-facebook-f me-1"></i>Facebook
                                </button>
                            </div>
                        </form>

                        <!-- Register Link -->
                        <div class="text-center">
                            <p class="mb-0" style="color: var(--gray-600); font-size: 0.9rem;">
                                Pas encore de compte ? 
                                <a href="${pageContext.request.contextPath}/pages/auth/register-client.jsp" 
                                   class="text-decoration-none fw-semibold" style="color: var(--primary-600);">
                                    Cr&eacute;er un compte
                                </a>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Enhanced Form Styles -->
<style>
/* Login Hero Section - Exact Copy of Homepage Hero Section */
.login-hero-section {
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

.login-hero-section::before {
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

.login-hero-section::after {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="grid-login" width="10" height="10" patternUnits="userSpaceOnUse"><path d="M 10 0 L 0 0 0 10" fill="none" stroke="rgba(255,255,255,0.05)" stroke-width="0.5"/></pattern></defs><rect width="100" height="100" fill="url(%23grid-login)"/></svg>');
    opacity: 0.4;
    z-index: 1;
}

.login-hero-section .container {
    position: relative;
    z-index: 2;
}

.login-hero-section .card {
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

/* Form Controls */
.form-control:focus {
    border-color: var(--primary-500) !important;
    box-shadow: 0 0 0 0.2rem rgba(37, 99, 235, 0.15) !important;
    transform: translateY(-1px);
}

.form-control:hover {
    border-color: var(--primary-300) !important;
}

.form-control.is-invalid {
    border-color: #dc2626 !important;
    box-shadow: 0 0 0 0.2rem rgba(220, 38, 38, 0.15) !important;
}

.form-control.is-valid {
    border-color: #059669 !important;
    box-shadow: 0 0 0 0.2rem rgba(5, 150, 105, 0.15) !important;
}

/* Ensure validation feedback doesn't interfere with password toggle */
#password.form-control.is-valid, 
#password.form-control.is-invalid {
    background-position: right calc(3.5rem + 0.375rem) center;
    background-size: 1rem 1rem;
    padding-right: calc(3.5rem + 2rem);
}

#email.form-control.is-valid, 
#email.form-control.is-invalid {
    background-position: right 0.75rem center;
    background-size: 1rem 1rem;
    padding-right: calc(0.75rem + 2rem);
}

/* Override Bootstrap's validation feedback positioning */
.was-validated .form-control:valid,
.was-validated .form-control:invalid {
    background-repeat: no-repeat;
    background-position: right 0.75rem center;
    padding-right: 2.25rem;
}

#password.was-validated.form-control:valid,
#password.was-validated.form-control:invalid {
    background-position: right calc(3.5rem + 0.375rem) center;
    padding-right: calc(3.5rem + 2rem);
}

/* Password toggle button styling */
.password-toggle-btn {
    z-index: 10 !important;
    transition: all 0.2s ease;
}

.password-toggle-btn:hover {
    color: var(--primary-600) !important;
    transform: scale(1.1);
}

/* Validation feedback improvements */
.invalid-feedback {
    font-size: 0.85rem;
    margin-top: 0.25rem;
    padding-right: 2.5rem;
    position: relative;
    z-index: 1;
}

/* Login error alert animation */
.alert-danger {
    animation: slideDown 0.3s ease-out;
}

@keyframes slideDown {
    from {
        opacity: 0;
        transform: translateY(-10px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.form-check-input:checked {
    background-color: var(--primary-600) !important;
    border-color: var(--primary-600) !important;
}

/* Button Effects */
.btn-gradient:hover {
    transform: translateY(-2px) !important;
    box-shadow: 0 10px 25px -5px rgba(37, 99, 235, 0.4) !important;
}

/* Enhanced Button States */
button[type="submit"] {
    display: flex !important;
    align-items: center !important;
    justify-content: center !important;
    gap: 0.5rem !important;
    position: relative !important;
}

button[type="submit"] .button-icon,
button[type="submit"] .button-text {
    flex-shrink: 0 !important;
    display: inline-flex !important;
    align-items: center !important;
}

button[type="submit"] .button-text {
    white-space: nowrap !important;
    font-weight: 600 !important;
}

/* Success state styling */
.success-checkmark {
    animation: checkmark 0.6s ease-in-out !important;
    color: white !important;
}

/* Loading state styling */
.loading-pulse .button-text {
    animation: pulse-text 1.5s ease-in-out infinite !important;
}

@keyframes pulse-text {
    0%, 100% { opacity: 1; }
    50% { opacity: 0.7; }
}

.btn-outline-primary:hover {
    background-color: var(--primary-50) !important;
    border-color: var(--primary-300) !important;
    color: var(--primary-700) !important;
    transform: translateY(-1px);
}

/* Loading Animation */
@keyframes pulse-login {
    0%, 100% { opacity: 1; }
    50% { opacity: 0.5; }
}

.loading-pulse {
    animation: pulse-login 1.5s ease-in-out infinite;
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

/* Responsive Adjustments - Matching Homepage */
@media (max-width: 992px) {
    .login-hero-section {
        padding: 2.5rem 0;
        padding-top: calc(80px + 4rem);
        min-height: auto;
    }
}

@media (max-width: 768px) {
    .login-hero-section {
        padding: 2rem 0;
        padding-top: calc(80px + 3.5rem);
        min-height: auto;
    }
    
    .login-hero-section .card-body {
        padding: 2.5rem !important;
    }
    
    .login-hero-section .col-lg-6 {
        max-width: 95%;
    }
}
</style>

<!-- Login JavaScript -->
<script>
document.addEventListener('DOMContentLoaded', function() {
    const loginForm = document.getElementById('loginForm');
    
    // Handle server-side messages
    <% if (error != null) { %>
        showError('<%= error %>');
    <% } %>
    
    <% if (success != null) { %>
        showSuccess();
    <% } %>
    
    <% if (logout != null) { %>
        showLogout();
    <% } %>
    
    // Update navbar links to redirect to homepage sections
    updateNavbarLinks();
    
    // Enhanced form validation and submission
    loginForm.addEventListener('submit', function(e) {
        if (!loginForm.checkValidity()) {
            e.preventDefault();
            loginForm.classList.add('was-validated');
            return;
        }
        
        // Show loading state
        const submitBtn = loginForm.querySelector('button[type="submit"]');
        const buttonText = submitBtn.querySelector('.button-text');
        const icon = submitBtn.querySelector('i.fas');
        
        submitBtn.disabled = true;
        submitBtn.classList.add('loading-pulse');
        buttonText.textContent = 'Connexion en cours...';
        icon.style.display = 'none';
        
        // Form will submit normally to the servlet
    });
    
    // Add focus effects to form inputs
    const formInputs = document.querySelectorAll('.form-control');
    formInputs.forEach(input => {
        input.addEventListener('focus', function() {
            this.parentElement.classList.add('focused');
        });
        
        input.addEventListener('blur', function() {
            this.parentElement.classList.remove('focused');
        });
    });
});

// Show error message
function showError(message) {
    const errorAlert = document.getElementById('loginError');
    errorAlert.classList.remove('d-none');
    
    // Scroll to error message
    errorAlert.scrollIntoView({ behavior: 'smooth', block: 'center' });
    
    // Hide error message after 8 seconds
    setTimeout(() => {
        errorAlert.classList.add('d-none');
    }, 8000);
}

// Show success message using notification system
function showSuccess() {
    // Show toggle notification
    if (window.notificationSystem) {
        notificationSystem.success('Votre compte a été créé avec succès ! Vous pouvez maintenant vous connecter.', 5000);
    }
}

// Show logout message using notification system
function showLogout() {
    // Show toggle notification
    if (window.notificationSystem) {
        notificationSystem.info('Vous avez été déconnecté avec succès.', 4000);
    }
}

// Update navbar links to redirect to homepage sections
function updateNavbarLinks() {
    var navLinks = document.querySelectorAll('.nav-link.smooth-scroll');
    
    navLinks.forEach(function(link) {
        var section = link.getAttribute('data-section');
        if (section) {
            link.href = '../../index.jsp#' + section;
            link.classList.remove('smooth-scroll');
        }
    });
}

// Toggle password visibility with enhanced animation
function togglePassword(inputId) {
    const input = document.getElementById(inputId);
    const icon = document.getElementById(inputId + 'ToggleIcon');
    const button = icon.closest('.password-toggle-btn');
    
    // Add transition effect
    icon.style.transform = 'scale(0.8)';
    button.style.transform = 'scale(0.9)';
    
    setTimeout(() => {
        if (input.type === 'password') {
            input.type = 'text';
            icon.className = 'fas fa-eye-slash';
            button.style.color = 'var(--primary-600)';
        } else {
            input.type = 'password';
            icon.className = 'fas fa-eye';
            button.style.color = 'var(--gray-500)';
        }
        icon.style.transform = 'scale(1)';
        button.style.transform = 'scale(1)';
    }, 150);
}

// Login is now handled by the servlet backend

// Auto-fill demo account
function fillDemoAccount(type) {
    const emailInput = document.getElementById('email');
    const passwordInput = document.getElementById('password');
    
    switch (type) {
        case 'client':
            emailInput.value = 'client@demo.com';
            passwordInput.value = 'demo123';
            break;
        case 'partner':
            emailInput.value = 'partner@demo.com';
            passwordInput.value = 'demo123';
            break;
        case 'admin':
            emailInput.value = 'admin@demo.com';
            passwordInput.value = 'demo123';
            break;
    }
}
</script>

<%@ include file="../../layouts/footer.jsp" %>

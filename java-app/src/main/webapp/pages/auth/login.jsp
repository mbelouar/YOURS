<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setAttribute("pageTitle", "Connexion - YOURS");
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

                        <!-- Login Form -->
                        <form id="loginForm" class="needs-validation" novalidate>
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
                                <span class="spinner-border spinner-border-sm d-none ms-2" role="status"></span>
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

                <!-- Demo Accounts Info Card -->
                <div class="card mt-3" style="border: 2px solid var(--gray-100); border-radius: 1rem; background: rgba(255, 255, 255, 0.8); backdrop-filter: blur(10px);">
                    <div class="card-body text-center p-3">
                        <div class="d-flex align-items-center justify-content-center mb-2">
                            <div class="d-inline-flex align-items-center justify-content-center me-2" style="width: 32px; height: 32px; background: linear-gradient(135deg, var(--success-500), var(--success-600)); border-radius: 0.5rem;">
                                <i class="fas fa-info-circle" style="color: white; font-size: 0.9rem;"></i>
                            </div>
                            <h6 class="fw-bold mb-0" style="color: var(--gray-800); font-size: 0.95rem;">
                                Comptes de d&eacute;monstration
                            </h6>
                        </div>
                        <div class="row g-2">
                            <div class="col-md-6">
                                <div class="p-2 rounded-3" style="background: var(--gray-50); border: 1px solid var(--gray-100);">
                                    <small class="text-muted d-block fw-semibold mb-1" style="font-size: 0.8rem;">Client</small>
                                    <code class="d-block" style="background: none; color: var(--primary-600); font-size: 0.8rem;">client@demo.com</code>
                                    <code class="d-block" style="background: none; color: var(--primary-600); font-size: 0.8rem;">demo123</code>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="p-2 rounded-3" style="background: var(--gray-50); border: 1px solid var(--gray-100);">
                                    <small class="text-muted d-block fw-semibold mb-1" style="font-size: 0.8rem;">Partenaire</small>
                                    <code class="d-block" style="background: none; color: var(--primary-600); font-size: 0.8rem;">partner@demo.com</code>
                                    <code class="d-block" style="background: none; color: var(--primary-600); font-size: 0.8rem;">demo123</code>
                                </div>
                            </div>
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
    
    // Update navbar links to redirect to homepage sections
    updateNavbarLinks();
    
    // Enhanced form validation and submission
    loginForm.addEventListener('submit', function(e) {
        e.preventDefault();
        
        if (!loginForm.checkValidity()) {
            loginForm.classList.add('was-validated');
            return;
        }
        
        handleLogin();
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

// Enhanced login handler with better UX
function handleLogin() {
    const form = document.getElementById('loginForm');
    const submitBtn = form.querySelector('button[type="submit"]');
    const buttonText = submitBtn.querySelector('.button-text');
    const spinner = submitBtn.querySelector('.spinner-border');
    const icon = submitBtn.querySelector('i.fas');
    
    // Enhanced loading state
    submitBtn.disabled = true;
    submitBtn.classList.add('loading-pulse');
    buttonText.textContent = 'Connexion en cours...';
    spinner.classList.remove('d-none');
    icon.style.display = 'none';
    
    // Get form data
    const formData = new FormData(form);
    const email = formData.get('email');
    const password = formData.get('password');
    const rememberMe = formData.get('rememberMe') === 'on';
    
    // Simulate API call with enhanced feedback
    setTimeout(() => {
        // Mock authentication logic
        let user = null;
        let userType = null;
        
        // Demo accounts with enhanced user data
        if (email === 'client@demo.com' && password === 'demo123') {
            user = {
                id: 1,
                nom: 'Client',
                prenom: 'Demo',
                email: 'client@demo.com',
                type: 'client'
            };
            userType = 'client';
        } else if (email === 'partner@demo.com' && password === 'demo123') {
            user = {
                id: 2,
                nom: 'Partenaire',
                prenom: 'Demo',
                email: 'partner@demo.com',
                type: 'partner'
            };
            userType = 'partner';
        } else if (email === 'admin@demo.com' && password === 'demo123') {
            user = {
                id: 3,
                nom: 'Admin',
                prenom: 'Demo',
                email: 'admin@demo.com',
                type: 'admin'
            };
            userType = 'admin';
        }
        
        if (user) {
            // Store user session on client-side
            if (rememberMe) {
                localStorage.setItem('yours_user', JSON.stringify(user));
            } else {
                sessionStorage.setItem('yours_user', JSON.stringify(user));
            }
            
            // Show success state briefly before redirect
            submitBtn.classList.remove('loading-pulse');
            buttonText.textContent = 'Connexion réussie !';
            spinner.classList.add('d-none');
            icon.className = 'fas fa-check success-checkmark';
            icon.style.display = 'inline';
            submitBtn.style.background = 'linear-gradient(135deg, #10b981, #059669)';
            
            // Redirect after a brief delay to show success state
            setTimeout(() => {
                try {
                    switch (userType) {
                        case 'client':
                            // Redirect to main dashboard with error handling
                            window.location.replace('${pageContext.request.contextPath}/pages/client/dashboard.jsp');
                            break;
                        case 'partner':
                            window.location.replace('${pageContext.request.contextPath}/pages/partner/dashboard.jsp');
                            break;
                        case 'admin':
                            window.location.replace('${pageContext.request.contextPath}/pages/admin/dashboard.jsp');
                            break;
                        default:
                            window.location.replace('${pageContext.request.contextPath}/');
                    }
               } catch (error) {
                   console.error('Redirect error:', error);
                   // Try alternative redirect method
                   setTimeout(() => {
                       try {
                           if (userType === 'client') {
                               window.location.href = '${pageContext.request.contextPath}/pages/client/dashboard.jsp';
                           } else {
                               window.location.href = '${pageContext.request.contextPath}/';
                           }
                       } catch (fallbackError) {
                           console.error('Fallback redirect error:', fallbackError);
                           // Last resort: reload page
                           window.location.reload();
                       }
                   }, 1000);
               }
            }, 800);
        } else {
            // Error state - show error message instead of changing button
            submitBtn.classList.remove('loading-pulse');
            buttonText.textContent = 'Se connecter';
            spinner.classList.add('d-none');
            icon.className = 'fas fa-sign-in-alt button-icon';
            icon.style.display = 'inline';
            icon.classList.remove('success-checkmark');
            submitBtn.disabled = false;
            
            // Show error message
            const errorAlert = document.getElementById('loginError');
            errorAlert.classList.remove('d-none');
            
            // Hide error message after 5 seconds
            setTimeout(() => {
                errorAlert.classList.add('d-none');
            }, 5000);
            
            // Show error toast if available
            if (typeof showToast === 'function') {
                showToast('Email ou mot de passe incorrect', 'danger');
            }
        }
    }, 1800); // Realistic network delay
}

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

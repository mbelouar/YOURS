<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setAttribute("pageTitle", "Connexion - YOURS");
%>

<%@ include file="../../layouts/header.jsp" %>
<%@ include file="../../layouts/navbar.jsp" %>

<!-- Login Hero Section -->
<section class="min-vh-100 d-flex align-items-center" style="background: linear-gradient(135deg, #1e40af 0%, #1e3a8a 50%, #1e293b 100%); margin-top: -80px; padding-top: calc(80px + 3rem); padding-bottom: 3rem; position: relative; overflow: hidden;">
    <!-- Background Effects -->
    <div style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; background: radial-gradient(circle at 20% 80%, rgba(120, 119, 198, 0.3) 0%, transparent 50%), radial-gradient(circle at 80% 20%, rgba(255, 255, 255, 0.1) 0%, transparent 50%);"></div>
    <div style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; background-image: radial-gradient(circle at 1px 1px, rgba(255,255,255,0.15) 1px, transparent 0); background-size: 20px 20px;"></div>
    
    <div class="container" style="position: relative; z-index: 2; padding-top: 2rem; padding-bottom: 2rem;">
        <div class="row justify-content-center">
            <div class="col-lg-5 col-md-7 col-sm-9">
                <!-- Main Login Card -->
                <div class="card card-modern" style="border: none; box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.4), 0 0 0 1px rgba(255, 255, 255, 0.1); backdrop-filter: blur(20px); background: rgba(255, 255, 255, 0.95);">
                    <div class="card-body p-5">
                        <!-- Logo and Title -->
                        <div class="text-center mb-5">
                            <div class="mb-4">
                                <div class="d-inline-flex align-items-center justify-content-center" style="width: 80px; height: 80px; background: linear-gradient(135deg, var(--primary-600), var(--primary-700)); border-radius: 1.5rem; box-shadow: 0 10px 25px -5px rgba(37, 99, 235, 0.4);">
                                    <i class="fas fa-user-circle" style="font-size: 2.5rem; color: white;"></i>
                                </div>
                            </div>
                            <h1 class="display-6 fw-bold mb-3" style="color: var(--gray-900);">Connexion</h1>
                            <p class="lead text-muted mb-0">Connectez-vous &agrave; votre compte YOURS</p>
                        </div>

                        <!-- Login Form -->
                        <form id="loginForm" class="needs-validation" novalidate>
                            <!-- Email -->
                            <div class="mb-4">
                                <label for="email" class="form-label fw-semibold mb-2" style="color: var(--gray-700);">
                                    <i class="fas fa-envelope me-2 text-primary"></i>Adresse email
                                </label>
                                <input type="email" class="form-control form-control-lg" id="email" 
                                       name="email" required placeholder="votre@email.com"
                                       style="height: 3.5rem; border: 2px solid var(--gray-200); border-radius: 0.875rem; font-size: 1rem; transition: all 0.3s ease;">
                                <div class="invalid-feedback">
                                    Veuillez saisir une adresse email valide.
                                </div>
                            </div>

                            <!-- Password -->
                            <div class="mb-4">
                                <label for="password" class="form-label fw-semibold mb-2" style="color: var(--gray-700);">
                                    <i class="fas fa-lock me-2 text-primary"></i>Mot de passe
                                </label>
                                <div class="position-relative">
                                    <input type="password" class="form-control form-control-lg" id="password" 
                                           name="password" required placeholder="Votre mot de passe"
                                           style="height: 3.5rem; border: 2px solid var(--gray-200); border-radius: 0.875rem; font-size: 1rem; padding-right: 3.5rem; transition: all 0.3s ease;">
                                    <button type="button" class="btn position-absolute end-0 top-50 translate-middle-y me-2" 
                                            onclick="togglePassword('password')" style="z-index: 5; border: none; background: none; color: var(--gray-500); padding: 0.5rem;">
                                        <i class="fas fa-eye" id="passwordToggleIcon"></i>
                                    </button>
                                </div>
                                <div class="invalid-feedback">
                                    Le mot de passe est requis.
                                </div>
                            </div>

                            <!-- Remember Me & Forgot Password -->
                            <div class="d-flex justify-content-between align-items-center mb-5">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="rememberMe" name="rememberMe"
                                           style="border-radius: 0.375rem; border: 2px solid var(--gray-300);">
                                    <label class="form-check-label fw-medium" for="rememberMe" style="color: var(--gray-600);">
                                        Se souvenir de moi
                                    </label>
                                </div>
                                <a href="${pageContext.request.contextPath}/pages/auth/forgot-password.jsp" 
                                   class="text-decoration-none fw-semibold" style="color: var(--primary-600);">
                                    Mot de passe oubli&eacute; ?
                                </a>
                            </div>

                            <!-- Submit Button -->
                            <button type="submit" class="btn btn-gradient btn-lg w-100 mb-4" 
                                    style="height: 3.5rem; font-size: 1.1rem; font-weight: 600; border-radius: 0.875rem; text-decoration: none !important;">
                                <i class="fas fa-sign-in-alt me-2"></i>
                                <span class="button-text">Se connecter</span>
                                <span class="spinner-border spinner-border-sm d-none ms-2" role="status"></span>
                            </button>

                            <!-- Social Login Divider -->
                            <div class="position-relative text-center mb-4">
                                <hr style="border-color: var(--gray-200);">
                                <span class="position-absolute top-50 start-50 translate-middle px-3 bg-white text-muted small">
                                    ou connectez-vous avec
                                </span>
                            </div>
                            
                            <!-- Social Login Buttons -->
                            <div class="d-flex gap-3 mb-4">
                                <button type="button" class="btn btn-outline-primary flex-fill" 
                                        style="height: 3rem; border: 2px solid var(--gray-200); border-radius: 0.875rem; font-weight: 500;">
                                    <i class="fab fa-google me-2"></i>Google
                                </button>
                                <button type="button" class="btn btn-outline-primary flex-fill"
                                        style="height: 3rem; border: 2px solid var(--gray-200); border-radius: 0.875rem; font-weight: 500;">
                                    <i class="fab fa-facebook-f me-2"></i>Facebook
                                </button>
                            </div>
                        </form>

                        <!-- Register Links -->
                        <div class="text-center">
                            <p class="mb-2" style="color: var(--gray-600);">
                                Pas encore de compte ? 
                                <a href="${pageContext.request.contextPath}/pages/auth/register-client.jsp" 
                                   class="text-decoration-none fw-semibold" style="color: var(--primary-600);">
                                    Cr&eacute;er un compte client
                                </a>
                            </p>
                            <p class="mb-0" style="color: var(--gray-600);">
                                Vous &ecirc;tes un partenaire ? 
                                <a href="${pageContext.request.contextPath}/pages/auth/register-partner.jsp" 
                                   class="text-decoration-none fw-semibold" style="color: var(--primary-600);">
                                    Cr&eacute;er un compte partenaire
                                </a>
                            </p>
                        </div>
                    </div>
                </div>

                <!-- Demo Accounts Info Card -->
                <div class="card mt-4" style="border: 2px solid var(--gray-100); border-radius: 1rem; background: rgba(255, 255, 255, 0.8); backdrop-filter: blur(10px);">
                    <div class="card-body text-center p-4">
                        <div class="mb-3">
                            <div class="d-inline-flex align-items-center justify-content-center" style="width: 48px; height: 48px; background: linear-gradient(135deg, var(--success-500), var(--success-600)); border-radius: 0.75rem;">
                                <i class="fas fa-info-circle" style="color: white; font-size: 1.25rem;"></i>
                            </div>
                        </div>
                        <h6 class="fw-bold mb-3" style="color: var(--gray-800);">
                            Comptes de d&eacute;monstration
                        </h6>
                        <div class="row g-3">
                            <div class="col-md-6">
                                <div class="p-3 rounded-3" style="background: var(--gray-50); border: 1px solid var(--gray-100);">
                                    <small class="text-muted d-block fw-semibold mb-1">Client</small>
                                    <code class="d-block" style="background: none; color: var(--primary-600); font-size: 0.875rem;">client@demo.com</code>
                                    <code class="d-block" style="background: none; color: var(--primary-600); font-size: 0.875rem;">demo123</code>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="p-3 rounded-3" style="background: var(--gray-50); border: 1px solid var(--gray-100);">
                                    <small class="text-muted d-block fw-semibold mb-1">Partenaire</small>
                                    <code class="d-block" style="background: none; color: var(--primary-600); font-size: 0.875rem;">partner@demo.com</code>
                                    <code class="d-block" style="background: none; color: var(--primary-600); font-size: 0.875rem;">demo123</code>
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
.form-control:focus {
    border-color: var(--primary-500) !important;
    box-shadow: 0 0 0 0.2rem rgba(37, 99, 235, 0.15) !important;
    transform: translateY(-1px);
}

.form-control:hover {
    border-color: var(--primary-300) !important;
}

.form-check-input:checked {
    background-color: var(--primary-600) !important;
    border-color: var(--primary-600) !important;
}

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
</style>

<!-- Login JavaScript -->
<script>
document.addEventListener('DOMContentLoaded', function() {
    const loginForm = document.getElementById('loginForm');
    
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

// Toggle password visibility with enhanced animation
function togglePassword(inputId) {
    const input = document.getElementById(inputId);
    const icon = document.getElementById(inputId + 'ToggleIcon');
    
    // Add transition effect
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
            // Success state
            submitBtn.classList.remove('loading-pulse');
            submitBtn.classList.add('btn-success');
            buttonText.textContent = 'Connexion r&eacute;ussie !';
            spinner.classList.add('d-none');
            icon.className = 'fas fa-check';
            icon.style.display = 'inline';
            icon.classList.add('success-checkmark');
            
            // Store user session
            if (rememberMe) {
                localStorage.setItem('yours_user', JSON.stringify(user));
            } else {
                sessionStorage.setItem('yours_user', JSON.stringify(user));
            }
            
            // Show success toast if available
            if (typeof showToast === 'function') {
                showToast('Connexion r&eacute;ussie ! Redirection...', 'success');
            }
            
            // Redirect based on user type
            setTimeout(() => {
                switch (userType) {
                    case 'client':
                        window.location.href = '${pageContext.request.contextPath}/pages/client/dashboard.jsp';
                        break;
                    case 'partner':
                        window.location.href = '${pageContext.request.contextPath}/pages/partner/dashboard.jsp';
                        break;
                    case 'admin':
                        window.location.href = '${pageContext.request.contextPath}/pages/admin/dashboard.jsp';
                        break;
                    default:
                        window.location.href = '${pageContext.request.contextPath}/';
                }
            }, 2000);
        } else {
            // Error state
            submitBtn.classList.remove('loading-pulse');
            submitBtn.classList.add('btn-danger');
            buttonText.textContent = 'Identifiants incorrects';
            spinner.classList.add('d-none');
            icon.className = 'fas fa-times';
            icon.style.display = 'inline';
            
            // Show error toast if available
            if (typeof showToast === 'function') {
                showToast('Email ou mot de passe incorrect', 'danger');
            }
            
            // Reset form state after delay
            setTimeout(() => {
                submitBtn.disabled = false;
                submitBtn.classList.remove('btn-danger');
                submitBtn.classList.add('btn-gradient');
                buttonText.textContent = 'Se connecter';
                icon.className = 'fas fa-sign-in-alt';
                icon.classList.remove('success-checkmark');
            }, 2000);
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

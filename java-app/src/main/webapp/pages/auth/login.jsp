<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setAttribute("pageTitle", "Connexion - YOURS");
%>

<%@ include file="../../layouts/header.jsp" %>
<%@ include file="../../layouts/navbar.jsp" %>

<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-lg-5 col-md-7">
            <div class="card shadow-custom-lg">
                <div class="card-body p-5">
                    <!-- Logo and Title -->
                    <div class="text-center mb-4">
                        <div class="mb-3">
                            <i class="bi bi-camera-video text-primary" style="font-size: 3rem;"></i>
                        </div>
                        <h2 class="fw-bold mb-2">Connexion</h2>
                        <p class="text-muted">Connectez-vous à votre compte YOURS</p>
                    </div>

                    <!-- Login Form -->
                    <form id="loginForm" class="needs-validation" novalidate>
                        <!-- Email -->
                        <div class="mb-3">
                            <label for="email" class="form-label">
                                <i class="bi bi-envelope me-2"></i>Adresse email
                            </label>
                            <input type="email" class="form-control form-control-lg" id="email" 
                                   name="email" required placeholder="votre@email.com">
                            <div class="invalid-feedback">
                                Veuillez saisir une adresse email valide.
                            </div>
                        </div>

                        <!-- Password -->
                        <div class="mb-3">
                            <label for="password" class="form-label">
                                <i class="bi bi-lock me-2"></i>Mot de passe
                            </label>
                            <div class="position-relative">
                                <input type="password" class="form-control form-control-lg" id="password" 
                                       name="password" required placeholder="Votre mot de passe">
                                <button type="button" class="btn btn-link position-absolute end-0 top-50 translate-middle-y" 
                                        onclick="togglePassword('password')" style="z-index: 5;">
                                    <i class="bi bi-eye" id="passwordToggleIcon"></i>
                                </button>
                            </div>
                            <div class="invalid-feedback">
                                Le mot de passe est requis.
                            </div>
                        </div>

                        <!-- Remember Me & Forgot Password -->
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="rememberMe" name="rememberMe">
                                <label class="form-check-label" for="rememberMe">
                                    Se souvenir de moi
                                </label>
                            </div>
                            <a href="${pageContext.request.contextPath}/pages/auth/forgot-password.jsp" 
                               class="text-decoration-none">
                                Mot de passe oublié ?
                            </a>
                        </div>

                        <!-- Submit Button -->
                        <button type="submit" class="btn btn-primary btn-lg w-100 mb-3">
                            <i class="bi bi-box-arrow-in-right me-2"></i>
                            <span class="button-text">Se connecter</span>
                            <span class="spinner-border spinner-border-sm d-none" role="status"></span>
                        </button>

                        <!-- Social Login (Optional) -->
                        <div class="text-center mb-3">
                            <p class="text-muted mb-3">ou connectez-vous avec</p>
                            <div class="d-flex gap-2">
                                <button type="button" class="btn btn-outline-secondary flex-fill">
                                    <i class="bi bi-google me-2"></i>Google
                                </button>
                                <button type="button" class="btn btn-outline-secondary flex-fill">
                                    <i class="bi bi-facebook me-2"></i>Facebook
                                </button>
                            </div>
                        </div>
                    </form>

                    <!-- Register Link -->
                    <div class="text-center">
                        <p class="mb-0">
                            Pas encore de compte ? 
                            <a href="${pageContext.request.contextPath}/pages/auth/register-client.jsp" 
                               class="text-decoration-none fw-bold">
                                Créer un compte client
                            </a>
                        </p>
                        <p class="mt-2 mb-0">
                            Vous êtes un partenaire ? 
                            <a href="${pageContext.request.contextPath}/pages/auth/register-partner.jsp" 
                               class="text-decoration-none fw-bold">
                                Créer un compte partenaire
                            </a>
                        </p>
                    </div>
                </div>
            </div>

            <!-- Demo Accounts Info -->
            <div class="card mt-4 bg-light border-0">
                <div class="card-body text-center">
                    <h6 class="fw-bold mb-3">
                        <i class="bi bi-info-circle me-2"></i>Comptes de démonstration
                    </h6>
                    <div class="row">
                        <div class="col-md-6 mb-2">
                            <small class="text-muted d-block">Client</small>
                            <code>client@demo.com / demo123</code>
                        </div>
                        <div class="col-md-6 mb-2">
                            <small class="text-muted d-block">Partenaire</small>
                            <code>partner@demo.com / demo123</code>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Login JavaScript -->
<script>
document.addEventListener('DOMContentLoaded', function() {
    const loginForm = document.getElementById('loginForm');
    
    loginForm.addEventListener('submit', function(e) {
        e.preventDefault();
        
        if (!loginForm.checkValidity()) {
            loginForm.classList.add('was-validated');
            return;
        }
        
        handleLogin();
    });
});

// Toggle password visibility
function togglePassword(inputId) {
    const input = document.getElementById(inputId);
    const icon = document.getElementById(inputId + 'ToggleIcon');
    
    if (input.type === 'password') {
        input.type = 'text';
        icon.className = 'bi bi-eye-slash';
    } else {
        input.type = 'password';
        icon.className = 'bi bi-eye';
    }
}

// Handle login
function handleLogin() {
    const form = document.getElementById('loginForm');
    const submitBtn = form.querySelector('button[type="submit"]');
    const buttonText = submitBtn.querySelector('.button-text');
    const spinner = submitBtn.querySelector('.spinner-border');
    
    // Show loading state
    submitBtn.disabled = true;
    buttonText.textContent = 'Connexion...';
    spinner.classList.remove('d-none');
    
    // Get form data
    const formData = new FormData(form);
    const email = formData.get('email');
    const password = formData.get('password');
    const rememberMe = formData.get('rememberMe') === 'on';
    
    // Simulate API call with mock authentication
    setTimeout(() => {
        // Mock authentication logic
        let user = null;
        let userType = null;
        
        // Demo accounts
        if (email === 'client@demo.com' && password === 'demo123') {
            user = {
                ...mockUsers.client,
                type: 'client'
            };
            userType = 'client';
        } else if (email === 'partner@demo.com' && password === 'demo123') {
            user = {
                ...mockUsers.partner,
                type: 'partner'
            };
            userType = 'partner';
        } else if (email === 'admin@demo.com' && password === 'demo123') {
            user = {
                ...mockUsers.admin,
                type: 'admin'
            };
            userType = 'admin';
        }
        
        if (user) {
            // Store user session
            if (rememberMe) {
                localStorage.setItem('yours_user', JSON.stringify(user));
            } else {
                sessionStorage.setItem('yours_user', JSON.stringify(user));
            }
            
            // Show success message
            YOURS.showToast('Connexion réussie ! Redirection...', 'success');
            
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
            }, 1500);
        } else {
            // Show error message
            YOURS.showToast('Email ou mot de passe incorrect', 'danger');
            
            // Reset form state
            submitBtn.disabled = false;
            buttonText.textContent = 'Se connecter';
            spinner.classList.add('d-none');
        }
    }, 1500); // Simulate network delay
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

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setAttribute("pageTitle", "Mot de passe oublié - YOURS");
%>

<%@ include file="../../layouts/header.jsp" %>
<%@ include file="../../layouts/navbar.jsp" %>

<!-- Forgot Password Hero Section -->
<section class="forgot-password-hero-section">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-5 col-md-7 col-sm-9">
                <!-- Main Forgot Password Card -->
                <div class="card card-modern" style="border: none; box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.4), 0 0 0 1px rgba(255, 255, 255, 0.1); backdrop-filter: blur(20px); background: rgba(255, 255, 255, 0.95);">
                    <div class="card-body p-4 py-4">
                        <!-- Logo and Title -->
                        <div class="text-center mb-4">
                            <div class="mb-3">
                                <div class="d-inline-flex align-items-center justify-content-center" style="width: 70px; height: 70px; background: linear-gradient(135deg, var(--primary-600), var(--primary-700)); border-radius: 1.25rem; box-shadow: 0 10px 25px -5px rgba(37, 99, 235, 0.4);">
                                    <i class="fas fa-key" style="font-size: 2rem; color: white;"></i>
                                </div>
                            </div>
                            <h1 class="h2 fw-bold mb-2" style="color: var(--gray-900);">Mot de passe oubli&eacute;</h1>
                            <p class="text-muted mb-0" style="font-size: 0.95rem;">Saisissez votre email pour recevoir un lien de r&eacute;initialisation</p>
                        </div>

                        <!-- Reset Form -->
                        <form id="resetForm" class="needs-validation" novalidate>
                            <!-- Email -->
                            <div class="mb-4">
                                <label for="email" class="form-label fw-semibold mb-2" style="color: var(--gray-700); font-size: 0.9rem;">
                                    <i class="fas fa-envelope me-2 text-primary"></i>Adresse email
                                </label>
                                <input type="email" class="form-control" id="email" 
                                       name="email" required placeholder="votre@email.com"
                                       style="height: 3rem; border: 2px solid var(--gray-200); border-radius: 0.875rem; font-size: 0.95rem; transition: all 0.3s ease;">
                                <div class="invalid-feedback">
                                    Veuillez saisir une adresse email valide.
                                </div>
                                <small class="text-muted" style="font-size: 0.85rem;">
                                    <i class="fas fa-info-circle me-1"></i>
                                    Nous vous enverrons un lien de r&eacute;initialisation &agrave; cette adresse.
                                </small>
                            </div>

                            <!-- Submit Button -->
                            <button type="submit" class="btn btn-gradient btn-lg w-100 mb-4" 
                                    style="height: 3rem; font-size: 1rem; font-weight: 600; border-radius: 0.875rem; text-decoration: none !important;">
                                <i class="fas fa-paper-plane me-2"></i>
                                <span class="button-text">Envoyer le lien</span>
                                <span class="spinner-border spinner-border-sm d-none ms-2" role="status"></span>
                            </button>
                        </form>

                        <!-- Success Message (Hidden by default) -->
                        <div id="successMessage" class="d-none mb-4">
                            <div class="alert alert-success border-0 shadow-sm" style="border-radius: 0.875rem; background: linear-gradient(135deg, var(--success-50), var(--success-100));">
                                <div class="d-flex align-items-start">
                                    <div class="d-inline-flex align-items-center justify-content-center me-3" style="width: 40px; height: 40px; background: linear-gradient(135deg, var(--success-500), var(--success-600)); border-radius: 0.75rem;">
                                        <i class="fas fa-check-circle" style="color: white; font-size: 1.25rem;"></i>
                                    </div>
                                    <div>
                                        <h6 class="fw-bold mb-1" style="color: var(--success-700);">Email envoy&eacute; !</h6>
                                        <p class="mb-1" style="font-size: 0.9rem; color: var(--success-700);">
                                            V&eacute;rifiez votre bo&icirc;te email et cliquez sur le lien de r&eacute;initialisation.
                                        </p>
                                        <small class="text-muted" style="font-size: 0.8rem;">
                                            Si vous ne recevez pas l'email, v&eacute;rifiez vos spams.
                                        </small>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Back to Login -->
                        <div class="text-center">
                            <a href="${pageContext.request.contextPath}/pages/auth/login.jsp" 
                               class="text-decoration-none fw-semibold d-inline-flex align-items-center" style="color: var(--primary-600); font-size: 0.9rem;">
                                <i class="fas fa-arrow-left me-2"></i>Retour &agrave; la connexion
                            </a>
                        </div>
                    </div>
                </div>

                <!-- Help Section -->
                <div class="card mt-3" style="border: 2px solid var(--gray-100); border-radius: 1rem; background: rgba(255, 255, 255, 0.8); backdrop-filter: blur(10px);">
                    <div class="card-body text-center p-3">
                        <div class="d-flex align-items-center justify-content-center mb-2">
                            <div class="d-inline-flex align-items-center justify-content-center me-2" style="width: 32px; height: 32px; background: linear-gradient(135deg, var(--info-500), var(--info-600)); border-radius: 0.5rem;">
                                <i class="fas fa-question-circle" style="color: white; font-size: 0.9rem;"></i>
                            </div>
                            <h6 class="fw-bold mb-0" style="color: var(--gray-800); font-size: 0.95rem;">
                                Besoin d'aide ?
                            </h6>
                        </div>
                        <p class="text-muted mb-3" style="font-size: 0.85rem;">
                            Si vous n'arrivez pas &agrave; r&eacute;cup&eacute;rer votre mot de passe, contactez notre support.
                        </p>
                        <div class="d-flex justify-content-center gap-2">
                            <a href="mailto:support@yours.ma" class="btn btn-outline-primary btn-sm" style="font-size: 0.85rem; padding: 0.5rem 1rem; border-radius: 0.75rem;">
                                <i class="fas fa-envelope me-1"></i>Email
                            </a>
                            <a href="tel:+212522123456" class="btn btn-outline-primary btn-sm" style="font-size: 0.85rem; padding: 0.5rem 1rem; border-radius: 0.75rem;">
                                <i class="fas fa-phone me-1"></i>T&eacute;l&eacute;phone
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Enhanced Styles -->
<style>
/* Forgot Password Hero Section - Matching Login Page */
.forgot-password-hero-section {
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

.forgot-password-hero-section::before {
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

.forgot-password-hero-section::after {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: url('data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><defs><pattern id="grid-forgot" width="10" height="10" patternUnits="userSpaceOnUse"><path d="M 10 0 L 0 0 0 10" fill="none" stroke="rgba(255,255,255,0.05)" stroke-width="0.5"/></pattern></defs><rect width="100" height="100" fill="url(%23grid-forgot)"/></svg>');
    opacity: 0.4;
    z-index: 1;
}

.forgot-password-hero-section .container {
    position: relative;
    z-index: 2;
}

.forgot-password-hero-section .card {
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
@keyframes pulse-reset {
    0%, 100% { opacity: 1; }
    50% { opacity: 0.5; }
}

.loading-pulse {
    animation: pulse-reset 1.5s ease-in-out infinite;
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
    .forgot-password-hero-section {
        padding: 2.5rem 0;
        padding-top: calc(80px + 4rem);
        min-height: auto;
    }
}

@media (max-width: 768px) {
    .forgot-password-hero-section {
        padding: 2rem 0;
        padding-top: calc(80px + 3.5rem);
        min-height: auto;
    }
    
    .forgot-password-hero-section .card-body {
        padding: 2.5rem !important;
    }
}
</style>

<!-- Reset Password JavaScript -->
<script>
document.addEventListener('DOMContentLoaded', function() {
    const resetForm = document.getElementById('resetForm');
    const emailInput = document.getElementById('email');
    
    // Update navbar links to redirect to homepage sections
    updateNavbarLinks();
    
    // Setup form validation
    resetForm.addEventListener('submit', function(e) {
        e.preventDefault();
        
        if (!resetForm.checkValidity()) {
            resetForm.classList.add('was-validated');
            return;
        }
        
        handlePasswordReset();
    });
    
    // Add focus effects to form input
    emailInput.addEventListener('focus', function() {
        this.parentElement.classList.add('focused');
    });
    
    emailInput.addEventListener('blur', function() {
        this.parentElement.classList.remove('focused');
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

// Enhanced password reset handler
function handlePasswordReset() {
    const form = document.getElementById('resetForm');
    const submitBtn = form.querySelector('button[type="submit"]');
    const buttonText = submitBtn.querySelector('.button-text');
    const spinner = submitBtn.querySelector('.spinner-border');
    const icon = submitBtn.querySelector('i.fas');
    const successMessage = document.getElementById('successMessage');
    
    // Enhanced loading state
    submitBtn.disabled = true;
    submitBtn.classList.add('loading-pulse');
    buttonText.textContent = 'Envoi en cours...';
    spinner.classList.remove('d-none');
    icon.style.display = 'none';
    
    // Get form data
    const formData = new FormData(form);
    const email = formData.get('email');
    
    // Simulate API call with enhanced feedback
    setTimeout(() => {
        // Success state
        submitBtn.classList.remove('loading-pulse');
        submitBtn.classList.add('btn-success');
        buttonText.textContent = 'Email envoye !';
        spinner.classList.add('d-none');
        icon.className = 'fas fa-check';
        icon.style.display = 'inline';
        icon.classList.add('success-checkmark');
        
        // Show success message with animation
        setTimeout(() => {
            form.style.display = 'none';
            successMessage.classList.remove('d-none');
            successMessage.style.animation = 'fadeInUp 0.5s ease-out';
        }, 800);
        
        // Show toast if available
        if (typeof showToast === 'function') {
            showToast('Email de reinitialisation envoye avec succes !', 'success');
        }
        
        // Optional: Auto redirect after some time
        setTimeout(() => {
            window.location.href = '${pageContext.request.contextPath}/pages/auth/login.jsp';
        }, 10000); // Redirect after 10 seconds
        
    }, 2000); // Realistic network delay
}
</script>

<%@ include file="../../layouts/footer.jsp" %>

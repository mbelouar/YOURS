<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setAttribute("pageTitle", "Mot de passe oublié - YOURS");
%>

<%@ include file="../../layouts/header.jsp" %>
<%@ include file="../../layouts/navbar.jsp" %>

<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-lg-5 col-md-7">
            <div class="card shadow-custom-lg">
                <div class="card-body p-5">
                    <!-- Header -->
                    <div class="text-center mb-4">
                        <div class="mb-3">
                            <i class="bi bi-key text-primary" style="font-size: 3rem;"></i>
                        </div>
                        <h2 class="fw-bold mb-2">Mot de passe oublié</h2>
                        <p class="text-muted">Saisissez votre email pour recevoir un lien de réinitialisation</p>
                    </div>

                    <!-- Reset Form -->
                    <form id="resetForm" class="needs-validation" novalidate>
                        <!-- Email -->
                        <div class="mb-4">
                            <label for="email" class="form-label">
                                <i class="bi bi-envelope me-2"></i>Adresse email
                            </label>
                            <input type="email" class="form-control form-control-lg" id="email" 
                                   name="email" required placeholder="votre@email.com">
                            <div class="invalid-feedback">
                                Veuillez saisir une adresse email valide.
                            </div>
                            <small class="text-muted">
                                Nous vous enverrons un lien de réinitialisation à cette adresse.
                            </small>
                        </div>

                        <!-- Submit Button -->
                        <button type="submit" class="btn btn-primary btn-lg w-100 mb-4">
                            <i class="bi bi-send me-2"></i>
                            <span class="button-text">Envoyer le lien</span>
                            <span class="spinner-border spinner-border-sm d-none" role="status"></span>
                        </button>
                    </form>

                    <!-- Success Message (Hidden by default) -->
                    <div id="successMessage" class="alert alert-success d-none">
                        <i class="bi bi-check-circle me-2"></i>
                        <strong>Email envoyé !</strong><br>
                        Vérifiez votre boîte email et cliquez sur le lien de réinitialisation.
                        <br><small class="text-muted">Si vous ne recevez pas l'email, vérifiez vos spams.</small>
                    </div>

                    <!-- Back to Login -->
                    <div class="text-center">
                        <a href="${pageContext.request.contextPath}/pages/auth/login.jsp" 
                           class="text-decoration-none">
                            <i class="bi bi-arrow-left me-2"></i>Retour à la connexion
                        </a>
                    </div>
                </div>
            </div>

            <!-- Help Section -->
            <div class="card mt-4 bg-light border-0">
                <div class="card-body text-center">
                    <h6 class="fw-bold mb-3">
                        <i class="bi bi-question-circle me-2"></i>Besoin d'aide ?
                    </h6>
                    <p class="text-muted mb-3">
                        Si vous n'arrivez pas à récupérer votre mot de passe, contactez notre support.
                    </p>
                    <div class="d-flex justify-content-center gap-3">
                        <a href="mailto:support@yours.ma" class="btn btn-outline-primary btn-sm">
                            <i class="bi bi-envelope me-1"></i>Email
                        </a>
                        <a href="tel:+212522123456" class="btn btn-outline-primary btn-sm">
                            <i class="bi bi-telephone me-1"></i>Téléphone
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Reset Password JavaScript -->
<script>
document.addEventListener('DOMContentLoaded', function() {
    const resetForm = document.getElementById('resetForm');
    
    resetForm.addEventListener('submit', function(e) {
        e.preventDefault();
        
        if (!resetForm.checkValidity()) {
            resetForm.classList.add('was-validated');
            return;
        }
        
        handlePasswordReset();
    });
});

// Handle password reset
function handlePasswordReset() {
    const form = document.getElementById('resetForm');
    const submitBtn = form.querySelector('button[type="submit"]');
    const buttonText = submitBtn.querySelector('.button-text');
    const spinner = submitBtn.querySelector('.spinner-border');
    const successMessage = document.getElementById('successMessage');
    
    // Show loading state
    submitBtn.disabled = true;
    buttonText.textContent = 'Envoi en cours...';
    spinner.classList.remove('d-none');
    
    // Get form data
    const formData = new FormData(form);
    const email = formData.get('email');
    
    // Simulate API call
    setTimeout(() => {
        // Hide form and show success message
        form.style.display = 'none';
        successMessage.classList.remove('d-none');
        
        // Show toast notification
        YOURS.showToast('Email de réinitialisation envoyé avec succès !', 'success');
        
        // Optional: Auto redirect after some time
        setTimeout(() => {
            window.location.href = '${pageContext.request.contextPath}/pages/auth/login.jsp';
        }, 10000); // Redirect after 10 seconds
        
    }, 2000); // Simulate network delay
}
</script>

<%@ include file="../../layouts/footer.jsp" %>

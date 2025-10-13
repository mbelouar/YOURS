<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setAttribute("pageTitle", "Inscription Client - YOURS");
%>

<%@ include file="../../layouts/header.jsp" %>
<%@ include file="../../layouts/navbar.jsp" %>

<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-lg-8 col-md-10">
            <div class="card shadow-custom-lg">
                <div class="card-body p-5">
                    <!-- Header -->
                    <div class="text-center mb-4">
                        <div class="mb-3">
                            <i class="bi bi-person-plus text-primary" style="font-size: 3rem;"></i>
                        </div>
                        <h2 class="fw-bold mb-2">Inscription Client</h2>
                        <p class="text-muted">Créez votre compte pour louer du matériel professionnel</p>
                    </div>

                    <!-- Registration Form -->
                    <form id="registerForm" class="needs-validation" novalidate>
                        <div class="row">
                            <!-- Personal Information -->
                            <div class="col-md-6">
                                <h5 class="fw-bold mb-3">
                                    <i class="bi bi-person me-2"></i>Informations personnelles
                                </h5>
                                
                                <!-- First Name -->
                                <div class="mb-3">
                                    <label for="prenom" class="form-label">Prénom *</label>
                                    <input type="text" class="form-control" id="prenom" name="prenom" 
                                           required placeholder="Votre prénom">
                                    <div class="invalid-feedback">Le prénom est requis.</div>
                                </div>

                                <!-- Last Name -->
                                <div class="mb-3">
                                    <label for="nom" class="form-label">Nom *</label>
                                    <input type="text" class="form-control" id="nom" name="nom" 
                                           required placeholder="Votre nom">
                                    <div class="invalid-feedback">Le nom est requis.</div>
                                </div>

                                <!-- Birth Date -->
                                <div class="mb-3">
                                    <label for="dateNaissance" class="form-label">Date de naissance</label>
                                    <input type="date" class="form-control" id="dateNaissance" name="dateNaissance">
                                </div>

                                <!-- Phone -->
                                <div class="mb-3">
                                    <label for="numTelephone" class="form-label">Téléphone</label>
                                    <input type="tel" class="form-control" id="numTelephone" name="numTelephone" 
                                           placeholder="+212 6 12 34 56 78" pattern="^(\+212|0)[5-7][0-9]{8}$">
                                    <div class="invalid-feedback">Format: +212 6 12 34 56 78</div>
                                </div>

                                <!-- Address -->
                                <div class="mb-3">
                                    <label for="adresse" class="form-label">Adresse</label>
                                    <textarea class="form-control" id="adresse" name="adresse" rows="3" 
                                              placeholder="Votre adresse complète"></textarea>
                                </div>
                            </div>

                            <!-- Account Information -->
                            <div class="col-md-6">
                                <h5 class="fw-bold mb-3">
                                    <i class="bi bi-shield-lock me-2"></i>Informations de compte
                                </h5>

                                <!-- Email -->
                                <div class="mb-3">
                                    <label for="mail" class="form-label">Email *</label>
                                    <input type="email" class="form-control" id="mail" name="mail" 
                                           required placeholder="votre@email.com">
                                    <div class="invalid-feedback">Veuillez saisir une adresse email valide.</div>
                                </div>

                                <!-- Password -->
                                <div class="mb-3">
                                    <label for="motDepasse" class="form-label">Mot de passe *</label>
                                    <div class="position-relative">
                                        <input type="password" class="form-control" id="motDepasse" name="motDepasse" 
                                               required minlength="8" placeholder="Minimum 8 caractères">
                                        <button type="button" class="btn btn-link position-absolute end-0 top-50 translate-middle-y" 
                                                onclick="togglePassword('motDepasse')" style="z-index: 5;">
                                            <i class="bi bi-eye" id="motDePasseToggleIcon"></i>
                                        </button>
                                    </div>
                                    <div class="invalid-feedback">Le mot de passe doit contenir au moins 8 caractères.</div>
                                    <!-- Password Strength Indicator -->
                                    <div class="progress mt-2" style="height: 5px;">
                                        <div class="progress-bar" id="passwordStrength" style="width: 0%"></div>
                                    </div>
                                    <small class="text-muted" id="passwordStrengthText">Force du mot de passe</small>
                                </div>

                                <!-- Confirm Password -->
                                <div class="mb-3">
                                    <label for="confirmPassword" class="form-label">Confirmer le mot de passe *</label>
                                    <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" 
                                           required placeholder="Confirmez votre mot de passe">
                                    <div class="invalid-feedback">Les mots de passe ne correspondent pas.</div>
                                </div>

                                <!-- Profile Photo -->
                                <div class="mb-3">
                                    <label for="photoPerso" class="form-label">Photo de profil</label>
                                    <input type="file" class="form-control" id="photoPerso" name="photoPerso" 
                                           accept="image/*" onchange="previewImage(this, 'photoPreview')">
                                    <div class="mt-2">
                                        <img id="photoPreview" class="img-thumbnail d-none" style="max-width: 150px;">
                                    </div>
                                </div>

                                <!-- CIN Upload -->
                                <div class="mb-3">
                                    <label class="form-label">Pièce d'identité (CIN)</label>
                                    <div class="row">
                                        <div class="col-6">
                                            <label for="cinRECTO" class="form-label small">Recto</label>
                                            <input type="file" class="form-control form-control-sm" id="cinRECTO" 
                                                   name="cinRECTO" accept="image/*" onchange="previewImage(this, 'cinRectoPreview')">
                                            <img id="cinRectoPreview" class="img-thumbnail mt-1 d-none" style="max-width: 100px;">
                                        </div>
                                        <div class="col-6">
                                            <label for="cinVERSO" class="form-label small">Verso</label>
                                            <input type="file" class="form-control form-control-sm" id="cinVERSO" 
                                                   name="cinVERSO" accept="image/*" onchange="previewImage(this, 'cinVersoPreview')">
                                            <img id="cinVersoPreview" class="img-thumbnail mt-1 d-none" style="max-width: 100px;">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Terms and Conditions -->
                        <div class="mb-4">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="acceptTerms" name="acceptTerms" required>
                                <label class="form-check-label" for="acceptTerms">
                                    J'accepte les 
                                    <a href="#" class="text-decoration-none">conditions d'utilisation</a> 
                                    et la 
                                    <a href="#" class="text-decoration-none">politique de confidentialité</a> *
                                </label>
                                <div class="invalid-feedback">Vous devez accepter les conditions d'utilisation.</div>
                            </div>
                        </div>

                        <!-- Newsletter -->
                        <div class="mb-4">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="newsletter" name="newsletter" checked>
                                <label class="form-check-label" for="newsletter">
                                    Je souhaite recevoir les actualités et offres spéciales par email
                                </label>
                            </div>
                        </div>

                        <!-- Submit Button -->
                        <button type="submit" class="btn btn-primary btn-lg w-100 mb-3">
                            <i class="bi bi-person-plus me-2"></i>
                            <span class="button-text">Créer mon compte</span>
                            <span class="spinner-border spinner-border-sm d-none" role="status"></span>
                        </button>
                    </form>

                    <!-- Login Link -->
                    <div class="text-center">
                        <p class="mb-0">
                            Déjà un compte ? 
                            <a href="${pageContext.request.contextPath}/pages/auth/login.jsp" 
                               class="text-decoration-none fw-bold">
                                Se connecter
                            </a>
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Registration JavaScript -->
<script>
document.addEventListener('DOMContentLoaded', function() {
    const registerForm = document.getElementById('registerForm');
    const passwordInput = document.getElementById('motDepasse');
    const confirmPasswordInput = document.getElementById('confirmPassword');
    
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
    
    // Phone number formatting
    const phoneInput = document.getElementById('numTelephone');
    phoneInput.addEventListener('input', formatPhoneNumber);
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

// Format phone number
function formatPhoneNumber(e) {
    let value = e.target.value.replace(/\D/g, '');
    
    if (value.startsWith('212')) {
        value = '+' + value;
    } else if (value.startsWith('0')) {
        // Keep as is
    } else if (value.length > 0) {
        value = '0' + value;
    }
    
    e.target.value = value;
}

// Preview uploaded image
function previewImage(input, previewId) {
    const preview = document.getElementById(previewId);
    
    if (input.files && input.files[0]) {
        const reader = new FileReader();
        
        reader.onload = function(e) {
            preview.src = e.target.result;
            preview.classList.remove('d-none');
        };
        
        reader.readAsDataURL(input.files[0]);
    } else {
        preview.classList.add('d-none');
    }
}

// Handle registration
function handleRegistration() {
    const form = document.getElementById('registerForm');
    const submitBtn = form.querySelector('button[type="submit"]');
    const buttonText = submitBtn.querySelector('.button-text');
    const spinner = submitBtn.querySelector('.spinner-border');
    
    // Show loading state
    submitBtn.disabled = true;
    buttonText.textContent = 'Création du compte...';
    spinner.classList.remove('d-none');
    
    // Get form data
    const formData = new FormData(form);
    
    // Simulate API call
    setTimeout(() => {
        // Mock successful registration
        YOURS.showToast('Compte créé avec succès ! Vérifiez votre email pour activer votre compte.', 'success');
        
        // Redirect to login page
        setTimeout(() => {
            window.location.href = '${pageContext.request.contextPath}/pages/auth/login.jsp';
        }, 2000);
    }, 2000);
}
</script>

<%@ include file="../../layouts/footer.jsp" %>

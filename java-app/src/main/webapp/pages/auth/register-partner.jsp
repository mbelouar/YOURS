<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setAttribute("pageTitle", "Inscription Partenaire - YOURS");
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
                            <i class="bi bi-shop text-primary" style="font-size: 3rem;"></i>
                        </div>
                        <h2 class="fw-bold mb-2">Inscription Partenaire</h2>
                        <p class="text-muted">Rejoignez notre réseau de partenaires et louez votre matériel</p>
                    </div>

                    <!-- Registration Form -->
                    <form id="registerPartnerForm" class="needs-validation" novalidate>
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

                                <!-- Phone -->
                                <div class="mb-3">
                                    <label for="numTelephone" class="form-label">Téléphone *</label>
                                    <input type="tel" class="form-control" id="numTelephone" name="numTelephone" 
                                           required placeholder="+212 5 22 34 56 78" pattern="^(\+212|0)[5-7][0-9]{8}$">
                                    <div class="invalid-feedback">Format: +212 5 22 34 56 78</div>
                                </div>

                                <!-- Address -->
                                <div class="mb-3">
                                    <label for="adresse" class="form-label">Adresse *</label>
                                    <textarea class="form-control" id="adresse" name="adresse" rows="3" 
                                              required placeholder="Adresse complète de votre entreprise"></textarea>
                                    <div class="invalid-feedback">L'adresse est requise.</div>
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
                            </div>

                            <!-- Business & Account Information -->
                            <div class="col-md-6">
                                <h5 class="fw-bold mb-3">
                                    <i class="bi bi-building me-2"></i>Informations entreprise
                                </h5>

                                <!-- Business Name -->
                                <div class="mb-3">
                                    <label for="businessName" class="form-label">Nom de l'entreprise *</label>
                                    <input type="text" class="form-control" id="businessName" name="businessName" 
                                           required placeholder="Nom de votre entreprise">
                                    <div class="invalid-feedback">Le nom de l'entreprise est requis.</div>
                                </div>

                                <!-- Business Type -->
                                <div class="mb-3">
                                    <label for="businessType" class="form-label">Type d'activité *</label>
                                    <select class="form-select" id="businessType" name="businessType" required>
                                        <option value="">Sélectionnez votre activité</option>
                                        <option value="photo-video">Photographie/Vidéographie</option>
                                        <option value="event">Événementiel</option>
                                        <option value="production">Production audiovisuelle</option>
                                        <option value="rental">Location d'équipement</option>
                                        <option value="studio">Studio de production</option>
                                        <option value="freelance">Freelance</option>
                                        <option value="other">Autre</option>
                                    </select>
                                    <div class="invalid-feedback">Veuillez sélectionner votre type d'activité.</div>
                                </div>

                                <!-- Email -->
                                <div class="mb-3">
                                    <label for="mail" class="form-label">Email professionnel *</label>
                                    <input type="email" class="form-control" id="mail" name="mail" 
                                           required placeholder="contact@votre-entreprise.com">
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
                            </div>
                        </div>

                        <!-- Documents Section -->
                        <div class="row mt-4">
                            <div class="col-12">
                                <h5 class="fw-bold mb-3">
                                    <i class="bi bi-file-earmark-text me-2"></i>Documents requis
                                </h5>
                            </div>
                            
                            <!-- CIN Upload -->
                            <div class="col-md-6">
                                <label class="form-label">Pièce d'identité (CIN) *</label>
                                <div class="row">
                                    <div class="col-6">
                                        <label for="cinRECTO" class="form-label small">Recto</label>
                                        <input type="file" class="form-control form-control-sm" id="cinRECTO" 
                                               name="cinRECTO" accept="image/*" required onchange="previewImage(this, 'cinRectoPreview')">
                                        <img id="cinRectoPreview" class="img-thumbnail mt-1 d-none" style="max-width: 100px;">
                                        <div class="invalid-feedback">La CIN recto est requise.</div>
                                    </div>
                                    <div class="col-6">
                                        <label for="cinVERSO" class="form-label small">Verso</label>
                                        <input type="file" class="form-control form-control-sm" id="cinVERSO" 
                                               name="cinVERSO" accept="image/*" required onchange="previewImage(this, 'cinVersoPreview')">
                                        <img id="cinVersoPreview" class="img-thumbnail mt-1 d-none" style="max-width: 100px;">
                                        <div class="invalid-feedback">La CIN verso est requise.</div>
                                    </div>
                                </div>
                            </div>

                            <!-- Business Documents -->
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="businessDoc" class="form-label">Registre de commerce (optionnel)</label>
                                    <input type="file" class="form-control form-control-sm" id="businessDoc" 
                                           name="businessDoc" accept=".pdf,.jpg,.jpeg,.png">
                                    <small class="text-muted">PDF, JPG ou PNG - Max 5MB</small>
                                </div>
                                
                                <div class="mb-3">
                                    <label for="taxDoc" class="form-label">Patente (optionnel)</label>
                                    <input type="file" class="form-control form-control-sm" id="taxDoc" 
                                           name="taxDoc" accept=".pdf,.jpg,.jpeg,.png">
                                    <small class="text-muted">PDF, JPG ou PNG - Max 5MB</small>
                                </div>
                            </div>
                        </div>

                        <!-- Equipment Information -->
                        <div class="row mt-4">
                            <div class="col-12">
                                <h5 class="fw-bold mb-3">
                                    <i class="bi bi-tools me-2"></i>Informations sur votre matériel
                                </h5>
                            </div>
                            
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="equipmentTypes" class="form-label">Types d'équipement que vous possédez</label>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="cameras" name="equipmentTypes[]" value="cameras">
                                        <label class="form-check-label" for="cameras">Caméras</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="lighting" name="equipmentTypes[]" value="lighting">
                                        <label class="form-check-label" for="lighting">Éclairage</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="audio" name="equipmentTypes[]" value="audio">
                                        <label class="form-check-label" for="audio">Audio</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="stabilizers" name="equipmentTypes[]" value="stabilizers">
                                        <label class="form-check-label" for="stabilizers">Stabilisateurs</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="computers" name="equipmentTypes[]" value="computers">
                                        <label class="form-check-label" for="computers">Ordinateurs</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="accessories" name="equipmentTypes[]" value="accessories">
                                        <label class="form-check-label" for="accessories">Accessoires</label>
                                    </div>
                                </div>
                            </div>
                            
                            <div class="col-md-6">
                                <div class="mb-3">
                                    <label for="equipmentCount" class="form-label">Nombre approximatif d'équipements</label>
                                    <select class="form-select" id="equipmentCount" name="equipmentCount">
                                        <option value="">Sélectionnez</option>
                                        <option value="1-5">1-5 équipements</option>
                                        <option value="6-15">6-15 équipements</option>
                                        <option value="16-30">16-30 équipements</option>
                                        <option value="31-50">31-50 équipements</option>
                                        <option value="50+">Plus de 50 équipements</option>
                                    </select>
                                </div>
                                
                                <div class="mb-3">
                                    <label for="experience" class="form-label">Années d'expérience</label>
                                    <select class="form-select" id="experience" name="experience">
                                        <option value="">Sélectionnez</option>
                                        <option value="0-1">Moins d'1 an</option>
                                        <option value="1-3">1-3 ans</option>
                                        <option value="3-5">3-5 ans</option>
                                        <option value="5-10">5-10 ans</option>
                                        <option value="10+">Plus de 10 ans</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <!-- Terms and Conditions -->
                        <div class="mb-4">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="acceptTerms" name="acceptTerms" required>
                                <label class="form-check-label" for="acceptTerms">
                                    J'accepte les 
                                    <a href="#" class="text-decoration-none">conditions d'utilisation partenaires</a> 
                                    et la 
                                    <a href="#" class="text-decoration-none">politique de confidentialité</a> *
                                </label>
                                <div class="invalid-feedback">Vous devez accepter les conditions d'utilisation.</div>
                            </div>
                        </div>

                        <!-- Commission Agreement -->
                        <div class="mb-4">
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="acceptCommission" name="acceptCommission" required>
                                <label class="form-check-label" for="acceptCommission">
                                    J'accepte le système de commission de 15% sur chaque location *
                                </label>
                                <div class="invalid-feedback">Vous devez accepter le système de commission.</div>
                            </div>
                        </div>

                        <!-- Submit Button -->
                        <button type="submit" class="btn btn-primary btn-lg w-100 mb-3">
                            <i class="bi bi-shop me-2"></i>
                            <span class="button-text">Devenir partenaire</span>
                            <span class="spinner-border spinner-border-sm d-none" role="status"></span>
                        </button>
                    </form>

                    <!-- Login Link -->
                    <div class="text-center">
                        <p class="mb-0">
                            Déjà partenaire ? 
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
    const registerForm = document.getElementById('registerPartnerForm');
    const passwordInput = document.getElementById('motDepasse');
    const confirmPasswordInput = document.getElementById('confirmPassword');
    
    // Setup form validation
    registerForm.addEventListener('submit', function(e) {
        e.preventDefault();
        
        if (!registerForm.checkValidity() || !validatePasswords()) {
            registerForm.classList.add('was-validated');
            return;
        }
        
        handlePartnerRegistration();
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

// Handle partner registration
function handlePartnerRegistration() {
    const form = document.getElementById('registerPartnerForm');
    const submitBtn = form.querySelector('button[type="submit"]');
    const buttonText = submitBtn.querySelector('.button-text');
    const spinner = submitBtn.querySelector('.spinner-border');
    
    // Show loading state
    submitBtn.disabled = true;
    buttonText.textContent = 'Envoi de la demande...';
    spinner.classList.remove('d-none');
    
    // Get form data
    const formData = new FormData(form);
    
    // Simulate API call
    setTimeout(() => {
        // Mock successful registration
        YOURS.showToast('Demande de partenariat envoyée avec succès ! Nous examinerons votre dossier sous 48h.', 'success');
        
        // Redirect to login page
        setTimeout(() => {
            window.location.href = '${pageContext.request.contextPath}/pages/auth/login.jsp';
        }, 3000);
    }, 2500);
}
</script>

<%@ include file="../../layouts/footer.jsp" %>

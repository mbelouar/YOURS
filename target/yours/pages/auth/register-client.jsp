<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setAttribute("pageTitle", "Inscription - YOURS");
    
    // Handle server-side messages
    String error = (String) request.getAttribute("error");
    String success = request.getParameter("success");
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

                        <!-- Error Message -->
                        <div class="alert alert-danger d-none mb-3" id="errorAlert" role="alert" 
                             style="border-radius: 0.875rem; border: none; background: linear-gradient(135deg, #fee2e2 0%, #fecaca 100%); color: #dc2626;">
                            <i class="fas fa-exclamation-triangle me-2"></i>
                            <strong>Erreur d'inscription</strong> - <span id="errorMessage"></span>
                        </div>

                        <!-- Success Message -->
                        <div class="alert alert-success d-none mb-3" id="successAlert" role="alert" 
                             style="border-radius: 0.875rem; border: none; background: linear-gradient(135deg, #d1fae5 0%, #a7f3d0 100%); color: #059669;">
                            <i class="fas fa-check-circle me-2"></i>
                            <strong>Inscription réussie !</strong> - Votre compte a été créé avec succès.
                        </div>

                        <!-- Registration Form -->
                        <form id="registerForm" class="needs-validation" action="${pageContext.request.contextPath}/register" method="POST" enctype="multipart/form-data">
                            <input type="hidden" id="accountType" name="accountType" value="client">
                            
                            <!-- Client-specific fields -->
                            <div id="clientFields">
                                <div class="mb-4">
                                    <h6 class="fw-bold mb-3" style="color: var(--gray-800); font-size: 0.95rem;">
                                        <i class="fas fa-user me-2 text-primary"></i>Informations personnelles
                                    </h6>
                                </div>
                                <div class="row">
                                <!-- Row 1: Prénom + Nom -->
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="prenom" class="form-label fw-semibold" style="font-size: 0.9rem;">Pr&eacute;nom *</label>
                                        <input type="text" class="form-control" id="prenom" name="prenom" 
                                               required placeholder="Votre pr&eacute;nom" style="height: 2.75rem; font-size: 0.9rem;">
                                        <div class="invalid-feedback">Le pr&eacute;nom est requis.</div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="nom" class="form-label fw-semibold" style="font-size: 0.9rem;">Nom *</label>
                                        <input type="text" class="form-control" id="nom" name="nom" 
                                               required placeholder="Votre nom" style="height: 2.75rem; font-size: 0.9rem;">
                                        <div class="invalid-feedback">Le nom est requis.</div>
                                    </div>
                                </div>

                                <!-- Row 2: Email + Téléphone -->
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="mail" class="form-label fw-semibold" style="font-size: 0.9rem;">
                                            <span id="emailLabel">Email *</span>
                                        </label>
                                        <input type="email" class="form-control" id="mail" name="mail" 
                                               required placeholder="votre@email.com" style="height: 2.75rem; font-size: 0.9rem;">
                                        <div class="invalid-feedback">Veuillez saisir une adresse email valide.</div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <label for="numTelephone" class="form-label fw-semibold" style="font-size: 0.9rem;">
                                            <i class="fas fa-phone me-1 text-primary" style="font-size: 0.8rem;"></i>
                                            T&eacute;l&eacute;phone *
                                        </label>
                                        <input type="tel" class="form-control" id="numTelephone" name="numTelephone" 
                                               required placeholder="+212 6 12 34 56 78" style="height: 2.75rem; font-size: 0.9rem;">
                                        <div class="invalid-feedback">Le num&eacute;ro de t&eacute;l&eacute;phone est requis.</div>
                                    </div>
                                </div>

                                <!-- Row 3: Mot de passe + Confirmer le mot de passe -->
                                <div class="col-md-6">
                                    <div class="mb-3" id="clientPasswordField">
                                        <label for="motDePasseClient" class="form-label fw-semibold" style="font-size: 0.9rem;">
                                            <i class="fas fa-lock me-1 text-primary" style="font-size: 0.8rem;"></i>
                                            Mot de passe *
                                        </label>
                                        <div class="position-relative">
                                            <input type="password" class="form-control" id="motDePasseClient" name="motDepasseClient" 
                                                   required minlength="8" placeholder="Minimum 8 caract&egrave;res" style="height: 2.75rem; font-size: 0.9rem; padding-right: 3rem;">
                                            <button type="button" class="btn position-absolute end-0 top-50 translate-middle-y me-1" 
                                                    onclick="togglePassword('motDePasseClient')" style="z-index: 5; border: none; background: none; color: var(--gray-500); padding: 0.5rem;">
                                                <i class="fas fa-eye" id="motDePasseClientToggleIcon"></i>
                                            </button>
                                        </div>
                                        <div class="progress mt-1" style="height: 4px;">
                                            <div class="progress-bar" id="passwordStrengthClient" style="width: 0%"></div>
                                        </div>
                                        <small class="text-muted" id="passwordStrengthTextClient" style="font-size: 0.8rem;">Force du mot de passe</small>
                                        <div class="invalid-feedback">Le mot de passe doit contenir au moins 8 caract&egrave;res.</div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3" id="clientConfirmPasswordField">
                                        <label for="confirmPasswordClient" class="form-label fw-semibold" style="font-size: 0.9rem;">Confirmer le mot de passe *</label>
                                        <input type="password" class="form-control" id="confirmPasswordClient" name="confirmPassword" 
                                               required placeholder="Confirmez votre mot de passe" style="height: 2.75rem; font-size: 0.9rem;">
                                        <div class="invalid-feedback">Les mots de passe ne correspondent pas.</div>
                                    </div>
                                </div>
                            </div>
                            </div>

                            <!-- Partner-specific fields (hidden by default) -->
                            <div id="partnerFields" style="display: none;">
                                <!-- Personal Information Section Title -->
                                <div class="row mb-3">
                                    <div class="col-12">
                                        <h6 class="fw-bold mb-3" style="color: var(--gray-800); font-size: 0.95rem;">
                                            <i class="fas fa-user me-2 text-primary"></i>Informations personnelles
                                        </h6>
                                    </div>
                                </div>
                                
                                <div class="row">
                                    <!-- Partner Personal Information -->
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="partnerPrenom" class="form-label fw-semibold" style="font-size: 0.9rem;">Pr&eacute;nom *</label>
                                            <input type="text" class="form-control partner-required" id="partnerPrenom" name="partnerPrenom" 
                                                   placeholder="Votre pr&eacute;nom" style="height: 2.75rem; font-size: 0.9rem;">
                                            <div class="invalid-feedback">Le pr&eacute;nom est requis.</div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="partnerNom" class="form-label fw-semibold" style="font-size: 0.9rem;">Nom *</label>
                                            <input type="text" class="form-control partner-required" id="partnerNom" name="partnerNom" 
                                                   placeholder="Votre nom" style="height: 2.75rem; font-size: 0.9rem;">
                                            <div class="invalid-feedback">Le nom est requis.</div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="partnerMail" class="form-label fw-semibold" style="font-size: 0.9rem;">Email professionnel *</label>
                                            <input type="email" class="form-control partner-required" id="partnerMail" name="partnerMail" 
                                                   placeholder="votre@email.com" style="height: 2.75rem; font-size: 0.9rem;">
                                            <div class="invalid-feedback">Veuillez saisir une adresse email valide.</div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="mb-3">
                                            <label for="partnerNumTelephone" class="form-label fw-semibold" style="font-size: 0.9rem;">
                                                <i class="fas fa-phone me-1 text-primary" style="font-size: 0.8rem;"></i>
                                                T&eacute;l&eacute;phone *
                                            </label>
                                            <input type="tel" class="form-control partner-required" id="partnerNumTelephone" name="partnerNumTelephone" 
                                                   placeholder="+212 6 12 34 56 78" style="height: 2.75rem; font-size: 0.9rem;">
                                            <div class="invalid-feedback">Le num&eacute;ro de t&eacute;l&eacute;phone est requis.</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <!-- Left Column - Business Name -->
                                    <div class="col-md-6">
                                        <!-- Business Name -->
                                        <div class="mb-3">
                                            <label for="businessName" class="form-label fw-semibold" style="font-size: 0.9rem;">
                                                <i class="fas fa-building me-1 text-primary" style="font-size: 0.8rem;"></i>
                                                Nom de l'entreprise *
                                            </label>
                                            <input type="text" class="form-control partner-required" id="businessName" name="partnerBusinessName" 
                                                   placeholder="Nom de votre entreprise" style="height: 2.75rem; font-size: 0.9rem;">
                                            <div class="invalid-feedback">Le nom de l'entreprise est requis.</div>
                                        </div>
                                    </div>

                                    <!-- Right Column - Business Type -->
                                    <div class="col-md-6">
                                        <!-- Business Type -->
                                        <div class="mb-3">
                                            <label for="businessType" class="form-label fw-semibold" style="font-size: 0.9rem;">
                                                <i class="fas fa-tag me-1 text-primary" style="font-size: 0.8rem;"></i>
                                                Type d'activit&eacute; *
                                            </label>
                                            <select class="form-select partner-required" id="businessType" name="partnerBusinessType" style="height: 2.75rem; font-size: 0.9rem;">
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

                                <!-- Address Field - Full Width Row -->
                                <div class="row">
                                    <div class="col-12">
                                        <!-- Address -->
                                        <div class="mb-3">
                                            <label for="adresse" class="form-label fw-semibold" style="font-size: 0.9rem;">
                                                <i class="fas fa-map-marker-alt me-1 text-primary" style="font-size: 0.8rem;"></i>
                                                Adresse de l'entreprise *
                                            </label>
                                            <textarea class="form-control partner-required" id="adresse" name="adresse" 
                                                      rows="3" placeholder="Adresse complète de votre entreprise" 
                                                      style="font-size: 0.9rem; resize: vertical;"></textarea>
                                            <div class="invalid-feedback">L'adresse de l'entreprise est requise.</div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Password Fields Row -->
                                <div class="row">
                                    <div class="col-md-6">
                                        <!-- Password -->
                                        <div class="mb-3">
                                            <label for="motDepasse" class="form-label fw-semibold" style="font-size: 0.9rem;">
                                                <i class="fas fa-lock me-1 text-primary" style="font-size: 0.8rem;"></i>
                                                Mot de passe *
                                            </label>
                                            <div class="position-relative">
                                                <input type="password" class="form-control" id="motDepasse" name="partnerMotDepasse" 
                                                       placeholder="Minimum 8 caract&egrave;res" style="height: 2.75rem; font-size: 0.9rem; padding-right: 3rem;">
                                                <button type="button" class="btn position-absolute end-0 top-50 translate-middle-y me-1" 
                                                        onclick="togglePassword('motDepasse')" style="z-index: 5; border: none; background: none; color: var(--gray-500); padding: 0.5rem;">
                                                    <i class="fas fa-eye" id="motDepasseToggleIcon"></i>
                                                </button>
                                            </div>
                                            <div class="progress mt-1" style="height: 4px;">
                                                <div class="progress-bar" id="passwordStrength" style="width: 0%"></div>
                                            </div>
                                            <small class="text-muted" id="passwordStrengthText" style="font-size: 0.8rem;">Force du mot de passe</small>
                                            <div class="invalid-feedback">Le mot de passe doit contenir au moins 8 caract&egrave;res.</div>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <!-- Confirm Password -->
                                        <div class="mb-3">
                                            <label for="confirmPassword" class="form-label fw-semibold" style="font-size: 0.9rem;">Confirmer le mot de passe *</label>
                                            <input type="password" class="form-control" id="confirmPassword" name="partnerConfirmPassword" 
                                                   placeholder="Confirmez votre mot de passe" style="height: 2.75rem; font-size: 0.9rem;">
                                            <div class="invalid-feedback">Les mots de passe ne correspondent pas.</div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <!-- Partner-specific sections (full width, hidden by default) -->
                            <div id="partnerSections" style="display: none;">
                                <div class="col-12">
                                    <hr class="my-4" style="border-color: var(--gray-200);">

                                    <!-- Required Documents Section -->
                                    <h6 class="fw-bold mb-3" style="color: var(--gray-800); font-size: 0.95rem;">
                                        <i class="fas fa-file-alt me-2 text-primary"></i>Documents requis
                                    </h6>
                                    <div class="row">
                                        <div class="col-12">
                                            <!-- CIN Upload -->
                                            <div class="mb-3">
                                                <label class="form-label fw-semibold" style="font-size: 0.9rem;">
                                                    Pi&egrave;ce d'identit&eacute; (CIN) *
                                                </label>
                                                <div class="row g-2">
                                                    <div class="col-md-6">
                                                        <label for="cinRECTO" class="form-label small">Recto</label>
                                                        <input type="file" class="form-control partner-required" id="cinRECTO" 
                                                               name="cinRECTO" accept="image/*" onchange="previewImage(this, 'cinRectoPreview')" style="height: 2.75rem; font-size: 0.9rem; padding-top: 0.55rem;">
                                                        <img id="cinRectoPreview" class="img-thumbnail mt-1 d-none" style="max-width: 80px; border-radius: 0.375rem;">
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label for="cinVERSO" class="form-label small">Verso</label>
                                                        <input type="file" class="form-control partner-required" id="cinVERSO" 
                                                               name="cinVERSO" accept="image/*" onchange="previewImage(this, 'cinVersoPreview')" style="height: 2.75rem; font-size: 0.9rem; padding-top: 0.55rem;">
                                                        <img id="cinVersoPreview" class="img-thumbnail mt-1 d-none" style="max-width: 80px; border-radius: 0.375rem;">
                                                    </div>
                                                </div>
                                                <div class="invalid-feedback">Les deux faces de la CIN sont requises.</div>
                                            </div>

                                            <!-- Photo de profil -->
                                            <div class="mb-3">
                                                <label for="photoPerso" class="form-label fw-semibold" style="font-size: 0.9rem;">
                                                    <i class="fas fa-camera me-1 text-primary" style="font-size: 0.8rem;"></i>
                                                    Photo de profil
                                                </label>
                                                <input type="file" class="form-control" id="photoPerso" name="photoPerso" 
                                                       accept="image/*" onchange="previewImage(this, 'photoPreview')" style="height: 2.75rem; font-size: 0.9rem; padding-top: 0.55rem;">
                                                <div class="mt-2">
                                                    <img id="photoPreview" class="img-thumbnail d-none" style="max-width: 100px; border-radius: 0.5rem;">
                                                </div>
                                            </div>
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
    display: flex;
    width: 100%;
    max-width: 400px;
    margin: 0 auto;
}

.user-type-toggle .btn-outline-primary {
    flex: 1;
    padding: 0.75rem 1.5rem;
    font-weight: 600;
    font-size: 0.95rem;
    border: 2px solid var(--gray-200);
    color: var(--gray-700);
    background: white;
    transition: all 0.3s ease;
    text-align: center;
    min-width: 0;
}

.user-type-toggle .btn-check:checked + .btn-outline-primary {
    background: linear-gradient(135deg, var(--primary-600), var(--primary-700));
    color: white;
    border-color: var(--primary-600);
    box-shadow: 0 4px 12px rgba(37, 99, 235, 0.3);
}

.user-type-toggle .btn-outline-primary:hover:not(:has(.btn-check:checked)) {
    background: var(--primary-50);
    border-color: var(--primary-300);
    color: var(--primary-700);
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

/* File Input Styling */
.form-control[type="file"] {
    background: white;
    border: 2px solid var(--gray-200);
    color: var(--gray-700);
    font-weight: 400;
    font-size: 0.9rem;
}

.form-control[type="file"]:hover {
    background: white;
    border-color: var(--primary-300);
    color: var(--gray-800);
}

.form-control[type="file"]:focus {
    background: white;
    border-color: var(--primary-500);
    color: var(--gray-800);
    box-shadow: 0 0 0 0.2rem rgba(37, 99, 235, 0.15);
}

.form-control[type="file"]::-webkit-file-upload-button {
    background: var(--primary-600);
    color: white;
    border: none;
    border-radius: 0.375rem;
    padding: 0.375rem 0.75rem;
    margin-right: 0.5rem;
    font-weight: 500;
    font-size: 0.8rem;
    transition: all 0.2s ease;
    cursor: pointer;
}

.form-control[type="file"]::-webkit-file-upload-button:hover {
    background: var(--primary-700);
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
    
    .user-type-toggle {
        max-width: 350px;
    }
    
    .user-type-toggle .btn-outline-primary {
        padding: 0.625rem 1rem;
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
    const accountTypeInput = document.getElementById('accountType');
    const emailLabel = document.getElementById('emailLabel');
    
    // Handle server-side messages
    <% if (error != null) { %>
        showError('<%= error %>');
    <% } %>
    
    <% if (success != null) { %>
        showSuccess();
    <% } %>
    
    // Update navbar links to redirect to homepage sections
    updateNavbarLinks();
    
    // Initialize form state - ensure client mode is properly set
    initializeFormState();
    
    // Check URL parameter for mode and auto-select partner if needed
    const urlParams = new URLSearchParams(window.location.search);
    if (urlParams.get('mode') === 'partner') {
        document.getElementById('typePartner').checked = true;
        document.getElementById('typePartner').dispatchEvent(new Event('change'));
    }
    
    // User type toggle handler
    const partnerFields = document.getElementById('partnerFields');
    const partnerSections = document.getElementById('partnerSections');
    const clientFields = document.getElementById('clientFields');
    const clientPasswordField = document.getElementById('clientPasswordField');
    const clientConfirmPasswordField = document.getElementById('clientConfirmPasswordField');
    
    userTypeRadios.forEach(radio => {
        radio.addEventListener('change', function() {
            if (this.value === 'partner') {
                // Hide client fields completely
                clientFields.style.display = 'none';
                
                // Remove required attribute from client fields to prevent validation issues
                const clientRequiredFields = ['prenom', 'nom', 'mail', 'numTelephone', 'motDePasseClient', 'confirmPasswordClient'];
                clientRequiredFields.forEach(fieldName => {
                    const field = document.getElementById(fieldName);
                    if (field) {
                        field.required = false;
                        field.setCustomValidity('');
                    }
                });
                
                // Show partner fields
                partnerFields.style.display = 'block';
                partnerSections.style.display = 'block';
                emailLabel.textContent = 'Email professionnel *';
                accountTypeInput.value = 'partner';
                
                // Make partner fields required and clear validation
                document.querySelectorAll('.partner-required').forEach(field => {
                    field.required = true;
                    field.setCustomValidity('');
                });
                
                // Make partner password fields required and clear validation
                const partnerPassword = document.getElementById('motDepasse');
                const partnerConfirmPassword = document.getElementById('confirmPassword');
                if (partnerPassword) {
                    partnerPassword.required = true;
                    partnerPassword.setCustomValidity('');
                    partnerPassword.removeAttribute('disabled');
                }
                if (partnerConfirmPassword) {
                    partnerConfirmPassword.required = true;
                    partnerConfirmPassword.setCustomValidity('');
                    partnerConfirmPassword.removeAttribute('disabled');
                }
            } else {
                // Show client fields completely
                clientFields.style.display = 'block';
                
                // Restore required attribute to client fields
                const clientRequiredFields = ['prenom', 'nom', 'mail', 'numTelephone', 'motDePasseClient', 'confirmPasswordClient'];
                clientRequiredFields.forEach(fieldName => {
                    const field = document.getElementById(fieldName);
                    if (field) {
                        field.required = true;
                        field.setCustomValidity('');
                    }
                });
                
                // Hide partner fields
                partnerFields.style.display = 'none';
                partnerSections.style.display = 'none';
                emailLabel.textContent = 'Email *';
                accountTypeInput.value = 'client';
                
                // Make partner fields not required and clear validation
                document.querySelectorAll('.partner-required').forEach(field => {
                    field.required = false;
                    field.setCustomValidity('');
                });
                
                // Make partner password fields not required and clear validation
                const partnerPassword = document.getElementById('motDepasse');
                const partnerConfirmPassword = document.getElementById('confirmPassword');
                if (partnerPassword) {
                    partnerPassword.required = false;
                    partnerPassword.setCustomValidity('');
                    partnerPassword.disabled = true;
                }
                if (partnerConfirmPassword) {
                    partnerConfirmPassword.required = false;
                    partnerConfirmPassword.setCustomValidity('');
                    partnerConfirmPassword.disabled = true;
                }
            }
        });
    });
    
    // Setup form validation
    registerForm.addEventListener('submit', function(e) {
        // Let browser validation run first
        if (!this.checkValidity()) {
            e.preventDefault();
            e.stopPropagation();
            this.classList.add('was-validated');
            return false;
        }
        
        // If browser validation passes, run our custom validation
        console.log('Form submission started');
        console.log('Account type:', document.getElementById('accountType').value);
        
        // Validate passwords before submission
        const passwordValidation = validatePasswords();
        console.log('Password validation result:', passwordValidation);
        
        if (!passwordValidation) {
            // Show error message
            showError('Veuillez vérifier que les mots de passe correspondent et sont remplis.');
            e.preventDefault();
            return false;
        }
        
        // Validate required fields based on account type
        const accountType = document.getElementById('accountType').value;
        if (accountType === 'partner') {
            // Validate partner personal info
            const partnerNom = document.getElementById('partnerNom');
            const partnerPrenom = document.getElementById('partnerPrenom');
            const partnerMail = document.getElementById('partnerMail');
            const partnerNumTelephone = document.getElementById('partnerNumTelephone');
            
            if (!partnerNom || !partnerNom.value.trim()) {
                showError('Le nom est requis.');
                e.preventDefault();
                return false;
            }
            
            if (!partnerPrenom || !partnerPrenom.value.trim()) {
                showError('Le prénom est requis.');
                e.preventDefault();
                return false;
            }
            
            if (!partnerMail || !partnerMail.value.trim()) {
                showError('L\'email professionnel est requis.');
                e.preventDefault();
                return false;
            }
            
            if (!partnerNumTelephone || !partnerNumTelephone.value.trim()) {
                showError('Le numéro de téléphone est requis.');
                e.preventDefault();
                return false;
            }
            
        }
        
        console.log('All validations passed, submitting form');
        
        // Show loading state
        const submitBtn = registerForm.querySelector('button[type="submit"]');
        const buttonText = submitBtn.querySelector('.button-text');
        const spinner = submitBtn.querySelector('.spinner-border');
        const icon = submitBtn.querySelector('i.fas');
        
        submitBtn.disabled = true;
        submitBtn.classList.add('loading-pulse');
        buttonText.textContent = 'Création du compte...';
        spinner.classList.remove('d-none');
        icon.style.display = 'none';
        
        // Submit the form
        this.submit();
    });
    
    // Password strength indicator for partner
    passwordInput.addEventListener('input', updatePasswordStrengthPartner);
    
    // Password confirmation validation for partner
    confirmPasswordInput.addEventListener('input', validatePasswords);
    
    // Password strength indicator for client
    const clientPasswordInput = document.getElementById('motDePasseClient');
    const clientConfirmPasswordInput = document.getElementById('confirmPasswordClient');
    
    clientPasswordInput.addEventListener('input', updatePasswordStrengthClient);
    clientConfirmPasswordInput.addEventListener('input', validatePasswords);
    
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

// Show error message using notification system
function showError(message) {
    // Show toggle notification for errors
    if (window.notificationSystem) {
        notificationSystem.error(message || 'Une erreur est survenue lors de la création du compte. Veuillez réessayer.', 6000);
    }
}

// Show success message using notification system
function showSuccess() {
    // Show toggle notification
    notificationSystem.success('Votre compte a été créé avec succès ! Vous allez être redirigé vers la page de connexion.', 5000);
    
    // Redirect to login page after 3 seconds
    setTimeout(() => {
        window.location.href = '${pageContext.request.contextPath}/pages/auth/login.jsp?success=registered';
    }, 3000);
}

// Initialize form state to ensure proper validation
function initializeFormState() {
    // Ensure client mode is selected by default
    const clientRadio = document.getElementById('typeClient');
    const accountTypeInput = document.getElementById('accountType');
    
    if (clientRadio && !clientRadio.checked) {
        clientRadio.checked = true;
        if (accountTypeInput) {
            accountTypeInput.value = 'client';
        }
        clientRadio.dispatchEvent(new Event('change'));
    }
    
    // Ensure account type is set
    if (accountTypeInput && !accountTypeInput.value) {
        accountTypeInput.value = 'client';
    }
    
    
    // Clear any existing validation states
    const form = document.getElementById('registerForm');
    if (form) {
        form.classList.remove('was-validated');
    }
    
    // Clear custom validity on all password fields and disable partner fields
    const passwordFields = ['motDepasse', 'confirmPassword', 'motDePasseClient', 'confirmPasswordClient'];
    passwordFields.forEach(fieldId => {
        const field = document.getElementById(fieldId);
        if (field) {
            field.setCustomValidity('');
            // Disable partner fields by default
            if (fieldId === 'motDepasse' || fieldId === 'confirmPassword') {
                field.disabled = true;
                field.required = false;
            }
        }
    });
    
    // Ensure client fields are required by default
    const clientRequiredFields = ['prenom', 'nom', 'mail', 'numTelephone', 'motDePasseClient', 'confirmPasswordClient'];
    clientRequiredFields.forEach(fieldName => {
        const field = document.getElementById(fieldName);
        if (field) {
            field.required = true;
            field.setCustomValidity('');
        }
    });
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

// Update password strength for client
function updatePasswordStrengthClient() {
    const password = document.getElementById('motDePasseClient').value;
    const strengthBar = document.getElementById('passwordStrengthClient');
    const strengthText = document.getElementById('passwordStrengthTextClient');
    
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

// Update password strength for partner
function updatePasswordStrengthPartner() {
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
    const accountType = document.getElementById('accountType').value;
    console.log('Validating passwords for account type:', accountType);
    
    if (accountType === 'partner') {
        const password = document.getElementById('motDepasse');
        const confirmPassword = document.getElementById('confirmPassword');
        
        console.log('Partner password fields found:', password !== null, confirmPassword !== null);
        console.log('Password value:', password ? password.value : 'null');
        console.log('Confirm password value:', confirmPassword ? confirmPassword.value : 'null');
        
        if (!password || !confirmPassword) {
            console.log('Partner password fields not found');
            return true; // Skip validation if elements don't exist
        }
        
        // Clear any existing validation
        password.setCustomValidity('');
        confirmPassword.setCustomValidity('');
        
        if (password.value.trim() === '') {
            console.log('Password is empty');
            password.setCustomValidity('Le mot de passe est requis');
            return false;
        }
        
        if (confirmPassword.value.trim() === '') {
            console.log('Confirm password is empty');
            confirmPassword.setCustomValidity('La confirmation du mot de passe est requise');
            return false;
        }
        
        if (password.value !== confirmPassword.value) {
            console.log('Passwords do not match');
            confirmPassword.setCustomValidity('Les mots de passe ne correspondent pas');
            return false;
        } else {
            console.log('Passwords match - validation passed');
            confirmPassword.setCustomValidity('');
            return true;
        }
    } else {
        const password = document.getElementById('motDePasseClient');
        const confirmPassword = document.getElementById('confirmPasswordClient');
        
        console.log('Client password fields found:', password !== null, confirmPassword !== null);
        console.log('Password value:', password ? password.value : 'null');
        console.log('Confirm password value:', confirmPassword ? confirmPassword.value : 'null');
        
        if (!password || !confirmPassword) {
            console.log('Client password fields not found');
            return true; // Skip validation if elements don't exist
        }
        
        // Clear any existing validation
        password.setCustomValidity('');
        confirmPassword.setCustomValidity('');
        
        if (password.value.trim() === '') {
            console.log('Password is empty');
            password.setCustomValidity('Le mot de passe est requis');
            return false;
        }
        
        if (confirmPassword.value.trim() === '') {
            console.log('Confirm password is empty');
            confirmPassword.setCustomValidity('La confirmation du mot de passe est requise');
            return false;
        }
        
        if (password.value !== confirmPassword.value) {
            console.log('Passwords do not match');
            confirmPassword.setCustomValidity('Les mots de passe ne correspondent pas');
            return false;
        } else {
            console.log('Passwords match - validation passed');
            confirmPassword.setCustomValidity('');
            return true;
        }
    }
}

// Registration is now handled by the servlet backend

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
</script>

<%@ include file="../../layouts/footer.jsp" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setAttribute("pageTitle", "Mon Profil - YOURS");
%>

<%@ include file="../../layouts/header.jsp" %>
<%@ include file="../../layouts/navbar.jsp" %>

<!-- Page Header -->
<section class="py-4" style="background: linear-gradient(135deg, #059669 0%, #047857 50%, #065f46 100%); margin-top: -80px; padding-top: calc(80px + 3rem) !important; padding-bottom: 3rem !important;">
    <div class="container">
        <h1 class="display-6 fw-bold mb-2" style="color: white;">
            <i class="fas fa-user-circle me-3"></i>Mon Profil Partenaire
        </h1>
        <p class="mb-0" style="color: rgba(255, 255, 255, 0.9);">
            Gérez vos informations personnelles et professionnelles
        </p>
    </div>
</section>

<!-- Profile Content -->
<div class="container py-5">
    <div class="row g-4">
        <!-- Profile Sidebar -->
        <div class="col-lg-4">
            <div class="card border-0 shadow-sm mb-4">
                <div class="card-body text-center p-4">
                    <div class="position-relative d-inline-block mb-3">
                        <img src="https://ui-avatars.com/api/?name=Partner&size=120&background=10b981&color=fff" 
                             class="rounded-circle" style="width: 120px; height: 120px;">
                        <button class="btn btn-sm btn-primary rounded-circle position-absolute bottom-0 end-0" 
                                style="width: 36px; height: 36px;">
                            <i class="fas fa-camera"></i>
                        </button>
                    </div>
                    <h4 class="fw-bold mb-1" id="partnerFullName">Partenaire Demo</h4>
                    <p class="text-muted mb-3" id="partnerEmail">partner@demo.com</p>
                    <div class="d-flex justify-content-center gap-3 mb-3">
                        <div class="text-center">
                            <h5 class="fw-bold mb-0">8</h5>
                            <small class="text-muted">Matériels</small>
                        </div>
                        <div class="text-center border-start border-end px-3">
                            <h5 class="fw-bold mb-0">42</h5>
                            <small class="text-muted">Locations</small>
                        </div>
                        <div class="text-center">
                            <h5 class="fw-bold mb-0">4.8</h5>
                            <small class="text-muted">Note</small>
                        </div>
                    </div>
                    <span class="badge bg-success">Compte Vérifié</span>
                </div>
            </div>

            <!-- Verification Status -->
            <div class="card border-0 shadow-sm">
                <div class="card-header bg-white border-0 py-3">
                    <h6 class="mb-0 fw-bold">
                        <i class="fas fa-shield-alt me-2 text-primary"></i>Vérification du Compte
                    </h6>
                </div>
                <div class="card-body">
                    <div class="mb-3 d-flex align-items-center justify-content-between">
                        <div class="d-flex align-items-center">
                            <i class="fas fa-envelope text-success me-2"></i>
                            <span>Email</span>
                        </div>
                        <i class="fas fa-check-circle text-success"></i>
                    </div>
                    <div class="mb-3 d-flex align-items-center justify-content-between">
                        <div class="d-flex align-items-center">
                            <i class="fas fa-phone text-success me-2"></i>
                            <span>Téléphone</span>
                        </div>
                        <i class="fas fa-check-circle text-success"></i>
                    </div>
                    <div class="d-flex align-items-center justify-content-between">
                        <div class="d-flex align-items-center">
                            <i class="fas fa-id-card text-warning me-2"></i>
                            <span>CIN</span>
                        </div>
                        <button class="btn btn-sm btn-outline-primary" onclick="showCINModal()">
                            Vérifier
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Profile Forms -->
        <div class="col-lg-8">
            <!-- Personal Information -->
            <div class="card border-0 shadow-sm mb-4">
                <div class="card-header bg-white border-0 py-3">
                    <h5 class="mb-0 fw-bold">
                        <i class="fas fa-user me-2 text-primary"></i>Informations Personnelles
                    </h5>
                </div>
                <div class="card-body p-4">
                    <form id="personalInfoForm">
                        <div class="row">
                            <div class="col-md-6 mb-3">
                                <label class="form-label fw-semibold">Prénom</label>
                                <input type="text" class="form-control form-control-lg" id="prenom" value="Demo">
                            </div>
                            <div class="col-md-6 mb-3">
                                <label class="form-label fw-semibold">Nom</label>
                                <input type="text" class="form-control form-control-lg" id="nom" value="Partenaire">
                            </div>
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-semibold">Email</label>
                            <input type="email" class="form-control form-control-lg" id="email" value="partner@demo.com">
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-semibold">Téléphone</label>
                            <input type="tel" class="form-control form-control-lg" id="telephone" value="+212 6 00 00 00 00">
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-semibold">Adresse</label>
                            <textarea class="form-control" id="adresse" rows="2">123 Rue Exemple, Casablanca, Maroc</textarea>
                        </div>
                        <button type="submit" class="btn btn-primary btn-lg">
                            <i class="fas fa-save me-2"></i>Enregistrer les modifications
                        </button>
                    </form>
                </div>
            </div>

            <!-- Business Information -->
            <div class="card border-0 shadow-sm">
                <div class="card-header bg-white border-0 py-3">
                    <h5 class="mb-0 fw-bold">
                        <i class="fas fa-briefcase me-2 text-success"></i>Informations Professionnelles
                    </h5>
                </div>
                <div class="card-body p-4">
                    <form id="businessInfoForm">
                        <div class="mb-3">
                            <label class="form-label fw-semibold">Nom de l'entreprise</label>
                            <input type="text" class="form-control form-control-lg" placeholder="Optionnel">
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-semibold">Description de votre activité</label>
                            <textarea class="form-control" rows="3" placeholder="Décrivez vos services..."></textarea>
                        </div>
                        <button type="submit" class="btn btn-success btn-lg">
                            <i class="fas fa-save me-2"></i>Enregistrer
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- CIN Verification Modal -->
<div class="modal fade" id="cinModal" tabindex="-1">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content border-0 shadow-lg">
            <div class="modal-header bg-primary text-white border-0">
                <h5 class="modal-title fw-bold">
                    <i class="fas fa-id-card me-2"></i>Vérification CIN
                </h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body p-4">
                <p class="text-muted mb-4">Veuillez télécharger les photos de votre CIN (recto et verso) pour vérifier votre identité.</p>
                <form id="cinForm">
                    <div class="mb-4">
                        <label class="form-label fw-semibold">CIN Recto</label>
                        <input type="file" class="form-control form-control-lg" accept="image/*" required>
                    </div>
                    <div class="mb-4">
                        <label class="form-label fw-semibold">CIN Verso</label>
                        <input type="file" class="form-control form-control-lg" accept="image/*" required>
                    </div>
                    <div class="alert alert-info">
                        <i class="fas fa-info-circle me-2"></i>
                        <small>Assurez-vous que les photos sont claires et lisibles. La vérification prend généralement 24-48 heures.</small>
                    </div>
                </form>
            </div>
            <div class="modal-footer border-0 bg-light">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
                <button type="button" class="btn btn-primary" onclick="submitCINVerification()">
                    <i class="fas fa-upload me-2"></i>Soumettre
                </button>
            </div>
        </div>
    </div>
</div>

<script>
let cinModal;

document.addEventListener('DOMContentLoaded', function() {
    cinModal = new bootstrap.Modal(document.getElementById('cinModal'));
    loadPartnerProfile();
    
    document.getElementById('personalInfoForm').addEventListener('submit', function(e) {
        e.preventDefault();
        savePersonalInfo();
    });
});

function loadPartnerProfile() {
    try {
        const user = localStorage.getItem('yours_user') || sessionStorage.getItem('yours_user');
        if (user) {
            const userData = JSON.parse(user);
            if (userData.type === 'partner') {
                document.getElementById('partnerFullName').textContent = `${userData.prenom} ${userData.nom}`;
                document.getElementById('partnerEmail').textContent = userData.email;
            }
        }
    } catch (error) {
        console.error('Error loading partner profile:', error);
    }
}

function savePersonalInfo() {
    // Save personal information - replace with actual API call
    alert('Informations enregistrées avec succès!');
}

function showCINModal() {
    cinModal.show();
}

function submitCINVerification() {
    // Submit CIN verification - replace with actual API call
    alert('Documents soumis avec succès! Vérification en cours...');
    cinModal.hide();
}
</script>

<%@ include file="../../layouts/footer.jsp" %>


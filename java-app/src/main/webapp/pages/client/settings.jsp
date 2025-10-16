<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setAttribute("pageTitle", "Paramètres - YOURS");
%>

<%@ include file="../../layouts/header.jsp" %>
<%@ include file="../../layouts/navbar.jsp" %>

<div class="container py-5" style="margin-top: 80px;">
    <!-- Breadcrumb -->
    <nav aria-label="breadcrumb" class="mb-4">
        <ol class="breadcrumb breadcrumb-custom">
            <li class="breadcrumb-item">
                <a href="${pageContext.request.contextPath}/pages/client/dashboard.jsp">
                    <i class="bi bi-house me-1"></i>Tableau de bord
                </a>
            </li>
            <li class="breadcrumb-item active">Paramètres</li>
        </ol>
    </nav>

    <div class="row">
        <div class="col-lg-3 mb-4">
            <!-- Settings Navigation -->
            <div class="card border-0 shadow-sm">
                <div class="card-header bg-white border-0 py-3">
                    <h5 class="fw-bold mb-0">
                        <i class="bi bi-gear me-2 text-primary"></i>Paramètres
                    </h5>
                </div>
                <div class="list-group list-group-flush">
                    <a href="#account" class="list-group-item list-group-item-action active">
                        <i class="bi bi-person-circle me-2"></i>Compte
                    </a>
                    <a href="#notifications" class="list-group-item list-group-item-action">
                        <i class="bi bi-bell me-2"></i>Notifications
                    </a>
                    <a href="#security" class="list-group-item list-group-item-action">
                        <i class="bi bi-shield-lock me-2"></i>Sécurité
                    </a>
                    <a href="#preferences" class="list-group-item list-group-item-action">
                        <i class="bi bi-sliders me-2"></i>Préférences
                    </a>
                    <a href="#privacy" class="list-group-item list-group-item-action">
                        <i class="bi bi-eye-slash me-2"></i>Confidentialité
                    </a>
                </div>
            </div>
        </div>

        <div class="col-lg-9">
            <!-- Account Settings -->
            <div class="card border-0 shadow-sm mb-4" id="account">
                <div class="card-header bg-white border-0 py-3">
                    <h5 class="fw-bold mb-0">
                        <i class="bi bi-person-circle me-2 text-primary"></i>Paramètres du compte
                    </h5>
                </div>
                <div class="card-body p-4">
                    <form>
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label fw-semibold">Langue</label>
                                <select class="form-select">
                                    <option selected>Français</option>
                                    <option>English</option>
                                    <option>العربية</option>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-semibold">Fuseau horaire</label>
                                <select class="form-select">
                                    <option selected>GMT+1 (Casablanca)</option>
                                    <option>GMT+0 (London)</option>
                                    <option>GMT+2 (Paris)</option>
                                </select>
                            </div>
                            <div class="col-12">
                                <button type="submit" class="btn btn-primary">
                                    <i class="bi bi-check-circle me-2"></i>Enregistrer les modifications
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <!-- Notification Settings -->
            <div class="card border-0 shadow-sm mb-4" id="notifications">
                <div class="card-header bg-white border-0 py-3">
                    <h5 class="fw-bold mb-0">
                        <i class="bi bi-bell me-2 text-primary"></i>Notifications
                    </h5>
                </div>
                <div class="card-body p-4">
                    <div class="form-check form-switch mb-3">
                        <input class="form-check-input" type="checkbox" id="emailNotif" checked>
                        <label class="form-check-label fw-semibold" for="emailNotif">
                            Notifications par email
                        </label>
                        <div><small class="text-muted">Recevoir les mises à jour par email</small></div>
                    </div>
                    <div class="form-check form-switch mb-3">
                        <input class="form-check-input" type="checkbox" id="smsNotif">
                        <label class="form-check-label fw-semibold" for="smsNotif">
                            Notifications SMS
                        </label>
                        <div><small class="text-muted">Recevoir les alertes par SMS</small></div>
                    </div>
                    <div class="form-check form-switch mb-3">
                        <input class="form-check-input" type="checkbox" id="reservationNotif" checked>
                        <label class="form-check-label fw-semibold" for="reservationNotif">
                            Rappels de réservation
                        </label>
                        <div><small class="text-muted">Rappels avant le début et la fin des réservations</small></div>
                    </div>
                    <div class="form-check form-switch mb-3">
                        <input class="form-check-input" type="checkbox" id="promoNotif" checked>
                        <label class="form-check-label fw-semibold" for="promoNotif">
                            Offres promotionnelles
                        </label>
                        <div><small class="text-muted">Recevoir les offres spéciales et promotions</small></div>
                    </div>
                    <button type="submit" class="btn btn-primary mt-3">
                        <i class="bi bi-check-circle me-2"></i>Enregistrer les modifications
                    </button>
                </div>
            </div>

            <!-- Security Settings -->
            <div class="card border-0 shadow-sm mb-4" id="security">
                <div class="card-header bg-white border-0 py-3">
                    <h5 class="fw-bold mb-0">
                        <i class="bi bi-shield-lock me-2 text-primary"></i>Sécurité
                    </h5>
                </div>
                <div class="card-body p-4">
                    <div class="d-flex justify-content-between align-items-center mb-3 pb-3 border-bottom">
                        <div>
                            <h6 class="mb-1 fw-semibold">Mot de passe</h6>
                            <small class="text-muted">Dernière modification il y a 3 mois</small>
                        </div>
                        <a href="${pageContext.request.contextPath}/pages/client/profile.jsp" class="btn btn-outline-primary btn-sm">
                            <i class="bi bi-key me-1"></i>Modifier
                        </a>
                    </div>
                    <div class="d-flex justify-content-between align-items-center mb-3 pb-3 border-bottom">
                        <div>
                            <h6 class="mb-1 fw-semibold">Authentification à deux facteurs</h6>
                            <small class="text-muted">Sécurisez votre compte avec 2FA</small>
                        </div>
                        <div class="form-check form-switch">
                            <input class="form-check-input" type="checkbox" id="2fa">
                        </div>
                    </div>
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <h6 class="mb-1 fw-semibold">Sessions actives</h6>
                            <small class="text-muted">Gérer vos sessions actives</small>
                        </div>
                        <button class="btn btn-outline-secondary btn-sm">
                            <i class="bi bi-eye me-1"></i>Voir
                        </button>
                    </div>
                </div>
            </div>

            <!-- Preferences -->
            <div class="card border-0 shadow-sm mb-4" id="preferences">
                <div class="card-header bg-white border-0 py-3">
                    <h5 class="fw-bold mb-0">
                        <i class="bi bi-sliders me-2 text-primary"></i>Préférences
                    </h5>
                </div>
                <div class="card-body p-4">
                    <div class="form-check form-switch mb-3">
                        <input class="form-check-input" type="checkbox" id="darkMode">
                        <label class="form-check-label fw-semibold" for="darkMode">
                            Mode sombre
                        </label>
                        <div><small class="text-muted">Utiliser le thème sombre (bientôt disponible)</small></div>
                    </div>
                    <div class="form-check form-switch mb-3">
                        <input class="form-check-input" type="checkbox" id="compactView">
                        <label class="form-check-label fw-semibold" for="compactView">
                            Vue compacte
                        </label>
                        <div><small class="text-muted">Affichage condensé des informations</small></div>
                    </div>
                    <button type="submit" class="btn btn-primary mt-3">
                        <i class="bi bi-check-circle me-2"></i>Enregistrer les modifications
                    </button>
                </div>
            </div>

            <!-- Privacy Settings -->
            <div class="card border-0 shadow-sm" id="privacy">
                <div class="card-header bg-white border-0 py-3">
                    <h5 class="fw-bold mb-0">
                        <i class="bi bi-eye-slash me-2 text-primary"></i>Confidentialité
                    </h5>
                </div>
                <div class="card-body p-4">
                    <div class="form-check form-switch mb-3">
                        <input class="form-check-input" type="checkbox" id="profileVisible" checked>
                        <label class="form-check-label fw-semibold" for="profileVisible">
                            Profil public
                        </label>
                        <div><small class="text-muted">Rendre votre profil visible aux autres utilisateurs</small></div>
                    </div>
                    <div class="form-check form-switch mb-3">
                        <input class="form-check-input" type="checkbox" id="shareActivity">
                        <label class="form-check-label fw-semibold" for="shareActivity">
                            Partager mon activité
                        </label>
                        <div><small class="text-muted">Permettre le partage de vos activités de location</small></div>
                    </div>
                    <hr class="my-4">
                    <div class="alert alert-danger border-0">
                        <h6 class="alert-heading fw-bold">
                            <i class="bi bi-exclamation-triangle me-2"></i>Zone dangereuse
                        </h6>
                        <p class="mb-3 small">Actions irréversibles sur votre compte</p>
                        <button class="btn btn-outline-danger btn-sm">
                            <i class="bi bi-trash me-1"></i>Supprimer mon compte
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
    // Smooth scroll to sections
    document.querySelectorAll('.list-group-item').forEach(item => {
        item.addEventListener('click', function(e) {
            e.preventDefault();
            const target = this.getAttribute('href');
            const element = document.querySelector(target);
            if (element) {
                const offset = 100;
                const elementPosition = element.getBoundingClientRect().top;
                const offsetPosition = elementPosition + window.pageYOffset - offset;
                
                window.scrollTo({
                    top: offsetPosition,
                    behavior: 'smooth'
                });
                
                // Update active state
                document.querySelectorAll('.list-group-item').forEach(i => i.classList.remove('active'));
                this.classList.add('active');
            }
        });
    });
    
    // Form submissions
    document.querySelectorAll('form').forEach(form => {
        form.addEventListener('submit', function(e) {
            e.preventDefault();
            YOURS.showToast('Paramètres enregistrés avec succès !', 'success');
        });
    });
    
    // Save buttons
    document.querySelectorAll('button[type="submit"]').forEach(btn => {
        btn.addEventListener('click', function(e) {
            if (!this.closest('form')) {
                e.preventDefault();
                YOURS.showToast('Paramètres enregistrés avec succès !', 'success');
            }
        });
    });
});
</script>

<%@ include file="../../layouts/footer.jsp" %>


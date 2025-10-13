<%@ include file="../../layouts/header.jsp" %>
<%@ include file="../../layouts/navbar.jsp" %>

<div class="container py-5">
    <div class="row">
        <div class="col-lg-8 mx-auto">
            <div class="card border-0 shadow-sm">
                <div class="card-header bg-primary text-white">
                    <h3 class="mb-0"><i class="fas fa-user me-2"></i>Mon Profil</h3>
                </div>
                <div class="card-body p-4">
                    <form id="profileForm">
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label for="prenom" class="form-label">Prénom</label>
                                <input type="text" class="form-control" id="prenom" value="Mohammed" required>
                            </div>
                            <div class="col-md-6">
                                <label for="nom" class="form-label">Nom</label>
                                <input type="text" class="form-control" id="nom" value="Belouarraq" required>
                            </div>
                            <div class="col-12">
                                <label for="email" class="form-label">Email</label>
                                <input type="email" class="form-control" id="email" value="mohammed@example.com" required>
                            </div>
                            <div class="col-md-6">
                                <label for="telephone" class="form-label">Téléphone</label>
                                <input type="tel" class="form-control" id="telephone" value="+212 6 12 34 56 78" required>
                            </div>
                            <div class="col-md-6">
                                <label for="cin" class="form-label">CIN</label>
                                <input type="text" class="form-control" id="cin" value="AB123456" required>
                            </div>
                            <div class="col-12">
                                <label for="adresse" class="form-label">Adresse</label>
                                <textarea class="form-control" id="adresse" rows="3" required>123 Rue Mohammed V, Casablanca</textarea>
                            </div>
                            <div class="col-md-6">
                                <label for="ville" class="form-label">Ville</label>
                                <input type="text" class="form-control" id="ville" value="Casablanca" required>
                            </div>
                            <div class="col-md-6">
                                <label for="codePostal" class="form-label">Code Postal</label>
                                <input type="text" class="form-control" id="codePostal" value="20000" required>
                            </div>
                        </div>

                        <hr class="my-4">

                        <h5 class="mb-3">Changer le mot de passe</h5>
                        <div class="row g-3">
                            <div class="col-12">
                                <label for="currentPassword" class="form-label">Mot de passe actuel</label>
                                <input type="password" class="form-control" id="currentPassword">
                            </div>
                            <div class="col-md-6">
                                <label for="newPassword" class="form-label">Nouveau mot de passe</label>
                                <input type="password" class="form-control" id="newPassword">
                            </div>
                            <div class="col-md-6">
                                <label for="confirmPassword" class="form-label">Confirmer le mot de passe</label>
                                <input type="password" class="form-control" id="confirmPassword">
                            </div>
                        </div>

                        <div class="d-flex justify-content-between mt-4">
                            <a href="${pageContext.request.contextPath}/pages/client/dashboard.jsp" class="btn btn-outline-secondary">
                                <i class="fas fa-arrow-left me-1"></i>Retour au tableau de bord
                            </a>
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-save me-1"></i>Enregistrer les modifications
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
document.getElementById('profileForm').addEventListener('submit', function(e) {
    e.preventDefault();
    
    // Simulate form submission
    const submitBtn = this.querySelector('button[type="submit"]');
    const originalText = submitBtn.innerHTML;
    
    submitBtn.innerHTML = '<i class="fas fa-spinner fa-spin me-1"></i>Enregistrement...';
    submitBtn.disabled = true;
    
    setTimeout(() => {
        alert('Profil mis à jour avec succès !');
        submitBtn.innerHTML = originalText;
        submitBtn.disabled = false;
    }, 2000);
});
</script>

<%@ include file="../../layouts/footer.jsp" %>

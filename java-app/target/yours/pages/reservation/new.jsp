<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<%-- Debug information --%>
<c:if test="${not empty error}">
    <div class="alert alert-danger">
        <h4>Erreur : ${error}</h4>
        <c:if test="${not empty errorDetails}">
            <pre>${errorDetails}</pre>
        </c:if>
    </div>
</c:if>

<%@ include file="/layouts/header.jsp" %>
<%@ include file="/layouts/navbar.jsp" %>

<!-- Page Header -->
<section class="py-5" style="background: linear-gradient(135deg, #1e40af 0%, #1e3a8a 50%, #1e293b 100%); margin-top: -80px; padding-top: calc(80px + 6rem) !important; padding-bottom: 6rem !important; min-height: 400px; position: relative; overflow: hidden;">
    <div style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; background: radial-gradient(circle at 20% 50%, rgba(59, 130, 246, 0.15) 0%, transparent 50%); opacity: 1;"></div>
    <div class="container" style="position: relative; z-index: 2;">
        <div class="row">
            <div class="col-lg-10 mx-auto text-center">
                <div class="d-inline-flex align-items-center mb-4" style="background: rgba(255, 255, 255, 0.15); backdrop-filter: blur(20px); border-radius: 50px; padding: 0.75rem 1.5rem; border: 1px solid rgba(255, 255, 255, 0.2); box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);">
                    <i class="fas fa-calendar-plus me-2" style="color: #fbbf24; font-size: 1rem;"></i>
                    <span style="color: white; font-weight: 600; font-size: 0.875rem; letter-spacing: 0.5px;">NOUVELLE RÉSERVATION</span>
                </div>
                <h1 class="display-2 fw-bold mb-4" style="color: white; text-shadow: 0 4px 20px rgba(0,0,0,0.3); letter-spacing: -0.03em; line-height: 1.1;">
                    Réserver <span style="background: linear-gradient(135deg, #fbbf24, #f59e0b); -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text;">${materiel.nom}</span>
                </h1>
                <p class="lead mb-0" style="color: rgba(255, 255, 255, 0.9); font-size: 1.25rem; max-width: 700px; margin: 0 auto;">
                    Remplissez les détails de votre réservation ci-dessous
                </p>
            </div>
        </div>
    </div>
</section>

<!-- Reservation Form -->
<div class="container py-5">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="card border-0 shadow-sm rounded-4 overflow-hidden">
                <div class="card-body p-0">
                    <div class="row g-0">
                        <!-- Equipment Preview -->
                        <div class="col-md-5 bg-light p-4 d-flex flex-column">
                            <div class="text-center mb-4">
                                <c:set var="photoUrl" value="/assets/img/placeholder-equipment.jpg" />
                                <c:if test="${not empty materiel.photos and not empty materiel.photos[0]}">
                                    <c:set var="photoUrl" value="${materiel.photos[0].urlPhoto}" />
                                </c:if>
                                <img src="${pageContext.request.contextPath}${photoUrl}" 
                                     class="img-fluid rounded-3 mb-3" 
                                     alt="${materiel.nom}"
                                     style="max-height: 200px; object-fit: contain;">
                                <h4 class="mb-1">${materiel.nom}</h4>
                                <p class="text-muted mb-2">${materiel.categorie.nomCategorie}</p>
                                <h3 class="text-primary fw-bold mb-0">
                                    <fmt:formatNumber value="${materiel.prix}" type="currency" currencyCode="MAD"/>
                                    <small class="text-muted fw-normal">/jour</small>
                                </h3>
                            </div>
                            <div class="mt-auto">
                                <div class="d-flex align-items-center mb-3">
                                    <div class="bg-primary-soft rounded-2 p-2 me-3">
                                        <i class="fas fa-box text-primary"></i>
                                    </div>
                                    <div>
                                        <p class="mb-0 small text-muted">Disponibilité</p>
                                        <p class="mb-0 fw-semibold">En stock</p>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center">
                                    <div class="bg-primary-soft rounded-2 p-2 me-3">
                                        <i class="fas fa-shield-alt text-primary"></i>
                                    </div>
                                    <div>
                                        <p class="mb-0 small text-muted">Assurance incluse</p>
                                        <p class="mb-0 fw-semibold">Protection complète</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Reservation Form -->
                        <div class="col-md-7 p-5">
                            <h4 class="mb-4">Détails de la réservation</h4>
                            
                            <form method="post" action="${pageContext.request.contextPath}/reservation/new" class="needs-validation" novalidate>
                                <input type="hidden" name="idMateriel" value="${materiel.idMateriel}">
                                
                                <div class="mb-4">
                                    <label for="dateDebut" class="form-label fw-semibold">Date de début</label>
                                    <div class="input-group">
                                        <span class="input-group-text bg-light border-end-0">
                                            <i class="far fa-calendar-alt text-muted"></i>
                                        </span>
                                        <input type="date" class="form-control ps-3" id="dateDebut" name="dateDebut" required>
                                    </div>
                                    <div class="invalid-feedback">
                                        Veuillez sélectionner une date de début valide.
                                    </div>
                                </div>
                                
                                <div class="mb-4">
                                    <label for="dateFin" class="form-label fw-semibold">Date de fin</label>
                                    <div class="input-group">
                                        <span class="input-group-text bg-light border-end-0">
                                            <i class="far fa-calendar-check text-muted"></i>
                                        </span>
                                        <input type="date" class="form-control ps-3" id="dateFin" name="dateFin" required>
                                    </div>
                                    <div class="invalid-feedback">
                                        Veuillez sélectionner une date de fin valide.
                                    </div>
                                </div>
                                
                                <!-- Price Summary -->
                                <div class="bg-light p-4 rounded-3 mb-4">
                                    <h6 class="mb-3 fw-semibold">Résumé des coûts</h6>
                                    <div class="d-flex justify-content-between mb-2">
                                        <span class="text-muted">Prix journalier</span>
                                        <span class="fw-medium"><fmt:formatNumber value="${materiel.prix}" type="currency" currencyCode="MAD"/></span>
                                    </div>
                                    <div class="d-flex justify-content-between mb-2">
                                        <span class="text-muted">Durée</span>
                                        <span class="fw-medium" id="durationDisplay">-</span>
                                    </div>
                                    <div class="d-flex justify-content-between mb-2">
                                        <span class="text-muted">Frais de service</span>
                                        <span class="fw-medium">Gratuit</span>
                                    </div>
                                    <hr class="my-3">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <span class="fw-bold">Total estimé</span>
                                        <h4 class="text-primary mb-0 fw-bold" id="totalPrice">-</h4>
                                    </div>
                                </div>
                                
                                <div class="d-grid gap-3">
                                    <button type="submit" class="btn btn-primary btn-lg py-3 fw-semibold">
                                        <i class="fas fa-check-circle me-2"></i>Confirmer la réservation
                                    </button>
                                    <a href="${pageContext.request.contextPath}/equipements/detail?id=${materiel.idMateriel}" class="btn btn-outline-secondary btn-lg py-3">
                                        <i class="fas fa-arrow-left me-2"></i>Retour au matériel
                                    </a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="/layouts/footer.jsp" %>

<script>
document.addEventListener('DOMContentLoaded', function() {
    // Set min date to today
    const today = new Date().toISOString().split('T')[0];
    const dateDebut = document.getElementById('dateDebut');
    const dateFin = document.getElementById('dateFin');
    const durationDisplay = document.getElementById('durationDisplay');
    const totalPrice = document.getElementById('totalPrice');
    const prixJournalier = parseFloat('${materiel.prix}');
    
    dateDebut.min = today;
    
    // Update end date min when start date changes
    dateDebut.addEventListener('change', function() {
        dateFin.min = this.value;
        if (dateFin.value && new Date(dateFin.value) < new Date(this.value)) {
            dateFin.value = this.value;
        }
        calculateTotal();
    });
    
    // Update total when end date changes
    dateFin.addEventListener('change', calculateTotal);
    
    function calculateTotal() {
        if (dateDebut.value && dateFin.value) {
            const start = new Date(dateDebut.value);
            const end = new Date(dateFin.value);
            
            // Calculate difference in days
            const diffTime = Math.abs(end - start);
            const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24)) + 1; // +1 to include both start and end days
            
            // Update display
            durationDisplay.textContent = diffDays + ' jour' + (diffDays > 1 ? 's' : '');
            
            // Calculate and format total price
            const total = diffDays * prixJournalier;
            totalPrice.textContent = new Intl.NumberFormat('fr-MA', { 
                style: 'currency', 
                currency: 'MAD',
                minimumFractionDigits: 2
            }).format(total);
        } else {
            durationDisplay.textContent = '-';
            totalPrice.textContent = '-';
        }
    }
    
    // Form validation
    const form = document.querySelector('.needs-validation');
    form.addEventListener('submit', function(event) {
        if (!form.checkValidity()) {
            event.preventDefault();
            event.stopPropagation();
        }
        form.classList.add('was-validated');
    }, false);
});
</script>

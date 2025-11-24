<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<% request.setAttribute("pageTitle", "Mes Réservations - YOURS"); %>

<!-- Debug des variables (à désactiver en production) -->
<c:if test="${param.debug == 'true'}">
    <div class="debug-info" style="background: #f8f9fa; padding: 10px; margin-bottom: 20px; border: 1px solid #dee2e6; border-radius: 4px;">
        <h5>Debug Information</h5>
        <p>Total: ${totalReservations}</p>
        <p>En cours: ${enCoursCount}</p>
        <p>À venir: ${aVenirCount}</p>
        <p>Terminées: ${termineesCount}</p>
    </div>
</c:if>


<%@ include file="../../layouts/header.jsp" %>
<%@ include file="../../layouts/navbar.jsp" %>

<!-- Page Header -->
<section class="py-5" style="background: linear-gradient(135deg, #1e40af 0%, #1e3a8a 50%, #1e293b 100%); margin-top: -80px; padding-top: calc(80px + 6rem) !important; padding-bottom: 6rem !important; min-height: 400px; position: relative; overflow: hidden;">
    <div style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; background: radial-gradient(circle at 20% 50%, rgba(59, 130, 246, 0.15) 0%, transparent 50%); opacity: 1;"></div>
    <div class="container" style="position: relative; z-index: 2;">
        <div class="row">
            <div class="col-lg-10 mx-auto text-center">
                <div class="d-inline-flex align-items-center mb-4" style="background: rgba(255, 255, 255, 0.15); backdrop-filter: blur(20px); border-radius: 50px; padding: 0.75rem 1.5rem; border: 1px solid rgba(255, 255, 255, 0.2); box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);">
                    <i class="fas fa-calendar-check me-2" style="color: #fbbf24; font-size: 1rem;"></i>
                    <span style="color: white; font-weight: 600; font-size: 0.875rem; letter-spacing: 0.5px;">GESTION DES RÉSERVATIONS</span>
                </div>
                <h1 class="display-2 fw-bold mb-4" style="color: white; text-shadow: 0 4px 20px rgba(0,0,0,0.3); letter-spacing: -0.03em; line-height: 1.1;">
                    Mes <span style="background: linear-gradient(135deg, #fbbf24, #f59e0b); -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text;">Réservations</span>
                </h1>
                <div class="mb-4" style="max-width: 700px; margin: 0 auto;">
                    <p class="lead mb-2" style="color: rgba(255, 255, 255, 0.95); font-size: 1.375rem; font-weight: 400; line-height: 1.6; letter-spacing: -0.01em;">
                        Suivez et gérez toutes vos réservations de matériel professionnel
                    </p>
                    <p class="mb-0" style="color: rgba(255, 255, 255, 0.8); font-size: 1.1rem; font-weight: 300; line-height: 1.7;">
                        Historique complet • Statuts en temps réel • Gestion simplifiée
                    </p>
                </div>
                <div class="d-flex justify-content-center align-items-center gap-3 mt-4">
                    <div style="width: 60px; height: 2px; background: linear-gradient(90deg, transparent, rgba(255,255,255,0.4), transparent); border-radius: 1px;"></div>
                    <div style="width: 8px; height: 8px; background: rgba(251, 191, 36, 0.8); border-radius: 50%; box-shadow: 0 0 20px rgba(251, 191, 36, 0.5);"></div>
                    <div style="width: 60px; height: 2px; background: linear-gradient(90deg, transparent, rgba(255,255,255,0.4), transparent); border-radius: 1px;"></div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Reservations Content -->
<div class="container py-5">
    <div class="row">
        <div class="col-12">
            <!-- Action Bar -->
            <div class="d-flex flex-wrap justify-content-between align-items-center gap-3 mb-5">
                <!-- Stats Summary -->
                <div class="d-flex align-items-center bg-white px-4 py-2 rounded-3 shadow-sm border-0" style="border-left: 4px solid var(--primary-600) !important;">
                    <div class="me-3">
                        <div class="bg-primary rounded-2 d-flex align-items-center justify-content-center" style="width: 48px; height: 48px;">
                            <i class="fas fa-calendar-check text-white" style="font-size: 1.125rem;"></i>
                        </div>
                    </div>
                    <div>
                        <div class="h4 mb-0 text-dark fw-bold">${totalReservations}</div>
                        <small class="text-muted fw-medium">Réservations totales</small>
                    </div>
                </div>
                
                <!-- New Reservation Button -->
                <a href="${pageContext.request.contextPath}/equipements" 
                   class="btn btn-primary btn-lg d-flex align-items-center gap-2 px-4 py-3 rounded-4 shadow-sm border-0 fw-semibold" 
                   style="min-height: 64px; background: var(--primary-600) !important; border: none !important; transition: all 0.2s ease;">
                    <i class="fas fa-plus" style="font-size: 0.875rem;"></i>
                    Nouvelle Réservation
                </a>
            </div>

            <!-- Filter Tabs -->
            <div class="mb-4">
                <div class="nav nav-pills nav-pills-modern" role="tablist" style="background: white; border-radius: 1rem; padding: 0.5rem; box-shadow: 0 4px 20px -2px rgba(0, 0, 0, 0.08); border: 1px solid rgba(226, 232, 240, 0.8);">
                    <button class="nav-link active" id="all-tab" data-bs-toggle="pill" data-bs-target="#all" type="button" role="tab" 
                            style="border-radius: 0.75rem; padding: 0.75rem 1.5rem; font-weight: 600; transition: all 0.3s ease; background: linear-gradient(135deg, var(--primary-600), var(--primary-700)); color: white;">
                        <i class="fas fa-list me-2"></i>Toutes <span class="badge bg-light text-primary ms-2">${totalReservations}</span>
                    </button>
                    <button class="nav-link" id="active-tab" data-bs-toggle="pill" data-bs-target="#active" type="button" role="tab"
                            style="border-radius: 0.75rem; padding: 0.75rem 1.5rem; font-weight: 600; transition: all 0.3s ease; color: var(--gray-700);">
                        <i class="fas fa-play-circle me-2"></i>En cours <span class="badge bg-primary ms-2">${enCoursCount}</span>
                    </button>
                    <button class="nav-link" id="upcoming-tab" data-bs-toggle="pill" data-bs-target="#upcoming" type="button" role="tab"
                            style="border-radius: 0.75rem; padding: 0.75rem 1.5rem; font-weight: 600; transition: all 0.3s ease; color: var(--gray-700);">
                        <i class="fas fa-clock me-2"></i>À venir <span class="badge bg-warning ms-2">${aVenirCount}</span>
                    </button>
                    <button class="nav-link" id="completed-tab" data-bs-toggle="pill" data-bs-target="#completed" type="button" role="tab"
                            style="border-radius: 0.75rem; padding: 0.75rem 1.5rem; font-weight: 600; transition: all 0.3s ease; color: var(--gray-700);">
                        <i class="fas fa-check-circle me-2"></i>Terminées <span class="badge bg-success ms-2">${termineesCount}</span>
                    </button>
                </div>
            </div>

            <!-- Tab Content -->
            <div class="tab-content" id="reservationTabsContent">
                <!-- All Reservations -->
                <div class="tab-pane fade show active" id="all" role="tabpanel">
                    <div class="row g-4">
                        <c:if test="${empty reservations}">
                            <div class="col-12 text-center py-5">
                                <i class="fas fa-box-open fa-3x text-muted mb-3"></i>
                                <h4>Aucune réservation</h4>
                                <p class="text-muted">Vous n'avez pas encore de réservation. Commencez par en créer une !</p>
                            </div>
                        </c:if>
                        <c:forEach var="reservation" items="${reservations}" varStatus="loop">
                            <div class="col-lg-6">
                                <jsp:include page="_reservation-card.jsp">
                                    <jsp:param name="reservation" value="${reservation}"/>
                                    <jsp:param name="reservationId" value="${reservation.idReservation}"/>
                                    <jsp:param name="dateDebut" value="${reservation.dateDebut}"/>
                                    <jsp:param name="dateFin" value="${reservation.dateFin}"/>
                                    <jsp:param name="montantTotal" value="${reservation.montantTotal}"/>
                                    <jsp:param name="statut" value="${reservation.statut}"/>
                                    <jsp:param name="materielNom" value="${reservation.materiel.nom}"/>
                                </jsp:include>
                            </div>
                        </c:forEach>
                    </div>
                </div>

                <!-- Active Reservations -->
                <div class="tab-pane fade" id="active" role="tabpanel">
                    <div class="row g-4">
                        <c:if test="${enCoursCount == 0}">
                            <div class="col-12 text-center py-5">
                                <i class="fas fa-play-circle fa-3x text-muted mb-3"></i>
                                <h4>Aucune réservation en cours</h4>
                            </div>
                        </c:if>
                        <c:forEach var="reservation" items="${reservations}">
                            <c:if test="${reservation.statut == 'EN_COURS'}">
                                <div class="col-lg-6">
                                    <jsp:include page="_reservation-card.jsp">
                                        <jsp:param name="reservation" value="${reservation}"/>
                                        <jsp:param name="reservationId" value="${reservation.idReservation}"/>
                                        <jsp:param name="dateDebut" value="${reservation.dateDebut}"/>
                                        <jsp:param name="dateFin" value="${reservation.dateFin}"/>
                                        <jsp:param name="montantTotal" value="${reservation.montantTotal}"/>
                                        <jsp:param name="statut" value="${reservation.statut}"/>
                                        <jsp:param name="materielNom" value="${reservation.materiel.nom}"/>
                                    </jsp:include>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>

                <!-- Upcoming Reservations -->
                <div class="tab-pane fade" id="upcoming" role="tabpanel">
                     <div class="row g-4">
                        <c:if test="${aVenirCount == 0}">
                            <div class="col-12 text-center py-5">
                                <i class="fas fa-clock fa-3x text-muted mb-3"></i>
                                <h4>Aucune réservation à venir</h4>
                            </div>
                        </c:if>
                        <c:forEach var="reservation" items="${reservations}">
                            <c:if test="${reservation.statut == 'A_VENIR'}">
                                <div class="col-lg-6">
                                    <jsp:include page="_reservation-card.jsp">
                                        <jsp:param name="reservation" value="${reservation}"/>
                                        <jsp:param name="reservationId" value="${reservation.idReservation}"/>
                                        <jsp:param name="dateDebut" value="${reservation.dateDebut}"/>
                                        <jsp:param name="dateFin" value="${reservation.dateFin}"/>
                                        <jsp:param name="montantTotal" value="${reservation.montantTotal}"/>
                                        <jsp:param name="statut" value="${reservation.statut}"/>
                                        <jsp:param name="materielNom" value="${reservation.materiel.nom}"/>
                                    </jsp:include>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>

                <!-- Completed Reservations -->
                <div class="tab-pane fade" id="completed" role="tabpanel">
                     <div class="row g-4">
                        <c:if test="${termineesCount == 0}">
                            <div class="col-12 text-center py-5">
                                <i class="fas fa-check-circle fa-3x text-muted mb-3"></i>
                                <h4>Aucune réservation terminée</h4>
                            </div>
                        </c:if>
                        <c:forEach var="reservation" items="${reservations}">
                            <c:if test="${reservation.statut == 'TERMINEE'}">
                                <div class="col-lg-6">
                                    <jsp:include page="_reservation-card.jsp">
                                        <jsp:param name="reservation" value="${reservation}"/>
                                        <jsp:param name="reservationId" value="${reservation.idReservation}"/>
                                        <jsp:param name="dateDebut" value="${reservation.dateDebut}"/>
                                        <jsp:param name="dateFin" value="${reservation.dateFin}"/>
                                        <jsp:param name="montantTotal" value="${reservation.montantTotal}"/>
                                        <jsp:param name="statut" value="${reservation.statut}"/>
                                        <jsp:param name="materielNom" value="${reservation.materiel.nom}"/>
                                    </jsp:include>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Cancellation Modal -->
<div class="modal fade" id="cancelModal" tabindex="-1" aria-labelledby="cancelModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content" style="border-radius: 1rem;">
            <div class="modal-header border-0">
                <h5 class="modal-title" id="cancelModalLabel">Confirmation d'annulation</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <p>Êtes-vous sûr de vouloir annuler la réservation <strong id="reservationIdText"></strong> pour l'équipement <strong id="equipmentNameText"></strong> ?</p>
            </div>
            <div class="modal-footer border-0">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fermer</button>
                <button type="button" class="btn btn-danger" id="confirmCancelBtn">Confirmer l'annulation</button>
            </div>
        </div>
    </div>
</div>

<%@ include file="../../layouts/footer.jsp" %>

<script>
document.addEventListener('DOMContentLoaded', function() {
    const cancelModal = new bootstrap.Modal(document.getElementById('cancelModal'));
    const reservationIdText = document.getElementById('reservationIdText');
    const equipmentNameText = document.getElementById('equipmentNameText');
    const confirmCancelBtn = document.getElementById('confirmCancelBtn');
    let reservationToCancel = null;

    document.querySelectorAll('.annuler-btn').forEach(button => {
        button.addEventListener('click', function() {
            reservationToCancel = this.dataset.reservationId;
            reservationIdText.textContent = reservationToCancel;
            equipmentNameText.textContent = this.dataset.equipmentName;
            cancelModal.show();
        });
    });

    confirmCancelBtn.addEventListener('click', function() {
        if (reservationToCancel) {
            // Here you would typically make an AJAX call to a servlet to cancel the reservation
            console.log('Cancelling reservation:', reservationToCancel);
            
            // For demonstration, we'll just hide the modal and maybe the card
            // In a real app, you would reload the page or update the UI based on the server response
            cancelModal.hide();
            alert('La réservation ' + reservationToCancel + ' a été annulée.');
            window.location.reload(); // Reload to see changes
        }
    });
});
</script>
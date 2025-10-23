<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>

<div class="card card-modern card-reservation h-100" style="border: none; border-radius: 1.25rem; box-shadow: 0 8px 32px -4px rgba(0, 0, 0, 0.12); transition: all 0.3s ease; background: linear-gradient(135deg, #ffffff 0%, #f8fafc 100%);">
    <div class="card-header" style="background: linear-gradient(135deg, var(--primary-600), var(--primary-700)); border-radius: 1.25rem 1.25rem 0 0; border: none; padding: 1.5rem;">
        <div class="d-flex justify-content-between align-items-center">
            <h6 class="mb-0 text-white fw-bold" style="font-size: 1rem; letter-spacing: -0.01em;">
                <i class="fas fa-hashtag me-2" style="opacity: 0.8;"></i>Réservation ${reservation.id}
            </h6>
            <span class="badge" style="background: rgba(255, 255, 255, 0.2); color: white; font-weight: 600; padding: 0.5rem 1rem; border-radius: 0.75rem; font-size: 0.875rem;">
                <c:choose>
                    <c:when test="${reservation.statut == 'EN_COURS'}"><i class="fas fa-play-circle me-1"></i>En cours</c:when>
                    <c:when test="${reservation.statut == 'A_VENIR'}"><i class="fas fa-clock me-1"></i>À venir</c:when>
                    <c:when test="${reservation.statut == 'TERMINEE'}"><i class="fas fa-check-circle me-1"></i>Terminée</c:when>
                    <c:otherwise>${reservation.statut}</c:otherwise>
                </c:choose>
            </span>
        </div>
    </div>
    <div class="card-body" style="padding: 1.5rem;">
        <div class="d-flex align-items-center mb-4">
            <div class="position-relative me-3">
                <c:choose>
                    <c:when test="${not empty reservation.materiel.primaryPhotoUrl}">
                        <img src="${pageContext.request.contextPath}/assets/img/equipment/${reservation.materiel.primaryPhotoUrl}" 
                             alt="${reservation.materiel.nom}" 
                             style="width: 80px; height: 80px; object-fit: cover; border-radius: 1rem; box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);">
                    </c:when>
                    <c:otherwise>
                        <img src="${pageContext.request.contextPath}/assets/img/equipment/default.jpg" 
                             alt="${reservation.materiel.nom}" 
                             style="width: 80px; height: 80px; object-fit: cover; border-radius: 1rem; box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);">
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="flex-grow-1">
                <h6 class="mb-1 fw-bold" style="color: var(--gray-900); font-size: 1.125rem;">${reservation.materiel.nom}</h6>
                <p class="text-muted mb-0" style="font-size: 0.875rem; line-height: 1.4;">${reservation.materiel.description}</p>
            </div>
        </div>
        
        <div class="row g-3 mb-4">
            <div class="col-6">
                <div style="background: rgba(37, 99, 235, 0.05); padding: 1rem; border-radius: 0.75rem; border-left: 4px solid var(--primary-600);">
                    <small class="text-muted d-block" style="font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.5px;">Début</small>
                    <strong style="color: var(--gray-900); font-size: 0.875rem;"><fmt:formatDate value="${reservation.dateDebut}" pattern="dd MMM yyyy" /></strong>
                </div>
            </div>
            <div class="col-6">
                <div style="background: rgba(239, 68, 68, 0.05); padding: 1rem; border-radius: 0.75rem; border-left: 4px solid #ef4444;">
                    <small class="text-muted d-block" style="font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.5px;">Fin</small>
                    <strong style="color: var(--gray-900); font-size: 0.875rem;"><fmt:formatDate value="${reservation.dateFin}" pattern="dd MMM yyyy" /></strong>
                </div>
            </div>
        </div>
        
        <div class="d-flex justify-content-between align-items-center">
            <div>
                <small class="text-muted d-block" style="font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.5px;">Total</small>
                <span class="fw-bold" style="color: var(--primary-600); font-size: 1.25rem;">${reservation.montantTotal} MAD</span>
            </div>
            <div class="d-flex gap-2">
                <a href="${pageContext.request.contextPath}/pages/equipment/detail.jsp?id=${reservation.materiel.idMateriel}" class="btn btn-sm" style="background: rgba(37, 99, 235, 0.1); color: var(--primary-600); border: none; border-radius: 0.5rem; padding: 0.5rem 1rem; font-weight: 600; transition: all 0.3s ease; text-decoration: none;">
                    <i class="fas fa-eye me-1"></i>Voir
                </a>
                <c:if test="${reservation.statut != 'TERMINEE'}">
                    <button class="btn btn-sm annuler-btn" style="background: rgba(239, 68, 68, 0.1); color: #ef4444; border: none; border-radius: 0.5rem; padding: 0.5rem 1rem; font-weight: 600; transition: all 0.3s ease;" data-reservation-id="${reservation.id}" data-equipment-name="${reservation.materiel.nom}">
                        <i class="fas fa-times me-1"></i>Annuler
                    </button>
                </c:if>
            </div>
        </div>
    </div>
</div>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setAttribute("pageTitle", "Mes Favoris - YOURS");
%>

<%@ include file="../../layouts/header.jsp" %>
<%@ include file="../../layouts/navbar.jsp" %>

<div class="container py-4" style="margin-top: 80px;">
    <!-- Breadcrumb -->
    <nav aria-label="breadcrumb" class="mb-4">
        <ol class="breadcrumb breadcrumb-custom">
            <li class="breadcrumb-item">
                <a href="${pageContext.request.contextPath}/pages/client/dashboard.jsp">
                    <i class="bi bi-house me-1"></i>Tableau de bord
                </a>
            </li>
            <li class="breadcrumb-item active">Favoris</li>
        </ol>
    </nav>

    <!-- Header -->
    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <h1 class="fw-bold mb-2">
                <i class="bi bi-heart text-danger me-2"></i>Mes Favoris
            </h1>
            <p class="text-muted mb-0">Retrouvez tout le matériel que vous avez sauvegardé</p>
        </div>
        <a href="${pageContext.request.contextPath}/pages/equipment/list.jsp" class="btn btn-primary">
            <i class="bi bi-plus-circle me-2"></i>Parcourir le matériel
        </a>
    </div>

    <!-- Favorites Grid -->
    <div class="row g-4" id="favoritesContainer">
        <!-- Favorites will be loaded here -->
    </div>

    <!-- Empty State -->
    <div id="emptyState" class="text-center py-5" style="display: none;">
        <i class="bi bi-heart text-muted" style="font-size: 5rem; opacity: 0.2;"></i>
        <h4 class="text-muted mt-4 mb-2">Aucun favori</h4>
        <p class="text-muted mb-4">Commencez à ajouter du matériel à vos favoris pour le retrouver facilement</p>
        <a href="${pageContext.request.contextPath}/pages/equipment/list.jsp" class="btn btn-primary">
            <i class="bi bi-search me-2"></i>Découvrir le matériel
        </a>
    </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
    loadFavorites();
});

function loadFavorites() {
    // Simulate loading favorites
    const favorites = MockDataUtils.getPopularEquipment(6);
    const container = document.getElementById('favoritesContainer');
    const emptyState = document.getElementById('emptyState');
    
    if (favorites.length === 0) {
        container.style.display = 'none';
        emptyState.style.display = 'block';
        return;
    }
    
    container.innerHTML = favorites.map(equipment => `
        <div class="col-lg-4 col-md-6">
            <div class="card h-100 border-0 shadow-sm">
                <div class="position-relative">
                    <img src="${equipment.images[0]}" class="card-img-top" alt="${equipment.nom}"
                         style="height: 250px; object-fit: cover;"
                         onerror="this.src='${pageContext.request.contextPath}/assets/images/placeholder-equipment.jpg'">
                    <button class="btn btn-sm btn-danger position-absolute top-0 end-0 m-3 rounded-circle" 
                            style="width: 40px; height: 40px;"
                            onclick="removeFavorite(${equipment.idMateriel})">
                        <i class="bi bi-heart-fill"></i>
                    </button>
                    <span class="badge bg-success position-absolute top-0 start-0 m-3">Disponible</span>
                </div>
                <div class="card-body">
                    <h5 class="card-title fw-bold mb-2">${equipment.nom}</h5>
                    <p class="card-text text-muted mb-3">${equipment.description.substring(0, 100)}...</p>
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <div>
                            <small class="text-muted d-block">Prix par jour</small>
                            <span class="fw-bold text-primary fs-5">${YOURS.formatCurrency(equipment.prix)}</span>
                        </div>
                        <div class="text-end">
                            <small class="text-muted d-block">Note</small>
                            <div class="text-warning">
                                <i class="bi bi-star-fill"></i>
                                <span class="text-dark fw-semibold">${equipment.note || 4.5}</span>
                            </div>
                        </div>
                    </div>
                    <div class="d-grid gap-2">
                        <a href="${pageContext.request.contextPath}/pages/equipment/detail.jsp?id=${equipment.idMateriel}" 
                           class="btn btn-primary">
                            <i class="bi bi-eye me-2"></i>Voir les détails
                        </a>
                        <a href="${pageContext.request.contextPath}/pages/booking/form.jsp?id=${equipment.idMateriel}" 
                           class="btn btn-outline-primary">
                            <i class="bi bi-calendar-check me-2"></i>Réserver
                        </a>
                    </div>
                </div>
            </div>
        </div>
    `).join('');
}

function removeFavorite(id) {
    YOURS.showConfirmDialog(
        'Retirer des favoris',
        'Êtes-vous sûr de vouloir retirer cet équipement de vos favoris ?',
        function() {
            YOURS.showToast('Équipement retiré des favoris', 'success');
            // Reload favorites
            setTimeout(() => loadFavorites(), 500);
        }
    );
}
</script>

<%@ include file="../../layouts/footer.jsp" %>


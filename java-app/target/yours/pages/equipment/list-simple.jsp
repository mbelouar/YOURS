<%@ page import="com.yours.dao.MaterielDAO" %>
<%@ page import="com.yours.model.Materiel" %>
<%@ page import="java.util.List" %>

<%
    MaterielDAO materielDAO = new MaterielDAO();
    List<Materiel> equipments = null;
    String errorMessage = null;
    try {
        equipments = materielDAO.getAllMateriels();
    } catch (Exception e) {
        errorMessage = "Erreur lors de la récupération des équipements: " + e.getMessage();
        e.printStackTrace();
    }
    request.setAttribute("equipments", equipments);
    request.setAttribute("errorMessage", errorMessage);
%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../layouts/header.jsp" %>
<%@ include file="../../layouts/navbar.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- Page Header -->
<section class="py-5" style="background: linear-gradient(135deg, #1e40af 0%, #1e3a8a 50%, #1e293b 100%); margin-top: -80px; padding-top: calc(80px + 6rem) !important; padding-bottom: 6rem !important; min-height: 400px; position: relative; overflow: hidden;">
    <div style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; background: radial-gradient(circle at 20% 50%, rgba(59, 130, 246, 0.15) 0%, transparent 50%); opacity: 1;"></div>
    <div class="container" style="position: relative; z-index: 2;">
        <div class="row">
            <div class="col-lg-10 mx-auto text-center">
                <div class="d-inline-flex align-items-center mb-4" style="background: rgba(255, 255, 255, 0.15); backdrop-filter: blur(20px); border-radius: 50px; padding: 0.75rem 1.5rem; border: 1px solid rgba(255, 255, 255, 0.2); box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);">
                    <i class="fas fa-tools me-2" style="color: #fbbf24; font-size: 1rem;"></i>
                    <span style="color: white; font-weight: 600; font-size: 0.875rem; letter-spacing: 0.5px;">CATALOGUE PROFESSIONNEL</span>
                </div>
                
                <h1 class="display-2 fw-bold mb-4" style="color: white; text-shadow: 0 4px 20px rgba(0,0,0,0.3); letter-spacing: -0.03em; line-height: 1.1;">
                    Mat&eacute;riel <span style="background: linear-gradient(135deg, #fbbf24, #f59e0b); -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text;">Professionnel</span>
                </h1>
                
                <div class="mb-4" style="max-width: 700px; margin: 0 auto;">
                    <p class="lead mb-2" style="color: rgba(255, 255, 255, 0.95); font-size: 1.375rem; font-weight: 400; line-height: 1.6; letter-spacing: -0.01em;">
                        Explorez notre collection exclusive d'&eacute;quipements haut de gamme
                    </p>
                    <p class="mb-0" style="color: rgba(255, 255, 255, 0.8); font-size: 1.1rem; font-weight: 300; line-height: 1.7;">
                        Solutions professionnelles pour tous vos projets • Disponibilit&eacute; garantie
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

<!-- Equipment Grid -->
<div class="container py-5">
    <div class="row">
        <div class="col-12">
            <!-- Enhanced Search & Filter Section -->
            <div class="mb-4">
                <div class="p-4 mb-3" style="background: linear-gradient(135deg, #ffffff 0%, #f8fafc 100%); border-radius: 1.25rem; box-shadow: 0 4px 20px -2px rgba(0, 0, 0, 0.08), 0 2px 8px -2px rgba(0, 0, 0, 0.04); border: 1px solid rgba(226, 232, 240, 0.8);">
                    <div class="row g-3 align-items-center">
                        <!-- Search Input -->
                        <div class="col-lg-5">
                            <label class="form-label fw-semibold mb-2" style="color: var(--gray-700); font-size: 0.875rem; display: flex; align-items: center;">
                                <i class="fas fa-search me-2" style="color: var(--primary-600); font-size: 0.875rem;"></i>
                                Recherche
                            </label>
                            <div class="position-relative">
                                <i class="fas fa-search position-absolute" style="left: 1.125rem; top: 50%; transform: translateY(-50%); color: var(--gray-400); font-size: 0.9375rem;"></i>
                                <input type="text" id="searchInput" class="form-control" placeholder="Rechercher par nom..." 
                                       style="padding-left: 2.875rem; padding-right: 2.875rem; border-radius: 0.875rem; border: 2px solid var(--gray-200); height: 48px; font-size: 0.9375rem; transition: all 0.3s ease; background: white;">
                                <button class="btn btn-link position-absolute d-none" id="clearSearch" style="right: 0.5rem; top: 50%; transform: translateY(-50%); color: var(--gray-400); text-decoration: none; padding: 0.25rem 0.5rem;">
                                    <i class="fas fa-times-circle"></i>
                                </button>
                            </div>
                        </div>
                        
                        <!-- Category Filter -->
                        <div class="col-lg-3">
                            <label class="form-label fw-semibold mb-2" style="color: var(--gray-700); font-size: 0.875rem; display: flex; align-items: center;">
                                <i class="fas fa-folder-open me-2" style="color: var(--primary-600); font-size: 0.875rem;"></i>
                                Cat&eacute;gorie
                            </label>
                            <select class="form-select" id="categoryFilter" style="border-radius: 0.875rem; border: 2px solid var(--gray-200); height: 48px; font-size: 0.9375rem; transition: all 0.3s ease; background: white;">
                                <option value="" selected>Toutes cat&eacute;gories</option>
                                <c:forEach var="mat" items="${equipments}">
                                    <c:if test="${not empty mat.categorie && not empty mat.categorie.nomCategorie}">
                                        <option value="${fn:toLowerCase(mat.categorie.nomCategorie)}">${mat.categorie.nomCategorie}</option>
                                    </c:if>
                                </c:forEach>
                            </select>
                        </div>
                        
                        <!-- Sort Filter -->
                        <div class="col-lg-3">
                            <label class="form-label fw-semibold mb-2" style="color: var(--gray-700); font-size: 0.875rem; display: flex; align-items: center;">
                                <i class="fas fa-sort-amount-down me-2" style="color: var(--primary-600); font-size: 0.875rem;"></i>
                                Trier par
                            </label>
                            <select class="form-select" id="sortFilter" style="border-radius: 0.875rem; border: 2px solid var(--gray-200); height: 48px; font-size: 0.9375rem; transition: all 0.3s ease; background: white;">
                                <option value="name-asc" selected>Nom (A-Z)</option>
                                <option value="name-desc">Nom (Z-A)</option>
                                <option value="price-asc">Prix croissant</option>
                                <option value="price-desc">Prix d&eacute;croissant</option>
                                <option value="availability">Disponibilit&eacute;</option>
                            </select>
                        </div>
                        
                        <!-- Advanced Filter Button -->
                        <div class="col-lg-1">
                            <label class="form-label mb-2" style="font-size: 0.875rem; opacity: 0;">_</label>
                            <button id="advancedFilterToggle" class="btn w-100" style="background: linear-gradient(135deg, var(--primary-600), var(--primary-700)); color: white; border: none; border-radius: 0.875rem; height: 48px; box-shadow: 0 4px 12px -2px rgba(37, 99, 235, 0.4); transition: all 0.3s ease;" title="Filtres avanc&eacute;s">
                                <i class="fas fa-sliders-h"></i>
                            </button>
                        </div>
                    </div>
                </div>
                
                <!-- Advanced Filters Panel -->
                <div id="advancedFiltersPanel" class="mt-3 mb-4" style="display: none; animation: slideDown 0.3s ease;">
                    <div class="p-4" style="background: white; border-radius: 1rem; border: 1px solid var(--gray-200); box-shadow: 0 4px 12px rgba(0,0,0,0.08);">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h6 class="mb-0" style="color: var(--gray-800); font-weight: 600;">
                                <i class="fas fa-filter me-2" style="color: var(--primary-600);"></i>
                                Filtres Avanc&eacute;s
                            </h6>
                            <button id="closeAdvancedFilters" class="btn btn-sm" style="color: var(--gray-500); padding: 0.25rem 0.5rem;">
                                <i class="fas fa-times"></i>
                            </button>
                        </div>
                        
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label fw-semibold mb-2" style="color: var(--gray-700); font-size: 0.875rem;">
                                    <i class="fas fa-tag me-1" style="color: var(--primary-600); font-size: 0.75rem;"></i>
                                    Fourchette de Prix
                                </label>
                                <div class="d-flex gap-2 align-items-center">
                                    <input type="number" id="priceMin" class="form-control form-control-sm" placeholder="Min" style="border-radius: 0.5rem;" min="0">
                                    <span style="color: var(--gray-400);">—</span>
                                    <input type="number" id="priceMax" class="form-control form-control-sm" placeholder="Max" style="border-radius: 0.5rem;" min="0">
                                </div>
                            </div>
                            
                            <div class="col-md-6">
                                <label class="form-label fw-semibold mb-2" style="color: var(--gray-700); font-size: 0.875rem;">
                                    <i class="fas fa-calendar-check me-1" style="color: var(--primary-600); font-size: 0.75rem;"></i>
                                    Disponibilit&eacute;
                                </label>
                                <select id="availabilityFilter" class="form-select form-select-sm" style="border-radius: 0.5rem;">
                                    <option value="">Tous</option>
                                    <option value="true">Disponible</option>
                                    <option value="false">Non disponible</option>
                                </select>
                            </div>
                        </div>
                        
                        <div class="d-flex gap-2 justify-content-end mt-3 pt-3" style="border-top: 1px solid var(--gray-200);">
                            <button class="btn btn-sm btn-outline-secondary" id="resetFilters" style="border-radius: 0.5rem; padding: 0.5rem 1rem;">
                                <i class="fas fa-redo me-1"></i>R&eacute;initialiser
                            </button>
                            <button id="applyFilters" class="btn btn-sm btn-primary" style="border-radius: 0.5rem; padding: 0.5rem 1rem;">
                                <i class="fas fa-check me-1"></i>Appliquer
                            </button>
                        </div>
                    </div>
                </div>
                
                <!-- Results Bar -->
                <div class="d-flex gap-3 flex-wrap align-items-center">
                    <div class="d-flex align-items-center" style="background: white; padding: 0.625rem 1.125rem; border-radius: 0.75rem; border: 1px solid var(--gray-200); box-shadow: 0 1px 3px rgba(0,0,0,0.05);">
                        <i class="fas fa-box-open me-2" style="color: var(--primary-600); font-size: 0.875rem;"></i>
                        <span style="font-weight: 600; color: var(--gray-900); font-size: 0.9375rem;" id="equipmentCount">${fn:length(equipments)}</span>
                        <span style="color: var(--gray-500); font-size: 0.875rem; margin-left: 0.375rem;">&eacute;quipements trouv&eacute;s</span>
                    </div>
                    
                    <!-- View Toggle -->
                    <div class="btn-group" role="group" style="background: white; border-radius: 0.75rem; padding: 0.25rem; box-shadow: 0 1px 3px rgba(0,0,0,0.05); border: 1px solid var(--gray-200);">
                        <button type="button" class="btn view-toggle-btn active" data-view="grid" style="background: linear-gradient(135deg, var(--primary-600), var(--primary-700)); color: white; border: none; border-radius: 0.5rem; padding: 0.5rem 1rem; box-shadow: 0 2px 8px rgba(37, 99, 235, 0.3); transition: all 0.3s ease;">
                            <i class="fas fa-th-large"></i>
                        </button>
                        <button type="button" class="btn view-toggle-btn" data-view="list" style="background: transparent; color: var(--gray-500); border: none; padding: 0.5rem 1rem; border-radius: 0.5rem; transition: all 0.3s ease;">
                            <i class="fas fa-list"></i>
                        </button>
                    </div>
                </div>
            </div>

            <!-- Equipment Cards Grid -->
            <div class="row g-4" id="equipmentGrid">
                <c:choose>
                    <c:when test="${empty equipments}">
                        <div class="col-12">
                            <div class="text-center py-5">
                                <i class="fas fa-box-open" style="font-size: 4rem; color: var(--gray-300);"></i>
                                <h4 style="color: var(--gray-600); margin-top: 1rem;">Aucun équipement trouvé</h4>
                                <p style="color: var(--gray-500);">Aucun matériel disponible pour le moment</p>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="materiel" items="${equipments}">
                            <div class="col-lg-4 col-md-6 equipment-card" 
                                 data-id="${materiel.idMateriel}"
                                 data-name="${fn:toLowerCase(materiel.nom)}"
                                 data-category="${fn:toLowerCase(materiel.categorie.nomCategorie)}"
                                 data-price="${materiel.prix}"
                                 data-available="${materiel.disponibilite}">
                                <div class="card card-modern card-equipment h-100" style="border-radius: 1rem; overflow: hidden; box-shadow: 0 2px 8px rgba(0, 0, 0, 0.06); transition: all 0.3s ease; border: 1px solid var(--gray-100);">
                                    <div class="position-relative" style="height: 250px; overflow: hidden; background: linear-gradient(135deg, #f0f9ff 0%, #e0f2fe 100%);">
                                        <c:choose>
                                            <c:when test="${not empty materiel.primaryPhotoUrl}">
                                                <img src="${pageContext.request.contextPath}${materiel.primaryPhotoUrl}" 
                                                     class="card-img-top" 
                                                     alt="${materiel.nom}"
                                                     style="width: 100%; height: 100%; object-fit: cover; transition: transform 0.3s ease;"
                                                     onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/assets/img/equipment/default.jpg';">
                                            </c:when>
                                            <c:when test="${not empty materiel.photos && fn:length(materiel.photos) > 0}">
                                                <img src="${pageContext.request.contextPath}${materiel.photos[0].urlPhoto}" 
                                                     class="card-img-top" 
                                                     alt="${materiel.nom}"
                                                     style="width: 100%; height: 100%; object-fit: cover; transition: transform 0.3s ease;"
                                                     onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/assets/img/equipment/default.jpg';">
                                            </c:when>
                                            <c:otherwise>
                                                <div class="d-flex align-items-center justify-content-center h-100" style="background: linear-gradient(135deg, #e0f2fe 0%, #bae6fd 100%);">
                                                    <div class="text-center">
                                                        <i class="fas fa-image" style="font-size: 3rem; color: rgba(37, 99, 235, 0.3);"></i>
                                                        <p class="mt-2 mb-0" style="color: rgba(37, 99, 235, 0.5); font-size: 0.875rem; font-weight: 500;">Aucune photo</p>
                                                    </div>
                                                </div>
                                            </c:otherwise>
                                        </c:choose>
                                        
                                        <div class="availability-badge ${materiel.disponibilite ? 'bg-success' : 'bg-danger'}" style="position: absolute; top: 1rem; right: 1rem; padding: 0.375rem 0.875rem; border-radius: 0.5rem; font-size: 0.75rem; font-weight: 600; color: white; box-shadow: 0 2px 8px rgba(0,0,0,0.2);">
                                            <i class="fas ${materiel.disponibilite ? 'fa-check-circle' : 'fa-times-circle'} me-1"></i>
                                            <c:choose>
                                                <c:when test="${materiel.disponibilite}">Disponible</c:when>
                                                <c:otherwise>Non disponible</c:otherwise>
                                            </c:choose>
                                        </div>
                                        
                                        <c:if test="${not empty materiel.photos && fn:length(materiel.photos) > 0}">
                                            <div class="photo-count-badge" style="position: absolute; top: 1rem; left: 1rem; background: rgba(0, 0, 0, 0.7); backdrop-filter: blur(10px); color: white; padding: 0.375rem 0.75rem; border-radius: 0.5rem; font-size: 0.75rem; font-weight: 600; box-shadow: 0 2px 8px rgba(0,0,0,0.3);">
                                                <i class="fas fa-images me-1"></i>
                                                ${fn:length(materiel.photos)}
                                            </div>
                                        </c:if>
                                        <div class="price-badge" style="position: absolute; bottom: 1rem; left: 1rem; background: rgba(30, 58, 138, 0.95); backdrop-filter: blur(10px); color: white; padding: 0.5rem 1rem; border-radius: 0.75rem; font-weight: 700; font-size: 1rem; box-shadow: 0 4px 12px rgba(0,0,0,0.3);">
                                            <fmt:formatNumber value="${materiel.prix}" pattern="#,##0.00"/> MAD/jour
                                        </div>
                                    </div>
                                    <div class="card-body" style="padding: 1.5rem;">
                                        <div class="mb-2">
                                            <span class="badge" style="background: linear-gradient(135deg, rgba(37, 99, 235, 0.1), rgba(37, 99, 235, 0.2)); color: var(--primary-600); font-size: 0.75rem; padding: 0.375rem 0.75rem; border-radius: 0.5rem; font-weight: 600;">
                                                <i class="fas fa-tag me-1"></i>
                                                ${materiel.categorie.nomCategorie}
                                            </span>
                                            <c:if test="${not empty materiel.partenaire && not empty materiel.partenaire.nom}">
                                                <span class="badge ms-2" style="background: linear-gradient(135deg, rgba(251, 191, 36, 0.1), rgba(251, 191, 36, 0.2)); color: #d97706; font-size: 0.75rem; padding: 0.375rem 0.75rem; border-radius: 0.5rem; font-weight: 600;">
                                                    <i class="fas fa-handshake me-1"></i>
                                                    ${materiel.partenaire.nom}
                                                </span>
                                            </c:if>
                                        </div>
                                        <h5 class="card-title mb-3" style="font-weight: 700; color: var(--gray-900); font-size: 1.25rem; line-height: 1.3;">${materiel.nom}</h5>
                                        
                                        <div class="d-flex justify-content-between align-items-center mb-3" style="padding: 0.75rem; background: var(--gray-50); border-radius: 0.5rem;">
                                            <div>
                                                <small class="text-muted d-block" style="font-size: 0.75rem;">ID Mat&eacute;riel</small>
                                                <span style="font-weight: 600; color: var(--gray-700);">#${materiel.idMateriel}</span>
                                            </div>
                                            <div class="text-end">
                                                <small class="text-muted d-block" style="font-size: 0.75rem;">Prix</small>
                                                <span style="font-weight: 700; color: var(--primary-600); font-size: 1.125rem;">
                                                    <fmt:formatNumber value="${materiel.prix}" pattern="#,##0"/> MAD
                                                </span>
                                            </div>
                                        </div>
                                        
                                        <div class="d-flex gap-2 align-items-stretch">
                                            <a href="${pageContext.request.contextPath}/materiel/details?id=${materiel.idMateriel}" 
                                               class="btn btn-primary btn-sm d-flex align-items-center justify-content-center" 
                                               style="flex: 1; padding: 0.625rem 0.875rem; white-space: nowrap; border-radius: 0.5rem; font-weight: 600;">
                                                <i class="fas fa-eye me-2"></i>D&eacute;tails
                                            </a>
                                            <c:if test="${materiel.disponibilite}">
                                                <a href="${pageContext.request.contextPath}/reservation/new?idMateriel=${materiel.idMateriel}" 
                                                   class="btn btn-outline-primary btn-sm d-flex align-items-center justify-content-center" 
                                                   style="flex: 1; padding: 0.625rem 0.875rem; white-space: nowrap; border-radius: 0.5rem; font-weight: 600;">
                                                    <i class="fas fa-calendar-plus me-2"></i>R&eacute;server
                                                </a>
                                            </c:if>
                                            <c:if test="${!materiel.disponibilite}">
                                                <button class="btn btn-outline-secondary btn-sm d-flex align-items-center justify-content-center" 
                                                        style="flex: 1; padding: 0.625rem 0.875rem; white-space: nowrap; border-radius: 0.5rem; font-weight: 600;" 
                                                        disabled>
                                                    <i class="fas fa-ban me-2"></i>Indisponible
                                                </button>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</div>

<style>
.card-equipment:hover {
    transform: translateY(-4px);
    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15) !important;
}

.card-equipment:hover img {
    transform: scale(1.05);
}
</style>

<script>
document.addEventListener('DOMContentLoaded', function() {
    updateNavbarLinks();
    
    const searchInput = document.getElementById('searchInput');
    const clearSearchBtn = document.getElementById('clearSearch');
    const categoryFilter = document.getElementById('categoryFilter');
    const sortFilter = document.getElementById('sortFilter');
    const priceMin = document.getElementById('priceMin');
    const priceMax = document.getElementById('priceMax');
    const availabilityFilter = document.getElementById('availabilityFilter');
    const equipmentCards = document.querySelectorAll('.equipment-card');
    const equipmentGrid = document.getElementById('equipmentGrid');
    const equipmentCount = document.getElementById('equipmentCount');
    const applyFiltersBtn = document.getElementById('applyFilters');
    
    // Extraire les catégories uniques
    const uniqueCategories = new Set();
    equipmentCards.forEach(card => {
        const category = card.dataset.category;
        if (category) uniqueCategories.add(category);
    });
    
    // Remplir le select des catégories avec les valeurs uniques
    categoryFilter.innerHTML = '<option value="">Toutes cat&eacute;gories</option>';
    Array.from(uniqueCategories).sort().forEach(cat => {
        const option = document.createElement('option');
        option.value = cat;
        option.textContent = cat.charAt(0).toUpperCase() + cat.slice(1);
        categoryFilter.appendChild(option);
    });
    
    // Fonction de filtrage
    function filterEquipments() {
        const searchTerm = searchInput.value.toLowerCase();
        const selectedCategory = categoryFilter.value.toLowerCase();
        const minPrice = parseFloat(priceMin.value) || 0;
        const maxPrice = parseFloat(priceMax.value) || Infinity;
        const availabilityValue = availabilityFilter.value;
        
        let visibleCount = 0;
        
        equipmentCards.forEach(card => {
            const name = card.dataset.name;
            const category = card.dataset.category;
            const price = parseFloat(card.dataset.price);
            const available = card.dataset.available === 'true';
            
            const matchesSearch = name.includes(searchTerm);
            const matchesCategory = !selectedCategory || category.includes(selectedCategory);
            const matchesPrice = price >= minPrice && price <= maxPrice;
            const matchesAvailability = !availabilityValue || available.toString() === availabilityValue;
            
            if (matchesSearch && matchesCategory && matchesPrice && matchesAvailability) {
                card.style.display = '';
                visibleCount++;
            } else {
                card.style.display = 'none';
            }
        });
        
        equipmentCount.textContent = visibleCount;
    }
    
    // Fonction de tri
    function sortEquipments() {
        const sortValue = sortFilter.value;
        const cardsArray = Array.from(equipmentCards);
        
        cardsArray.sort((a, b) => {
            switch(sortValue) {
                case 'name-asc':
                    return a.dataset.name.localeCompare(b.dataset.name);
                case 'name-desc':
                    return b.dataset.name.localeCompare(a.dataset.name);
                case 'price-asc':
                    return parseFloat(a.dataset.price) - parseFloat(b.dataset.price);
                case 'price-desc':
                    return parseFloat(b.dataset.price) - parseFloat(a.dataset.price);
                case 'availability':
                    return (b.dataset.available === 'true' ? 1 : 0) - (a.dataset.available === 'true' ? 1 : 0);
                default:
                    return 0;
            }
        });
        
        cardsArray.forEach(card => equipmentGrid.appendChild(card));
    }
    
    // Événements
    searchInput?.addEventListener('input', function() {
        clearSearchBtn.classList.toggle('d-none', this.value.length === 0);
        filterEquipments();
    });
    
    clearSearchBtn?.addEventListener('click', function() {
        searchInput.value = '';
        clearSearchBtn.classList.add('d-none');
        filterEquipments();
        searchInput.focus();
    });
    
    categoryFilter?.addEventListener('change', filterEquipments);
    sortFilter?.addEventListener('change', sortEquipments);
    applyFiltersBtn?.addEventListener('click', filterEquipments);
    
    // Effets de focus
    [searchInput, categoryFilter, sortFilter].forEach(control => {
        control?.addEventListener('focus', function() {
            this.style.borderColor = 'var(--primary-500)';
            this.style.boxShadow = '0 0 0 4px rgba(37, 99, 235, 0.1)';
        });
        
        control?.addEventListener('blur', function() {
            this.style.borderColor = 'var(--gray-200)';
            this.style.boxShadow = 'none';
        });
    });
    
    // Toggle vue grille/liste
    const viewToggleBtns = document.querySelectorAll('.view-toggle-btn');
    viewToggleBtns.forEach(btn => {
        btn.addEventListener('click', function() {
            const viewType = this.getAttribute('data-view');
            
            viewToggleBtns.forEach(b => {
                b.classList.remove('active');
                b.style.background = 'transparent';
                b.style.color = 'var(--gray-500)';
                b.style.boxShadow = 'none';
            });
            
            this.classList.add('active');
            this.style.background = 'linear-gradient(135deg, var(--primary-600), var(--primary-700))';
            this.style.color = 'white';
            this.style.boxShadow = '0 2px 8px rgba(37, 99, 235, 0.3)';
            
            if (viewType === 'list') {
                equipmentCards.forEach(card => card.className = 'col-12 equipment-card');
                equipmentGrid.classList.remove('g-4');
                equipmentGrid.classList.add('g-3');
            } else {
                equipmentCards.forEach(card => card.className = 'col-lg-4 col-md-6 equipment-card');
                equipmentGrid.classList.remove('g-3');
                equipmentGrid.classList.add('g-4');
            }
        });
    });
    
    // Panel de filtres avancés
    const advancedFilterToggle = document.getElementById('advancedFilterToggle');
    const advancedFiltersPanel = document.getElementById('advancedFiltersPanel');
    const closeAdvancedFilters = document.getElementById('closeAdvancedFilters');
    const resetFilters = document.getElementById('resetFilters');
    
    advancedFilterToggle?.addEventListener('click', function() {
        const isVisible = advancedFiltersPanel.style.display !== 'none';
        advancedFiltersPanel.style.display = isVisible ? 'none' : 'block';
        this.style.background = isVisible ? 
            'linear-gradient(135deg, var(--primary-600), var(--primary-700))' : 
            'linear-gradient(135deg, var(--primary-700), var(--primary-800))';
    });
    
    closeAdvancedFilters?.addEventListener('click', function() {
        advancedFiltersPanel.style.display = 'none';
        advancedFilterToggle.style.background = 'linear-gradient(135deg, var(--primary-600), var(--primary-700))';
    });
    
    resetFilters?.addEventListener('click', function() {
        searchInput.value = '';
        categoryFilter.selectedIndex = 0;
        sortFilter.selectedIndex = 0;
        priceMin.value = '';
        priceMax.value = '';
        availabilityFilter.selectedIndex = 0;
        clearSearchBtn.classList.add('d-none');
        filterEquipments();
    });
    
    // Hover effect pour le bouton de filtres avancés
    advancedFilterToggle?.addEventListener('mouseenter', function() {
        this.style.transform = 'translateY(-2px)';
        this.style.boxShadow = '0 6px 20px -2px rgba(37, 99, 235, 0.5)';
    });
    
    advancedFilterToggle?.addEventListener('mouseleave', function() {
        this.style.transform = 'translateY(0)';
        this.style.boxShadow = '0 4px 12px -2px rgba(37, 99, 235, 0.4)';
    });
});

function updateNavbarLinks() {
    const navLinks = document.querySelectorAll('.nav-link.smooth-scroll');
    navLinks.forEach(function(link) {
        const section = link.getAttribute('data-section');
        if (section) {
            link.href = '../../index.jsp#' + section;
            link.classList.remove('smooth-scroll');
        }
    });
}
</script>

<%@ include file="../../layouts/footer.jsp" %>
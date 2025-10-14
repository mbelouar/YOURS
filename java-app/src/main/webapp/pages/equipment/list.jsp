<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setAttribute("pageTitle", "Matériel disponible - YOURS");
%>

<%@ include file="../../layouts/header.jsp" %>
<%@ include file="../../layouts/navbar.jsp" %>

<!-- Page Header -->
<section class="py-5" style="background: linear-gradient(135deg, #1e40af 0%, #1e3a8a 50%, #1e293b 100%); margin-top: -80px; padding-top: calc(80px + 4rem) !important; padding-bottom: 4rem !important;">
    <div class="container">
        <div class="row">
            <div class="col-lg-8 mx-auto text-center">
                <h1 class="display-4 fw-bold mb-3" style="color: white;">Catalogue Mat&eacute;riel</h1>
                <p class="lead mb-0" style="color: rgba(255, 255, 255, 0.9);">
                    Explorez, filtrez et r&eacute;servez le mat&eacute;riel professionnel dont vous avez besoin
                </p>
            </div>
        </div>
    </div>
</section>

<div class="container py-5">
    <div class="row">
        <!-- Filter Sidebar -->
        <div class="col-lg-3 col-md-4 mb-4">
            <div class="filter-sidebar">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h5 class="fw-bold mb-0" style="color: var(--gray-900);">
                        <i class="fas fa-filter me-2" style="color: var(--primary-600);"></i>Filtres
                    </h5>
                    <button class="btn btn-sm btn-outline-secondary" onclick="clearAllFilters()" style="font-size: 0.75rem; padding: 0.375rem 0.75rem; border-radius: 0.5rem;">
                        <i class="fas fa-redo me-1"></i>R&eacute;initialiser
                    </button>
                </div>

                <!-- Search -->
                <div class="filter-group">
                    <h6 style="color: var(--gray-800); font-size: 0.9375rem; margin-bottom: 0.75rem;">
                        <i class="fas fa-search me-2" style="color: var(--gray-500); font-size: 0.875rem;"></i>Recherche
                    </h6>
                    <div class="position-relative">
                        <i class="fas fa-search position-absolute" style="left: 0.875rem; top: 50%; transform: translateY(-50%); color: var(--gray-400); font-size: 0.875rem;"></i>
                        <input type="text" class="form-control search-input" id="equipmentSearch" 
                               placeholder="Rechercher..." 
                               style="padding-left: 2.5rem; border-radius: 0.75rem; border: 2px solid var(--gray-200); font-size: 0.9375rem;">
                    </div>
                </div>

                <!-- Categories -->
                <div class="filter-group">
                    <h6 style="color: var(--gray-800); font-size: 0.9375rem; margin-bottom: 0.75rem;">
                        <i class="fas fa-tags me-2" style="color: var(--gray-500); font-size: 0.875rem;"></i>Cat&eacute;gories
                    </h6>
                    <div id="categoryFilters" style="max-height: 200px; overflow-y: auto;">
                        <!-- Categories will be loaded here -->
                    </div>
                </div>

                <!-- Price Range -->
                <div class="filter-group">
                    <h6 style="color: var(--gray-800); font-size: 0.9375rem; margin-bottom: 0.75rem;">
                        <i class="fas fa-coins me-2" style="color: var(--gray-500); font-size: 0.875rem;"></i>Prix par jour
                    </h6>
                    <div class="price-range-slider">
                        <div class="mb-3">
                            <label for="minPrice" class="form-label" style="font-size: 0.875rem; color: var(--gray-600);">Min: <span class="min-price-display fw-bold" style="color: var(--primary-600);">0 MAD</span></label>
                            <input type="range" class="form-range min-price" id="minPrice" 
                                   min="0" max="1000" value="0" step="10" 
                                   style="accent-color: var(--primary-600);">
                        </div>
                        <div>
                            <label for="maxPrice" class="form-label" style="font-size: 0.875rem; color: var(--gray-600);">Max: <span class="max-price-display fw-bold" style="color: var(--primary-600);">1000 MAD</span></label>
                            <input type="range" class="form-range max-price" id="maxPrice" 
                                   min="0" max="1000" value="1000" step="10" 
                                   style="accent-color: var(--primary-600);">
                        </div>
                    </div>
                </div>

                <!-- Availability -->
                <div class="filter-group">
                    <h6 style="color: var(--gray-800); font-size: 0.9375rem; margin-bottom: 0.75rem;">
                        <i class="fas fa-check-circle me-2" style="color: var(--gray-500); font-size: 0.875rem;"></i>Disponibilit&eacute;
                    </h6>
                    <div class="form-check" style="padding: 0.5rem 0.75rem; border-radius: 0.5rem; transition: background 0.2s ease;">
                        <input class="form-check-input" type="checkbox" id="availableOnly" checked 
                               style="width: 1.25rem; height: 1.25rem; margin-top: 0.125rem; cursor: pointer;">
                        <label class="form-check-label" for="availableOnly" style="margin-left: 0.5rem; cursor: pointer; color: var(--gray-700);">
                            Disponible uniquement
                        </label>
                    </div>
                </div>

                <!-- Partner Rating -->
                <div class="filter-group">
                    <h6 style="color: var(--gray-800); font-size: 0.9375rem; margin-bottom: 0.75rem;">
                        <i class="fas fa-star me-2" style="color: var(--gray-500); font-size: 0.875rem;"></i>Note partenaire
                    </h6>
                    <div class="form-check mb-2" style="padding: 0.5rem 0.75rem; border-radius: 0.5rem; transition: background 0.2s ease;">
                        <input class="form-check-input" type="checkbox" id="rating5" value="5" 
                               style="width: 1.25rem; height: 1.25rem; margin-top: 0.125rem; cursor: pointer;">
                        <label class="form-check-label" for="rating5" style="margin-left: 0.5rem; cursor: pointer; color: var(--gray-700); font-size: 0.9375rem;">
                            <i class="fas fa-star" style="color: #fbbf24; font-size: 0.75rem;"></i>
                            <i class="fas fa-star" style="color: #fbbf24; font-size: 0.75rem;"></i>
                            <i class="fas fa-star" style="color: #fbbf24; font-size: 0.75rem;"></i>
                            <i class="fas fa-star" style="color: #fbbf24; font-size: 0.75rem;"></i>
                            <i class="fas fa-star" style="color: #fbbf24; font-size: 0.75rem;"></i>
                            <span class="ms-1">5 &eacute;toiles</span>
                        </label>
                    </div>
                    <div class="form-check" style="padding: 0.5rem 0.75rem; border-radius: 0.5rem; transition: background 0.2s ease;">
                        <input class="form-check-input" type="checkbox" id="rating4" value="4" 
                               style="width: 1.25rem; height: 1.25rem; margin-top: 0.125rem; cursor: pointer;">
                        <label class="form-check-label" for="rating4" style="margin-left: 0.5rem; cursor: pointer; color: var(--gray-700); font-size: 0.9375rem;">
                            <i class="fas fa-star" style="color: #fbbf24; font-size: 0.75rem;"></i>
                            <i class="fas fa-star" style="color: #fbbf24; font-size: 0.75rem;"></i>
                            <i class="fas fa-star" style="color: #fbbf24; font-size: 0.75rem;"></i>
                            <i class="fas fa-star" style="color: #fbbf24; font-size: 0.75rem;"></i>
                            <i class="far fa-star" style="color: #fbbf24; font-size: 0.75rem;"></i>
                            <span class="ms-1">4+ &eacute;toiles</span>
                        </label>
                    </div>
                </div>
            </div>
        </div>

        <!-- Equipment Grid -->
        <div class="col-lg-9 col-md-8">
            <!-- Header with Sort -->
            <div class="p-4 mb-4" style="background: white; border-radius: 1rem; box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.08); border: 1px solid var(--gray-200);">
                <div class="d-flex flex-wrap justify-content-between align-items-center gap-3">
                    <div>
                        <h2 class="fw-bold mb-1" style="color: var(--gray-900); font-size: 1.5rem;">Mat&eacute;riel disponible</h2>
                        <p class="mb-0" id="resultsCount" style="color: var(--gray-600); font-size: 0.9375rem;">
                            <i class="fas fa-spinner fa-spin me-1"></i>Chargement...
                        </p>
                    </div>
                    
                    <div class="d-flex align-items-center gap-2">
                        <!-- View Toggle -->
                        <div class="btn-group" role="group" style="border-radius: 0.625rem; overflow: hidden;">
                            <button type="button" class="btn btn-outline-primary active" id="gridView" 
                                    onclick="toggleView('grid')" 
                                    style="border-radius: 0; padding: 0.5rem 1rem;">
                                <i class="fas fa-th"></i>
                            </button>
                            <button type="button" class="btn btn-outline-primary" id="listView" 
                                    onclick="toggleView('list')" 
                                    style="border-radius: 0; padding: 0.5rem 1rem;">
                                <i class="fas fa-list"></i>
                            </button>
                        </div>
                        
                        <!-- Sort -->
                        <select class="form-select" id="sortBy" 
                                style="width: auto; min-width: 180px; border-radius: 0.625rem; border: 2px solid var(--gray-200);">
                            <option value="popularity">
                                <i class="fas fa-fire"></i> Plus populaire
                            </option>
                            <option value="price-asc">Prix croissant</option>
                            <option value="price-desc">Prix d&eacute;croissant</option>
                            <option value="name">Nom A-Z</option>
                            <option value="newest">Plus r&eacute;cent</option>
                        </select>
                    </div>
                </div>
            </div>

            <!-- Equipment Grid Container -->
            <div id="equipmentContainer" class="equipment-grid">
                <!-- Equipment cards will be loaded here -->
            </div>

            <!-- Loading Indicator -->
            <div id="loadingIndicator" class="text-center py-5">
                <div class="spinner-border" role="status" style="width: 3rem; height: 3rem; color: var(--primary-600); border-width: 0.3rem;">
                    <span class="visually-hidden">Chargement...</span>
                </div>
                <p class="text-muted mt-3" style="font-size: 1rem; font-weight: 500;">Chargement du mat&eacute;riel...</p>
            </div>

            <!-- No Results -->
            <div id="noResults" class="d-none">
                <div class="text-center py-5" style="background: white; border-radius: 1rem; padding: 4rem 2rem; box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.08); border: 1px solid var(--gray-200);">
                    <div style="width: 100px; height: 100px; margin: 0 auto 2rem; background: linear-gradient(135deg, rgba(37, 99, 235, 0.1), rgba(37, 99, 235, 0.05)); border-radius: 50%; display: flex; align-items: center; justify-content: center;">
                        <i class="fas fa-search" style="font-size: 3rem; color: var(--primary-600);"></i>
                    </div>
                    <h3 style="color: var(--gray-900); font-size: 1.75rem; font-weight: 700; margin-bottom: 1rem;">Aucun r&eacute;sultat trouv&eacute;</h3>
                    <p style="color: var(--gray-600); font-size: 1rem; max-width: 400px; margin: 0 auto 2rem; line-height: 1.6;">
                        Essayez de modifier vos crit&egrave;res de recherche ou de supprimer certains filtres.
                    </p>
                    <button class="btn btn-primary" onclick="clearAllFilters()">
                        <i class="fas fa-redo me-2"></i>R&eacute;initialiser les filtres
                    </button>
                </div>
            </div>

            <!-- Pagination -->
            <nav aria-label="Equipment pagination" class="mt-5">
                <ul class="pagination pagination-modern justify-content-center" id="pagination">
                    <!-- Pagination will be generated here -->
                </ul>
            </nav>
        </div>
    </div>
</div>

<!-- Equipment List JavaScript -->
<script>
// Global variables
let currentEquipment = [];
let filteredEquipment = [];
let currentPage = 1;
const itemsPerPage = 12;
let currentView = 'grid';

document.addEventListener('DOMContentLoaded', function() {
    // Load initial data
    loadEquipment();
    loadCategoryFilters();
    
    // Setup event listeners
    setupEventListeners();
    
    // Check URL parameters
    checkUrlParameters();
});

// Load equipment data
function loadEquipment() {
    // Simulate API call
    setTimeout(() => {
        currentEquipment = [...mockEquipment];
        filteredEquipment = [...currentEquipment];
        
        // Hide loading indicator
        document.getElementById('loadingIndicator').style.display = 'none';
        
        // Display equipment
        displayEquipment();
        updateResultsCount();
        generatePagination();
    }, 1000);
}

// Load category filters
function loadCategoryFilters() {
    const container = document.getElementById('categoryFilters');
    
    container.innerHTML = mockCategories.map(category => `
        <div class="form-check">
            <input class="form-check-input category-filter" type="checkbox" 
                   id="category-${category.idCategorie}" value="${category.idCategorie}">
            <label class="form-check-label" for="category-${category.idCategorie}">
                <i class="${category.icon} me-2"></i>
                ${category.nomCategorie} (${category.equipmentCount})
            </label>
        </div>
    `).join('');
}

// Setup event listeners
function setupEventListeners() {
    // Search input
    const searchInput = document.getElementById('equipmentSearch');
    searchInput.addEventListener('input', YOURS.debounce(filterEquipment, 300));
    
    // Category filters
    document.addEventListener('change', function(e) {
        if (e.target.classList.contains('category-filter')) {
            filterEquipment();
        }
    });
    
    // Price range sliders
    document.getElementById('minPrice').addEventListener('input', YOURS.debounce(filterEquipment, 300));
    document.getElementById('maxPrice').addEventListener('input', YOURS.debounce(filterEquipment, 300));
    
    // Availability filter
    document.getElementById('availableOnly').addEventListener('change', filterEquipment);
    
    // Sort dropdown
    document.getElementById('sortBy').addEventListener('change', function() {
        sortEquipment(this.value);
        displayEquipment();
    });
}

// Check URL parameters
function checkUrlParameters() {
    const urlParams = new URLSearchParams(window.location.search);
    
    // Search query
    const search = urlParams.get('search');
    if (search) {
        document.getElementById('equipmentSearch').value = search;
    }
    
    // Category filter
    const category = urlParams.get('category');
    if (category) {
        const categoryCheckbox = document.getElementById(`category-${category}`);
        if (categoryCheckbox) {
            categoryCheckbox.checked = true;
        }
    }
    
    // Apply filters if any URL parameters exist
    if (search || category) {
        setTimeout(filterEquipment, 100);
    }
}

// Filter equipment
function filterEquipment() {
    const searchQuery = document.getElementById('equipmentSearch').value.toLowerCase();
    const selectedCategories = Array.from(document.querySelectorAll('.category-filter:checked')).map(cb => parseInt(cb.value));
    const minPrice = parseInt(document.getElementById('minPrice').value);
    const maxPrice = parseInt(document.getElementById('maxPrice').value);
    const availableOnly = document.getElementById('availableOnly').checked;
    
    filteredEquipment = currentEquipment.filter(equipment => {
        // Search filter
        const matchesSearch = !searchQuery || 
            equipment.nom.toLowerCase().includes(searchQuery) ||
            equipment.description.toLowerCase().includes(searchQuery) ||
            equipment.categorie.toLowerCase().includes(searchQuery);
        
        // Category filter
        const matchesCategory = selectedCategories.length === 0 || 
            selectedCategories.includes(equipment.idCategorie);
        
        // Price filter
        const matchesPrice = equipment.prix >= minPrice && equipment.prix <= maxPrice;
        
        // Availability filter
        const matchesAvailability = !availableOnly || equipment.disponibilite;
        
        return matchesSearch && matchesCategory && matchesPrice && matchesAvailability;
    });
    
    // Reset to first page
    currentPage = 1;
    
    // Update display
    displayEquipment();
    updateResultsCount();
    generatePagination();
    
    // Update URL
    updateUrl();
}

// Sort equipment
function sortEquipment(sortBy) {
    switch (sortBy) {
        case 'popularity':
            filteredEquipment.sort((a, b) => b.popularityScore - a.popularityScore);
            break;
        case 'price-asc':
            filteredEquipment.sort((a, b) => a.prix - b.prix);
            break;
        case 'price-desc':
            filteredEquipment.sort((a, b) => b.prix - a.prix);
            break;
        case 'name':
            filteredEquipment.sort((a, b) => a.nom.localeCompare(b.nom));
            break;
        case 'newest':
            filteredEquipment.sort((a, b) => b.idMateriel - a.idMateriel);
            break;
    }
}

// Display equipment
function displayEquipment() {
    const container = document.getElementById('equipmentContainer');
    const noResults = document.getElementById('noResults');
    
    if (filteredEquipment.length === 0) {
        container.innerHTML = '';
        noResults.classList.remove('d-none');
        return;
    }
    
    noResults.classList.add('d-none');
    
    // Calculate pagination
    const startIndex = (currentPage - 1) * itemsPerPage;
    const endIndex = startIndex + itemsPerPage;
    const pageEquipment = filteredEquipment.slice(startIndex, endIndex);
    
    // Generate HTML based on view type
    if (currentView === 'grid') {
        container.className = 'equipment-grid';
        container.innerHTML = pageEquipment.map(equipment => createEquipmentCard(equipment)).join('');
    } else {
        container.className = 'equipment-list';
        container.innerHTML = pageEquipment.map(equipment => createEquipmentListItem(equipment)).join('');
    }
}

// Create equipment card (grid view)
function createEquipmentCard(equipment) {
    return `
        <div class="col-lg-4 col-md-6 mb-4">
            <div class="equipment-card">
                <div class="position-relative">
                    <img src="${equipment.images[0]}" class="card-img-top" alt="${equipment.nom}"
                         onerror="this.src='assets/images/placeholder-equipment.jpg'">
                    <div class="equipment-category">${equipment.categorie}</div>
                    <div class="availability-badge ${equipment.disponibilite ? 'available' : 'rented'}">
                        ${equipment.disponibilite ? 'Disponible' : 'Loué'}
                    </div>
                </div>
                <div class="card-body">
                    <h5 class="equipment-title">${equipment.nom}</h5>
                    <p class="card-text text-muted">${equipment.description.substring(0, 100)}...</p>
                    
                    <!-- Partner Info -->
                    <div class="d-flex align-items-center mb-2">
                        <small class="text-muted">
                            <i class="bi bi-shop me-1"></i>${equipment.partner.nom}
                        </small>
                        <div class="ms-auto">
                            ${generateStars(equipment.partner.rating)}
                            <small class="text-muted">(${equipment.partner.rating})</small>
                        </div>
                    </div>
                    
                    <div class="d-flex justify-content-between align-items-center">
                        <div class="equipment-price">${YOURS.formatCurrency(equipment.prix)}/jour</div>
                        <div class="btn-group">
                            <a href="${pageContext.request.contextPath}/pages/equipment/detail.jsp?id=${equipment.idMateriel}" 
                               class="btn btn-outline-primary btn-sm">
                                <i class="bi bi-eye me-1"></i>Voir
                            </a>
                            ${equipment.disponibilite ? `
                                <button class="btn btn-primary btn-sm" onclick="quickBook(${equipment.idMateriel})">
                                    <i class="bi bi-calendar-plus me-1"></i>Réserver
                                </button>
                            ` : ''}
                        </div>
                    </div>
                </div>
            </div>
        </div>
    `;
}

// Create equipment list item (list view)
function createEquipmentListItem(equipment) {
    return `
        <div class="card mb-3">
            <div class="row g-0">
                <div class="col-md-3">
                    <div class="position-relative">
                        <img src="${equipment.images[0]}" class="img-fluid rounded-start h-100" 
                             alt="${equipment.nom}" style="object-fit: cover;"
                             onerror="this.src='assets/images/placeholder-equipment.jpg'">
                        <div class="equipment-category position-absolute top-0 start-0 m-2">
                            ${equipment.categorie}
                        </div>
                        <div class="availability-badge ${equipment.disponibilite ? 'available' : 'rented'} position-absolute top-0 end-0 m-2">
                            ${equipment.disponibilite ? 'Disponible' : 'Loué'}
                        </div>
                    </div>
                </div>
                <div class="col-md-9">
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-8">
                                <h5 class="card-title">${equipment.nom}</h5>
                                <p class="card-text">${equipment.description}</p>
                                
                                <!-- Specifications -->
                                <div class="mb-2">
                                    ${equipment.specifications.slice(0, 3).map(spec => 
                                        `<span class="badge bg-light text-dark me-1">${spec}</span>`
                                    ).join('')}
                                </div>
                                
                                <!-- Partner Info -->
                                <div class="d-flex align-items-center">
                                    <small class="text-muted">
                                        <i class="bi bi-shop me-1"></i>${equipment.partner.nom}
                                    </small>
                                    <div class="ms-3">
                                        ${generateStars(equipment.partner.rating)}
                                        <small class="text-muted">(${equipment.partner.rating})</small>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 text-end">
                                <div class="equipment-price mb-3">${YOURS.formatCurrency(equipment.prix)}/jour</div>
                                <div class="d-grid gap-2">
                                    <a href="${pageContext.request.contextPath}/pages/equipment/detail.jsp?id=${equipment.idMateriel}" 
                                       class="btn btn-outline-primary">
                                        <i class="bi bi-eye me-1"></i>Voir détails
                                    </a>
                                    ${equipment.disponibilite ? `
                                        <button class="btn btn-primary" onclick="quickBook(${equipment.idMateriel})">
                                            <i class="bi bi-calendar-plus me-1"></i>Réserver
                                        </button>
                                    ` : ''}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    `;
}

// Generate star rating
function generateStars(rating) {
    const fullStars = Math.floor(rating);
    const hasHalfStar = rating % 1 !== 0;
    let stars = '';
    
    for (let i = 0; i < fullStars; i++) {
        stars += '<i class="bi bi-star-fill text-warning"></i>';
    }
    
    if (hasHalfStar) {
        stars += '<i class="bi bi-star-half text-warning"></i>';
    }
    
    const emptyStars = 5 - Math.ceil(rating);
    for (let i = 0; i < emptyStars; i++) {
        stars += '<i class="bi bi-star text-warning"></i>';
    }
    
    return stars;
}

// Update results count
function updateResultsCount() {
    const count = filteredEquipment.length;
    const total = currentEquipment.length;
    const resultsText = count === total ? 
        `${count} équipements disponibles` : 
        `${count} sur ${total} équipements`;
    
    document.getElementById('resultsCount').textContent = resultsText;
}

// Generate pagination
function generatePagination() {
    const totalPages = Math.ceil(filteredEquipment.length / itemsPerPage);
    const pagination = document.getElementById('pagination');
    
    if (totalPages <= 1) {
        pagination.innerHTML = '';
        return;
    }
    
    let paginationHTML = '';
    
    // Previous button
    paginationHTML += `
        <li class="page-item ${currentPage === 1 ? 'disabled' : ''}">
            <a class="page-link" href="#" onclick="changePage(${currentPage - 1})">
                <i class="bi bi-chevron-left"></i>
            </a>
        </li>
    `;
    
    // Page numbers
    const startPage = Math.max(1, currentPage - 2);
    const endPage = Math.min(totalPages, currentPage + 2);
    
    if (startPage > 1) {
        paginationHTML += `<li class="page-item"><a class="page-link" href="#" onclick="changePage(1)">1</a></li>`;
        if (startPage > 2) {
            paginationHTML += `<li class="page-item disabled"><span class="page-link">...</span></li>`;
        }
    }
    
    for (let i = startPage; i <= endPage; i++) {
        paginationHTML += `
            <li class="page-item ${i === currentPage ? 'active' : ''}">
                <a class="page-link" href="#" onclick="changePage(${i})">${i}</a>
            </li>
        `;
    }
    
    if (endPage < totalPages) {
        if (endPage < totalPages - 1) {
            paginationHTML += `<li class="page-item disabled"><span class="page-link">...</span></li>`;
        }
        paginationHTML += `<li class="page-item"><a class="page-link" href="#" onclick="changePage(${totalPages})">${totalPages}</a></li>`;
    }
    
    // Next button
    paginationHTML += `
        <li class="page-item ${currentPage === totalPages ? 'disabled' : ''}">
            <a class="page-link" href="#" onclick="changePage(${currentPage + 1})">
                <i class="bi bi-chevron-right"></i>
            </a>
        </li>
    `;
    
    pagination.innerHTML = paginationHTML;
}

// Change page
function changePage(page) {
    if (page < 1 || page > Math.ceil(filteredEquipment.length / itemsPerPage)) return;
    
    currentPage = page;
    displayEquipment();
    generatePagination();
    
    // Scroll to top
    window.scrollTo({ top: 0, behavior: 'smooth' });
}

// Toggle view
function toggleView(view) {
    currentView = view;
    
    // Update buttons
    document.getElementById('gridView').classList.toggle('active', view === 'grid');
    document.getElementById('listView').classList.toggle('active', view === 'list');
    
    // Update display
    displayEquipment();
}

// Clear all filters
function clearAllFilters() {
    // Clear search
    document.getElementById('equipmentSearch').value = '';
    
    // Clear category filters
    document.querySelectorAll('.category-filter').forEach(cb => cb.checked = false);
    
    // Reset price range
    document.getElementById('minPrice').value = 0;
    document.getElementById('maxPrice').value = 1000;
    document.querySelector('.min-price-display').textContent = '0 MAD';
    document.querySelector('.max-price-display').textContent = '1000 MAD';
    
    // Reset availability
    document.getElementById('availableOnly').checked = true;
    
    // Reset sort
    document.getElementById('sortBy').value = 'popularity';
    
    // Apply filters
    filterEquipment();
}

// Quick book function
function quickBook(equipmentId) {
    // Check if user is logged in
    const user = YOURS.storage.get('user') || JSON.parse(sessionStorage.getItem('yours_user') || 'null');
    
    if (!user) {
        YOURS.showToast('Veuillez vous connecter pour réserver du matériel', 'warning');
        setTimeout(() => {
            window.location.href = '${pageContext.request.contextPath}/pages/auth/login.jsp';
        }, 2000);
        return;
    }
    
    // Redirect to booking page
    window.location.href = `${pageContext.request.contextPath}/pages/booking/form.jsp?equipment=${equipmentId}`;
}

// Update URL with current filters
function updateUrl() {
    const url = new URL(window.location);
    
    // Search parameter
    const search = document.getElementById('equipmentSearch').value;
    if (search) {
        url.searchParams.set('search', search);
    } else {
        url.searchParams.delete('search');
    }
    
    // Category parameter
    const selectedCategories = Array.from(document.querySelectorAll('.category-filter:checked')).map(cb => cb.value);
    if (selectedCategories.length === 1) {
        url.searchParams.set('category', selectedCategories[0]);
    } else {
        url.searchParams.delete('category');
    }
    
    // Update URL without page reload
    window.history.replaceState({}, '', url);
}
</script>

<%@ include file="../../layouts/footer.jsp" %>

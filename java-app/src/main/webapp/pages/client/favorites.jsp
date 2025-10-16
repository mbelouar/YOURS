<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setAttribute("pageTitle", "Mes Favoris - YOURS");
%>

<%@ include file="../../layouts/header.jsp" %>
<%@ include file="../../layouts/navbar.jsp" %>

<div class="container py-5" style="margin-top: 80px;">
    <!-- Breadcrumb -->
    <nav aria-label="breadcrumb" class="mb-4">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="${pageContext.request.contextPath}/pages/client/dashboard.jsp">
                    <i class="bi bi-house me-1"></i>Tableau de bord
                </a>
            </li>
            <li class="breadcrumb-item active">Mes Favoris</li>
        </ol>
    </nav>

    <div class="row">
        <div class="col-lg-3 mb-4">
            <div class="sticky-sidebar">
            <!-- Favorites Navigation -->
            <div class="card border-0 shadow-lg favorites-nav-card enhanced-nav">
                <div class="card-header bg-gradient-primary text-white border-0 py-4">
                    <h5 class="fw-bold mb-0 d-flex align-items-center">
                        <i class="bi bi-heart-fill me-3" style="font-size: 1.2rem;"></i>Favoris
                    </h5>
                    <small class="text-white-50 mt-1">Matériel sauvegardé</small>
                </div>
                <div class="list-group list-group-flush favorites-nav-list">
                    <a href="#all-favorites" class="list-group-item list-group-item-action favorites-nav-item active" data-section="all-favorites">
                        <div class="d-flex align-items-center">
                            <div class="nav-icon-wrapper me-3">
                                <i class="bi bi-heart"></i>
                            </div>
                            <div class="nav-content">
                                <div class="nav-title">Tous les favoris</div>
                                <small class="nav-subtitle">Tout le matériel</small>
                            </div>
                            <i class="bi bi-chevron-right ms-auto nav-arrow"></i>
                        </div>
                    </a>
                    <a href="#recent-favorites" class="list-group-item list-group-item-action favorites-nav-item" data-section="recent-favorites">
                        <div class="d-flex align-items-center">
                            <div class="nav-icon-wrapper me-3">
                                <i class="bi bi-clock-history"></i>
                            </div>
                            <div class="nav-content">
                                <div class="nav-title">Récents</div>
                                <small class="nav-subtitle">Ajoutés récemment</small>
                            </div>
                            <i class="bi bi-chevron-right ms-auto nav-arrow"></i>
                        </div>
                    </a>
                    <a href="#categories-favorites" class="list-group-item list-group-item-action favorites-nav-item" data-section="categories-favorites">
                        <div class="d-flex align-items-center">
                            <div class="nav-icon-wrapper me-3">
                                <i class="bi bi-grid"></i>
                            </div>
                            <div class="nav-content">
                                <div class="nav-title">Par catégorie</div>
                                <small class="nav-subtitle">Matériel organisé</small>
                            </div>
                            <i class="bi bi-chevron-right ms-auto nav-arrow"></i>
                        </div>
                    </a>
                </div>
            </div>

            <!-- Quick Stats Card -->
            <div class="card border-0 shadow-lg mt-4">
                <div class="card-body p-4">
                    <h6 class="fw-bold mb-3 text-primary">
                        <i class="bi bi-bar-chart me-2"></i>Statistiques
                    </h6>
                    <div class="stat-item mb-3">
                        <div class="d-flex justify-content-between align-items-center">
                            <span class="text-muted">Total favoris</span>
                            <span class="badge bg-primary" id="totalFavs">0</span>
                        </div>
                    </div>
                    <div class="stat-item mb-3">
                        <div class="d-flex justify-content-between align-items-center">
                            <span class="text-muted">Disponibles</span>
                            <span class="badge bg-success" id="availableFavs">0</span>
                        </div>
                    </div>
                    <div class="stat-item">
                        <div class="d-flex justify-content-between align-items-center">
                            <span class="text-muted">Réservés</span>
                            <span class="badge bg-warning" id="reservedFavs">0</span>
                        </div>
                    </div>
                </div>
            </div>
            </div>
        </div>

        <div class="col-lg-9">
            <!-- All Favorites Section -->
            <div class="favorites-section" id="all-favorites">
                <div class="card border-0 shadow-lg mb-4 favorites-card">
                    <div class="card-header bg-gradient-light border-0 py-3">
                        <div class="d-flex justify-content-between align-items-center">
                            <h5 class="fw-bold mb-0 d-flex align-items-center">
                                <i class="bi bi-heart me-3 text-danger" style="font-size: 1.3rem;"></i>Tous les favoris
                            </h5>
                            <div class="d-flex gap-2">
                                <span class="badge bg-primary" id="favCount">0 équipements</span>
                                <a href="${pageContext.request.contextPath}/pages/equipment/list.jsp" class="btn btn-sm btn-outline-primary" id="browseEquipmentBtn">
                                    <i class="bi bi-plus-circle me-1"></i>Parcourir
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="card-body p-4">
                        <div class="row g-4" id="favoritesContainer">
                            <!-- Favorites will be loaded here -->
                        </div>

                        <!-- Empty State -->
                        <div id="emptyState" class="text-center py-5" style="display: none;">
                            <div class="empty-state-icon mb-4">
                                <i class="bi bi-heart text-muted"></i>
                            </div>
                            <h4 class="text-muted mb-3">Aucun favori</h4>
                            <p class="text-muted mb-4">Commencez à ajouter du matériel à vos favoris pour le retrouver facilement</p>
                            <a href="${pageContext.request.contextPath}/pages/equipment/list.jsp" class="btn btn-primary btn-lg">
                                <i class="bi bi-search me-2"></i>Découvrir le matériel
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Recent Favorites Section -->
            <div class="favorites-section" id="recent-favorites" style="display: none;">
                <div class="card border-0 shadow-lg mb-4 favorites-card">
                    <div class="card-header bg-gradient-light border-0 py-3">
                        <div class="d-flex justify-content-between align-items-center">
                            <h5 class="fw-bold mb-0 d-flex align-items-center">
                                <i class="bi bi-clock-history me-3 text-primary" style="font-size: 1.3rem;"></i>Favoris récents
                            </h5>
                            <span class="badge bg-info">Derniers ajouts</span>
                        </div>
                    </div>
                    <div class="card-body p-4">
                        <div class="row g-4" id="recentFavoritesContainer">
                            <!-- Recent favorites will be loaded here -->
                        </div>
                    </div>
                </div>
            </div>

            <!-- Categories Section -->
            <div class="favorites-section" id="categories-favorites" style="display: none;">
                <div class="card border-0 shadow-lg mb-4 favorites-card">
                    <div class="card-header bg-gradient-light border-0 py-3">
                        <div class="d-flex justify-content-between align-items-center">
                            <h5 class="fw-bold mb-0 d-flex align-items-center">
                                <i class="bi bi-grid me-3 text-success" style="font-size: 1.3rem;"></i>Par catégorie
                            </h5>
                            <span class="badge bg-success">Organisé</span>
                        </div>
                    </div>
                    <div class="card-body p-4">
                        <div id="categoriesFavoritesContainer">
                            <!-- Categories will be loaded here -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
// Store context path for use in JavaScript
const contextPath = '${pageContext.request.contextPath}';

document.addEventListener('DOMContentLoaded', function() {
    console.log('Favorites page loaded successfully');
    
    // Load favorites
    loadFavorites();
    
    // Enhanced smooth scroll navigation
    document.querySelectorAll('.favorites-nav-item').forEach(item => {
        item.addEventListener('click', function(e) {
            e.preventDefault();
            const sectionId = this.getAttribute('data-section');
            
            // Hide all sections
            document.querySelectorAll('.favorites-section').forEach(section => {
                section.style.display = 'none';
            });
            
            // Show selected section
            const targetSection = document.getElementById(sectionId);
            if (targetSection) {
                targetSection.style.display = 'block';
                
                // Scroll to top of content
                const leftContainer = document.querySelector('.favorites-nav-card');
                const leftContainerTop = leftContainer.offsetTop;
                
                window.scrollTo({
                    top: leftContainerTop - 20,
                    behavior: 'smooth'
                });
            }
            
            // Update active state
            document.querySelectorAll('.favorites-nav-item').forEach(i => i.classList.remove('active'));
            this.classList.add('active');
            
            // Add visual feedback
            this.style.transform = 'scale(0.98)';
            setTimeout(() => {
                this.style.transform = '';
            }, 150);
            
            // Load appropriate content
            if (sectionId === 'recent-favorites') {
                loadRecentFavorites();
            } else if (sectionId === 'categories-favorites') {
                loadCategoriesFavorites();
            }
        });
    });
});

function loadFavorites() {
    // Simulate loading favorites
    const favorites = MockDataUtils.getPopularEquipment(6);
    const container = document.getElementById('favoritesContainer');
    const emptyState = document.getElementById('emptyState');
    
    // Update stats
    document.getElementById('totalFavs').textContent = favorites.length;
    document.getElementById('availableFavs').textContent = favorites.length;
    document.getElementById('reservedFavs').textContent = '0';
    document.getElementById('favCount').textContent = `${favorites.length} équipement${favorites.length > 1 ? 's' : ''}`;
    
    if (favorites.length === 0) {
        container.style.display = 'none';
        emptyState.style.display = 'block';
        return;
    }
    
    container.innerHTML = favorites.map(equipment => `
        <div class="col-md-6 col-lg-4">
            <div class="card equipment-card h-100 border-0 shadow-sm">
                <div class="position-relative equipment-image-wrapper">
                    <img src="\${equipment.images[0]}" class="card-img-top equipment-image" alt="\${equipment.nom}"
                         onerror="this.src='${contextPath}/assets/images/placeholder-equipment.jpg'">
                    <button class="btn btn-sm btn-danger favorite-btn position-absolute" 
                            onclick="removeFavorite(\${equipment.idMateriel})">
                        <i class="bi bi-heart-fill"></i>
                    </button>
                    <span class="badge bg-success equipment-status position-absolute">Disponible</span>
                </div>
                <div class="card-body">
                    <h6 class="card-title fw-bold mb-2 text-truncate">\${equipment.nom}</h6>
                    <p class="card-text text-muted small mb-3">\${equipment.description.substring(0, 80)}...</p>
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <div>
                            <small class="text-muted d-block">Prix/jour</small>
                            <span class="fw-bold text-primary">\${YOURS.formatCurrency(equipment.prix)}</span>
                        </div>
                        <div class="text-end">
                            <small class="text-muted d-block">Note</small>
                            <div class="text-warning">
                                <i class="bi bi-star-fill"></i>
                                <span class="text-dark fw-semibold">\${equipment.note || 4.5}</span>
                            </div>
                        </div>
                    </div>
                    <div class="d-grid gap-2">
                        <a href="${contextPath}/pages/equipment/detail.jsp?id=\${equipment.idMateriel}" 
                           class="btn btn-sm btn-primary">
                            <i class="bi bi-eye me-1"></i>Détails
                        </a>
                        <a href="${contextPath}/pages/booking/form.jsp?id=\${equipment.idMateriel}" 
                           class="btn btn-sm btn-outline-primary">
                            <i class="bi bi-calendar-check me-1"></i>Réserver
                        </a>
                    </div>
                </div>
            </div>
        </div>
    `).join('');
}

function loadRecentFavorites() {
    const container = document.getElementById('recentFavoritesContainer');
    const favorites = MockDataUtils.getPopularEquipment(3); // Show only 3 recent
    
    container.innerHTML = favorites.map(equipment => `
        <div class="col-md-6 col-lg-4">
            <div class="card equipment-card h-100 border-0 shadow-sm">
                <div class="position-relative equipment-image-wrapper">
                    <img src="\${equipment.images[0]}" class="card-img-top equipment-image" alt="\${equipment.nom}"
                         onerror="this.src='${contextPath}/assets/images/placeholder-equipment.jpg'">
                    <button class="btn btn-sm btn-danger favorite-btn position-absolute" 
                            onclick="removeFavorite(\${equipment.idMateriel})">
                        <i class="bi bi-heart-fill"></i>
                    </button>
                    <span class="badge bg-info equipment-status position-absolute">Récent</span>
                </div>
                <div class="card-body">
                    <h6 class="card-title fw-bold mb-2 text-truncate">\${equipment.nom}</h6>
                    <p class="card-text text-muted small mb-3">\${equipment.description.substring(0, 80)}...</p>
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <div>
                            <small class="text-muted d-block">Prix/jour</small>
                            <span class="fw-bold text-primary">\${YOURS.formatCurrency(equipment.prix)}</span>
                        </div>
                        <div class="text-end">
                            <small class="text-muted d-block">Ajouté</small>
                            <span class="text-dark fw-semibold small">Aujourd'hui</span>
                        </div>
                    </div>
                    <div class="d-grid gap-2">
                        <a href="${contextPath}/pages/equipment/detail.jsp?id=\${equipment.idMateriel}" 
                           class="btn btn-sm btn-primary">
                            <i class="bi bi-eye me-1"></i>Détails
                        </a>
                    </div>
                </div>
            </div>
        </div>
    `).join('');
}

function loadCategoriesFavorites() {
    const container = document.getElementById('categoriesFavoritesContainer');
    const categories = ['Électronique', 'Mobilier', 'Outils'];
    
    let html = '';
    categories.forEach(category => {
        const equipmentList = MockDataUtils.getPopularEquipment(2);
        
        html += '<div class="mb-4">';
        html += '    <div class="d-flex justify-content-between align-items-center mb-3">';
        html += '        <h6 class="fw-bold text-primary mb-0">';
        html += '            <i class="bi bi-tag me-2"></i>' + category;
        html += '        </h6>';
        html += '        <span class="badge bg-primary">2 équipements</span>';
        html += '    </div>';
        html += '    <div class="row g-3">';
        
        equipmentList.forEach(equipment => {
            html += '        <div class="col-md-6">';
            html += '            <div class="card equipment-card-small border-0 shadow-sm">';
            html += '                <div class="row g-0">';
            html += '                    <div class="col-4">';
            html += '                        <div class="position-relative">';
            html += '                            <img src="' + equipment.images[0] + '" class="img-fluid rounded-start" ';
            html += '                                 style="height: 120px; width: 100%; object-fit: cover;"';
            html += '                                 alt="' + equipment.nom + '"';
            html += '                                 onerror="this.src=\'' + contextPath + '/assets/images/placeholder-equipment.jpg\'">';
            html += '                        </div>';
            html += '                    </div>';
            html += '                    <div class="col-8">';
            html += '                        <div class="card-body p-3">';
            html += '                            <h6 class="card-title fw-bold mb-1 small">' + equipment.nom + '</h6>';
            html += '                            <p class="text-primary fw-bold mb-2">' + YOURS.formatCurrency(equipment.prix) + '/jour</p>';
            html += '                            <div class="d-flex gap-1">';
            html += '                                <a href="' + contextPath + '/pages/equipment/detail.jsp?id=' + equipment.idMateriel + '" ';
            html += '                                   class="btn btn-xs btn-primary flex-fill">';
            html += '                                    <i class="bi bi-eye"></i>';
            html += '                                </a>';
            html += '                                <button class="btn btn-xs btn-danger" onclick="removeFavorite(' + equipment.idMateriel + ')">';
            html += '                                    <i class="bi bi-heart-fill"></i>';
            html += '                                </button>';
            html += '                            </div>';
            html += '                        </div>';
            html += '                    </div>';
            html += '                </div>';
            html += '            </div>';
            html += '        </div>';
        });
        
        html += '    </div>';
        html += '</div>';
    });
    
    container.innerHTML = html;
}

function removeFavorite(id) {
    YOURS.showConfirmDialog(
        'Retirer des favoris',
        'Êtes-vous sûr de vouloir retirer cet équipement de vos favoris ?',
        function() {
            YOURS.showToast('Équipement retiré des favoris', 'success');
            // Reload favorites after a short delay
            setTimeout(() => {
                loadFavorites();
                // Check which section is active and reload accordingly
                const activeSection = document.querySelector('.favorites-nav-item.active');
                const sectionId = activeSection ? activeSection.getAttribute('data-section') : 'all-favorites';
                
                if (sectionId === 'recent-favorites') {
                    loadRecentFavorites();
                } else if (sectionId === 'categories-favorites') {
                    loadCategoriesFavorites();
                }
            }, 500);
        }
    );
}
</script>

<style>
/* Sticky Sidebar Wrapper */
.sticky-sidebar {
    position: sticky;
    top: 100px;
    align-self: flex-start;
}

/* Enhanced Navigation Container Styling */
.favorites-nav-card.enhanced-nav {
    border-radius: 1rem !important;
    overflow: hidden;
    box-shadow: 0 15px 35px -5px rgba(0, 0, 0, 0.15);
    border: 1px solid rgba(226, 232, 240, 0.8);
    background: linear-gradient(135deg, #ffffff, #f8fafc);
}

.enhanced-nav .card-header {
    background: linear-gradient(135deg, #1e40af, #1d4ed8, #2563eb) !important;
    border-bottom: 1px solid rgba(255, 255, 255, 0.2);
    position: relative;
    overflow: hidden;
}

.enhanced-nav .card-header::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: linear-gradient(45deg, rgba(255, 255, 255, 0.1), transparent);
    pointer-events: none;
}

.enhanced-nav .card-header h5 {
    position: relative;
    z-index: 2;
}

.enhanced-nav .card-header small {
    position: relative;
    z-index: 2;
}

/* Enhanced Navigation Items */
.enhanced-nav .favorites-nav-list .favorites-nav-item {
    border: none !important;
    padding: 1rem 1.25rem !important;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
    position: relative;
    background: transparent;
    color: #374151;
    margin-bottom: 0.25rem;
    border-radius: 0.75rem !important;
    overflow: hidden;
}

.enhanced-nav .favorites-nav-list .favorites-nav-item::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background: linear-gradient(135deg, rgba(59, 130, 246, 0.05), rgba(147, 197, 253, 0.05));
    opacity: 0;
    transition: all 0.3s ease;
}

.enhanced-nav .favorites-nav-list .favorites-nav-item:hover {
    background: linear-gradient(135deg, #eff6ff, #dbeafe) !important;
    color: #1e40af !important;
    transform: translateX(6px) translateY(-1px);
    box-shadow: 0 6px 20px -5px rgba(59, 130, 246, 0.15);
    border-left: 3px solid #3b82f6;
    border-radius: 0.75rem !important;
}

.enhanced-nav .favorites-nav-list .favorites-nav-item:hover::before {
    opacity: 1;
}

.enhanced-nav .favorites-nav-list .favorites-nav-item.active {
    background: linear-gradient(135deg, #2563eb, #1d4ed8) !important;
    color: white !important;
    font-weight: 600;
    border-left: 3px solid #ffffff;
    box-shadow: 0 6px 20px -5px rgba(37, 99, 235, 0.25);
    border-radius: 0 0 0.75rem 0.75rem !important;
}

.enhanced-nav .favorites-nav-list .favorites-nav-item:first-child.active {
    border-radius: 0 0 0.75rem 0.75rem !important;
}

.enhanced-nav .favorites-nav-list .favorites-nav-item.active::before {
    opacity: 1;
    background: linear-gradient(135deg, rgba(255, 255, 255, 0.1), transparent);
}

/* Navigation Icon Wrapper */
.nav-icon-wrapper {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    background: rgba(59, 130, 246, 0.1);
    display: flex;
    align-items: center;
    justify-content: center;
    transition: all 0.3s ease;
    flex-shrink: 0;
}

.enhanced-nav .favorites-nav-item:hover .nav-icon-wrapper {
    background: rgba(59, 130, 246, 0.2);
    transform: scale(1.1);
}

.enhanced-nav .favorites-nav-item.active .nav-icon-wrapper {
    background: rgba(255, 255, 255, 0.2);
}

.nav-icon-wrapper i {
    font-size: 1.1rem;
    color: #3b82f6;
    transition: all 0.3s ease;
}

.enhanced-nav .favorites-nav-item:hover .nav-icon-wrapper i {
    color: #1e40af;
}

.enhanced-nav .favorites-nav-item.active .nav-icon-wrapper i {
    color: white;
}

/* Navigation Content */
.nav-content {
    flex: 1;
}

.nav-title {
    font-weight: 600;
    font-size: 1rem;
    margin-bottom: 0.125rem;
    transition: all 0.3s ease;
}

.nav-subtitle {
    font-size: 0.8rem;
    opacity: 0.7;
    transition: all 0.3s ease;
    color: inherit;
}

.enhanced-nav .favorites-nav-item:hover .nav-subtitle {
    opacity: 0.9;
}

.enhanced-nav .favorites-nav-item.active .nav-subtitle {
    opacity: 0.8;
    color: rgba(255, 255, 255, 0.9);
}

/* Navigation Arrow */
.nav-arrow {
    font-size: 0.875rem;
    opacity: 0.6;
    transition: all 0.3s ease;
    flex-shrink: 0;
}

.enhanced-nav .favorites-nav-item:hover .nav-arrow {
    opacity: 1;
    transform: translateX(4px);
}

.enhanced-nav .favorites-nav-item.active .nav-arrow {
    opacity: 0.8;
    color: white;
}

/* Favorites Card Styling */
.favorites-card {
    border-radius: 1rem !important;
    transition: all 0.3s ease;
    overflow: hidden;
    border: 1px solid #e5e7eb;
    background: white;
    animation: fadeInUp 0.6s ease-out;
}

.favorites-card:hover {
    box-shadow: 0 20px 60px -10px rgba(0, 0, 0, 0.15) !important;
    transform: translateY(-3px);
    border-color: #d1d5db;
}

.favorites-card .card-header {
    border-bottom: 1px solid #e5e7eb;
    background: linear-gradient(135deg, #ffffff, #f8fafc) !important;
}

.bg-gradient-light {
    background: linear-gradient(135deg, #ffffff, #f8fafc) !important;
}

/* Equipment Card Styling */
.equipment-card {
    transition: all 0.3s ease;
    border-radius: 0.75rem !important;
    overflow: hidden;
}

.equipment-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 15px 35px -5px rgba(0, 0, 0, 0.2) !important;
}

.equipment-image-wrapper {
    overflow: hidden;
}

.equipment-image {
    height: 200px;
    object-fit: cover;
    width: 100%;
    transition: transform 0.3s ease;
}

.equipment-card:hover .equipment-image {
    transform: scale(1.1);
}

.favorite-btn {
    top: 10px;
    right: 10px;
    z-index: 10;
    width: 36px;
    height: 36px;
    border-radius: 50% !important;
    padding: 0;
    display: flex;
    align-items: center;
    justify-content: center;
    transition: all 0.3s ease;
}

.favorite-btn:hover {
    transform: scale(1.1);
    box-shadow: 0 4px 12px rgba(220, 38, 38, 0.3);
}

.equipment-status {
    top: 10px;
    left: 10px;
    z-index: 10;
    font-size: 0.75rem;
    padding: 0.35rem 0.75rem;
}

/* Empty State Styling */
.empty-state-icon {
    font-size: 6rem;
    opacity: 0.2;
}

.empty-state-icon i {
    color: #dc2626;
}

/* Stats Card Styling */
.sticky-sidebar .card {
    border-radius: 1rem !important;
    overflow: hidden;
    box-shadow: 0 15px 35px -5px rgba(0, 0, 0, 0.15);
    border: 1px solid rgba(226, 232, 240, 0.8);
    background: linear-gradient(135deg, #ffffff, #f8fafc);
}

.stat-item {
    padding: 0.5rem 0;
    border-bottom: 1px solid #e5e7eb;
}

.stat-item:last-child {
    border-bottom: none;
}

/* Button Enhancements */
.btn {
    border-radius: 0.75rem;
    font-weight: 500;
    transition: all 0.3s ease;
}

.btn-primary {
    background: linear-gradient(135deg, #2563eb, #1d4ed8);
    border-color: #2563eb;
    color: white;
}

.btn-primary:hover {
    background: linear-gradient(135deg, #1d4ed8, #1e40af);
    border-color: #1d4ed8;
    transform: translateY(-2px);
    box-shadow: 0 10px 25px -5px rgba(37, 99, 235, 0.3);
}

.btn-outline-primary {
    border-color: #2563eb;
    color: #2563eb;
    background-color: transparent;
}

.btn-outline-primary:hover {
    background-color: #2563eb;
    border-color: #2563eb;
    color: white;
    transform: translateY(-2px);
    box-shadow: 0 8px 25px -5px rgba(37, 99, 235, 0.2);
}

.btn-xs {
    padding: 0.25rem 0.5rem;
    font-size: 0.875rem;
}

.btn-sm {
    padding: 0.5rem 1rem;
    font-size: 0.875rem;
}

/* Badge Styling */
.badge {
    font-size: 0.8rem;
    padding: 0.5rem 1rem;
    border-radius: 0.75rem;
    font-weight: 500;
}

.badge.bg-primary {
    background: linear-gradient(135deg, #2563eb, #1d4ed8) !important;
    color: white;
}

.badge.bg-success {
    background: linear-gradient(135deg, #10b981, #059669) !important;
    color: white;
}

.badge.bg-info {
    background: linear-gradient(135deg, #06b6d4, #0891b2) !important;
    color: white;
}

.badge.bg-warning {
    background: linear-gradient(135deg, #f59e0b, #d97706) !important;
    color: white;
}

.badge.bg-danger {
    background: linear-gradient(135deg, #dc2626, #b91c1c) !important;
    color: white;
}

/* Animation */
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

/* Text Improvements */
.text-muted {
    color: #6b7280 !important;
}

.fw-semibold {
    color: #374151 !important;
}

.fw-bold {
    color: #111827 !important;
}

/* Background Improvements */
body {
    background-color: #f9fafb;
}

.container {
    background-color: transparent;
}

/* Responsive adjustments */
@media (max-width: 768px) {
    .sticky-sidebar {
        position: relative;
        top: auto;
    }
    
    .favorites-nav-card {
        margin-bottom: 1rem;
    }
    
    .favorites-card .card-body {
        padding: 1.5rem !important;
    }
    
    .equipment-image {
        height: 180px;
    }
}
</style>

<%@ include file="../../layouts/footer.jsp" %>


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
                                <span class="badge bg-primary ms-3" id="favCount">0 équipements</span>
                            </h5>
                            <div class="d-flex gap-2">
                                <div class="dropdown">
                                    <button class="btn btn-sm btn-outline-secondary dropdown-toggle" type="button" id="categoryFilterBtn" data-bs-toggle="dropdown" aria-expanded="false">
                                        <i class="bi bi-funnel me-1"></i><span id="filterLabel">Toutes catégories</span>
                                    </button>
                                    <ul class="dropdown-menu dropdown-menu-end shadow-sm category-dropdown" aria-labelledby="categoryFilterBtn">
                                        <li><a class="dropdown-item active" href="#" onclick="filterByCategory('all'); return false;">
                                            <i class="bi bi-grid-fill me-2"></i>
                                            <span>Toutes catégories</span>
                                        </a></li>
                                        <li><hr class="dropdown-divider"></li>
                                        <li><a class="dropdown-item" href="#" onclick="filterByCategory('Photographie'); return false;">
                                            <i class="bi bi-camera-fill me-2" style="color: #8b5cf6;"></i>
                                            <span>Photographie</span>
                                        </a></li>
                                        <li><a class="dropdown-item" href="#" onclick="filterByCategory('Vidéo'); return false;">
                                            <i class="bi bi-film me-2" style="color: #ef4444;"></i>
                                            <span>Vidéo</span>
                                        </a></li>
                                        <li><a class="dropdown-item" href="#" onclick="filterByCategory('Audio'); return false;">
                                            <i class="bi bi-music-note-beamed me-2" style="color: #f59e0b;"></i>
                                            <span>Audio</span>
                                        </a></li>
                                        <li><a class="dropdown-item" href="#" onclick="filterByCategory('Gaming'); return false;">
                                            <i class="bi bi-controller me-2" style="color: #10b981;"></i>
                                            <span>Gaming</span>
                                        </a></li>
                                        <li><a class="dropdown-item" href="#" onclick="filterByCategory('Informatique'); return false;">
                                            <i class="bi bi-laptop me-2" style="color: #3b82f6;"></i>
                                            <span>Informatique</span>
                                        </a></li>
                                        <li><a class="dropdown-item" href="#" onclick="filterByCategory('Éclairage'); return false;">
                                            <i class="bi bi-lightbulb-fill me-2" style="color: #eab308;"></i>
                                            <span>Éclairage</span>
                                        </a></li>
                                    </ul>
                                </div>
                                <a href="${pageContext.request.contextPath}/pages/equipment/list-simple.jsp" class="btn btn-sm btn-outline-primary" id="browseEquipmentBtn">
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
            }
        });
    });
});

function loadFavorites(category = 'all') {
    // Simulate loading favorites
    let favorites = MockDataUtils.getPopularEquipment(6);
    
    // Filter by category if specified
    if (category !== 'all') {
        // For demo purposes, we'll just show a subset based on category
        // In real implementation, this would filter based on equipment category
        favorites = favorites.filter((item, index) => {
            if (category === 'Photographie') return index % 6 === 0;
            if (category === 'Vidéo') return index % 6 === 1;
            if (category === 'Audio') return index % 6 === 2;
            if (category === 'Gaming') return index % 6 === 3;
            if (category === 'Informatique') return index % 6 === 4;
            if (category === 'Éclairage') return index % 6 === 5;
            return true;
        });
    }
    
    const container = document.getElementById('favoritesContainer');
    const emptyState = document.getElementById('emptyState');
    
    // Update stats
    document.getElementById('totalFavs').textContent = favorites.length;
    document.getElementById('availableFavs').textContent = favorites.length;
    document.getElementById('reservedFavs').textContent = '0';
    document.getElementById('favCount').textContent = `${favorites.length} équipement${favorites.length > 1 ? 's' : ''}`;
    
    if (favorites.length === 0) {
        container.innerHTML = '<div class="col-12 text-center py-5"><p class="text-muted">Aucun équipement trouvé dans cette catégorie.</p></div>';
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
                        <a href="${contextPath}/pages/equipment/detail.jsp?id=\${equipment.idMateriel}&autobook=true#reservation" 
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
                        <a href="${contextPath}/pages/equipment/detail.jsp?id=\${equipment.idMateriel}&autobook=true#reservation" 
                           class="btn btn-sm btn-outline-primary">
                            <i class="bi bi-calendar-check me-1"></i>Réserver
                        </a>
                    </div>
                </div>
            </div>
        </div>
    `).join('');
}

// Track current filter
let currentFilter = 'all';

function filterByCategory(category) {
    currentFilter = category;
    
    // Update filter label
    const filterLabel = document.getElementById('filterLabel');
    if (category === 'all') {
        filterLabel.textContent = 'Toutes catégories';
    } else {
        filterLabel.textContent = category;
    }
    
    // Update active state in dropdown
    document.querySelectorAll('.category-dropdown .dropdown-item').forEach(item => {
        item.classList.remove('active');
    });
    event.target.closest('.dropdown-item').classList.add('active');
    
    // Reload favorites with filter
    loadFavorites(category);
}

function removeFavorite(id) {
    showRemoveFavoriteDialog(id);
}

function showRemoveFavoriteDialog(equipmentId) {
    // Create the modal backdrop
    const backdrop = document.createElement('div');
    backdrop.className = 'remove-favorite-backdrop';
    backdrop.innerHTML = `
        <div class="remove-favorite-modal">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="modal-icon">
                        <div class="icon-container">
                            <i class="bi bi-heart-fill icon-heart"></i>
                            <i class="bi bi-x icon-cross"></i>
                        </div>
                    </div>
                    <h4 class="modal-title">Retirer des favoris</h4>
                    <button type="button" class="btn-close" onclick="closeRemoveFavoriteDialog()">
                        <i class="bi bi-x"></i>
                    </button>
                </div>
                <div class="modal-body">
                    <p class="modal-message">
                        Êtes-vous sûr de vouloir retirer cet équipement de vos favoris ?
                    </p>
                    <div class="modal-warning">
                        <i class="bi bi-exclamation-triangle me-2"></i>
                        <span>Cette action peut être annulée en ajoutant à nouveau l'équipement aux favoris.</span>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-secondary" onclick="closeRemoveFavoriteDialog()">
                        <i class="bi bi-x-circle me-2"></i>Annuler
                    </button>
                    <button type="button" class="btn btn-danger" onclick="confirmRemoveFavorite(` + equipmentId + `)">
                        <i class="bi bi-heart-break me-2"></i>Retirer des favoris
                    </button>
                </div>
            </div>
        </div>
    `;
    
    // Add to body
    document.body.appendChild(backdrop);
    
    // Trigger animation
    setTimeout(() => {
        backdrop.classList.add('show');
    }, 10);
    
    // Prevent body scroll
    document.body.style.overflow = 'hidden';
}

function closeRemoveFavoriteDialog() {
    const backdrop = document.querySelector('.remove-favorite-backdrop');
    if (backdrop) {
        backdrop.classList.remove('show');
        setTimeout(() => {
            if (backdrop.parentElement) {
                backdrop.parentElement.removeChild(backdrop);
            }
            document.body.style.overflow = '';
        }, 300);
    }
}

function confirmRemoveFavorite(equipmentId) {
    console.log('confirmRemoveFavorite called with ID:', equipmentId);
    
    // Close the dialog first
    closeRemoveFavoriteDialog();
    
    // Show loading state
    console.log('Showing loading toast...');
    showRemoveFavoriteToast('Suppression en cours...', 'info', 1000);
    
    // Simulate removal process
    setTimeout(() => {
        console.log('Showing success toast...');
        showRemoveFavoriteToast('Équipement retiré des favoris avec succès', 'success', 3000);
        
        // Reload favorites after a short delay
        setTimeout(() => {
            loadFavorites();
            // Check which section is active and reload accordingly
            const activeSection = document.querySelector('.favorites-nav-item.active');
            const sectionId = activeSection ? activeSection.getAttribute('data-section') : 'all-favorites';
            
            if (sectionId === 'recent-favorites') {
                loadRecentFavorites();
            }
            
            // Update stats
            updateFavoriteStats();
        }, 500);
    }, 800);
}

function showRemoveFavoriteToast(message, type = 'info', duration = 3000) {
    console.log('showRemoveFavoriteToast called with:', message, type, duration);
    
    // Use the centralized notification system
    switch(type) {
        case 'success':
            notificationSystem.success(message, duration);
            break;
        case 'danger':
            notificationSystem.error(message, duration);
            break;
        case 'info':
        default:
            notificationSystem.info(message, duration);
            break;
    }
}

function updateFavoriteStats() {
    // Update the statistics in the sidebar
    const favorites = MockDataUtils.getPopularEquipment(6);
    document.getElementById('totalFavs').textContent = favorites.length;
    document.getElementById('availableFavs').textContent = favorites.length;
    document.getElementById('favCount').textContent = `${favorites.length} équipement${favorites.length > 1 ? 's' : ''}`;
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
    border-left: none !important;
    padding: 1rem 1.5rem !important;
    transition: all 0.3s ease;
    background-color: white !important;
    position: relative;
}

.enhanced-nav .favorites-nav-list .favorites-nav-item:hover {
    background-color: #f8fafc !important;
    transform: translateX(5px);
}

.enhanced-nav .favorites-nav-list .favorites-nav-item:hover::before {
    content: '';
    position: absolute;
    left: 0;
    top: 0;
    bottom: 0;
    width: 3px;
    background-color: #2563eb;
}

.enhanced-nav .favorites-nav-list .favorites-nav-item.active {
    background: linear-gradient(135deg, #eff6ff 0%, #dbeafe 100%) !important;
}

.enhanced-nav .favorites-nav-list .favorites-nav-item.active::before {
    content: '';
    position: absolute;
    left: 0;
    top: 0;
    bottom: 0;
    width: 3px;
    background-color: #2563eb;
}

/* Navigation Icon Wrapper */
.nav-icon-wrapper {
    width: 40px;
    height: 40px;
    border-radius: 0.5rem;
    background: linear-gradient(135deg, #eff6ff, #dbeafe);
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 1.2rem;
    color: #2563eb;
}

.enhanced-nav .favorites-nav-item.active .nav-icon-wrapper {
    background: linear-gradient(135deg, #2563eb, #1d4ed8);
    color: white;
}

/* Navigation Content */
.nav-content .nav-title {
    font-weight: 600;
    color: #1e293b;
    font-size: 0.95rem;
}

.nav-content .nav-subtitle {
    color: #64748b;
    font-size: 0.8rem;
}

/* Navigation Arrow */
.nav-arrow {
    color: #cbd5e1;
    transition: all 0.3s ease;
}

.enhanced-nav .favorites-nav-item:hover .nav-arrow,
.enhanced-nav .favorites-nav-item.active .nav-arrow {
    color: #2563eb;
    transform: translateX(5px);
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

/* Remove Favorite Modal Styles */
.remove-favorite-backdrop {
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.5);
    backdrop-filter: blur(8px);
    z-index: 9999;
    display: flex;
    align-items: center;
    justify-content: center;
    opacity: 0;
    visibility: hidden;
    transition: all 0.3s ease;
}

.remove-favorite-backdrop.show {
    opacity: 1;
    visibility: visible;
}

.remove-favorite-modal {
    background: white;
    border-radius: 1rem;
    box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25);
    max-width: 500px;
    width: 90%;
    margin: 1rem;
    transform: scale(0.9) translateY(20px);
    transition: all 0.3s ease;
    overflow: hidden;
    border: 1px solid #e5e7eb;
}

.remove-favorite-backdrop.show .remove-favorite-modal {
    transform: scale(1) translateY(0);
}

.modal-content {
    display: flex;
    flex-direction: column;
}

.modal-header {
    padding: 1.5rem 1.5rem 1rem;
    border-bottom: 1px solid #e5e7eb;
    display: flex;
    align-items: center;
    gap: 1rem;
    background: linear-gradient(135deg, #fef2f2, #ffffff);
}

.modal-icon {
    width: 50px;
    height: 50px;
    border-radius: 50%;
    background: linear-gradient(135deg, #dc2626, #b91c1c);
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    font-size: 1.5rem;
    flex-shrink: 0;
    position: relative;
    box-shadow: 0 4px 12px rgba(220, 38, 38, 0.2);
}

.icon-container {
    position: relative;
    width: 100%;
    height: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
}

.icon-heart {
    font-size: 1.5rem;
    color: white;
    z-index: 2;
}

.icon-cross {
    position: absolute;
    font-size: 1.8rem;
    font-weight: bold;
    color: #991b1b;
    z-index: 3;
    text-shadow: 0 1px 2px rgba(0, 0, 0, 0.2);
}

.modal-title {
    font-size: 1.25rem;
    font-weight: 600;
    color: #111827;
    margin: 0;
    flex: 1;
}

.btn-close {
    background: none;
    border: none;
    color: #6b7280;
    font-size: 1.25rem;
    padding: 0.5rem;
    border-radius: 0.5rem;
    cursor: pointer;
    transition: all 0.2s ease;
    width: 40px;
    height: 40px;
    display: flex;
    align-items: center;
    justify-content: center;
}

.btn-close:hover {
    background: #f3f4f6;
    color: #374151;
}

.modal-body {
    padding: 1.5rem;
}

.modal-message {
    font-size: 1rem;
    color: #374151;
    margin: 0 0 1rem;
    line-height: 1.5;
}

.modal-warning {
    background: linear-gradient(135deg, #fef3c7, #fef7cd);
    border: 1px solid #f59e0b;
    border-radius: 0.75rem;
    padding: 1rem;
    display: flex;
    align-items: flex-start;
    gap: 0.75rem;
    color: #92400e;
    font-size: 0.875rem;
    line-height: 1.4;
}

.modal-warning i {
    color: #f59e0b;
    font-size: 1rem;
    margin-top: 0.125rem;
    flex-shrink: 0;
}

.modal-footer {
    padding: 1rem 1.5rem 1.5rem;
    display: flex;
    gap: 0.75rem;
    justify-content: flex-end;
}

.modal-footer .btn {
    padding: 0.75rem 1.5rem;
    font-weight: 500;
    border-radius: 0.75rem;
    transition: all 0.3s ease;
    border: 2px solid transparent;
}

.modal-footer .btn-outline-secondary {
    background: transparent;
    border-color: #6b7280;
    color: #6b7280;
}

.modal-footer .btn-outline-secondary:hover {
    background: #6b7280;
    color: white;
    transform: translateY(-2px);
    box-shadow: 0 8px 25px -5px rgba(107, 114, 128, 0.2);
}

.modal-footer .btn-danger {
    background: linear-gradient(135deg, #dc2626, #b91c1c);
    border-color: #dc2626;
    color: white;
}

.modal-footer .btn-danger:hover {
    background: linear-gradient(135deg, #b91c1c, #991b1b);
    border-color: #b91c1c;
    transform: translateY(-2px);
    box-shadow: 0 8px 25px -5px rgba(220, 38, 38, 0.3);
}

/* Remove Favorite Toast Styles */
.remove-favorite-toast {
    position: fixed;
    top: 20px;
    right: 20px;
    background: #ffffff !important;
    border-radius: 0.75rem;
    box-shadow: 0 15px 35px -5px rgba(0, 0, 0, 0.4) !important;
    border: 2px solid #e5e7eb !important;
    padding: 1rem 1.25rem;
    z-index: 10000;
    min-width: 300px;
    max-width: 400px;
    transform: translateX(100%);
    opacity: 0;
    transition: all 0.3s ease;
}

.remove-favorite-toast.show {
    transform: translateX(0);
    opacity: 1;
}

.toast-content {
    display: flex;
    align-items: center;
    gap: 0.75rem;
}

.toast-icon {
    width: 32px;
    height: 32px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 1rem;
    flex-shrink: 0;
}

.toast-success {
    border-color: #10b981;
}

.toast-success .toast-icon {
    background: linear-gradient(135deg, #10b981, #059669);
    color: white;
}

.toast-info {
    border-color: #06b6d4;
}

.toast-info .toast-icon {
    background: linear-gradient(135deg, #06b6d4, #0891b2);
    color: white;
}

.toast-danger {
    border-color: #dc2626;
}

.toast-danger .toast-icon {
    background: linear-gradient(135deg, #dc2626, #b91c1c);
    color: white;
}

.toast-message {
    font-weight: 600 !important;
    color: #1f2937 !important;
    flex: 1;
    font-size: 0.95rem !important;
    line-height: 1.4;
    text-shadow: none !important;
}

/* Force text color for all toast messages */
.remove-favorite-toast .toast-message,
.remove-favorite-toast .toast-content,
.remove-favorite-toast .toast-content span {
    color: #1f2937 !important;
}

/* Ensure no white text inheritance */
.remove-favorite-toast * {
    color: inherit !important;
}

.remove-favorite-toast .toast-content {
    color: #1f2937 !important;
}

/* Enhanced favorite button animations */
.favorite-btn {
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
}

.favorite-btn:hover {
    transform: scale(1.1) rotate(5deg);
    box-shadow: 0 6px 20px -5px rgba(220, 38, 38, 0.4);
}

.favorite-btn:active {
    transform: scale(0.95);
}

/* Category Section Styling */
.category-section {
    margin-bottom: 2rem;
}

.category-header h5 {
    color: #1f2937;
    font-size: 1.25rem;
}

.category-header .border-bottom {
    border-color: #e5e7eb !important;
}

.category-equipment-card {
    border-radius: 0.75rem !important;
    overflow: hidden;
    transition: all 0.3s ease;
    border: 1px solid #e5e7eb;
}

.category-equipment-card:hover {
    transform: translateY(-3px);
    box-shadow: 0 12px 30px -5px rgba(0, 0, 0, 0.15) !important;
    border-color: #d1d5db;
}

.category-image-wrapper {
    height: 100%;
    min-height: 180px;
    overflow: hidden;
    background: #f3f4f6;
    display: flex;
    align-items: center;
    justify-content: center;
}

.category-equipment-image {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: transform 0.3s ease;
}

.category-equipment-card:hover .category-equipment-image {
    transform: scale(1.05);
}

.category-equipment-card .card-body {
    display: flex;
    flex-direction: column;
    justify-content: space-between;
}

.category-equipment-card .card-title {
    color: #1f2937;
    font-size: 1.1rem;
}

.category-equipment-card .badge {
    font-size: 0.75rem;
    padding: 0.35rem 0.75rem;
}

.category-equipment-card .btn-sm {
    padding: 0.5rem 1rem;
    font-size: 0.875rem;
    border-radius: 0.5rem;
}

.category-equipment-card .btn-danger {
    padding: 0.5rem 0.75rem;
}

/* Responsive Category Cards */
@media (max-width: 768px) {
    .category-image-wrapper {
        min-height: 200px;
    }
    
    .category-equipment-card .card-body {
        padding: 1.5rem !important;
    }
    
    .category-equipment-card .d-flex.gap-2 {
        flex-direction: column;
        width: 100%;
    }
    
    .category-equipment-card .btn-sm {
        width: 100%;
    }
}

/* Parcourir Button Styling */
#browseEquipmentBtn {
    background: linear-gradient(135deg, #ffffff, #f8fafc);
    border: 2px solid #3b82f6;
    color: #3b82f6;
    font-weight: 500;
    transition: all 0.3s ease;
    box-shadow: 0 2px 4px rgba(59, 130, 246, 0.1);
}

#browseEquipmentBtn:hover {
    background: linear-gradient(135deg, #3b82f6, #2563eb);
    border-color: #2563eb;
    color: white;
    transform: translateY(-2px);
    box-shadow: 0 6px 16px rgba(59, 130, 246, 0.25);
}

#browseEquipmentBtn:active {
    transform: translateY(0);
    box-shadow: 0 2px 4px rgba(59, 130, 246, 0.1);
}

#browseEquipmentBtn i {
    transition: transform 0.3s ease;
}

#browseEquipmentBtn:hover i {
    transform: scale(1.1);
}

/* Category Filter Button Styling */
#categoryFilterBtn {
    background: linear-gradient(135deg, #ffffff, #f8fafc);
    border: 2px solid #6b7280;
    color: #6b7280;
    font-weight: 500;
    transition: all 0.3s ease;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.05);
}

#categoryFilterBtn:hover {
    background: linear-gradient(135deg, #f3f4f6, #e5e7eb);
    border-color: #374151;
    color: #374151;
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

#categoryFilterBtn:active {
    transform: translateY(0);
}

/* Dropdown Menu Styling */
.category-dropdown {
    border-radius: 1rem !important;
    border: 1px solid #e5e7eb !important;
    padding: 0.75rem !important;
    min-width: 240px !important;
    box-shadow: 0 10px 40px rgba(0, 0, 0, 0.12) !important;
    margin-top: 0.5rem !important;
    background: #ffffff !important;
}

.category-dropdown .dropdown-item {
    padding: 0.875rem 1rem !important;
    border-radius: 0.625rem !important;
    transition: all 0.25s ease !important;
    font-size: 0.9375rem !important;
    color: #374151 !important;
    margin-bottom: 0.375rem !important;
    display: flex !important;
    align-items: center !important;
    font-weight: 500 !important;
}

.category-dropdown .dropdown-item:last-child {
    margin-bottom: 0 !important;
}

.category-dropdown .dropdown-item span {
    color: inherit !important;
}

.category-dropdown .dropdown-item i {
    font-size: 1.125rem !important;
    flex-shrink: 0 !important;
}

.category-dropdown .dropdown-item:hover {
    background: linear-gradient(135deg, #f3f4f6, #e5e7eb) !important;
    color: #1f2937 !important;
    transform: translateX(4px) !important;
}

.category-dropdown .dropdown-item.active {
    background: linear-gradient(135deg, #eff6ff, #dbeafe) !important;
    color: #1e40af !important;
    font-weight: 600 !important;
    border-left: 3px solid #3b82f6 !important;
    padding-left: calc(1rem - 3px) !important;
}

.category-dropdown .dropdown-item.active:hover {
    background: linear-gradient(135deg, #dbeafe, #bfdbfe) !important;
    color: #1e40af !important;
    transform: translateX(2px) !important;
}

.category-dropdown .dropdown-item.active i {
    color: #3b82f6 !important;
}

.category-dropdown .dropdown-divider {
    margin: 0.75rem 0 !important;
    border-color: #e5e7eb !important;
    opacity: 1 !important;
}
</style>

<%@ include file="../../layouts/footer.jsp" %>


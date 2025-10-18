<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setAttribute("pageTitle", "Mon Matériel - YOURS");
%>

<%@ include file="../../layouts/header.jsp" %>
<%@ include file="../../layouts/navbar.jsp" %>

<style>
/* Equipment Cards Styling */
.card-equipment {
    border: none !important;
    border-radius: 1rem !important;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.06) !important;
    transition: all 0.3s ease !important;
    overflow: hidden !important;
}

.card-equipment:hover {
    transform: translateY(-4px) !important;
    box-shadow: 0 8px 25px rgba(0, 0, 0, 0.15) !important;
}

.card-equipment .equipment-image-container {
    height: 250px !important;
    border-radius: 1rem 1rem 0 0 !important;
    transition: transform 0.3s ease !important;
}

.card-equipment:hover .equipment-image-container {
    transform: scale(1.02) !important;
}

.availability-badge {
    position: absolute !important;
    top: 1rem !important;
    right: 1rem !important;
    background: rgba(16, 185, 129, 0.9) !important;
    color: white !important;
    padding: 0.25rem 0.75rem !important;
    border-radius: 0.5rem !important;
    font-size: 0.75rem !important;
    font-weight: 600 !important;
    backdrop-filter: blur(10px) !important;
}

.price-badge {
    position: absolute !important;
    bottom: 1rem !important;
    left: 1rem !important;
    background: rgba(0, 0, 0, 0.8) !important;
    color: white !important;
    padding: 0.375rem 0.75rem !important;
    border-radius: 0.5rem !important;
    font-size: 0.875rem !important;
    font-weight: 700 !important;
    backdrop-filter: blur(10px) !important;
}

.card-equipment .card-body {
    padding: 1.5rem !important;
    display: flex !important;
    flex-direction: column !important;
    justify-content: space-between !important;
}

.card-equipment .card-title {
    font-size: 1.125rem !important;
    font-weight: 700 !important;
    color: var(--gray-900) !important;
    margin-bottom: 0.5rem !important;
    line-height: 1.3 !important;
}

.card-equipment .card-text {
    font-size: 0.9375rem !important;
    line-height: 1.6 !important;
    color: var(--gray-600) !important;
    margin-bottom: 1rem !important;
}

.rating {
    display: flex !important;
    align-items: center !important;
    gap: 0.125rem !important;
}

/* Pagination Styling */
.pagination-modern .page-link {
    border: none !important;
    color: var(--gray-600) !important;
    padding: 0.75rem 1rem !important;
    margin: 0 0.25rem !important;
    border-radius: 0.5rem !important;
    transition: all 0.3s ease !important;
    font-weight: 500 !important;
}

.pagination-modern .page-link:hover {
    background: var(--primary-50) !important;
    color: var(--primary-600) !important;
    transform: translateY(-1px) !important;
}

.pagination-modern .page-item.active .page-link {
    background: linear-gradient(135deg, var(--primary-600), var(--primary-700)) !important;
    color: white !important;
    box-shadow: 0 4px 12px rgba(37, 99, 235, 0.3) !important;
}

.pagination-modern .page-item.disabled .page-link {
    color: var(--gray-400) !important;
    cursor: not-allowed !important;
}

/* Search and Filter Enhancements */
.form-control:focus,
.form-select:focus {
    border-color: var(--primary-500) !important;
    box-shadow: 0 0 0 4px rgba(37, 99, 235, 0.1) !important;
}

/* Equipment Image Placeholder */
.equipment-image-container {
    height: 250px !important;
    border-radius: 1rem 1rem 0 0 !important;
    overflow: hidden !important;
}

.equipment-placeholder {
    width: 100% !important;
    height: 100% !important;
    background: linear-gradient(135deg, #fbbf24, #f59e0b) !important;
    display: flex !important;
    align-items: center !important;
    justify-content: center !important;
    border-radius: 1rem 1rem 0 0 !important;
    transition: all 0.3s ease !important;
}

.equipment-placeholder i {
    font-size: 4rem !important;
    color: white !important;
    text-shadow: 0 2px 4px rgba(0, 0, 0, 0.2) !important;
    transition: transform 0.3s ease !important;
}

.card-equipment:hover .equipment-placeholder {
    background: linear-gradient(135deg, #f59e0b, #d97706) !important;
}

.card-equipment:hover .equipment-placeholder i {
    transform: scale(1.1) !important;
}

/* Animation for slide down */
@keyframes slideDown {
    from {
        opacity: 0;
        transform: translateY(-10px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}
</style>

<!-- Page Header -->
<section class="py-5" style="background: linear-gradient(135deg, #1e40af 0%, #1e3a8a 50%, #1e293b 100%); margin-top: -80px; padding-top: calc(80px + 6rem) !important; padding-bottom: 6rem !important; min-height: 400px; position: relative; overflow: hidden;">
    <div style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; background: radial-gradient(circle at 20% 50%, rgba(59, 130, 246, 0.15) 0%, transparent 50%); opacity: 1;"></div>
    <div class="container" style="position: relative; z-index: 2;">
        <div class="row">
            <div class="col-lg-10 mx-auto text-center">
                <!-- Badge -->
                <div class="d-inline-flex align-items-center mb-4" style="background: rgba(255, 255, 255, 0.15); backdrop-filter: blur(20px); border-radius: 50px; padding: 0.75rem 1.5rem; border: 1px solid rgba(255, 255, 255, 0.2); box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);">
                    <i class="fas fa-boxes me-2" style="color: #fbbf24; font-size: 1rem;"></i>
                    <span style="color: white; font-weight: 600; font-size: 0.875rem; letter-spacing: 0.5px;">GESTION DU MATÉRIEL</span>
                </div>
                
                <!-- Main Title -->
                <h1 class="display-2 fw-bold mb-4" style="color: white; text-shadow: 0 4px 20px rgba(0,0,0,0.3); letter-spacing: -0.03em; line-height: 1.1;">
                    Mon <span style="background: linear-gradient(135deg, #fbbf24, #f59e0b); background-clip: text; -webkit-background-clip: text; -webkit-text-fill-color: transparent;">Matériel</span>
                </h1>
                
                <!-- Subtitle -->
                <div class="mb-4" style="max-width: 700px; margin: 0 auto;">
                    <p class="lead mb-2" style="color: rgba(255, 255, 255, 0.95); font-size: 1.375rem; font-weight: 400; line-height: 1.6; letter-spacing: -0.01em;">
                        Gérez vos équipements et leur disponibilité
                    </p>
                    <p class="mb-0" style="color: rgba(255, 255, 255, 0.8); font-size: 1.1rem; font-weight: 300; line-height: 1.7;">
                        Ajoutez du matériel • Modifiez les prix • Suivez les réservations
                    </p>
                </div>
                
                <!-- Decorative Elements -->
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
                <!-- Main Search Bar -->
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
                                <input type="text" id="searchInput" class="form-control" placeholder="Rechercher par nom, marque, modèle..." 
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
                                Catégorie
                            </label>
                            <select class="form-select" id="categoryFilter" style="border-radius: 0.875rem; border: 2px solid var(--gray-200); height: 48px; font-size: 0.9375rem; transition: all 0.3s ease; background: white;">
                                <option value="" selected>Toutes catégories</option>
                                <option value="photo">Photographie</option>
                                <option value="video">Vidéo</option>
                                <option value="info">Informatique</option>
                                <option value="audio">Audio</option>
                                <option value="gaming">Gaming</option>
                                <option value="light">Éclairage</option>
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
                                <option value="price-desc">Prix décroissant</option>
                                <option value="availability">Disponibilité</option>
                            </select>
                        </div>
                        
                        <!-- Add Equipment Button -->
                        <div class="col-lg-1">
                            <label class="form-label mb-2" style="font-size: 0.875rem; opacity: 0;">_</label>
                            <button onclick="showAddEquipmentModal()" class="btn w-100" style="background: linear-gradient(135deg, var(--primary-600), var(--primary-700)); color: white; border: none; border-radius: 0.875rem; height: 48px; box-shadow: 0 4px 12px -2px rgba(37, 99, 235, 0.4); transition: all 0.3s ease;" title="Ajouter du matériel">
                                <i class="fas fa-plus"></i>
                            </button>
                        </div>
                    </div>
                </div>
                
                <!-- Results Bar & Quick Filters -->
                <div class="d-flex flex-wrap justify-content-between align-items-center gap-3 mb-4">
                    <!-- Results Count -->
                    <div class="d-flex align-items-center" style="background: white; padding: 0.625rem 1.125rem; border-radius: 0.75rem; border: 1px solid var(--gray-200); box-shadow: 0 1px 3px rgba(0,0,0,0.05);">
                        <i class="fas fa-box-open me-2" style="color: var(--primary-600); font-size: 0.875rem;"></i>
                        <span style="font-weight: 600; color: var(--gray-900); font-size: 0.9375rem;" id="equipmentCount">0</span>
                        <span style="color: var(--gray-500); font-size: 0.875rem; margin-left: 0.375rem;">équipements trouvés</span>
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
            <div class="row g-4" id="equipmentGrid">
                <!-- Equipment items will be populated here -->
            </div>

            <!-- Empty State -->
            <div id="emptyState" class="text-center py-5" style="display: none;">
                <i class="fas fa-boxes fa-3x text-muted mb-3"></i>
                <h4 class="text-muted">Aucun matériel trouvé</h4>
                <p class="text-muted">Commencez par ajouter votre premier équipement</p>
                <button class="btn btn-primary" onclick="showAddEquipmentModal()">
                    <i class="fas fa-plus me-2"></i>Ajouter du matériel
                </button>
            </div>

            <!-- Pagination -->
            <div class="text-center mt-5 pt-4">
                <nav aria-label="Equipment pagination">
                    <ul class="pagination pagination-modern justify-content-center">
                        <li class="page-item disabled">
                            <a class="page-link" href="#" tabindex="-1" aria-disabled="true">
                                <i class="fas fa-chevron-left me-1"></i>Précédent
                            </a>
                        </li>
                        <li class="page-item active" aria-current="page">
                            <a class="page-link" href="#">1</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">2</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">3</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">4</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">
                                Suivant<i class="fas fa-chevron-right ms-1"></i>
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>

<!-- Add/Edit Equipment Modal -->
<div class="modal fade" id="equipmentModal" tabindex="-1">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content border-0 shadow-lg">
            <div class="modal-header bg-primary text-white border-0">
                <h5 class="modal-title fw-bold">
                    <i class="fas fa-box me-2"></i><span id="modalTitle">Ajouter du matériel</span>
                </h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body p-4">
                <form id="equipmentForm">
                    <input type="hidden" id="equipmentId">
                    
                    <div class="row">
                        <div class="col-md-8 mb-3">
                            <label class="form-label fw-semibold">Nom du matériel *</label>
                            <input type="text" class="form-control form-control-lg" id="equipmentName" required>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label class="form-label fw-semibold">Prix/jour (MAD) *</label>
                            <input type="number" class="form-control form-control-lg" id="equipmentPrice" required>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label fw-semibold">Catégorie *</label>
                            <select class="form-select form-select-lg" id="equipmentCategory" required>
                                <option value="">Sélectionner une catégorie</option>
                                <option value="1">Photographie</option>
                                <option value="2">Vidéo</option>
                                <option value="3">Audio</option>
                                <option value="4">Informatique</option>
                                <option value="5">Gaming</option>
                                <option value="6">Éclairage</option>
                            </select>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label fw-semibold">Disponibilité *</label>
                            <select class="form-select form-select-lg" id="equipmentStatus" required>
                                <option value="true">Disponible</option>
                                <option value="false">Non disponible</option>
                            </select>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-semibold">Description</label>
                        <textarea class="form-control" id="equipmentDescription" rows="3" placeholder="Décrivez votre matériel..."></textarea>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-semibold">Photos du matériel</label>
                        <input type="file" class="form-control" id="equipmentPhotos" multiple accept="image/*">
                        <small class="text-muted">Vous pouvez sélectionner plusieurs images</small>
                    </div>
                </form>
            </div>
            <div class="modal-footer border-0 bg-light">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
                <button type="button" class="btn btn-primary" onclick="saveEquipment()">
                    <i class="fas fa-save me-2"></i>Enregistrer
                </button>
            </div>
        </div>
    </div>
</div>

<script>
let equipmentModal;

document.addEventListener('DOMContentLoaded', function() {
    equipmentModal = new bootstrap.Modal(document.getElementById('equipmentModal'));
    loadEquipment();
    
    // Search functionality
    const searchInput = document.getElementById('searchInput');
    const clearSearchBtn = document.getElementById('clearSearch');
    const categoryFilter = document.getElementById('categoryFilter');
    const sortFilter = document.getElementById('sortFilter');
    
    // Show/hide clear button
    if (searchInput && clearSearchBtn) {
        searchInput.addEventListener('input', function() {
            if (this.value.length > 0) {
                clearSearchBtn.classList.remove('d-none');
            } else {
                clearSearchBtn.classList.add('d-none');
            }
            filterEquipment();
        });
        
        clearSearchBtn.addEventListener('click', function() {
            searchInput.value = '';
            clearSearchBtn.classList.add('d-none');
            searchInput.focus();
            filterEquipment();
        });
    }
    
    // Enhanced focus effects for inputs
    const formControls = [searchInput, categoryFilter, sortFilter];
    formControls.forEach(control => {
        if (control) {
            control.addEventListener('focus', function() {
                this.style.borderColor = 'var(--primary-500)';
                this.style.boxShadow = '0 0 0 4px rgba(37, 99, 235, 0.1)';
            });
            
            control.addEventListener('blur', function() {
                this.style.borderColor = 'var(--gray-200)';
                this.style.boxShadow = 'none';
            });
        }
    });
    
    // Filter change events
    if (categoryFilter) categoryFilter.addEventListener('change', filterEquipment);
    if (sortFilter) sortFilter.addEventListener('change', filterEquipment);
    
    // View toggle buttons
    const viewToggleBtns = document.querySelectorAll('.view-toggle-btn');
    const equipmentGrid = document.getElementById('equipmentGrid');
    
    // Add hover effects
    viewToggleBtns.forEach(btn => {
        btn.addEventListener('mouseenter', function() {
            if (!this.classList.contains('active')) {
                this.style.background = 'var(--gray-50)';
                this.style.color = 'var(--gray-700)';
            }
        });
        
        btn.addEventListener('mouseleave', function() {
            if (!this.classList.contains('active')) {
                this.style.background = 'transparent';
                this.style.color = 'var(--gray-500)';
            }
        });
    });
    
    viewToggleBtns.forEach(btn => {
        btn.addEventListener('click', function() {
            const viewType = this.getAttribute('data-view');
            
            // Remove active state from all buttons
            viewToggleBtns.forEach(b => {
                b.classList.remove('active');
                b.style.background = 'transparent';
                b.style.color = 'var(--gray-500)';
                b.style.boxShadow = 'none';
            });
            
            // Add active state to clicked button
            this.classList.add('active');
            this.style.background = 'linear-gradient(135deg, var(--primary-600), var(--primary-700))';
            this.style.color = 'white';
            this.style.boxShadow = '0 2px 8px rgba(37, 99, 235, 0.3)';
            
            // Update grid layout
            const cardColumns = equipmentGrid.querySelectorAll('[class*="col-"]');
            const equipmentCards = equipmentGrid.querySelectorAll('.card');
            
            if (viewType === 'list') {
                // List view - horizontal card layout
                cardColumns.forEach(card => {
                    card.className = 'col-12';
                });
                
                equipmentCards.forEach(card => {
                    // Change card to horizontal layout
                    card.style.flexDirection = 'row';
                    card.style.maxHeight = 'none';
                    card.style.height = '200px';
                    card.style.alignItems = 'stretch';
                    card.style.boxShadow = '0 4px 12px rgba(0, 0, 0, 0.08)';
                    card.style.transition = 'all 0.3s ease';
                    
                    const imgContainer = card.querySelector('.equipment-image-container');
                    const cardBody = card.querySelector('.card-body');
                    const placeholder = card.querySelector('.equipment-placeholder');
                    
                    if (imgContainer) {
                        imgContainer.style.flex = '0 0 300px';
                        imgContainer.style.maxWidth = '300px';
                        imgContainer.style.height = '100%';
                        imgContainer.style.overflow = 'hidden';
                        imgContainer.style.display = 'flex';
                        imgContainer.style.alignItems = 'center';
                        imgContainer.style.justifyContent = 'center';
                        imgContainer.style.borderRadius = '1rem 0 0 1rem';
                        
                        // Position badges for list view
                        const availabilityBadge = imgContainer.querySelector('.availability-badge');
                        const priceBadge = imgContainer.querySelector('.price-badge');
                        if (availabilityBadge) {
                            availabilityBadge.style.top = '0.75rem';
                            availabilityBadge.style.left = '0.75rem';
                            availabilityBadge.style.right = 'auto';
                            availabilityBadge.style.fontSize = '0.7rem';
                        }
                        if (priceBadge) {
                            priceBadge.style.bottom = '0.75rem';
                            priceBadge.style.left = '0.75rem';
                            priceBadge.style.right = 'auto';
                            priceBadge.style.fontSize = '0.7rem';
                            priceBadge.style.fontWeight = '600';
                        }
                    }
                    
                    if (placeholder) {
                        placeholder.style.width = '100%';
                        placeholder.style.height = '100%';
                        placeholder.style.borderRadius = '1rem 0 0 1rem';
                        placeholder.style.transition = 'transform 0.3s ease';
                    }
                    
                    if (cardBody) {
                        cardBody.style.flex = '1';
                        cardBody.style.display = 'flex';
                        cardBody.style.flexDirection = 'column';
                        cardBody.style.justifyContent = 'space-between';
                        cardBody.style.padding = '1.5rem 2rem';
                    }
                });
                
                equipmentGrid.classList.remove('g-4');
                equipmentGrid.classList.add('g-3');
            } else {
                // Grid view - vertical card layout
                cardColumns.forEach(card => {
                    card.className = 'col-lg-4 col-md-6';
                });
                
                equipmentCards.forEach(card => {
                    // Reset to vertical layout
                    card.style.flexDirection = 'column';
                    card.style.maxHeight = 'none';
                    card.style.height = '100%';
                    card.style.alignItems = 'stretch';
                    card.style.boxShadow = '0 2px 8px rgba(0, 0, 0, 0.06)';
                    card.style.transition = 'all 0.3s ease';
                    
                    const imgContainer = card.querySelector('.equipment-image-container');
                    const cardBody = card.querySelector('.card-body');
                    const placeholder = card.querySelector('.equipment-placeholder');
                    
                    if (imgContainer) {
                        imgContainer.style.flex = 'none';
                        imgContainer.style.maxWidth = 'none';
                        imgContainer.style.height = '250px';
                        imgContainer.style.overflow = 'hidden';
                        imgContainer.style.display = 'block';
                        imgContainer.style.alignItems = 'initial';
                        imgContainer.style.justifyContent = 'initial';
                        imgContainer.style.borderRadius = '1rem 1rem 0 0';
                        
                        // Reset badges position for grid view
                        const availabilityBadge = imgContainer.querySelector('.availability-badge');
                        const priceBadge = imgContainer.querySelector('.price-badge');
                        if (availabilityBadge) {
                            availabilityBadge.style.top = '1rem';
                            availabilityBadge.style.left = 'auto';
                            availabilityBadge.style.right = '1rem';
                            availabilityBadge.style.fontSize = '';
                        }
                        if (priceBadge) {
                            priceBadge.style.bottom = '1rem';
                            priceBadge.style.left = '1rem';
                            priceBadge.style.right = 'auto';
                            priceBadge.style.fontSize = '';
                            priceBadge.style.fontWeight = '';
                        }
                    }
                    
                    if (placeholder) {
                        placeholder.style.width = '100%';
                        placeholder.style.height = '250px';
                        placeholder.style.borderRadius = '1rem 1rem 0 0';
                        placeholder.style.transition = 'transform 0.3s ease';
                    }
                    
                    if (cardBody) {
                        cardBody.style.flex = '1';
                        cardBody.style.display = 'flex';
                        cardBody.style.flexDirection = 'column';
                        cardBody.style.justifyContent = 'space-between';
                        cardBody.style.padding = '1.5rem';
                    }
                });
                
                equipmentGrid.classList.remove('g-3');
                equipmentGrid.classList.add('g-4');
            }
        });
    });
});

function loadEquipment() {
    // Mock data - replace with actual API call
    const equipment = [
        {
            id: 1,
            name: 'Canon EOS R5',
            price: 240,
            category: 'Photographie',
            status: 'available',
            image: 'https://images.unsplash.com/photo-1502920917128-1aa500764cbd?w=400',
            bookings: 12,
            revenue: 2880,
            rating: 4.9
        },
        {
            id: 2,
            name: 'MacBook Pro 16"',
            price: 150,
            category: 'Informatique',
            status: 'rented',
            image: 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=400',
            bookings: 8,
            revenue: 1200,
            rating: 4.8
        },
        {
            id: 3,
            name: 'Sony A7 III',
            price: 175,
            category: 'Photographie',
            status: 'available',
            image: 'https://images.unsplash.com/photo-1606980624725-9502fde6e4e3?w=400',
            bookings: 15,
            revenue: 2625,
            rating: 4.7
        },
        {
            id: 4,
            name: 'iPad Pro 12.9"',
            price: 75,
            category: 'Informatique',
            status: 'available',
            image: 'https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0?w=400',
            bookings: 20,
            revenue: 1500,
            rating: 5.0
        },
        {
            id: 5,
            name: 'DJI Mavic Air 2',
            price: 120,
            category: 'Vidéo',
            status: 'available',
            image: 'https://images.unsplash.com/photo-1473968512647-3e447244af8f?w=400',
            bookings: 10,
            revenue: 1200,
            rating: 4.6
        },
        {
            id: 6,
            name: 'Rode PodMic',
            price: 30,
            category: 'Audio',
            status: 'available',
            image: 'https://images.unsplash.com/photo-1598300042247-d088f8ab3a91?w=400',
            bookings: 25,
            revenue: 750,
            rating: 4.5
        }
    ];
    
    displayEquipment(equipment);
}

function displayEquipment(equipment) {
    const grid = document.getElementById('equipmentGrid');
    const emptyState = document.getElementById('emptyState');
    const equipmentCount = document.getElementById('equipmentCount');
    
    if (equipment.length === 0) {
        grid.style.display = 'none';
        emptyState.style.display = 'block';
        equipmentCount.textContent = '0';
        return;
    }
    
    grid.style.display = 'flex';
    emptyState.style.display = 'none';
    equipmentCount.textContent = equipment.length;
    
    grid.innerHTML = equipment.map(item => {
        let statusClass, statusText;
        if (item.status === 'available') {
            statusClass = 'bg-success';
            statusText = 'Disponible';
        } else if (item.status === 'rented') {
            statusClass = 'bg-warning';
            statusText = 'Loué';
        } else {
            statusClass = 'bg-secondary';
            statusText = 'Maintenance';
        }
        
        // Generate star rating
        const stars = Array.from({length: 5}, (_, i) => {
            if (i < Math.floor(item.rating)) {
                return '<i class="fas fa-star" style="color: #fbbf24; font-size: 0.875rem;"></i>';
            } else if (i === Math.floor(item.rating) && item.rating % 1 !== 0) {
                return '<i class="fas fa-star-half-alt" style="color: #fbbf24; font-size: 0.875rem;"></i>';
            } else {
                return '<i class="far fa-star" style="color: #fbbf24; font-size: 0.875rem;"></i>';
            }
        }).join('');
        
        return '<div class="col-lg-4 col-md-6">' +
            '<div class="card card-modern card-equipment h-100">' +
                '<div class="position-relative equipment-image-container">' +
                    '<div class="equipment-placeholder">' +
                        '<i class="fas fa-headphones"></i>' +
                    '</div>' +
                    '<div class="availability-badge">' + statusText + '</div>' +
                    '<div class="price-badge">' + item.price + ' MAD/jour</div>' +
                '</div>' +
                '<div class="card-body">' +
                    '<div class="mb-2">' +
                        '<span class="badge" style="background: linear-gradient(135deg, rgba(37, 99, 235, 0.1), rgba(37, 99, 235, 0.2)); color: var(--primary-600); font-size: 0.75rem; padding: 0.375rem 0.75rem; border-radius: 0.5rem; font-weight: 600;">' +
                            '<i class="fas fa-tag me-1"></i>' + item.category +
                        '</span>' +
                    '</div>' +
                    '<h5 class="card-title mb-2">' + item.name + '</h5>' +
                    '<p class="card-text text-muted mb-3" style="font-size: 0.9375rem; line-height: 1.6;">Équipement professionnel de qualité</p>' +
                    '<div class="d-flex align-items-center mb-3">' +
                        '<div class="rating me-2">' + stars + '</div>' +
                        '<small class="text-muted">(' + item.rating + ')</small>' +
                    '</div>' +
                    '<div class="d-flex gap-2 align-items-stretch">' +
                        '<button class="btn btn-sm btn-outline-primary flex-fill" onclick="editEquipment(' + item.id + ')">' +
                            '<i class="fas fa-edit me-1"></i>Modifier' +
                        '</button>' +
                        '<button class="btn btn-sm btn-outline-danger" onclick="deleteEquipment(' + item.id + ')">' +
                            '<i class="fas fa-trash"></i>' +
                        '</button>' +
                    '</div>' +
                '</div>' +
            '</div>' +
        '</div>';
    }).join('');
}

function showAddEquipmentModal() {
    document.getElementById('modalTitle').textContent = 'Ajouter du matériel';
    document.getElementById('equipmentForm').reset();
    document.getElementById('equipmentId').value = '';
    equipmentModal.show();
}

function editEquipment(id) {
    document.getElementById('modalTitle').textContent = 'Modifier le matériel';
    // Load equipment data - replace with actual API call
    document.getElementById('equipmentId').value = id;
    equipmentModal.show();
}

function saveEquipment() {
    const form = document.getElementById('equipmentForm');
    if (form.checkValidity()) {
        // Save equipment - replace with actual API call
        console.log('Saving equipment...');
        equipmentModal.hide();
        loadEquipment();
    } else {
        form.reportValidity();
    }
}

function deleteEquipment(id) {
    if (confirm('Êtes-vous sûr de vouloir supprimer cet équipement ?')) {
        // Delete equipment - replace with actual API call
        console.log('Deleting equipment:', id);
        loadEquipment();
    }
}

function filterEquipment() {
    // Implement filtering logic
    loadEquipment();
}
</script>

<%@ include file="../../layouts/footer.jsp" %>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Get equipment ID from URL parameter
    String equipmentId = request.getParameter("id");
    request.setAttribute("pageTitle", "Détails du matériel - YOURS");
%>

<%@ include file="../../layouts/header.jsp" %>
<%@ include file="../../layouts/navbar.jsp" %>

<!-- Breadcrumb -->
<div class="container py-3">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb breadcrumb-custom">
            <li class="breadcrumb-item">
                <a href="${pageContext.request.contextPath}/" class="text-decoration-none">
                    <i class="bi bi-house me-1"></i>Accueil
                </a>
            </li>
            <li class="breadcrumb-item">
                <a href="${pageContext.request.contextPath}/pages/equipment/list.jsp" class="text-decoration-none">
                    Matériel
                </a>
            </li>
            <li class="breadcrumb-item active" id="equipmentBreadcrumb">Chargement...</li>
        </ol>
    </nav>
</div>

<div class="container py-4">
    <!-- Loading State -->
    <div id="loadingState" class="text-center py-5">
        <div class="spinner-border text-primary" role="status">
            <span class="visually-hidden">Chargement...</span>
        </div>
        <p class="text-muted mt-2">Chargement des détails...</p>
    </div>

    <!-- Equipment Not Found -->
    <div id="notFoundState" class="empty-state d-none">
        <div class="empty-icon">
            <i class="bi bi-exclamation-triangle"></i>
        </div>
        <h3 class="empty-title">Équipement non trouvé</h3>
        <p class="empty-description">
            L'équipement que vous recherchez n'existe pas ou n'est plus disponible.
        </p>
        <a href="${pageContext.request.contextPath}/pages/equipment/list.jsp" class="btn btn-primary">
            <i class="bi bi-arrow-left me-2"></i>Retour au catalogue
        </a>
    </div>

    <!-- Equipment Detail Content -->
    <div id="equipmentDetail" class="d-none">
        <div class="row">
            <!-- Image Gallery -->
            <div class="col-lg-6 mb-4">
                <div class="equipment-detail-images">
                    <!-- Main Image -->
                    <div class="main-image-container mb-3">
                        <img id="mainImage" src="" alt="" class="img-fluid rounded-custom shadow-custom">
                        <button class="btn btn-light position-absolute top-0 end-0 m-3" 
                                onclick="openImageModal()" title="Agrandir">
                            <i class="bi bi-arrows-fullscreen"></i>
                        </button>
                    </div>
                    
                    <!-- Thumbnail Gallery -->
                    <div class="thumbnail-gallery" id="thumbnailGallery">
                        <!-- Thumbnails will be loaded here -->
                    </div>
                </div>
            </div>

            <!-- Equipment Information -->
            <div class="col-lg-6">
                <div class="equipment-info">
                    <!-- Header -->
                    <div class="mb-4">
                        <div class="d-flex align-items-center mb-2">
                            <span id="equipmentCategory" class="badge bg-primary me-2"></span>
                            <div id="availabilityBadge" class="availability-badge"></div>
                        </div>
                        <h1 id="equipmentName" class="fw-bold mb-2"></h1>
                        <p id="equipmentDescription" class="text-muted lead"></p>
                    </div>

                    <!-- Price -->
                    <div class="price-section mb-4">
                        <div class="d-flex align-items-center">
                            <div class="equipment-price me-3" id="equipmentPrice"></div>
                            <small class="text-muted">par jour</small>
                        </div>
                        <small class="text-muted">
                            <i class="bi bi-info-circle me-1"></i>
                            Prix dégressifs pour les locations longues
                        </small>
                    </div>

                    <!-- Partner Information -->
                    <div class="partner-info card mb-4">
                        <div class="card-body">
                            <h6 class="fw-bold mb-2">
                                <i class="bi bi-shop me-2"></i>Proposé par
                            </h6>
                            <div class="d-flex align-items-center">
                                <div class="flex-grow-1">
                                    <h6 id="partnerName" class="mb-1"></h6>
                                    <div class="d-flex align-items-center">
                                        <div id="partnerRating" class="me-2"></div>
                                        <small class="text-muted" id="partnerRatingText"></small>
                                    </div>
                                </div>
                                <button class="btn btn-outline-primary btn-sm" onclick="contactPartner()">
                                    <i class="bi bi-chat-dots me-1"></i>Contacter
                                </button>
                            </div>
                        </div>
                    </div>

                    <!-- Quick Booking -->
                    <div class="booking-section card mb-4">
                        <div class="card-body">
                            <h6 class="fw-bold mb-3">
                                <i class="bi bi-calendar-check me-2"></i>Réservation rapide
                            </h6>
                            <form id="quickBookingForm">
                                <div class="row g-3">
                                    <div class="col-md-6">
                                        <label for="startDate" class="form-label">Date de début</label>
                                        <input type="date" class="form-control start-date" id="startDate" required>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="endDate" class="form-label">Date de fin</label>
                                        <input type="date" class="form-control end-date" id="endDate" required>
                                    </div>
                                    <div class="col-12">
                                        <div class="booking-summary p-3 bg-light rounded">
                                            <div class="d-flex justify-content-between">
                                                <span>Durée:</span>
                                                <span id="rentalDuration">-</span>
                                            </div>
                                            <div class="d-flex justify-content-between">
                                                <span>Prix par jour:</span>
                                                <span id="dailyPrice">-</span>
                                            </div>
                                            <hr>
                                            <div class="d-flex justify-content-between fw-bold">
                                                <span>Total:</span>
                                                <span id="totalPrice">-</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <button type="submit" class="btn btn-primary btn-lg w-100" id="bookingBtn">
                                            <i class="bi bi-calendar-plus me-2"></i>Réserver maintenant
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                    <!-- Share & Wishlist -->
                    <div class="d-flex gap-2">
                        <button class="btn btn-outline-secondary flex-fill" onclick="addToWishlist()">
                            <i class="bi bi-heart me-2"></i>Favoris
                        </button>
                        <button class="btn btn-outline-secondary flex-fill" onclick="shareEquipment()">
                            <i class="bi bi-share me-2"></i>Partager
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Detailed Information Tabs -->
        <div class="row mt-5">
            <div class="col-12">
                <ul class="nav nav-tabs" id="equipmentTabs" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="specifications-tab" data-bs-toggle="tab" 
                                data-bs-target="#specifications" type="button" role="tab">
                            <i class="bi bi-list-check me-2"></i>Spécifications
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="reviews-tab" data-bs-toggle="tab" 
                                data-bs-target="#reviews" type="button" role="tab">
                            <i class="bi bi-star me-2"></i>Avis (12)
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="availability-tab" data-bs-toggle="tab" 
                                data-bs-target="#availability" type="button" role="tab">
                            <i class="bi bi-calendar me-2"></i>Disponibilité
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="ai-insights-tab" data-bs-toggle="tab" 
                                data-bs-target="#ai-insights" type="button" role="tab">
                            <i class="bi bi-robot me-2"></i>Insights IA
                        </button>
                    </li>
                </ul>
                
                <div class="tab-content" id="equipmentTabsContent">
                    <!-- Specifications Tab -->
                    <div class="tab-pane fade show active" id="specifications" role="tabpanel">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="fw-bold mb-3">Spécifications techniques</h5>
                                <div id="specificationsList">
                                    <!-- Specifications will be loaded here -->
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Reviews Tab -->
                    <div class="tab-pane fade" id="reviews" role="tabpanel">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="fw-bold mb-3">Avis clients</h5>
                                <div id="reviewsList">
                                    <!-- Reviews will be loaded here -->
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Availability Tab -->
                    <div class="tab-pane fade" id="availability" role="tabpanel">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="fw-bold mb-3">Calendrier de disponibilité</h5>
                                <div id="availabilityCalendar">
                                    <!-- Calendar will be loaded here -->
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- AI Insights Tab -->
                    <div class="tab-pane fade" id="ai-insights" role="tabpanel">
                        <div class="card">
                            <div class="card-body">
                                <h5 class="fw-bold mb-3">
                                    <i class="bi bi-robot me-2"></i>Analyses intelligentes
                                </h5>
                                <div id="aiInsights">
                                    <!-- AI insights will be loaded here -->
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Similar Equipment -->
        <div class="row mt-5">
            <div class="col-12">
                <h3 class="fw-bold mb-4">Équipements similaires</h3>
                <div class="row" id="similarEquipment">
                    <!-- Similar equipment will be loaded here -->
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Image Modal -->
<div class="modal fade" id="imageModal" tabindex="-1">
    <div class="modal-dialog modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="imageModalTitle">Images</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body text-center">
                <img id="modalImage" src="" alt="" class="img-fluid">
            </div>
        </div>
    </div>
</div>

<!-- Equipment Detail JavaScript -->
<script>
let currentEquipment = null;
let currentImageIndex = 0;

document.addEventListener('DOMContentLoaded', function() {
    // Get equipment ID from URL
    const urlParams = new URLSearchParams(window.location.search);
    const equipmentId = urlParams.get('id') || '<%= equipmentId %>';
    
    if (equipmentId) {
        loadEquipmentDetail(parseInt(equipmentId));
    } else {
        showNotFound();
    }
    
    // Setup form listeners
    setupFormListeners();
});

// Load equipment detail
function loadEquipmentDetail(equipmentId) {
    // Simulate API call
    setTimeout(() => {
        // Find equipment in mock data
        currentEquipment = MockDataUtils.getEquipmentById(equipmentId);
        
        if (currentEquipment) {
            displayEquipmentDetail();
            loadSimilarEquipment();
            loadAIInsights();
        } else {
            showNotFound();
        }
        
        // Hide loading state
        document.getElementById('loadingState').style.display = 'none';
    }, 1000);
}

// Display equipment detail
function displayEquipmentDetail() {
    // Update page title
    document.title = `${currentEquipment.nom} - YOURS`;
    
    // Update breadcrumb
    document.getElementById('equipmentBreadcrumb').textContent = currentEquipment.nom;
    
    // Basic information
    document.getElementById('equipmentName').textContent = currentEquipment.nom;
    document.getElementById('equipmentDescription').textContent = currentEquipment.description;
    document.getElementById('equipmentCategory').textContent = currentEquipment.categorie;
    document.getElementById('equipmentPrice').textContent = YOURS.formatCurrency(currentEquipment.prix);
    
    // Availability badge
    const availabilityBadge = document.getElementById('availabilityBadge');
    availabilityBadge.className = `availability-badge ${currentEquipment.disponibilite ? 'available' : 'rented'}`;
    availabilityBadge.textContent = currentEquipment.disponibilite ? 'Disponible' : 'Loué';
    
    // Partner information
    document.getElementById('partnerName').textContent = currentEquipment.partner.nom;
    document.getElementById('partnerRating').innerHTML = generateStars(currentEquipment.partner.rating);
    document.getElementById('partnerRatingText').textContent = `(${currentEquipment.partner.rating}/5)`;
    
    // Images
    displayImages();
    
    // Specifications
    displaySpecifications();
    
    // Reviews
    displayReviews();
    
    // Availability calendar
    displayAvailabilityCalendar();
    
    // Show detail content
    document.getElementById('equipmentDetail').classList.remove('d-none');
}

// Display images
function displayImages() {
    const mainImage = document.getElementById('mainImage');
    const thumbnailGallery = document.getElementById('thumbnailGallery');
    
    // Set main image
    mainImage.src = currentEquipment.images[0];
    mainImage.alt = currentEquipment.nom;
    
    // Generate thumbnails
    thumbnailGallery.innerHTML = currentEquipment.images.map((image, index) => `
        <img src="${image}" alt="${currentEquipment.nom} ${index + 1}" 
             class="thumbnail ${index === 0 ? 'active' : ''}" 
             onclick="changeMainImage(${index})"
             onerror="this.src='assets/images/placeholder-equipment.jpg'">
    `).join('');
}

// Change main image
function changeMainImage(index) {
    currentImageIndex = index;
    const mainImage = document.getElementById('mainImage');
    mainImage.src = currentEquipment.images[index];
    
    // Update thumbnail active state
    document.querySelectorAll('.thumbnail').forEach((thumb, i) => {
        thumb.classList.toggle('active', i === index);
    });
}

// Open image modal
function openImageModal() {
    const modal = new bootstrap.Modal(document.getElementById('imageModal'));
    const modalImage = document.getElementById('modalImage');
    const modalTitle = document.getElementById('imageModalTitle');
    
    modalImage.src = currentEquipment.images[currentImageIndex];
    modalTitle.textContent = `${currentEquipment.nom} - Image ${currentImageIndex + 1}`;
    
    modal.show();
}

// Display specifications
function displaySpecifications() {
    const container = document.getElementById('specificationsList');
    
    container.innerHTML = currentEquipment.specifications.map(spec => `
        <div class="d-flex align-items-center py-2 border-bottom">
            <i class="bi bi-check-circle text-success me-3"></i>
            <span>${spec}</span>
        </div>
    `).join('');
}

// Display reviews (mock data)
function displayReviews() {
    const container = document.getElementById('reviewsList');
    
    const mockReviews = [
        {
            user: "Ahmed B.",
            rating: 5,
            date: "2024-01-10",
            comment: "Excellent matériel, très bien entretenu. Le partenaire est professionnel et réactif."
        },
        {
            user: "Fatima A.",
            rating: 4,
            date: "2024-01-08",
            comment: "Bonne qualité d'image, parfait pour mon projet vidéo. Livraison rapide."
        },
        {
            user: "Mohamed K.",
            rating: 5,
            date: "2024-01-05",
            comment: "Matériel professionnel de qualité. Je recommande vivement !"
        }
    ];
    
    container.innerHTML = mockReviews.map(review => `
        <div class="review-item border-bottom py-3">
            <div class="d-flex justify-content-between align-items-center mb-2">
                <div class="d-flex align-items-center">
                    <strong class="me-3">${review.user}</strong>
                    <div class="me-2">${generateStars(review.rating)}</div>
                    <small class="text-muted">${YOURS.formatDate(review.date)}</small>
                </div>
            </div>
            <p class="mb-0">${review.comment}</p>
        </div>
    `).join('');
}

// Display availability calendar (simplified)
function displayAvailabilityCalendar() {
    const container = document.getElementById('availabilityCalendar');
    
    container.innerHTML = `
        <div class="alert alert-info">
            <i class="bi bi-info-circle me-2"></i>
            <strong>Disponibilité en temps réel</strong><br>
            Cet équipement est actuellement ${currentEquipment.disponibilite ? 'disponible' : 'loué'}. 
            Sélectionnez vos dates dans le formulaire de réservation pour vérifier la disponibilité.
        </div>
        <div class="row">
            <div class="col-md-6">
                <h6>Prochaines disponibilités:</h6>
                <ul class="list-unstyled">
                    <li class="mb-2">
                        <i class="bi bi-calendar-check text-success me-2"></i>
                        15 Jan - 20 Jan 2024
                    </li>
                    <li class="mb-2">
                        <i class="bi bi-calendar-check text-success me-2"></i>
                        25 Jan - 30 Jan 2024
                    </li>
                    <li class="mb-2">
                        <i class="bi bi-calendar-x text-danger me-2"></i>
                        01 Fév - 05 Fév 2024 (Réservé)
                    </li>
                </ul>
            </div>
            <div class="col-md-6">
                <h6>Périodes populaires:</h6>
                <ul class="list-unstyled">
                    <li class="mb-2">
                        <i class="bi bi-star text-warning me-2"></i>
                        Weekends (forte demande)
                    </li>
                    <li class="mb-2">
                        <i class="bi bi-star text-warning me-2"></i>
                        Vacances scolaires
                    </li>
                    <li class="mb-2">
                        <i class="bi bi-calendar-event text-info me-2"></i>
                        Événements spéciaux
                    </li>
                </ul>
            </div>
        </div>
    `;
}

// Load AI insights
function loadAIInsights() {
    const container = document.getElementById('aiInsights');
    
    // Simulate AI analysis
    setTimeout(() => {
        const insights = mockAIPredictions.equipmentAnalysis;
        
        container.innerHTML = `
            <div class="row">
                <div class="col-md-6">
                    <div class="card bg-light">
                        <div class="card-body text-center">
                            <h3 class="text-primary">${insights.utilizationRate}%</h3>
                            <p class="mb-0">Taux d'utilisation</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card bg-light">
                        <div class="card-body text-center">
                            <h3 class="text-success">${insights.profitabilityScore}/100</h3>
                            <p class="mb-0">Score de rentabilité</p>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="mt-4">
                <h6 class="fw-bold">Recommandations IA:</h6>
                <ul class="list-unstyled">
                    ${insights.recommendations.map(rec => `
                        <li class="mb-2">
                            <i class="bi bi-lightbulb text-warning me-2"></i>
                            ${rec}
                        </li>
                    `).join('')}
                </ul>
            </div>
            
            <div class="mt-4">
                <h6 class="fw-bold">Périodes de forte demande:</h6>
                <div class="d-flex flex-wrap gap-2">
                    ${insights.peakDemandPeriods.map(period => `
                        <span class="badge bg-primary">${period}</span>
                    `).join('')}
                </div>
            </div>
        `;
    }, 1500);
}

// Load similar equipment
function loadSimilarEquipment() {
    const container = document.getElementById('similarEquipment');
    
    // Get equipment from same category
    const similarItems = MockDataUtils.getEquipmentByCategory(currentEquipment.idCategorie)
        .filter(eq => eq.idMateriel !== currentEquipment.idMateriel)
        .slice(0, 3);
    
    container.innerHTML = similarItems.map(equipment => `
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
                    <div class="d-flex justify-content-between align-items-center">
                        <div class="equipment-price">${YOURS.formatCurrency(equipment.prix)}/jour</div>
                        <a href="?id=${equipment.idMateriel}" class="btn btn-outline-primary btn-sm">
                            <i class="bi bi-eye me-1"></i>Voir
                        </a>
                    </div>
                </div>
            </div>
        </div>
    `).join('');
}

// Setup form listeners
function setupFormListeners() {
    const startDateInput = document.getElementById('startDate');
    const endDateInput = document.getElementById('endDate');
    const bookingForm = document.getElementById('quickBookingForm');
    
    // Set minimum date to today
    const today = new Date().toISOString().split('T')[0];
    startDateInput.min = today;
    
    // Update end date minimum when start date changes
    startDateInput.addEventListener('change', function() {
        endDateInput.min = this.value;
        if (endDateInput.value && endDateInput.value < this.value) {
            endDateInput.value = '';
        }
        calculateTotal();
    });
    
    endDateInput.addEventListener('change', calculateTotal);
    
    // Handle form submission
    bookingForm.addEventListener('submit', function(e) {
        e.preventDefault();
        handleBooking();
    });
}

// Calculate total price
function calculateTotal() {
    const startDate = document.getElementById('startDate').value;
    const endDate = document.getElementById('endDate').value;
    
    if (!startDate || !endDate) {
        document.getElementById('rentalDuration').textContent = '-';
        document.getElementById('dailyPrice').textContent = '-';
        document.getElementById('totalPrice').textContent = '-';
        return;
    }
    
    const days = YOURS.calculateDays(startDate, endDate);
    const dailyPrice = currentEquipment.prix;
    const total = dailyPrice * days;
    
    document.getElementById('rentalDuration').textContent = `${days} jour${days > 1 ? 's' : ''}`;
    document.getElementById('dailyPrice').textContent = YOURS.formatCurrency(dailyPrice);
    document.getElementById('totalPrice').textContent = YOURS.formatCurrency(total);
}

// Handle booking
function handleBooking() {
    // Check if user is logged in
    const user = YOURS.storage.get('user') || JSON.parse(sessionStorage.getItem('yours_user') || 'null');
    
    if (!user) {
        YOURS.showToast('Veuillez vous connecter pour réserver du matériel', 'warning');
        setTimeout(() => {
            window.location.href = '${pageContext.request.contextPath}/pages/auth/login.jsp';
        }, 2000);
        return;
    }
    
    const startDate = document.getElementById('startDate').value;
    const endDate = document.getElementById('endDate').value;
    
    // Redirect to booking page with pre-filled data
    const bookingUrl = `${pageContext.request.contextPath}/pages/booking/form.jsp?equipment=${currentEquipment.idMateriel}&start=${startDate}&end=${endDate}`;
    window.location.href = bookingUrl;
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

// Show not found state
function showNotFound() {
    document.getElementById('loadingState').style.display = 'none';
    document.getElementById('notFoundState').classList.remove('d-none');
}

// Contact partner
function contactPartner() {
    YOURS.showToast('Fonctionnalité de contact en cours de développement', 'info');
}

// Add to wishlist
function addToWishlist() {
    YOURS.showToast('Ajouté aux favoris !', 'success');
}

// Share equipment
function shareEquipment() {
    if (navigator.share) {
        navigator.share({
            title: currentEquipment.nom,
            text: currentEquipment.description,
            url: window.location.href
        });
    } else {
        // Fallback: copy to clipboard
        navigator.clipboard.writeText(window.location.href).then(() => {
            YOURS.showToast('Lien copié dans le presse-papiers !', 'success');
        });
    }
}
</script>

<style>
.equipment-detail-images {
    position: relative;
}

.main-image-container {
    position: relative;
    overflow: hidden;
    border-radius: 1rem;
}

.main-image-container img {
    width: 100%;
    height: 400px;
    object-fit: cover;
}

.thumbnail-gallery {
    display: flex;
    gap: 0.5rem;
    overflow-x: auto;
    padding: 0.5rem 0;
}

.thumbnail {
    width: 80px;
    height: 60px;
    object-fit: cover;
    border-radius: 0.5rem;
    cursor: pointer;
    opacity: 0.7;
    transition: all 0.3s ease;
    border: 2px solid transparent;
}

.thumbnail:hover,
.thumbnail.active {
    opacity: 1;
    border-color: var(--primary-color);
}

.booking-summary {
    background: #f8f9fa;
    border-radius: 0.5rem;
}

.review-item:last-child {
    border-bottom: none !important;
}

.tab-content {
    margin-top: 1rem;
}

.nav-tabs .nav-link {
    border-radius: 0.5rem 0.5rem 0 0;
    margin-right: 0.25rem;
}

.nav-tabs .nav-link.active {
    background: white;
    border-color: #dee2e6 #dee2e6 white;
}
</style>

<%@ include file="../../layouts/footer.jsp" %>

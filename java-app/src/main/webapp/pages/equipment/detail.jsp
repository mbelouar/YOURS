<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Détails du matériel - YOURS</title>
    
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="../../css/main.css">
    <link rel="stylesheet" href="../../css/components.css">
    <link rel="stylesheet" href="../../css/responsive.css">
</head>
<body>

<%@ include file="../../layouts/navbar.jsp" %>

<!-- Page Header -->
<section class="py-5" style="background: linear-gradient(135deg, #1e40af 0%, #1e3a8a 50%, #1e293b 100%); margin-top: -80px; padding-top: calc(80px + 3rem) !important; padding-bottom: 3rem !important; position: relative; overflow: hidden;">
    <div style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; background: radial-gradient(circle at 20% 50%, rgba(59, 130, 246, 0.15) 0%, transparent 50%); opacity: 1;"></div>
    <div class="container" style="position: relative; z-index: 2;">
        <nav aria-label="breadcrumb" class="mb-3">
            <ol class="breadcrumb" style="background: transparent; padding: 0; margin: 0;">
                <li class="breadcrumb-item">
                    <a href="../../index.jsp" style="color: rgba(255,255,255,0.8); text-decoration: none;">
                        <i class="fas fa-home me-1"></i>Accueil
                    </a>
                </li>
                <li class="breadcrumb-item">
                    <a href="list-simple.jsp" style="color: rgba(255,255,255,0.8); text-decoration: none;">
                        Mat&eacute;riel
                    </a>
                </li>
                <li class="breadcrumb-item active" id="equipmentBreadcrumb" style="color: white;">Chargement...</li>
            </ol>
        </nav>
    </div>
</section>

<div class="container py-5">
    <!-- Loading State -->
    <div id="loadingState" class="text-center py-5">
        <div class="spinner-border" style="color: #1e40af; width: 3rem; height: 3rem;" role="status">
            <span class="visually-hidden">Chargement...</span>
        </div>
        <p class="text-muted mt-3">Chargement des d&eacute;tails...</p>
    </div>

    <!-- Equipment Not Found -->
    <div id="notFoundState" class="d-none text-center py-5">
        <i class="fas fa-exclamation-triangle" style="font-size: 4rem; color: #d1d5db;"></i>
        <h3 class="mt-4" style="color: #374151;">&Eacute;quipement non trouv&eacute;</h3>
        <p class="text-muted mb-4">
            L'&eacute;quipement que vous recherchez n'existe pas ou n'est plus disponible.
        </p>
        <a href="list-simple.jsp" class="btn btn-primary">
            <i class="fas fa-arrow-left me-2"></i>Retour au catalogue
        </a>
    </div>

    <!-- Equipment Detail Content -->
    <div id="equipmentDetail" class="d-none">
        <div class="row g-4">
            <!-- Image Gallery -->
            <div class="col-lg-6">
                <div class="equipment-detail-images">
                    <!-- Main Image -->
                    <div class="main-image-container position-relative mb-3" style="border-radius: 1rem; overflow: hidden; box-shadow: 0 4px 20px rgba(0,0,0,0.1);">
                        <img id="mainImage" src="" alt="" class="img-fluid" style="width: 100%; height: 450px; object-fit: cover;">
                        <button class="btn btn-light position-absolute" style="top: 1rem; right: 1rem; border-radius: 0.5rem;" 
                                onclick="openImageModal()" title="Agrandir">
                            <i class="fas fa-expand"></i>
                        </button>
                        <div class="availability-badge" id="imageBadge" style="position: absolute; top: 1rem; right: 1rem;"></div>
                        <div class="price-badge" id="imagePriceBadge" style="position: absolute; bottom: 1rem; left: 1rem;"></div>
                    </div>
                    
                    <!-- Thumbnail Gallery -->
                    <div class="thumbnail-gallery d-flex gap-2" id="thumbnailGallery" style="overflow-x: auto;">
                        <!-- Thumbnails will be loaded here -->
                    </div>
                </div>
            </div>

            <!-- Equipment Information -->
            <div class="col-lg-6">
                <div class="equipment-info">
                    <!-- Category Badge -->
                    <div class="mb-3">
                        <span id="equipmentCategory" class="badge" style="font-size: 0.875rem; padding: 0.5rem 1rem;"></span>
                    </div>
                    
                    <!-- Title -->
                    <h1 id="equipmentName" class="display-5 fw-bold mb-3" style="color: #111827;"></h1>
                    <p id="equipmentDescription" class="lead text-muted mb-4"></p>

                    <!-- Price Section -->
                    <div class="p-4 mb-4" style="background: linear-gradient(135deg, #f8fafc, #f1f5f9); border-radius: 1rem; border: 1px solid #e5e7eb;">
                        <div class="d-flex align-items-baseline mb-2">
                            <div id="equipmentPrice" style="font-size: 2.5rem; font-weight: 700; color: #1e40af;"></div>
                            <span class="ms-2 text-muted" style="font-size: 1.125rem;">/jour</span>
                        </div>
                        <small class="text-muted">
                            <i class="fas fa-info-circle me-1"></i>
                            Prix d&eacute;gressifs pour les locations longues
                        </small>
                    </div>

                    <!-- Partner Information -->
                    <div class="card mb-4" style="border-radius: 1rem; border: 1px solid #e5e7eb;">
                        <div class="card-body p-4">
                            <h6 class="fw-bold mb-3" style="color: #1f2937;">
                                <i class="fas fa-store me-2" style="color: #1e40af;"></i>Propos&eacute; par
                            </h6>
                            <div class="d-flex justify-content-between align-items-center">
                                <div>
                                    <h6 id="partnerName" class="mb-1" style="color: #111827;"></h6>
                                    <div class="d-flex align-items-center">
                                        <div id="partnerRating" class="me-2"></div>
                                        <small class="text-muted" id="partnerRatingText"></small>
                                    </div>
                                </div>
                                <button class="btn btn-outline-primary btn-sm" style="border-radius: 0.75rem;" onclick="contactPartner()">
                                    <i class="fas fa-comment-dots me-1"></i>Contacter
                                </button>
                            </div>
                        </div>
                    </div>

                    <!-- Quick Booking Form -->
                    <div class="card mb-4" style="border-radius: 1rem; border: 2px solid #1e40af; background: linear-gradient(135deg, #ffffff 0%, #f8fafc 100%);">
                        <div class="card-body p-4">
                            <h6 class="fw-bold mb-3" style="color: #1f2937;">
                                <i class="fas fa-calendar-check me-2" style="color: #1e40af;"></i>R&eacute;servation rapide
                            </h6>
                            <form id="quickBookingForm">
                                <div class="row g-3">
                                    <div class="col-md-6">
                                        <label for="startDate" class="form-label fw-semibold" style="color: #374151; font-size: 0.875rem;">Date de d&eacute;but</label>
                                        <input type="date" class="form-control" id="startDate" required 
                                               style="border-radius: 0.75rem; border: 2px solid #e5e7eb; height: 48px;">
                                    </div>
                                    <div class="col-md-6">
                                        <label for="endDate" class="form-label fw-semibold" style="color: #374151; font-size: 0.875rem;">Date de fin</label>
                                        <input type="date" class="form-control" id="endDate" required 
                                               style="border-radius: 0.75rem; border: 2px solid #e5e7eb; height: 48px;">
                                    </div>
                                    <div class="col-12">
                                        <div class="p-3" style="background: white; border-radius: 0.75rem; border: 1px solid #e5e7eb;">
                                            <div class="d-flex justify-content-between mb-2">
                                                <span style="color: #6b7280;">Dur&eacute;e:</span>
                                                <span id="rentalDuration" style="font-weight: 600; color: #111827;">-</span>
                                            </div>
                                            <div class="d-flex justify-content-between mb-2">
                                                <span style="color: #6b7280;">Prix par jour:</span>
                                                <span id="dailyPrice" style="font-weight: 600; color: #111827;">-</span>
                                            </div>
                                            <hr style="border-color: #e5e7eb;">
                                            <div class="d-flex justify-content-between">
                                                <span style="font-weight: 700; color: #111827;">Total:</span>
                                                <span id="totalPrice" style="font-weight: 700; font-size: 1.25rem; color: #1e40af;">-</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <button type="submit" class="btn btn-primary w-100" style="height: 52px; border-radius: 0.75rem; font-weight: 600; font-size: 1.0625rem;">
                                            <i class="fas fa-calendar-plus me-2"></i>R&eacute;server maintenant
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                    <!-- Share & Wishlist -->
                    <div class="d-flex gap-2">
                        <button class="btn btn-outline-secondary" style="flex: 1; border-radius: 0.75rem; height: 48px;" onclick="addToWishlist()">
                            <i class="fas fa-heart me-2"></i>Favoris
                        </button>
                        <button class="btn btn-outline-secondary" style="flex: 1; border-radius: 0.75rem; height: 48px;" onclick="shareEquipment()">
                            <i class="fas fa-share-alt me-2"></i>Partager
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Detailed Information Tabs -->
        <div class="row mt-5">
            <div class="col-12">
                <ul class="nav nav-tabs border-0 mb-4" id="equipmentTabs" role="tablist" style="gap: 0.5rem;">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="specifications-tab" data-bs-toggle="tab" 
                                data-bs-target="#specifications" type="button" role="tab"
                                style="border-radius: 0.75rem; border: 2px solid transparent; padding: 0.75rem 1.5rem; font-weight: 600;">
                            <i class="fas fa-list-check me-2"></i>Sp&eacute;cifications
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="reviews-tab" data-bs-toggle="tab" 
                                data-bs-target="#reviews" type="button" role="tab"
                                style="border-radius: 0.75rem; border: 2px solid transparent; padding: 0.75rem 1.5rem; font-weight: 600;">
                            <i class="fas fa-star me-2"></i>Avis (3)
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="availability-tab" data-bs-toggle="tab" 
                                data-bs-target="#availability" type="button" role="tab"
                                style="border-radius: 0.75rem; border: 2px solid transparent; padding: 0.75rem 1.5rem; font-weight: 600;">
                            <i class="fas fa-calendar me-2"></i>Disponibilit&eacute;
                        </button>
                    </li>
                </ul>
                
                <div class="tab-content" id="equipmentTabsContent">
                    <!-- Specifications Tab -->
                    <div class="tab-pane fade show active" id="specifications" role="tabpanel">
                        <div class="card" style="border-radius: 1rem; border: 1px solid #e5e7eb;">
                            <div class="card-body p-4">
                                <h5 class="fw-bold mb-4" style="color: #111827;">Sp&eacute;cifications techniques</h5>
                                <div id="specificationsList">
                                    <!-- Specifications will be loaded here -->
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Reviews Tab -->
                    <div class="tab-pane fade" id="reviews" role="tabpanel">
                        <div class="card" style="border-radius: 1rem; border: 1px solid #e5e7eb;">
                            <div class="card-body p-4">
                                <h5 class="fw-bold mb-4" style="color: #111827;">Avis clients</h5>
                                <div id="reviewsList">
                                    <!-- Reviews will be loaded here -->
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Availability Tab -->
                    <div class="tab-pane fade" id="availability" role="tabpanel">
                        <div class="card" style="border-radius: 1rem; border: 1px solid #e5e7eb;">
                            <div class="card-body p-4">
                                <h5 class="fw-bold mb-4" style="color: #111827;">Calendrier de disponibilit&eacute;</h5>
                                <div id="availabilityCalendar">
                                    <!-- Calendar will be loaded here -->
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
                <h3 class="fw-bold mb-4" style="color: #111827;">
                    <i class="fas fa-layer-group me-2" style="color: #1e40af;"></i>
                    &Eacute;quipements similaires
                </h3>
                <div class="row g-4" id="similarEquipment">
                    <!-- Similar equipment will be loaded here -->
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Image Modal -->
<div class="modal fade" id="imageModal" tabindex="-1">
    <div class="modal-dialog modal-xl">
        <div class="modal-content" style="border-radius: 1rem;">
            <div class="modal-header border-0">
                <h5 class="modal-title fw-bold" id="imageModalTitle">Images</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body text-center">
                <img id="modalImage" src="" alt="" class="img-fluid" style="border-radius: 0.5rem;">
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<script>
let currentEquipment = null;
let currentImageIndex = 0;

const mockEquipment = [
    {
        idMateriel: 1,
        nom: "Canon EOS R5",
        prix: 240,
        disponibilite: true,
        idCategorie: 1,
        categorie: "Photographie",
        description: "Appareil photo professionnel 45MP avec stabilisation integree et enregistrement video 8K.",
        specifications: [
            "Capteur CMOS full-frame 45MP",
            "Enregistrement video 8K RAW",
            "Stabilisation d'image 5 axes",
            "Ecran tactile orientable 3.2 pouces",
            "Double slot carte memoire"
        ],
        images: [
            "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600&auto=format&fit=crop&q=80",
            "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600&auto=format&fit=crop&q=80",
            "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600&auto=format&fit=crop&q=80"
        ],
        partner: { idPartenaire: 1, nom: "Photo Pro Rental", rating: 4.8 }
    },
    {
        idMateriel: 2,
        nom: "Sony A7 IV",
        prix: 180,
        disponibilite: true,
        idCategorie: 1,
        categorie: "Photographie",
        description: "Hybride full-frame 33MP avec autofocus intelligent et video 4K 60fps.",
        specifications: [
            "Capteur CMOS full-frame 33MP",
            "Video 4K 60fps",
            "Autofocus AF-I avance",
            "Stabilisation 5.5 stops",
            "Ecran tactile orientable"
        ],
        images: [
            "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600&auto=format&fit=crop&q=80"
        ],
        partner: { idPartenaire: 1, nom: "Photo Pro Rental", rating: 4.8 }
    },
    {
        idMateriel: 3,
        nom: "MacBook Pro 16\"",
        prix: 120,
        disponibilite: true,
        idCategorie: 3,
        categorie: "Informatique",
        description: "Ordinateur portable haute performance pour montage video professionnel.",
        specifications: [
            "Apple M2 Max",
            "32GB RAM",
            "1TB SSD",
            "Ecran Retina 16 pouces",
            "GPU 38 coeurs"
        ],
        images: [
            "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600&auto=format&fit=crop&q=80"
        ],
        partner: { idPartenaire: 2, nom: "Tech Solutions", rating: 4.9 }
    },
    {
        idMateriel: 4,
        nom: "Rode NTG5",
        prix: 45,
        disponibilite: true,
        idCategorie: 4,
        categorie: "Audio",
        description: "Microphone shotgun ultra-leger avec qualite broadcast professionnelle.",
        specifications: [
            "Microphone shotgun professionnel",
            "Ultra-leger (76g)",
            "Alimentation fantome 48V",
            "Reponse en frequence optimisee",
            "Bonnette Rycote incluse"
        ],
        images: [
            "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600&auto=format&fit=crop&q=80"
        ],
        partner: { idPartenaire: 3, nom: "Sound Studio Pro", rating: 5.0 }
    },
    {
        idMateriel: 5,
        nom: "Aputure 600D Pro",
        prix: 95,
        disponibilite: true,
        idCategorie: 5,
        categorie: "Gaming",
        description: "Eclairage LED puissant avec controle sans fil et effets speciaux.",
        specifications: [
            "LED COB 600W",
            "Temperature couleur variable",
            "Controle sans fil",
            "CRI 96+",
            "Effets speciaux integres"
        ],
        images: [
            "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600&auto=format&fit=crop&q=80"
        ],
        partner: { idPartenaire: 4, nom: "Light Masters", rating: 4.6 }
    },
    {
        idMateriel: 6,
        nom: "Rode Microphone",
        prix: 30,
        disponibilite: true,
        idCategorie: 4,
        categorie: "Audio",
        description: "Microphone USB de qualite studio pour enregistrement et streaming.",
        specifications: [
            "Capsule a condensateur",
            "Interface USB-C",
            "Monitoring sans latence",
            "Filtre anti-pop integre",
            "Support anti-vibration"
        ],
        images: [
            "https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600&auto=format&fit=crop&q=80"
        ],
        partner: { idPartenaire: 3, nom: "Sound Studio Pro", rating: 4.5 }
    }
];

document.addEventListener('DOMContentLoaded', function() {
    const urlParams = new URLSearchParams(window.location.search);
    const equipmentIdParam = urlParams.get('id');
    const equipmentId = equipmentIdParam ? parseInt(equipmentIdParam) : null;
    
    if (equipmentId) {
        loadEquipmentDetail(equipmentId);
    } else {
        showNotFound();
    }
    
    setupFormListeners();
});

function loadEquipmentDetail(equipmentId) {
    setTimeout(function() {
        currentEquipment = mockEquipment.find(function(eq) {
            return eq.idMateriel === equipmentId;
        });
        
        if (currentEquipment) {
            displayEquipmentDetail();
            loadSimilarEquipment();
        } else {
            showNotFound();
        }
        
        document.getElementById('loadingState').style.display = 'none';
    }, 800);
}

function displayEquipmentDetail() {
    document.title = currentEquipment.nom + ' - YOURS';
    document.getElementById('equipmentBreadcrumb').textContent = currentEquipment.nom;
    
    document.getElementById('equipmentName').textContent = currentEquipment.nom;
    document.getElementById('equipmentDescription').textContent = currentEquipment.description;
    document.getElementById('equipmentPrice').textContent = currentEquipment.prix + ' MAD';
    
    var categoryBadge = document.getElementById('equipmentCategory');
    var categoryColors = {
        'Photographie': 'linear-gradient(135deg, rgba(37, 99, 235, 0.1), rgba(37, 99, 235, 0.2))',
        'Video': 'linear-gradient(135deg, rgba(16, 185, 129, 0.1), rgba(16, 185, 129, 0.2))',
        'Audio': 'linear-gradient(135deg, rgba(6, 182, 212, 0.1), rgba(6, 182, 212, 0.2))',
        'Informatique': 'linear-gradient(135deg, rgba(245, 158, 11, 0.1), rgba(245, 158, 11, 0.2))',
        'Gaming': 'linear-gradient(135deg, rgba(220, 38, 38, 0.1), rgba(220, 38, 38, 0.2))'
    };
    categoryBadge.textContent = currentEquipment.categorie;
    categoryBadge.style.background = categoryColors[currentEquipment.categorie] || categoryColors['Photographie'];
    categoryBadge.style.color = '#1e40af';
    categoryBadge.style.borderRadius = '0.5rem';
    
    var availabilityText = currentEquipment.disponibilite ? 'Disponible' : 'Non disponible';
    document.getElementById('imageBadge').textContent = availabilityText;
    document.getElementById('imagePriceBadge').textContent = currentEquipment.prix + ' MAD/jour';
    
    document.getElementById('partnerName').textContent = currentEquipment.partner.nom;
    document.getElementById('partnerRating').innerHTML = generateStars(currentEquipment.partner.rating);
    document.getElementById('partnerRatingText').textContent = '(' + currentEquipment.partner.rating + '/5)';
    
    displayImages();
    displaySpecifications();
    displayReviews();
    displayAvailabilityCalendar();
    
    document.getElementById('equipmentDetail').classList.remove('d-none');
}

function displayImages() {
    var mainImage = document.getElementById('mainImage');
    var thumbnailGallery = document.getElementById('thumbnailGallery');
    
    mainImage.src = currentEquipment.images[0];
    mainImage.alt = currentEquipment.nom;
    
    var thumbnailsHtml = '';
    for (var i = 0; i < currentEquipment.images.length; i++) {
        var isActive = i === 0;
        thumbnailsHtml += '<img src="' + currentEquipment.images[i] + '" ';
        thumbnailsHtml += 'alt="' + currentEquipment.nom + ' ' + (i + 1) + '" ';
        thumbnailsHtml += 'class="thumbnail' + (isActive ? ' active' : '') + '" ';
        thumbnailsHtml += 'onclick="changeMainImage(' + i + ')" ';
        thumbnailsHtml += 'style="width: 100px; height: 75px; object-fit: cover; border-radius: 0.5rem; cursor: pointer; ';
        thumbnailsHtml += 'opacity: ' + (isActive ? '1' : '0.7') + '; transition: all 0.3s ease; ';
        thumbnailsHtml += 'border: 2px solid ' + (isActive ? '#1e40af' : 'transparent') + ';">';
    }
    thumbnailGallery.innerHTML = thumbnailsHtml;
}

function changeMainImage(index) {
    currentImageIndex = index;
    var mainImage = document.getElementById('mainImage');
    mainImage.src = currentEquipment.images[index];
    
    var thumbnails = document.querySelectorAll('.thumbnail');
    for (var i = 0; i < thumbnails.length; i++) {
        thumbnails[i].style.opacity = i === index ? '1' : '0.7';
        thumbnails[i].style.borderColor = i === index ? '#1e40af' : 'transparent';
    }
}

function openImageModal() {
    var modal = new bootstrap.Modal(document.getElementById('imageModal'));
    document.getElementById('modalImage').src = currentEquipment.images[currentImageIndex];
    document.getElementById('imageModalTitle').textContent = currentEquipment.nom + ' - Image ' + (currentImageIndex + 1);
    modal.show();
}

function displaySpecifications() {
    var container = document.getElementById('specificationsList');
    var html = '';
    for (var i = 0; i < currentEquipment.specifications.length; i++) {
        html += '<div class="d-flex align-items-start py-3 border-bottom">';
        html += '<i class="fas fa-check-circle me-3 mt-1" style="color: #10b981; font-size: 1.125rem;"></i>';
        html += '<span style="color: #374151; line-height: 1.6;">' + currentEquipment.specifications[i] + '</span>';
        html += '</div>';
    }
    container.innerHTML = html;
}

function displayReviews() {
    var container = document.getElementById('reviewsList');
    var mockReviews = [
        { user: "Ahmed B.", rating: 5, date: "2024-01-10", comment: "Excellent materiel, tres bien entretenu. Le partenaire est professionnel et reactif." },
        { user: "Fatima A.", rating: 4, date: "2024-01-08", comment: "Bonne qualite d'image, parfait pour mon projet video. Livraison rapide." },
        { user: "Mohamed K.", rating: 5, date: "2024-01-05", comment: "Materiel professionnel de qualite. Je recommande vivement !" }
    ];
    
    var html = '';
    for (var i = 0; i < mockReviews.length; i++) {
        var review = mockReviews[i];
        html += '<div class="border-bottom py-3">';
        html += '<div class="d-flex justify-content-between align-items-center mb-2">';
        html += '<div class="d-flex align-items-center gap-3">';
        html += '<strong style="color: #111827;">' + review.user + '</strong>';
        html += '<div>' + generateStars(review.rating) + '</div>';
        html += '<small class="text-muted">' + review.date + '</small>';
        html += '</div></div>';
        html += '<p class="mb-0" style="color: #374151;">' + review.comment + '</p>';
        html += '</div>';
    }
    container.innerHTML = html;
}

function displayAvailabilityCalendar() {
    var container = document.getElementById('availabilityCalendar');
    var statusText = currentEquipment.disponibilite ? 'disponible' : 'loue';
    container.innerHTML = '<div class="alert" style="background: rgba(59, 130, 246, 0.1); border: 1px solid rgba(59, 130, 246, 0.2); border-radius: 0.75rem; color: #1f2937;">' +
        '<i class="fas fa-info-circle me-2" style="color: #1e40af;"></i>' +
        '<strong>Disponibilite en temps reel</strong><br>' +
        'Cet equipement est actuellement ' + statusText + '. ' +
        'Selectionnez vos dates dans le formulaire de reservation pour verifier la disponibilite.' +
        '</div>';
}

function loadSimilarEquipment() {
    var container = document.getElementById('similarEquipment');
    var similarItems = mockEquipment.filter(function(eq) {
        return eq.idCategorie === currentEquipment.idCategorie && eq.idMateriel !== currentEquipment.idMateriel;
    }).slice(0, 3);
    
    var html = '';
    for (var i = 0; i < similarItems.length; i++) {
        var equipment = similarItems[i];
        html += '<div class="col-lg-4 col-md-6">';
        html += '<div class="card card-modern card-equipment h-100">';
        html += '<div class="position-relative">';
        html += '<img src="' + equipment.images[0] + '" class="card-img-top" alt="' + equipment.nom + '" style="height: 250px; object-fit: cover;">';
        html += '<div class="availability-badge">' + (equipment.disponibilite ? 'Disponible' : 'Non disponible') + '</div>';
        html += '<div class="price-badge">' + equipment.prix + ' MAD/jour</div>';
        html += '</div>';
        html += '<div class="card-body p-3">';
        html += '<span class="badge mb-2" style="background: rgba(37, 99, 235, 0.1); color: #1e40af; font-size: 0.75rem; padding: 0.375rem 0.75rem; border-radius: 0.5rem;">';
        html += '<i class="fas fa-camera me-1"></i>' + equipment.categorie;
        html += '</span>';
        html += '<h5 class="card-title mb-2">' + equipment.nom + '</h5>';
        html += '<p class="card-text text-muted mb-3" style="font-size: 0.9rem;">' + equipment.description.substring(0, 80) + '...</p>';
        html += '<div class="d-flex gap-2 align-items-stretch">';
        html += '<a href="?id=' + equipment.idMateriel + '" class="btn btn-primary btn-sm d-flex align-items-center justify-content-center" style="flex: 1; padding: 0.5rem 0.75rem; white-space: nowrap;">';
        html += '<i class="fas fa-eye me-1"></i>Voir';
        html += '</a>';
        html += '<button class="btn btn-outline-primary btn-sm d-flex align-items-center justify-content-center" style="flex: 1; padding: 0.5rem 0.75rem; white-space: nowrap;">';
        html += '<i class="fas fa-calendar-plus me-1"></i>R\u00e9server';
        html += '</button>';
        html += '</div></div></div></div>';
    }
    container.innerHTML = html;
}

function setupFormListeners() {
    var startDateInput = document.getElementById('startDate');
    var endDateInput = document.getElementById('endDate');
    var bookingForm = document.getElementById('quickBookingForm');
    
    var today = new Date().toISOString().split('T')[0];
    startDateInput.min = today;
    
    startDateInput.addEventListener('change', function() {
        endDateInput.min = this.value;
        if (endDateInput.value && endDateInput.value < this.value) {
            endDateInput.value = '';
        }
        calculateTotal();
    });
    
    endDateInput.addEventListener('change', calculateTotal);
    
    bookingForm.addEventListener('submit', function(e) {
        e.preventDefault();
        handleBooking();
    });
}

function calculateTotal() {
    var startDate = document.getElementById('startDate').value;
    var endDate = document.getElementById('endDate').value;
    
    if (!startDate || !endDate) {
        document.getElementById('rentalDuration').textContent = '-';
        document.getElementById('dailyPrice').textContent = '-';
        document.getElementById('totalPrice').textContent = '-';
        return;
    }
    
    var start = new Date(startDate);
    var end = new Date(endDate);
    var days = Math.ceil((end - start) / (1000 * 60 * 60 * 24));
    var dailyPrice = currentEquipment.prix;
    var total = dailyPrice * days;
    
    document.getElementById('rentalDuration').textContent = days + ' jour' + (days > 1 ? 's' : '');
    document.getElementById('dailyPrice').textContent = dailyPrice + ' MAD';
    document.getElementById('totalPrice').textContent = total + ' MAD';
}

function handleBooking() {
    var user = JSON.parse(sessionStorage.getItem('yours_user') || 'null');
    
    if (!user) {
        alert('Veuillez vous connecter pour reserver du materiel');
        setTimeout(function() {
            window.location.href = '../../pages/auth/login.jsp';
        }, 1500);
        return;
    }
    
    var startDate = document.getElementById('startDate').value;
    var endDate = document.getElementById('endDate').value;
    
    window.location.href = '../booking/form.jsp?equipment=' + currentEquipment.idMateriel + '&start=' + startDate + '&end=' + endDate;
}

function generateStars(rating) {
    var fullStars = Math.floor(rating);
    var hasHalfStar = rating % 1 !== 0;
    var stars = '';
    
    for (var i = 0; i < fullStars; i++) {
        stars += '<i class="fas fa-star" style="color: #fbbf24; font-size: 0.875rem;"></i>';
    }
    
    if (hasHalfStar) {
        stars += '<i class="fas fa-star-half-alt" style="color: #fbbf24; font-size: 0.875rem;"></i>';
    }
    
    var emptyStars = 5 - Math.ceil(rating);
    for (var i = 0; i < emptyStars; i++) {
        stars += '<i class="far fa-star" style="color: #fbbf24; font-size: 0.875rem;"></i>';
    }
    
    return stars;
}

function showNotFound() {
    document.getElementById('loadingState').style.display = 'none';
    document.getElementById('notFoundState').classList.remove('d-none');
}

function contactPartner() {
    alert('Fonctionnalite de contact en cours de developpement');
}

function addToWishlist() {
    alert('Ajoute aux favoris !');
}

function shareEquipment() {
    if (navigator.share) {
        navigator.share({
            title: currentEquipment.nom,
            text: currentEquipment.description,
            url: window.location.href
        });
    } else {
        navigator.clipboard.writeText(window.location.href).then(function() {
            alert('Lien copie dans le presse-papiers !');
        });
    }
}
</script>

<style>
.nav-tabs .nav-link {
    color: #6b7280;
    border: 2px solid transparent;
    background: transparent;
}

.nav-tabs .nav-link:hover {
    color: #1e40af;
    background: rgba(37, 99, 235, 0.05);
}

.nav-tabs .nav-link.active {
    color: #1e40af;
    background: white;
    border: 2px solid #1e40af;
}

.breadcrumb-item + .breadcrumb-item::before {
    content: "›";
    color: rgba(255,255,255,0.6);
}

.form-control:focus {
    border-color: #1e40af;
    box-shadow: 0 0 0 4px rgba(30, 64, 175, 0.1);
}
</style>

<%@ include file="../../layouts/footer.jsp" %>

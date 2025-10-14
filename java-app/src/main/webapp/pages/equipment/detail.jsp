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
<section class="py-4" style="background: linear-gradient(135deg, #1e40af 0%, #1e3a8a 50%, #1e293b 100%); margin-top: -80px; padding-top: calc(80px + 2rem) !important; padding-bottom: 2rem !important; position: relative; overflow: hidden;">
    <div style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; background: radial-gradient(circle at 20% 50%, rgba(59, 130, 246, 0.15) 0%, transparent 50%); opacity: 1;"></div>
    <div class="container" style="position: relative; z-index: 2;">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb" style="background: transparent; padding: 0; margin: 0;">
                <li class="breadcrumb-item">
                    <a href="../../index.jsp" style="color: rgba(255,255,255,0.9); text-decoration: none; font-weight: 500; transition: all 0.2s ease;">
                        <i class="fas fa-home me-1"></i>Accueil
                    </a>
                </li>
                <li class="breadcrumb-item">
                    <a href="list-simple.jsp" style="color: rgba(255,255,255,0.9); text-decoration: none; font-weight: 500; transition: all 0.2s ease;">
                        Mat&eacute;riel
                    </a>
                </li>
                <li class="breadcrumb-item active" id="equipmentBreadcrumb" style="color: white; font-weight: 600;">Chargement...</li>
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
                <div class="equipment-detail-images" style="position: sticky; top: 6rem;">
                    <!-- Main Image -->
                    <div class="main-image-container position-relative mb-3" style="border-radius: 1.25rem; overflow: hidden; box-shadow: 0 8px 30px rgba(0,0,0,0.12); border: 1px solid rgba(0,0,0,0.05);">
                        <img id="mainImage" src="" alt="" class="img-fluid" style="width: 100%; height: 500px; object-fit: cover;">
                        <button class="btn position-absolute" style="top: 1.25rem; right: 1.25rem; border-radius: 0.75rem; background: rgba(255,255,255,0.95); backdrop-filter: blur(10px); border: 1px solid rgba(0,0,0,0.1); padding: 0.625rem 0.875rem; box-shadow: 0 4px 12px rgba(0,0,0,0.15); transition: all 0.2s ease;" 
                                onclick="openImageModal()" title="Agrandir">
                            <i class="fas fa-expand" style="color: #1e40af;"></i>
                        </button>
                        <div class="availability-badge" id="imageBadge" style="position: absolute; top: 1.25rem; left: 1.25rem;"></div>
                        <div class="price-badge" id="imagePriceBadge" style="position: absolute; bottom: 1.25rem; left: 1.25rem;"></div>
                    </div>
                    
                    <!-- Thumbnail Gallery -->
                    <div class="thumbnail-gallery d-flex gap-3" id="thumbnailGallery" style="overflow-x: auto; padding: 0.5rem 0;">
                        <!-- Thumbnails will be loaded here -->
                    </div>
                </div>
            </div>

            <!-- Equipment Information -->
            <div class="col-lg-6">
                <div class="equipment-info">
                    <!-- Category Badge -->
                    <div class="mb-3">
                        <span id="equipmentCategory" class="badge d-inline-flex align-items-center" style="font-size: 0.8125rem; padding: 0.5rem 1rem; font-weight: 600; border-radius: 0.625rem;">
                            <i class="fas fa-tag me-2" style="font-size: 0.75rem;"></i>
                            <span id="categoryText"></span>
                        </span>
                    </div>
                    
                    <!-- Title -->
                    <h1 id="equipmentName" class="display-5 fw-bold mb-3" style="color: #111827; line-height: 1.2; letter-spacing: -0.02em;"></h1>
                    <p id="equipmentDescription" class="lead mb-4" style="color: #6b7280; font-size: 1.125rem; line-height: 1.7;"></p>

                    <!-- Price Section -->
                    <div class="p-4 mb-4" style="background: linear-gradient(135deg, rgba(30, 64, 175, 0.05), rgba(30, 58, 138, 0.05)); border-radius: 1.25rem; border: 2px solid rgba(30, 64, 175, 0.15); box-shadow: 0 4px 15px rgba(30, 64, 175, 0.08);">
                        <div class="d-flex align-items-baseline mb-2">
                            <div id="equipmentPrice" style="font-size: 3rem; font-weight: 800; color: #1e40af; letter-spacing: -0.02em;"></div>
                            <span class="ms-2" style="font-size: 1.25rem; color: #6b7280; font-weight: 500;">/jour</span>
                        </div>
                        <div class="d-flex align-items-center" style="color: #6b7280; font-size: 0.875rem;">
                            <i class="fas fa-info-circle me-2" style="color: #1e40af;"></i>
                            <span>Prix d&eacute;gressifs pour les locations longues</span>
                        </div>
                    </div>

                    <!-- Partner Information -->
                    <div class="card mb-4" style="border-radius: 1.25rem; border: 1px solid #e5e7eb; box-shadow: 0 2px 8px rgba(0,0,0,0.04); transition: all 0.3s ease;">
                        <div class="card-body p-4">
                            <div class="d-flex align-items-center mb-3">
                                <i class="fas fa-store-alt me-2" style="color: #1e40af; font-size: 1.125rem;"></i>
                                <h6 class="fw-semibold mb-0" style="color: #1f2937; font-size: 0.9375rem; letter-spacing: 0.01em;">PROPOS&Eacute; PAR</h6>
                            </div>
                            <div class="d-flex justify-content-between align-items-center">
                                <div>
                                    <h5 id="partnerName" class="mb-2" style="color: #111827; font-weight: 700;"></h5>
                                    <div class="d-flex align-items-center">
                                        <div id="partnerRating" class="me-2"></div>
                                        <small style="color: #6b7280; font-weight: 500;" id="partnerRatingText"></small>
                                    </div>
                                </div>
                                <button class="btn btn-outline-primary btn-sm" style="border-radius: 0.75rem; padding: 0.625rem 1rem; border-width: 2px; font-weight: 600;" onclick="contactPartner()">
                                    <i class="fas fa-comment-dots me-1"></i>Contacter
                                </button>
                            </div>
                        </div>
                    </div>

                    <!-- Quick Booking Form -->
                    <div class="card mb-4" style="border-radius: 1.25rem; border: 2px solid #1e40af; background: linear-gradient(135deg, #ffffff 0%, #f8fafc 100%); box-shadow: 0 8px 25px rgba(30, 64, 175, 0.15);">
                        <div class="card-body p-4">
                            <div class="d-flex align-items-center mb-4">
                                <i class="fas fa-calendar-check me-2" style="color: #1e40af; font-size: 1.25rem;"></i>
                                <h5 class="fw-bold mb-0" style="color: #111827; font-size: 1.125rem;">R&eacute;servation Rapide</h5>
                            </div>
                            <form id="quickBookingForm">
                                <div class="row g-3">
                                    <div class="col-md-6">
                                        <label for="startDate" class="form-label fw-semibold mb-2" style="color: #374151; font-size: 0.875rem; display: flex; align-items-center;">
                                            <i class="fas fa-calendar-day me-2" style="color: #1e40af; font-size: 0.75rem;"></i>
                                            Date de d&eacute;but
                                        </label>
                                        <input type="date" class="form-control" id="startDate" required 
                                               style="border-radius: 0.875rem; border: 2px solid #e5e7eb; height: 48px; font-size: 0.9375rem; transition: all 0.3s ease;">
                                    </div>
                                    <div class="col-md-6">
                                        <label for="endDate" class="form-label fw-semibold mb-2" style="color: #374151; font-size: 0.875rem; display: flex; align-items-center;">
                                            <i class="fas fa-calendar-day me-2" style="color: #1e40af; font-size: 0.75rem;"></i>
                                            Date de fin
                                        </label>
                                        <input type="date" class="form-control" id="endDate" required 
                                               style="border-radius: 0.875rem; border: 2px solid #e5e7eb; height: 48px; font-size: 0.9375rem; transition: all 0.3s ease;">
                                    </div>
                                    <div class="col-12">
                                        <div class="p-4 mt-2" style="background: white; border-radius: 1rem; border: 2px dashed #e5e7eb;">
                                            <div class="d-flex justify-content-between align-items-center mb-3 pb-3" style="border-bottom: 1px solid #f3f4f6;">
                                                <span style="color: #6b7280; font-size: 0.9375rem;">Dur&eacute;e:</span>
                                                <span id="rentalDuration" style="font-weight: 600; color: #111827; font-size: 0.9375rem;">-</span>
                                            </div>
                                            <div class="d-flex justify-content-between align-items-center mb-3 pb-3" style="border-bottom: 1px solid #f3f4f6;">
                                                <span style="color: #6b7280; font-size: 0.9375rem;">Prix par jour:</span>
                                                <span id="dailyPrice" style="font-weight: 600; color: #111827; font-size: 0.9375rem;">-</span>
                                            </div>
                                            <div class="d-flex justify-content-between align-items-center">
                                                <span style="font-weight: 700; color: #111827; font-size: 1.125rem;">Total:</span>
                                                <span id="totalPrice" style="font-weight: 800; font-size: 1.5rem; color: #1e40af; letter-spacing: -0.01em;">-</span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-12">
                                        <button type="submit" class="btn btn-primary w-100" style="height: 54px; border-radius: 0.875rem; font-weight: 700; font-size: 1.0625rem; box-shadow: 0 4px 12px rgba(30, 64, 175, 0.3); transition: all 0.3s ease;">
                                            <i class="fas fa-calendar-plus me-2"></i>R&eacute;server Maintenant
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                    <!-- Share & Wishlist -->
                    <div class="d-flex gap-2">
                        <button class="btn btn-outline-secondary d-flex align-items-center justify-content-center" style="flex: 1; border-radius: 0.875rem; height: 48px; border-width: 2px; font-weight: 600; transition: all 0.3s ease;" onclick="addToWishlist()">
                            <i class="fas fa-heart me-2"></i>Favoris
                        </button>
                        <button class="btn btn-outline-secondary d-flex align-items-center justify-content-center" style="flex: 1; border-radius: 0.875rem; height: 48px; border-width: 2px; font-weight: 600; transition: all 0.3s ease;" onclick="shareEquipment()">
                            <i class="fas fa-share-alt me-2"></i>Partager
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Detailed Information Tabs -->
        <div class="row mt-5 pt-4" style="border-top: 2px solid #f3f4f6;">
            <div class="col-12">
                <ul class="nav nav-tabs border-0 mb-4" id="equipmentTabs" role="tablist" style="gap: 0.75rem; padding-top: 1rem;">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" id="specifications-tab" data-bs-toggle="tab" 
                                data-bs-target="#specifications" type="button" role="tab"
                                style="border-radius: 0.875rem; border: 2px solid transparent; padding: 0.875rem 1.75rem; font-weight: 600; font-size: 0.9375rem; transition: all 0.3s ease;">
                            <i class="fas fa-list-check me-2"></i>Sp&eacute;cifications
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="reviews-tab" data-bs-toggle="tab" 
                                data-bs-target="#reviews" type="button" role="tab"
                                style="border-radius: 0.875rem; border: 2px solid transparent; padding: 0.875rem 1.75rem; font-weight: 600; font-size: 0.9375rem; transition: all 0.3s ease;">
                            <i class="fas fa-star me-2"></i>Avis <span style="opacity: 0.7;">(3)</span>
                        </button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" id="availability-tab" data-bs-toggle="tab" 
                                data-bs-target="#availability" type="button" role="tab"
                                style="border-radius: 0.875rem; border: 2px solid transparent; padding: 0.875rem 1.75rem; font-weight: 600; font-size: 0.9375rem; transition: all 0.3s ease;">
                            <i class="fas fa-calendar me-2"></i>Disponibilit&eacute;
                        </button>
                    </li>
                </ul>
                
                <div class="tab-content" id="equipmentTabsContent">
                    <!-- Specifications Tab -->
                    <div class="tab-pane fade show active" id="specifications" role="tabpanel">
                        <div class="card" style="border-radius: 1.25rem; border: 1px solid #e5e7eb; box-shadow: 0 2px 8px rgba(0,0,0,0.04);">
                            <div class="card-body p-4">
                                <h5 class="fw-bold mb-4" style="color: #111827; font-size: 1.25rem;">
                                    <i class="fas fa-cog me-2" style="color: #1e40af;"></i>
                                    Sp&eacute;cifications Techniques
                                </h5>
                                <div id="specificationsList">
                                    <!-- Specifications will be loaded here -->
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Reviews Tab -->
                    <div class="tab-pane fade" id="reviews" role="tabpanel">
                        <div class="card" style="border-radius: 1.25rem; border: 1px solid #e5e7eb; box-shadow: 0 2px 8px rgba(0,0,0,0.04);">
                            <div class="card-body p-4">
                                <h5 class="fw-bold mb-4" style="color: #111827; font-size: 1.25rem;">
                                    <i class="fas fa-comments me-2" style="color: #1e40af;"></i>
                                    Avis Clients
                                </h5>
                                <div id="reviewsList">
                                    <!-- Reviews will be loaded here -->
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Availability Tab -->
                    <div class="tab-pane fade" id="availability" role="tabpanel">
                        <div class="card" style="border-radius: 1.25rem; border: 1px solid #e5e7eb; box-shadow: 0 2px 8px rgba(0,0,0,0.04);">
                            <div class="card-body p-4">
                                <h5 class="fw-bold mb-4" style="color: #111827; font-size: 1.25rem;">
                                    <i class="fas fa-calendar-alt me-2" style="color: #1e40af;"></i>
                                    Calendrier de Disponibilit&eacute;
                                </h5>
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
        <div class="row mt-5 pt-4" style="border-top: 2px solid #f3f4f6;">
            <div class="col-12">
                <div class="d-flex align-items-center mb-4 pt-3">
                    <div style="flex: 1;">
                        <h3 class="fw-bold mb-1" style="color: #111827; font-size: 1.75rem;">
                            <i class="fas fa-layer-group me-3" style="color: #1e40af;"></i>
                            &Eacute;quipements Similaires
                        </h3>
                        <p class="text-muted mb-0" style="font-size: 0.9375rem; padding-left: 2.75rem;">D&eacute;couvrez d'autres &eacute;quipements de la m&ecirc;me cat&eacute;gorie</p>
                    </div>
                    <a href="list-simple.jsp" class="btn btn-outline-primary" style="border-radius: 0.75rem; padding: 0.625rem 1.25rem; border-width: 2px; font-weight: 600;">
                        Voir tout
                        <i class="fas fa-arrow-right ms-2"></i>
                    </a>
                </div>
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
    var categoryText = document.getElementById('categoryText');
    var categoryColors = {
        'Photographie': 'linear-gradient(135deg, rgba(37, 99, 235, 0.1), rgba(37, 99, 235, 0.2))',
        'Video': 'linear-gradient(135deg, rgba(16, 185, 129, 0.1), rgba(16, 185, 129, 0.2))',
        'Audio': 'linear-gradient(135deg, rgba(6, 182, 212, 0.1), rgba(6, 182, 212, 0.2))',
        'Informatique': 'linear-gradient(135deg, rgba(245, 158, 11, 0.1), rgba(245, 158, 11, 0.2))',
        'Gaming': 'linear-gradient(135deg, rgba(220, 38, 38, 0.1), rgba(220, 38, 38, 0.2))'
    };
    categoryText.textContent = currentEquipment.categorie;
    categoryBadge.style.background = categoryColors[currentEquipment.categorie] || categoryColors['Photographie'];
    categoryBadge.style.color = '#1e40af';
    
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
        thumbnailsHtml += 'style="width: 110px; height: 82px; object-fit: cover; border-radius: 0.75rem; cursor: pointer; ';
        thumbnailsHtml += 'opacity: ' + (isActive ? '1' : '0.6') + '; transition: all 0.3s ease; ';
        thumbnailsHtml += 'border: 3px solid ' + (isActive ? '#1e40af' : 'transparent') + '; ';
        thumbnailsHtml += 'box-shadow: ' + (isActive ? '0 4px 12px rgba(30, 64, 175, 0.3)' : '0 2px 6px rgba(0,0,0,0.1)') + ';">';
    }
    thumbnailGallery.innerHTML = thumbnailsHtml;
}

function changeMainImage(index) {
    currentImageIndex = index;
    var mainImage = document.getElementById('mainImage');
    mainImage.src = currentEquipment.images[index];
    
    var thumbnails = document.querySelectorAll('.thumbnail');
    for (var i = 0; i < thumbnails.length; i++) {
        thumbnails[i].style.opacity = i === index ? '1' : '0.6';
        thumbnails[i].style.borderColor = i === index ? '#1e40af' : 'transparent';
        thumbnails[i].style.borderWidth = '3px';
        thumbnails[i].style.boxShadow = i === index ? '0 4px 12px rgba(30, 64, 175, 0.3)' : '0 2px 6px rgba(0,0,0,0.1)';
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
        var isLast = i === currentEquipment.specifications.length - 1;
        html += '<div class="d-flex align-items-start py-3' + (isLast ? '' : ' border-bottom') + '" style="' + (isLast ? '' : 'border-color: #f3f4f6;') + '">';
        html += '<div style="flex: 0 0 auto; margin-right: 1rem;">';
        html += '<i class="fas fa-check-circle" style="color: #10b981; font-size: 1.25rem;"></i>';
        html += '</div>';
        html += '<span style="color: #374151; line-height: 1.7; font-size: 0.9375rem; flex: 1;">' + currentEquipment.specifications[i] + '</span>';
        html += '</div>';
    }
    container.innerHTML = html;
}

function displayReviews() {
    var container = document.getElementById('reviewsList');
    var mockReviews = [
        { user: "Ahmed B.", rating: 5, date: "10 Jan 2024", comment: "Excellent materiel, tres bien entretenu. Le partenaire est professionnel et reactif." },
        { user: "Fatima A.", rating: 4, date: "08 Jan 2024", comment: "Bonne qualite d'image, parfait pour mon projet video. Livraison rapide." },
        { user: "Mohamed K.", rating: 5, date: "05 Jan 2024", comment: "Materiel professionnel de qualite. Je recommande vivement !" }
    ];
    
    var html = '';
    for (var i = 0; i < mockReviews.length; i++) {
        var review = mockReviews[i];
        var isLast = i === mockReviews.length - 1;
        html += '<div class="py-4' + (isLast ? '' : ' border-bottom') + '" style="' + (isLast ? '' : 'border-color: #f3f4f6;') + '">';
        html += '<div class="d-flex justify-content-between align-items-start mb-3">';
        html += '<div class="d-flex align-items-center gap-3">';
        html += '<div style="width: 48px; height: 48px; border-radius: 50%; background: linear-gradient(135deg, #1e40af, #1e3a8a); display: flex; align-items: center; justify-content: center; color: white; font-weight: 700; font-size: 1.125rem;">' + review.user.charAt(0) + '</div>';
        html += '<div>';
        html += '<strong style="color: #111827; display: block; font-size: 0.9375rem; margin-bottom: 0.25rem;">' + review.user + '</strong>';
        html += '<div class="d-flex align-items-center gap-2">';
        html += '<div>' + generateStars(review.rating) + '</div>';
        html += '<span style="color: #d1d5db;">•</span>';
        html += '<small style="color: #6b7280; font-size: 0.8125rem;">' + review.date + '</small>';
        html += '</div></div></div></div>';
        html += '<p class="mb-0" style="color: #374151; line-height: 1.7; font-size: 0.9375rem; padding-left: 3.75rem;">' + review.comment + '</p>';
        html += '</div>';
    }
    container.innerHTML = html;
}

function displayAvailabilityCalendar() {
    var container = document.getElementById('availabilityCalendar');
    var statusText = currentEquipment.disponibilite ? 'disponible' : 'loue';
    var statusColor = currentEquipment.disponibilite ? '#10b981' : '#ef4444';
    var statusBg = currentEquipment.disponibilite ? 'rgba(16, 185, 129, 0.1)' : 'rgba(239, 68, 68, 0.1)';
    
    container.innerHTML = '<div class="alert d-flex align-items-start mb-4" style="background: ' + statusBg + '; border: 2px solid ' + statusColor + '33; border-radius: 1rem; padding: 1.25rem; color: #1f2937;">' +
        '<i class="fas fa-info-circle me-3 mt-1" style="color: ' + statusColor + '; font-size: 1.25rem;"></i>' +
        '<div>' +
        '<strong style="display: block; margin-bottom: 0.5rem; font-size: 1rem;">Disponibilite en temps reel</strong>' +
        '<p class="mb-0" style="color: #374151; line-height: 1.6;">Cet equipement est actuellement <strong style="color: ' + statusColor + ';">' + statusText + '</strong>. Selectionnez vos dates dans le formulaire de reservation pour verifier la disponibilite.</p>' +
        '</div>' +
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
        html += '<div class="card-body p-4">';
        html += '<span class="badge mb-2 d-inline-flex align-items-center" style="background: rgba(37, 99, 235, 0.1); color: #1e40af; font-size: 0.75rem; padding: 0.375rem 0.75rem; border-radius: 0.5rem; font-weight: 600;">';
        html += '<i class="fas fa-tag me-1" style="font-size: 0.625rem;"></i>' + equipment.categorie;
        html += '</span>';
        html += '<h5 class="card-title mb-2" style="font-weight: 700; color: #111827; font-size: 1.125rem;">' + equipment.nom + '</h5>';
        html += '<p class="card-text mb-3" style="font-size: 0.9375rem; color: #6b7280; line-height: 1.6;">' + equipment.description.substring(0, 85) + '...</p>';
        html += '<div class="d-flex gap-2 align-items-stretch">';
        html += '<a href="?id=' + equipment.idMateriel + '" class="btn btn-primary btn-sm d-flex align-items-center justify-content-center" style="flex: 1; padding: 0.5rem 0.75rem; white-space: nowrap; font-weight: 600;">';
        html += '<i class="fas fa-eye me-1"></i>Voir';
        html += '</a>';
        html += '<button class="btn btn-outline-primary btn-sm d-flex align-items-center justify-content-center" style="flex: 1; padding: 0.5rem 0.75rem; white-space: nowrap; font-weight: 600;">';
        html += '<i class="fas fa-calendar-plus me-1"></i>Reserver';
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
    border: 2px solid transparent !important;
    background: transparent;
}

.nav-tabs .nav-link:hover {
    color: #1e40af;
    background: rgba(37, 99, 235, 0.05);
    transform: translateY(-2px);
}

.nav-tabs .nav-link.active {
    color: #1e40af !important;
    background: white !important;
    border: 2px solid #1e40af !important;
    box-shadow: 0 4px 12px rgba(30, 64, 175, 0.15);
}

.breadcrumb-item + .breadcrumb-item::before {
    content: "›";
    color: rgba(255,255,255,0.6);
    font-size: 1.125rem;
    padding: 0 0.5rem;
}

.breadcrumb-item a:hover {
    color: white !important;
}

.form-control:focus {
    border-color: #1e40af !important;
    box-shadow: 0 0 0 4px rgba(30, 64, 175, 0.1) !important;
}

.btn-primary:hover {
    transform: translateY(-2px);
    box-shadow: 0 6px 20px rgba(30, 64, 175, 0.4) !important;
}

.btn-outline-primary:hover {
    background: #1e40af !important;
    border-color: #1e40af !important;
    color: white !important;
    transform: translateY(-2px);
}

.btn-outline-secondary:hover {
    background: #374151 !important;
    border-color: #374151 !important;
    color: white !important;
    transform: translateY(-2px);
}

.card-equipment:hover {
    transform: translateY(-4px);
    box-shadow: 0 12px 30px rgba(0,0,0,0.15) !important;
}

.card-equipment:hover img {
    transform: scale(1.05);
}

.thumbnail:hover {
    opacity: 1 !important;
    transform: translateY(-2px);
}

.main-image-container button:hover {
    background: white !important;
    transform: scale(1.05);
}

/* Smooth scrollbar for thumbnails */
.thumbnail-gallery::-webkit-scrollbar {
    height: 6px;
}

.thumbnail-gallery::-webkit-scrollbar-track {
    background: #f3f4f6;
    border-radius: 3px;
}

.thumbnail-gallery::-webkit-scrollbar-thumb {
    background: #d1d5db;
    border-radius: 3px;
}

.thumbnail-gallery::-webkit-scrollbar-thumb:hover {
    background: #9ca3af;
}
</style>

<%@ include file="../../layouts/footer.jsp" %>

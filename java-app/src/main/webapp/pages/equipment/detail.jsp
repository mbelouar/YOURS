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

<div class="container" style="margin-top: 100px;">
<!-- Breadcrumb -->
    <nav aria-label="breadcrumb" class="mb-4">
        <ol class="breadcrumb" style="background: transparent; padding: 0; margin: 0;">
            <li class="breadcrumb-item">
                <a href="../../index.jsp" class="d-inline-flex align-items-center" style="color: #6b7280; text-decoration: none; font-weight: 500; transition: all 0.2s ease; font-size: 0.875rem; padding: 0.375rem 0.625rem; border-radius: 0.5rem;">
                    <i class="fas fa-home me-2" style="font-size: 0.75rem; color: #1e40af;"></i>
                    Accueil
                </a>
            </li>
            <li class="breadcrumb-item">
                <a href="list-simple.jsp" class="d-inline-flex align-items-center" style="color: #6b7280; text-decoration: none; font-weight: 500; transition: all 0.2s ease; font-size: 0.875rem; padding: 0.375rem 0.625rem; border-radius: 0.5rem;">
                    <i class="fas fa-box me-2" style="font-size: 0.75rem; color: #1e40af;"></i>
                    Mat&eacute;riel
                </a>
            </li>
            <li class="breadcrumb-item active d-inline-flex align-items-center" style="padding: 0.375rem 0.625rem;">
                <i class="fas fa-chevron-right me-2" style="font-size: 0.625rem; color: #1e40af;"></i>
                <span id="equipmentBreadcrumb" style="color: #111827; font-weight: 600; font-size: 0.875rem;">Chargement...</span>
            </li>
        </ol>
    </nav>
</div>

<div class="container pb-5">
    <!-- Loading State -->
    <div id="loadingState" class="text-center py-5">
        <div style="max-width: 300px; margin: 0 auto;">
            <div style="position: relative; width: 80px; height: 80px; margin: 0 auto 2rem;">
                <div class="spinner-border" style="color: #1e40af; width: 80px; height: 80px; border-width: 4px;" role="status">
            <span class="visually-hidden">Chargement...</span>
        </div>
                <div style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%);">
                    <i class="fas fa-box-open" style="color: #1e40af; font-size: 2rem; animation: pulse 2s ease-in-out infinite;"></i>
                </div>
            </div>
            <h5 class="fw-bold mb-2" style="color: #111827;">Chargement en cours...</h5>
            <p class="text-muted mb-0" style="font-size: 0.9375rem;">Pr&eacute;paration des d&eacute;tails de l'&eacute;quipement</p>
        </div>
    </div>

    <!-- Equipment Not Found -->
    <div id="notFoundState" class="d-none text-center py-5">
        <div style="max-width: 500px; margin: 0 auto; padding: 3rem 2rem;">
            <div style="width: 120px; height: 120px; border-radius: 50%; background: linear-gradient(135deg, rgba(239, 68, 68, 0.1), rgba(239, 68, 68, 0.05)); display: flex; align-items: center; justify-content: center; margin: 0 auto 2rem;">
                <i class="fas fa-box-open" style="font-size: 3.5rem; color: #ef4444;"></i>
        </div>
            <h3 class="fw-bold mb-3" style="color: #111827; font-size: 1.75rem;">&Eacute;quipement Non Trouv&eacute;</h3>
            <p class="mb-4" style="color: #6b7280; font-size: 1.0625rem; line-height: 1.6;">
                L'&eacute;quipement que vous recherchez n'existe pas ou n'est plus disponible dans notre catalogue.
            </p>
            <a href="list-simple.jsp" class="btn btn-primary" style="border-radius: 0.875rem; padding: 0.875rem 2rem; font-weight: 600; font-size: 1rem; box-shadow: 0 4px 12px rgba(30, 64, 175, 0.3);">
                <i class="fas fa-arrow-left me-2"></i>Retour au Catalogue
            </a>
        </div>
    </div>

    <!-- Equipment Detail Content -->
    <div id="equipmentDetail" class="d-none">
        <div class="row g-4">
            <!-- Image Gallery -->
            <div class="col-lg-6">
                <div class="equipment-detail-images" style="position: sticky; top: 6rem;">
                    <!-- Main Image -->
                    <div class="main-image-container position-relative mb-3" style="border-radius: 1.25rem; overflow: hidden; box-shadow: 0 8px 30px rgba(0,0,0,0.12); border: 1px solid rgba(0,0,0,0.05);">
                        <img id="mainImage" src="" alt="" class="img-fluid" style="width: 100%; height: 500px; object-fit: cover; cursor: zoom-in;" onclick="openImageModal()">
                        <button class="btn position-absolute" style="top: 1.25rem; right: 1.25rem; border-radius: 0.75rem; background: rgba(255,255,255,0.95); backdrop-filter: blur(10px); border: 1px solid rgba(0,0,0,0.1); padding: 0.625rem 0.875rem; box-shadow: 0 4px 12px rgba(0,0,0,0.15); transition: all 0.2s ease;" 
                                onclick="openImageModal()" title="Agrandir">
                            <i class="fas fa-expand" style="color: #1e40af;"></i>
                        </button>
                        <div class="availability-badge" id="imageBadge" style="position: absolute; top: 1.25rem; left: 1.25rem;"></div>
                    </div>
                    
                    <!-- Thumbnail Gallery -->
                    <div class="thumbnail-gallery d-flex gap-3" id="thumbnailGallery" style="overflow-x: auto; padding: 0.5rem 0;">
                        <!-- Thumbnails will be loaded here -->
                    </div>
                </div>
            </div>

            <!-- Equipment Information -->
            <div class="col-lg-6">
                <div class="equipment-info" style="position: sticky; top: 6rem;">
                    <!-- Category & Status Row -->
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <span id="equipmentCategory" class="badge d-inline-flex align-items-center" style="font-size: 0.8125rem; padding: 0.625rem 1.125rem; font-weight: 600; border-radius: 0.75rem; box-shadow: 0 2px 8px rgba(0,0,0,0.08);">
                            <i class="fas fa-tag me-2" style="font-size: 0.75rem;"></i>
                            <span id="categoryText"></span>
                        </span>
                        <div id="statusBadge" class="d-inline-flex align-items-center" style="padding: 0.625rem 1.125rem; border-radius: 0.75rem; font-weight: 600; font-size: 0.8125rem;">
                            <i class="fas fa-circle me-2" style="font-size: 0.5rem;"></i>
                            <span id="statusText"></span>
                        </div>
                    </div>

                    <!-- Title -->
                    <h1 id="equipmentName" class="display-4 fw-bold mb-3" style="color: #111827; line-height: 1.15; letter-spacing: -0.025em;"></h1>
                    <p id="equipmentDescription" class="lead mb-4" style="color: #6b7280; font-size: 1.125rem; line-height: 1.75; font-weight: 400;"></p>

                    <!-- Price Section -->
                    <div class="position-relative mb-4" style="background: linear-gradient(135deg, #1e40af 0%, #1e3a8a 100%); border-radius: 1.5rem; padding: 2rem; overflow: hidden; box-shadow: 0 12px 40px rgba(30, 64, 175, 0.25);">
                        <div style="position: absolute; top: 0; right: 0; width: 200px; height: 200px; background: radial-gradient(circle, rgba(255,255,255,0.1) 0%, transparent 70%); opacity: 0.5;"></div>
                        <div style="position: relative; z-index: 2;">
                            <div class="d-flex align-items-baseline mb-3">
                                <div id="equipmentPrice" style="font-size: 3.5rem; font-weight: 900; color: white; letter-spacing: -0.03em; text-shadow: 0 2px 10px rgba(0,0,0,0.2);"></div>
                                <span class="ms-3" style="font-size: 1.375rem; color: rgba(255,255,255,0.85); font-weight: 500;">/jour</span>
                        </div>
                            <div class="d-flex align-items-center" style="color: rgba(255,255,255,0.9); font-size: 0.9375rem;">
                                <i class="fas fa-info-circle me-2" style="font-size: 1rem;"></i>
                                <span>R&eacute;ductions disponibles pour les locations longue dur&eacute;e</span>
                            </div>
                        </div>
                    </div>

                    <!-- Partner Information -->
                    <div class="card mb-4" style="border-radius: 1.25rem; border: 1px solid #e5e7eb; background: linear-gradient(135deg, #ffffff 0%, #fafbfc 100%); box-shadow: 0 4px 15px rgba(0,0,0,0.06); transition: all 0.3s ease;">
                        <div class="card-body p-4">
                            <div class="d-flex align-items-center gap-2 mb-3 pb-3" style="border-bottom: 1px solid #f3f4f6;">
                                <div style="width: 40px; height: 40px; border-radius: 0.75rem; background: linear-gradient(135deg, #1e40af, #1e3a8a); display: flex; align-items: center; justify-content: center; box-shadow: 0 4px 12px rgba(30, 64, 175, 0.25);">
                                    <i class="fas fa-store-alt" style="color: white; font-size: 1.125rem;"></i>
                                    </div>
                                <div>
                                    <div style="color: #6b7280; font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.05em;">Partenaire</div>
                                    <h5 id="partnerName" class="mb-0" style="color: #111827; font-weight: 700; font-size: 1.125rem;"></h5>
                                </div>
                                    </div>
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="d-flex align-items-center gap-2">
                                    <div id="partnerRating"></div>
                                    <span style="color: #6b7280; font-weight: 600; font-size: 0.9375rem;" id="partnerRatingText"></span>
                                </div>
                                <button class="btn btn-primary btn-sm" style="border-radius: 0.75rem; padding: 0.625rem 1.25rem; font-weight: 600; box-shadow: 0 2px 8px rgba(30, 64, 175, 0.3);" onclick="contactPartner()">
                                    <i class="fas fa-comment-dots me-2"></i>Contacter
                                </button>
                            </div>
                        </div>
                    </div>

                    <!-- Quick Booking Form -->
                    <div class="card mb-4 position-relative" style="border-radius: 1.5rem; border: 2px solid #1e40af; background: linear-gradient(135deg, #ffffff 0%, #f8fafc 100%); box-shadow: 0 12px 40px rgba(30, 64, 175, 0.2); overflow: hidden;">
                        <div style="position: absolute; top: 0; right: 0; width: 150px; height: 150px; background: radial-gradient(circle, rgba(30, 64, 175, 0.05) 0%, transparent 70%);"></div>
                        <div class="card-body p-4" style="position: relative; z-index: 2;">
                            <div class="d-flex align-items-center mb-4 pb-3" style="border-bottom: 2px solid rgba(30, 64, 175, 0.1);">
                                <div style="width: 48px; height: 48px; border-radius: 1rem; background: linear-gradient(135deg, #1e40af, #1e3a8a); display: flex; align-items: center; justify-content: center; box-shadow: 0 4px 12px rgba(30, 64, 175, 0.3);">
                                    <i class="fas fa-calendar-check" style="color: white; font-size: 1.25rem;"></i>
                                </div>
                                <h5 class="fw-bold mb-0 ms-3" style="color: #111827; font-size: 1.25rem; letter-spacing: -0.01em;">R&eacute;servation Rapide</h5>
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
                                        <button type="submit" class="btn btn-primary w-100 position-relative" style="height: 56px; border-radius: 0.875rem; font-weight: 700; font-size: 1.125rem; box-shadow: 0 8px 20px rgba(30, 64, 175, 0.35); transition: all 0.3s ease; background: linear-gradient(135deg, #1e40af 0%, #1e3a8a 100%); border: none; overflow: hidden;">
                                            <span style="position: relative; z-index: 2;">
                                                <i class="fas fa-calendar-plus me-2"></i>R&eacute;server Maintenant
                                            </span>
                                            <div style="position: absolute; top: 0; left: -100%; width: 100%; height: 100%; background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent); transition: left 0.5s ease;"></div>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                    <!-- Share & Wishlist -->
                    <div class="d-flex gap-3">
                        <button class="btn d-flex align-items-center justify-content-center" style="flex: 1; border-radius: 0.875rem; height: 52px; background: white; border: 2px solid #e5e7eb; color: #374151; font-weight: 600; font-size: 0.9375rem; box-shadow: 0 2px 8px rgba(0,0,0,0.06); transition: all 0.3s ease;" onclick="addToWishlist()">
                            <i class="fas fa-heart me-2" style="font-size: 1rem;"></i>Ajouter aux Favoris
                        </button>
                        <button class="btn d-flex align-items-center justify-content-center" style="flex: 1; border-radius: 0.875rem; height: 52px; background: white; border: 2px solid #e5e7eb; color: #374151; font-weight: 600; font-size: 0.9375rem; box-shadow: 0 2px 8px rgba(0,0,0,0.06); transition: all 0.3s ease;" onclick="shareEquipment()">
                            <i class="fas fa-share-alt me-2" style="font-size: 1rem;"></i>Partager
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
<div class="modal fade" id="imageModal" tabindex="-1" style="background: rgba(0,0,0,0.95); backdrop-filter: blur(10px);">
    <div class="modal-dialog modal-fullscreen">
        <div class="modal-content" style="background: transparent; border: none;">
            <div class="modal-header border-0 position-absolute w-100" style="z-index: 1050; background: linear-gradient(180deg, rgba(0,0,0,0.7) 0%, transparent 100%); padding: 1.5rem 2rem;">
                <h5 class="modal-title fw-bold d-flex align-items-center" id="imageModalTitle" style="color: white; font-size: 1.125rem;">
                    <i class="fas fa-images me-3" style="color: #fbbf24;"></i>
                    <span></span>
                </h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" style="font-size: 1rem; opacity: 0.9;"></button>
            </div>
            <div class="modal-body d-flex align-items-center justify-content-center p-0" style="min-height: 100vh; position: relative;">
                <div class="position-relative" style="max-width: 85%; max-height: 80vh;">
                    <img id="modalImage" src="" alt="" class="img-fluid" style="max-height: 80vh; width: auto; object-fit: contain; border-radius: 0.75rem; box-shadow: 0 20px 60px rgba(0,0,0,0.8);">
                </div>
                
                <!-- Side Navigation Areas (Invisible but clickable) -->
                <div onclick="navigateImage(-1)" id="prevArea" style="position: absolute; left: 0; top: 0; bottom: 0; width: 15%; cursor: w-resize; z-index: 10; display: none;"></div>
                <div onclick="navigateImage(1)" id="nextArea" style="position: absolute; right: 0; top: 0; bottom: 0; width: 15%; cursor: e-resize; z-index: 10; display: none;"></div>
            </div>
            
            <!-- Navigation & Actions Bar -->
            <div class="position-absolute w-100 bottom-0" style="background: linear-gradient(0deg, rgba(0,0,0,0.85) 0%, transparent 100%); padding: 1.5rem 2rem 2rem; z-index: 1050;">
                <div class="d-flex flex-column align-items-center gap-3">
                    <!-- Thumbnail Navigation -->
                    <div id="modalThumbnails" class="d-flex gap-2 justify-content-center" style="max-width: 600px; overflow-x: auto; padding: 0.5rem;">
                        <!-- Thumbnails will be loaded here -->
                    </div>
                    
                    <!-- Counter & Download -->
                    <div class="d-flex justify-content-center align-items-center gap-3">
                        <div id="imageCounter" class="d-flex align-items-center" style="background: rgba(255,255,255,0.2); backdrop-filter: blur(20px); padding: 0.5rem 1rem; border-radius: 0.625rem; color: white; font-weight: 700; font-size: 0.875rem; border: 1px solid rgba(255,255,255,0.2); box-shadow: 0 4px 12px rgba(0,0,0,0.3); transition: all 0.3s ease;">
                            <i class="fas fa-images me-2" style="color: #fbbf24; font-size: 0.875rem;"></i>
                            <span><!-- Counter will be updated here --></span>
                        </div>
                        <button class="btn btn-sm d-flex align-items-center" onclick="downloadImage()" style="background: linear-gradient(135deg, rgba(30, 64, 175, 0.9), rgba(30, 58, 138, 0.9)); backdrop-filter: blur(20px); color: white; border: 1px solid rgba(255,255,255,0.2); padding: 0.5rem 1rem; border-radius: 0.625rem; font-weight: 600; font-size: 0.875rem; box-shadow: 0 4px 12px rgba(30, 64, 175, 0.4); transition: all 0.3s ease;">
                            <i class="fas fa-download me-2"></i>T&eacute;l&eacute;charger
                        </button>
                    </div>
                </div>
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
    var statusBadge = document.getElementById('statusBadge');
    var statusText = document.getElementById('statusText');
    
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
    var availabilityColor = currentEquipment.disponibilite ? '#10b981' : '#ef4444';
    var availabilityBg = currentEquipment.disponibilite ? 'rgba(16, 185, 129, 0.1)' : 'rgba(239, 68, 68, 0.1)';
    
    statusText.textContent = availabilityText;
    statusBadge.style.background = availabilityBg;
    statusBadge.style.color = availabilityColor;
    statusBadge.querySelector('i').style.color = availabilityColor;
    statusBadge.style.border = '1px solid ' + availabilityColor + '33';
    
    document.getElementById('imageBadge').textContent = availabilityText;
    
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
        thumbnailsHtml += '<div style="position: relative; flex-shrink: 0;">';
        thumbnailsHtml += '<img src="' + currentEquipment.images[i] + '" ';
        thumbnailsHtml += 'alt="' + currentEquipment.nom + ' ' + (i + 1) + '" ';
        thumbnailsHtml += 'class="thumbnail' + (isActive ? ' active' : '') + '" ';
        thumbnailsHtml += 'onclick="changeMainImage(' + i + ')" ';
        thumbnailsHtml += 'style="width: 110px; height: 82px; object-fit: cover; border-radius: 0.875rem; cursor: pointer; ';
        thumbnailsHtml += 'opacity: ' + (isActive ? '1' : '0.6') + '; transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1); ';
        thumbnailsHtml += 'border: 3px solid ' + (isActive ? '#1e40af' : '#e5e7eb') + '; ';
        thumbnailsHtml += 'box-shadow: ' + (isActive ? '0 6px 16px rgba(30, 64, 175, 0.35)' : '0 2px 8px rgba(0,0,0,0.08)') + ';">';
        if (isActive) {
            thumbnailsHtml += '<div style="position: absolute; top: 0.375rem; right: 0.375rem; width: 20px; height: 20px; background: linear-gradient(135deg, #1e40af, #1e3a8a); border-radius: 50%; border: 2px solid white; display: flex; align-items: center; justify-content: center; box-shadow: 0 2px 6px rgba(0,0,0,0.2);">';
            thumbnailsHtml += '<i class="fas fa-check" style="color: white; font-size: 0.625rem;"></i>';
            thumbnailsHtml += '</div>';
        }
        thumbnailsHtml += '</div>';
    }
    thumbnailGallery.innerHTML = thumbnailsHtml;
}

function changeMainImage(index) {
    currentImageIndex = index;
    var mainImage = document.getElementById('mainImage');
    mainImage.src = currentEquipment.images[index];
    
    // Update all thumbnails
    var thumbnailContainers = document.getElementById('thumbnailGallery').children;
    for (var i = 0; i < thumbnailContainers.length; i++) {
        var img = thumbnailContainers[i].querySelector('.thumbnail');
        var isActive = i === index;
        
        img.style.opacity = isActive ? '1' : '0.6';
        img.style.borderColor = isActive ? '#1e40af' : '#e5e7eb';
        img.style.boxShadow = isActive ? '0 6px 16px rgba(30, 64, 175, 0.35)' : '0 2px 8px rgba(0,0,0,0.08)';
        
        // Update checkmark
        var existingCheck = thumbnailContainers[i].querySelector('div:last-child');
        if (existingCheck && existingCheck.querySelector('.fa-check')) {
            existingCheck.remove();
        }
        
        if (isActive) {
            var checkmark = document.createElement('div');
            checkmark.style.cssText = 'position: absolute; top: 0.375rem; right: 0.375rem; width: 20px; height: 20px; background: linear-gradient(135deg, #1e40af, #1e3a8a); border-radius: 50%; border: 2px solid white; display: flex; align-items: center; justify-content: center; box-shadow: 0 2px 6px rgba(0,0,0,0.2);';
            checkmark.innerHTML = '<i class="fas fa-check" style="color: white; font-size: 0.625rem;"></i>';
            thumbnailContainers[i].appendChild(checkmark);
        }
    }
}

function openImageModal() {
    var modal = new bootstrap.Modal(document.getElementById('imageModal'));
    updateModalImage();
    populateModalThumbnails();
    
    // Show/hide navigation areas
    var prevArea = document.getElementById('prevArea');
    var nextArea = document.getElementById('nextArea');
    var hasMultipleImages = currentEquipment.images.length > 1;
    
    if (hasMultipleImages) {
        prevArea.style.display = 'block';
        nextArea.style.display = 'block';
    }
    
    modal.show();
    
    // Add keyboard navigation
    document.addEventListener('keydown', handleModalKeyboard);
}

function populateModalThumbnails() {
    var container = document.getElementById('modalThumbnails');
    var html = '';
    
    for (var i = 0; i < currentEquipment.images.length; i++) {
        var isActive = i === currentImageIndex;
        html += '<div onclick="changeMainImage(' + i + ')" class="modal-thumb" style="position: relative; cursor: pointer; transition: all 0.3s ease;">';
        html += '<img src="' + currentEquipment.images[i] + '" ';
        html += 'style="width: 80px; height: 60px; object-fit: cover; border-radius: 0.5rem; ';
        html += 'opacity: ' + (isActive ? '1' : '0.5') + '; ';
        html += 'border: 2px solid ' + (isActive ? '#fbbf24' : 'rgba(255,255,255,0.3)') + '; ';
        html += 'box-shadow: ' + (isActive ? '0 4px 16px rgba(251, 191, 36, 0.5)' : '0 2px 8px rgba(0,0,0,0.3)') + '; ';
        html += 'transition: all 0.3s ease;">';
        if (isActive) {
            html += '<div style="position: absolute; top: -6px; left: 50%; transform: translateX(-50%); width: 16px; height: 3px; background: #fbbf24; border-radius: 2px; box-shadow: 0 0 10px rgba(251, 191, 36, 0.8);"></div>';
        }
        html += '</div>';
    }
    
    container.innerHTML = html;
}

function handleModalKeyboard(e) {
    var modal = document.getElementById('imageModal');
    if (!modal.classList.contains('show')) return;
    
    if (e.key === 'ArrowLeft') {
        navigateImage(-1);
    } else if (e.key === 'ArrowRight') {
        navigateImage(1);
    } else if (e.key === 'Escape') {
        bootstrap.Modal.getInstance(modal).hide();
        document.removeEventListener('keydown', handleModalKeyboard);
    }
}

function updateModalImage() {
    var modalImage = document.getElementById('modalImage');
    var modalTitle = document.getElementById('imageModalTitle').querySelector('span');
    var imageCounter = document.getElementById('imageCounter').querySelector('span');
    
    modalImage.src = currentEquipment.images[currentImageIndex];
    modalTitle.textContent = currentEquipment.nom;
    imageCounter.textContent = (currentImageIndex + 1) + ' / ' + currentEquipment.images.length;
}

function navigateImage(direction) {
    var newIndex = currentImageIndex + direction;
    
    if (newIndex < 0) {
        newIndex = currentEquipment.images.length - 1;
    } else if (newIndex >= currentEquipment.images.length) {
        newIndex = 0;
    }
    
    currentImageIndex = newIndex;
    updateModalImage();
    
    // Update modal thumbnails if modal is open
    if (document.getElementById('imageModal').classList.contains('show')) {
        populateModalThumbnails();
    }
}

function downloadImage() {
    var link = document.createElement('a');
    link.href = currentEquipment.images[currentImageIndex];
    link.download = currentEquipment.nom + '_image_' + (currentImageIndex + 1) + '.jpg';
    document.body.appendChild(link);
    link.click();
    document.body.removeChild(link);
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
    color: #d1d5db;
    font-size: 0.875rem;
    padding: 0 0.5rem;
}

.breadcrumb-item a:hover {
    background: #f3f4f6 !important;
    color: #1e40af !important;
}

.breadcrumb {
    transition: all 0.2s ease;
}

.form-control:focus {
    border-color: #1e40af !important;
    box-shadow: 0 0 0 4px rgba(30, 64, 175, 0.1) !important;
}

.btn-primary:hover {
    transform: translateY(-3px);
    box-shadow: 0 12px 30px rgba(30, 64, 175, 0.45) !important;
}

.btn-primary:active {
    transform: translateY(0);
}

.btn-outline-primary:hover {
    background: #1e40af !important;
    border-color: #1e40af !important;
    color: white !important;
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(30, 64, 175, 0.3) !important;
}

.btn[onclick*="Wishlist"]:hover,
.btn[onclick*="shareEquipment"]:hover {
    background: #f9fafb !important;
    border-color: #1e40af !important;
    color: #1e40af !important;
    transform: translateY(-3px);
    box-shadow: 0 8px 20px rgba(0,0,0,0.12) !important;
}

.btn[onclick*="Wishlist"]:hover i {
    color: #ef4444 !important;
}

.card:hover {
    box-shadow: 0 8px 25px rgba(0,0,0,0.12) !important;
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

/* Fade-in animation */
@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(20px);
    }
    to {
    opacity: 1;
        transform: translateY(0);
    }
}

#equipmentDetail {
    animation: fadeIn 0.6s ease-out;
}

/* Shimmer effect for loading */
@keyframes shimmer {
    0% {
        background-position: -1000px 0;
    }
    100% {
        background-position: 1000px 0;
    }
}

.main-image-container {
    transition: all 0.3s ease;
}

.main-image-container:hover {
    box-shadow: 0 12px 40px rgba(0,0,0,0.18) !important;
    transform: translateY(-2px);
}

/* Partner card hover */
.card-body:has(#partnerName) {
    transition: all 0.3s ease;
}

/* Enhanced focus states */
input[type="date"]:focus {
    transform: translateY(-1px);
}

/* Book button shine effect on hover */
button[type="submit"]:hover div {
    left: 100% !important;
}

/* Tab content fade in */
.tab-pane {
    animation: fadeIn 0.4s ease-out;
}

/* Review avatar pulse */
@keyframes pulse {
    0%, 100% {
        transform: scale(1);
    }
    50% {
        transform: scale(1.05);
    }
}

/* Price card gradient animation */
@keyframes gradientShift {
    0% {
        background-position: 0% 50%;
    }
    50% {
        background-position: 100% 50%;
    }
    100% {
        background-position: 0% 50%;
    }
}

/* Smooth page transitions */
body {
    overflow-x: hidden;
}

/* Enhanced shadows on interactive elements */
.card-body:has(#partnerName):hover {
    transform: translateY(-2px);
}

/* Input animations */
input[type="date"] {
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
}

input[type="date"]:hover {
    border-color: #9ca3af !important;
}

/* Modal Enhancements */
#imageModal .modal-content {
    animation: fadeIn 0.3s ease-out;
}

#modalImage {
    animation: zoomIn 0.4s cubic-bezier(0.4, 0, 0.2, 1);
}

@keyframes zoomIn {
    from {
        opacity: 0;
        transform: scale(0.9);
    }
    to {
        opacity: 1;
        transform: scale(1);
    }
}

/* Modal thumbnail navigation */
.modal-thumb:hover img {
    opacity: 1 !important;
    transform: scale(1.1);
    border-color: #fbbf24 !important;
    box-shadow: 0 6px 20px rgba(251, 191, 36, 0.6) !important;
}

.modal-thumb img {
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
}

/* Side navigation areas - show hint on hover */
#prevArea:hover::before,
#nextArea:hover::before {
    content: '';
    position: absolute;
    top: 0;
    bottom: 0;
    width: 100%;
    background: linear-gradient(90deg, rgba(255,255,255,0.05) 0%, transparent 100%);
    pointer-events: none;
}

#nextArea:hover::before {
    background: linear-gradient(270deg, rgba(255,255,255,0.05) 0%, transparent 100%);
}

/* Thumbnail scrollbar */
#modalThumbnails::-webkit-scrollbar {
    height: 4px;
}

#modalThumbnails::-webkit-scrollbar-track {
    background: rgba(255,255,255,0.1);
    border-radius: 2px;
}

#modalThumbnails::-webkit-scrollbar-thumb {
    background: rgba(255,255,255,0.3);
    border-radius: 2px;
}

#modalThumbnails::-webkit-scrollbar-thumb:hover {
    background: rgba(255,255,255,0.5);
}

.modal-header button:hover {
    transform: scale(1.1);
}

/* Download button hover */
button[onclick="downloadImage()"]:hover {
    transform: translateY(-2px) !important;
    box-shadow: 0 8px 20px rgba(30, 64, 175, 0.6) !important;
    background: linear-gradient(135deg, #1e40af, #1e3a8a) !important;
}

button[onclick="downloadImage()"]:active {
    transform: translateY(0) !important;
}

/* Image counter hover */
#imageCounter:hover {
    background: rgba(255,255,255,0.25) !important;
    transform: scale(1.05);
}

/* Keyboard navigation hint */
#imageModal::after {
    content: "Cliquez sur les côtés ou utilisez ← → | ESC pour fermer";
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    background: rgba(0,0,0,0.8);
    backdrop-filter: blur(10px);
    color: rgba(255,255,255,0.8);
    padding: 0.75rem 1.5rem;
    border-radius: 0.75rem;
    font-size: 0.875rem;
    font-weight: 500;
    border: 1px solid rgba(255,255,255,0.2);
    box-shadow: 0 4px 16px rgba(0,0,0,0.5);
    pointer-events: none;
    z-index: 1051;
    opacity: 0;
    animation: fadeInOut 4s ease-in-out 0.5s;
}

@keyframes fadeInOut {
    0%, 100% { opacity: 0; }
    10%, 90% { opacity: 1; }
}

/* Responsive adjustments */
@media (max-width: 991px) {
    .equipment-detail-images,
    .equipment-info {
        position: static !important;
    }
    
    .main-image-container img {
        height: 350px !important;
    }
    
    #equipmentName {
        font-size: 2rem !important;
    }
    
    #equipmentPrice {
        font-size: 2.5rem !important;
    }
    
    #modalThumbnails {
        max-width: 90% !important;
    }
    
    #prevArea,
    #nextArea {
        display: block !important;
        width: 20% !important;
    }
}

@media (max-width: 767px) {
    .main-image-container img {
        height: 300px !important;
    }
    
    .thumbnail {
        width: 80px !important;
        height: 60px !important;
    }
}
</style>

<%@ include file="../../layouts/footer.jsp" %>

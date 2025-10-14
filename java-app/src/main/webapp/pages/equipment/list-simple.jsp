<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../layouts/header.jsp" %>
<%@ include file="../../layouts/navbar.jsp" %>

<!-- Page Header -->
<section class="py-5" style="background: linear-gradient(135deg, #1e40af 0%, #1e3a8a 50%, #1e293b 100%); margin-top: -80px; padding-top: calc(80px + 6rem) !important; padding-bottom: 6rem !important; position: relative; overflow: hidden;">
    <div style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; background: radial-gradient(circle at 20% 50%, rgba(59, 130, 246, 0.15) 0%, transparent 50%); opacity: 1;"></div>
    <div class="container" style="position: relative; z-index: 2;">
        <div class="row">
            <div class="col-lg-10 mx-auto text-center">
                <!-- Badge -->
                <div class="d-inline-flex align-items-center mb-4" style="background: rgba(255, 255, 255, 0.15); backdrop-filter: blur(20px); border-radius: 50px; padding: 0.75rem 1.5rem; border: 1px solid rgba(255, 255, 255, 0.2); box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);">
                    <i class="fas fa-tools me-2" style="color: #fbbf24; font-size: 1rem;"></i>
                    <span style="color: white; font-weight: 600; font-size: 0.875rem; letter-spacing: 0.5px;">CATALOGUE PROFESSIONNEL</span>
                </div>
                
                <!-- Main Title -->
                <h1 class="display-2 fw-bold mb-4" style="color: white; text-shadow: 0 4px 20px rgba(0,0,0,0.3); letter-spacing: -0.03em; line-height: 1.1;">
                    Mat&eacute;riel <span style="background: linear-gradient(135deg, #fbbf24, #f59e0b); -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text;">Professionnel</span>
                </h1>
                
                <!-- Subtitle -->
                <div class="mb-4" style="max-width: 700px; margin: 0 auto;">
                    <p class="lead mb-2" style="color: rgba(255, 255, 255, 0.95); font-size: 1.375rem; font-weight: 400; line-height: 1.6; letter-spacing: -0.01em;">
                        Explorez notre collection exclusive d'&eacute;quipements haut de gamme
                    </p>
                    <p class="mb-0" style="color: rgba(255, 255, 255, 0.8); font-size: 1.1rem; font-weight: 300; line-height: 1.7;">
                        Solutions professionnelles pour tous vos projets • Disponibilit&eacute; garantie • Livraison rapide
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
                                <input type="text" id="searchInput" class="form-control" placeholder="Rechercher par nom, marque, mod&egrave;le..." 
                                       style="padding-left: 2.875rem; padding-right: 2.875rem; border-radius: 0.875rem; border: 2px solid var(--gray-200); height: 48px; font-size: 0.9375rem; transition: all 0.3s ease; background: white;">
                                <button class="btn btn-link position-absolute d-none" id="clearSearch" style="right: 0.5rem; top: 50%; transform: translateY(-50%); color: var(--gray-400); text-decoration: none; padding: 0.25rem 0.5rem;">
                                    <i class="fas fa-times-circle"></i>
                                </button>
                            </div>
                        </div>
                        
                        <!-- Category Filter -->
                        <div class="col-lg-3">
                            <label class="form-label fw-semibold mb-2" style="color: var(--gray-700); font-size: 0.875rem; display: flex; align-items-center;">
                                <i class="fas fa-folder-open me-2" style="color: var(--primary-600); font-size: 0.875rem;"></i>
                                Cat&eacute;gorie
                            </label>
                            <select class="form-select" id="categoryFilter" style="border-radius: 0.875rem; border: 2px solid var(--gray-200); height: 48px; font-size: 0.9375rem; transition: all 0.3s ease; background: white;">
                                <option value="" selected>Toutes cat&eacute;gories</option>
                                <option value="photo">Photographie</option>
                                <option value="video">Vid&eacute;o</option>
                                <option value="info">Informatique</option>
                                <option value="audio">Audio</option>
                                <option value="gaming">Gaming</option>
                                <option value="light">&Eacute;clairage</option>
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
                
                <!-- Advanced Filters Panel (Hidden by default) -->
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
                            <!-- Price Range -->
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
                            
                            <!-- Availability -->
                            <div class="col-md-6">
                                <label class="form-label fw-semibold mb-2" style="color: var(--gray-700); font-size: 0.875rem;">
                                    <i class="fas fa-calendar-check me-1" style="color: var(--primary-600); font-size: 0.75rem;"></i>
                                    Disponibilit&eacute;
                                </label>
                                <select id="availabilityFilter" class="form-select form-select-sm" style="border-radius: 0.5rem;">
                                    <option value="">Tous</option>
                                    <option value="1">Disponible</option>
                                    <option value="0">Non disponible</option>
                                </select>
                            </div>
                        </div>
                        
                        <!-- Action Buttons -->
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
                
                <!-- Results Bar & Quick Filters -->
                <div class="d-flex flex-wrap justify-content-between align-items-center gap-3 mb-4">
                    <!-- Results Count -->
                    <div class="d-flex align-items-center" style="background: white; padding: 0.625rem 1.125rem; border-radius: 0.75rem; border: 1px solid var(--gray-200); box-shadow: 0 1px 3px rgba(0,0,0,0.05);">
                        <i class="fas fa-box-open me-2" style="color: var(--primary-600); font-size: 0.875rem;"></i>
                        <span style="font-weight: 600; color: var(--gray-900); font-size: 0.9375rem;">248</span>
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
            <div class="row g-4" id="equipmentGrid">
                <div class="col-lg-4 col-md-6">
                    <div class="card card-modern card-equipment h-100">
                        <div class="position-relative">
                            <img src="https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600&auto=format&fit=crop&q=80" 
                                 class="card-img-top" alt="Canon EOS R5">
                            <div class="availability-badge">Disponible</div>
                            <div class="price-badge">240 MAD/jour</div>
                        </div>
                        <div class="card-body">
                            <div class="mb-2">
                                <span class="badge" style="background: linear-gradient(135deg, rgba(37, 99, 235, 0.1), rgba(37, 99, 235, 0.2)); color: var(--primary-600); font-size: 0.75rem; padding: 0.375rem 0.75rem; border-radius: 0.5rem; font-weight: 600;">
                                    <i class="fas fa-camera me-1"></i>Photographie
                                </span>
                            </div>
                            <h5 class="card-title mb-2">Canon EOS R5</h5>
                            <p class="card-text text-muted mb-3" style="font-size: 0.9375rem; line-height: 1.6;">Appareil photo professionnel 45MP avec stabilisation int&eacute;gr&eacute;e</p>
                            <div class="d-flex align-items-center mb-3">
                                <div class="rating me-2">
                                    <i class="fas fa-star" style="color: #fbbf24; font-size: 0.875rem;"></i>
                                    <i class="fas fa-star" style="color: #fbbf24; font-size: 0.875rem;"></i>
                                    <i class="fas fa-star" style="color: #fbbf24; font-size: 0.875rem;"></i>
                                    <i class="fas fa-star" style="color: #fbbf24; font-size: 0.875rem;"></i>
                                    <i class="fas fa-star" style="color: #fbbf24; font-size: 0.875rem;"></i>
                                </div>
                                <small class="text-muted">(4.9)</small>
                            </div>
                            <div class="d-flex gap-2 align-items-stretch">
                                <a href="${pageContext.request.contextPath}/pages/equipment/detail.jsp?id=1" class="btn btn-primary btn-sm d-flex align-items-center justify-content-center" style="flex: 1; padding: 0.5rem 0.75rem; white-space: nowrap;">
                                    <i class="fas fa-eye me-1"></i>Voir
                                </a>
                                <button class="btn btn-outline-primary btn-sm d-flex align-items-center justify-content-center" style="flex: 1; padding: 0.5rem 0.75rem; white-space: nowrap;">
                                    <i class="fas fa-calendar-plus me-1"></i>R&eacute;server
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="card card-modern card-equipment h-100">
                        <div class="position-relative">
                            <img src="https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600&auto=format&fit=crop&q=80" 
                                 class="card-img-top" alt="MacBook Pro">
                            <div class="availability-badge">Disponible</div>
                            <div class="price-badge">150 MAD/jour</div>
                        </div>
                        <div class="card-body">
                            <div class="mb-2">
                                <span class="badge" style="background: linear-gradient(135deg, rgba(245, 158, 11, 0.1), rgba(245, 158, 11, 0.2)); color: var(--warning-color); font-size: 0.75rem; padding: 0.375rem 0.75rem; border-radius: 0.5rem; font-weight: 600;">
                                    <i class="fas fa-laptop me-1"></i>Informatique
                                </span>
                            </div>
                            <h5 class="card-title mb-2">MacBook Pro 16"</h5>
                            <p class="card-text text-muted mb-3" style="font-size: 0.9375rem; line-height: 1.6;">Ordinateur portable M2 Pro pour montage vid&eacute;o professionnel</p>
                            <div class="d-flex align-items-center mb-3">
                                <div class="rating me-2">
                                    <i class="fas fa-star" style="color: #fbbf24; font-size: 0.875rem;"></i>
                                    <i class="fas fa-star" style="color: #fbbf24; font-size: 0.875rem;"></i>
                                    <i class="fas fa-star" style="color: #fbbf24; font-size: 0.875rem;"></i>
                                    <i class="fas fa-star" style="color: #fbbf24; font-size: 0.875rem;"></i>
                                    <i class="fas fa-star" style="color: #fbbf24; font-size: 0.875rem;"></i>
                                </div>
                                <small class="text-muted">(4.8)</small>
                            </div>
                            <div class="d-flex gap-2 align-items-stretch">
                                <a href="${pageContext.request.contextPath}/pages/equipment/detail.jsp?id=2" class="btn btn-primary btn-sm d-flex align-items-center justify-content-center" style="flex: 1; padding: 0.5rem 0.75rem; white-space: nowrap;">
                                    <i class="fas fa-eye me-1"></i>Voir
                                </a>
                                <button class="btn btn-outline-primary btn-sm d-flex align-items-center justify-content-center" style="flex: 1; padding: 0.5rem 0.75rem; white-space: nowrap;">
                                    <i class="fas fa-calendar-plus me-1"></i>R&eacute;server
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="card card-modern card-equipment h-100">
                        <div class="position-relative">
                            <img src="https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600&auto=format&fit=crop&q=80"
                                 class="card-img-top" alt="Sony A7 III">
                            <div class="availability-badge">Disponible</div>
                            <div class="price-badge">180 MAD/jour</div>
                        </div>
                        <div class="card-body">
                            <div class="mb-2">
                                <span class="badge" style="background: linear-gradient(135deg, rgba(37, 99, 235, 0.1), rgba(37, 99, 235, 0.2)); color: var(--primary-600); font-size: 0.75rem; padding: 0.375rem 0.75rem; border-radius: 0.5rem; font-weight: 600;">
                                    <i class="fas fa-camera me-1"></i>Photographie
                                </span>
                            </div>
                            <h5 class="card-title mb-2">Sony A7 III</h5>
                            <p class="card-text text-muted mb-3" style="font-size: 0.9375rem; line-height: 1.6;">Appareil photo hybride 24MP avec autofocus rapide et pr&eacute;cis</p>
                            <div class="d-flex align-items-center mb-3">
                                <div class="rating me-2">
                                    <i class="fas fa-star" style="color: #fbbf24; font-size: 0.875rem;"></i>
                                    <i class="fas fa-star" style="color: #fbbf24; font-size: 0.875rem;"></i>
                                    <i class="fas fa-star" style="color: #fbbf24; font-size: 0.875rem;"></i>
                                    <i class="fas fa-star" style="color: #fbbf24; font-size: 0.875rem;"></i>
                                    <i class="fas fa-star-half-alt" style="color: #fbbf24; font-size: 0.875rem;"></i>
                                </div>
                                <small class="text-muted">(4.7)</small>
                            </div>
                            <div class="d-flex gap-2 align-items-stretch">
                                <a href="${pageContext.request.contextPath}/pages/equipment/detail.jsp?id=3" class="btn btn-primary btn-sm d-flex align-items-center justify-content-center" style="flex: 1; padding: 0.5rem 0.75rem; white-space: nowrap;">
                                    <i class="fas fa-eye me-1"></i>Voir
                                </a>
                                <button class="btn btn-outline-primary btn-sm d-flex align-items-center justify-content-center" style="flex: 1; padding: 0.5rem 0.75rem; white-space: nowrap;">
                                    <i class="fas fa-calendar-plus me-1"></i>R&eacute;server
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="card card-modern card-equipment h-100">
                        <div class="position-relative">
                            <img src="https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600&auto=format&fit=crop&q=80"
                                 class="card-img-top" alt="iPad Pro">
                            <div class="availability-badge">Disponible</div>
                            <div class="price-badge">75 MAD/jour</div>
                        </div>
                        <div class="card-body">
                            <div class="mb-2">
                                <span class="badge" style="background: linear-gradient(135deg, rgba(245, 158, 11, 0.1), rgba(245, 158, 11, 0.2)); color: var(--warning-color); font-size: 0.75rem; padding: 0.375rem 0.75rem; border-radius: 0.5rem; font-weight: 600;">
                                    <i class="fas fa-laptop me-1"></i>Informatique
                                </span>
                            </div>
                            <h5 class="card-title mb-2">iPad Pro 12.9"</h5>
                            <p class="card-text text-muted mb-3" style="font-size: 0.9375rem; line-height: 1.6;">Tablette professionnelle M2 id&eacute;ale pour la cr&eacute;ation</p>
                            <div class="d-flex align-items-center mb-3">
                                <div class="rating me-2">
                                    <i class="fas fa-star" style="color: #fbbf24; font-size: 0.875rem;"></i>
                                    <i class="fas fa-star" style="color: #fbbf24; font-size: 0.875rem;"></i>
                                    <i class="fas fa-star" style="color: #fbbf24; font-size: 0.875rem;"></i>
                                    <i class="fas fa-star" style="color: #fbbf24; font-size: 0.875rem;"></i>
                                    <i class="fas fa-star" style="color: #fbbf24; font-size: 0.875rem;"></i>
                                </div>
                                <small class="text-muted">(5.0)</small>
                            </div>
                            <div class="d-flex gap-2 align-items-stretch">
                                <a href="${pageContext.request.contextPath}/pages/equipment/detail.jsp?id=4" class="btn btn-primary btn-sm d-flex align-items-center justify-content-center" style="flex: 1; padding: 0.5rem 0.75rem; white-space: nowrap;">
                                    <i class="fas fa-eye me-1"></i>Voir
                                </a>
                                <button class="btn btn-outline-primary btn-sm d-flex align-items-center justify-content-center" style="flex: 1; padding: 0.5rem 0.75rem; white-space: nowrap;">
                                    <i class="fas fa-calendar-plus me-1"></i>R&eacute;server
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="card card-modern card-equipment h-100">
                        <div class="position-relative">
                            <img src="https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600&auto=format&fit=crop&q=80"
                                 class="card-img-top" alt="DJI Mavic">
                            <div class="availability-badge">Disponible</div>
                            <div class="price-badge">120 MAD/jour</div>
                        </div>
                        <div class="card-body">
                            <div class="mb-2">
                                <span class="badge" style="background: linear-gradient(135deg, rgba(16, 185, 129, 0.1), rgba(16, 185, 129, 0.2)); color: var(--success-color); font-size: 0.75rem; padding: 0.375rem 0.75rem; border-radius: 0.5rem; font-weight: 600;">
                                    <i class="fas fa-video me-1"></i>Vid&eacute;o
                                </span>
                            </div>
                            <h5 class="card-title mb-2">DJI Mavic Air 2</h5>
                            <p class="card-text text-muted mb-3" style="font-size: 0.9375rem; line-height: 1.6;">Drone professionnel 4K avec stabilisation 3 axes avanc&eacute;e</p>
                            <div class="d-flex align-items-center mb-3">
                                <div class="rating me-2">
                                    <i class="fas fa-star" style="color: #fbbf24; font-size: 0.875rem;"></i>
                                    <i class="fas fa-star" style="color: #fbbf24; font-size: 0.875rem;"></i>
                                    <i class="fas fa-star" style="color: #fbbf24; font-size: 0.875rem;"></i>
                                    <i class="fas fa-star" style="color: #fbbf24; font-size: 0.875rem;"></i>
                                    <i class="far fa-star" style="color: #fbbf24; font-size: 0.875rem;"></i>
                                </div>
                                <small class="text-muted">(4.6)</small>
                            </div>
                            <div class="d-flex gap-2 align-items-stretch">
                                <a href="${pageContext.request.contextPath}/pages/equipment/detail.jsp?id=5" class="btn btn-primary btn-sm d-flex align-items-center justify-content-center" style="flex: 1; padding: 0.5rem 0.75rem; white-space: nowrap;">
                                    <i class="fas fa-eye me-1"></i>Voir
                                </a>
                                <button class="btn btn-outline-primary btn-sm d-flex align-items-center justify-content-center" style="flex: 1; padding: 0.5rem 0.75rem; white-space: nowrap;">
                                    <i class="fas fa-calendar-plus me-1"></i>R&eacute;server
                                </button>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="card card-modern card-equipment h-100">
                        <div class="position-relative">
                            <img src="https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600&auto=format&fit=crop&q=80"
                                 class="card-img-top" alt="Rode Microphone">
                            <div class="availability-badge">Disponible</div>
                            <div class="price-badge">30 MAD/jour</div>
                        </div>
                        <div class="card-body">
                            <div class="mb-2">
                                <span class="badge" style="background: linear-gradient(135deg, rgba(6, 182, 212, 0.1), rgba(6, 182, 212, 0.2)); color: var(--info-color); font-size: 0.75rem; padding: 0.375rem 0.75rem; border-radius: 0.5rem; font-weight: 600;">
                                    <i class="fas fa-headphones me-1"></i>Audio
                                </span>
                            </div>
                            <h5 class="card-title mb-2">Rode PodMic</h5>
                            <p class="card-text text-muted mb-3" style="font-size: 0.9375rem; line-height: 1.6;">Microphone professionnel pour podcast et streaming de qualit&eacute;</p>
                            <div class="d-flex align-items-center mb-3">
                                <div class="rating me-2">
                                    <i class="fas fa-star" style="color: #fbbf24; font-size: 0.875rem;"></i>
                                    <i class="fas fa-star" style="color: #fbbf24; font-size: 0.875rem;"></i>
                                    <i class="fas fa-star" style="color: #fbbf24; font-size: 0.875rem;"></i>
                                    <i class="fas fa-star" style="color: #fbbf24; font-size: 0.875rem;"></i>
                                    <i class="fas fa-star-half-alt" style="color: #fbbf24; font-size: 0.875rem;"></i>
                                </div>
                                <small class="text-muted">(4.5)</small>
                            </div>
                            <div class="d-flex gap-2 align-items-stretch">
                                <a href="${pageContext.request.contextPath}/pages/equipment/detail.jsp?id=6" class="btn btn-primary btn-sm d-flex align-items-center justify-content-center" style="flex: 1; padding: 0.5rem 0.75rem; white-space: nowrap;">
                                    <i class="fas fa-eye me-1"></i>Voir
                                </a>
                                <button class="btn btn-outline-primary btn-sm d-flex align-items-center justify-content-center" style="flex: 1; padding: 0.5rem 0.75rem; white-space: nowrap;">
                                    <i class="fas fa-calendar-plus me-1"></i>R&eacute;server
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Pagination -->
            <div class="text-center mt-5 pt-4">
                <nav aria-label="Equipment pagination">
                    <ul class="pagination pagination-modern justify-content-center">
                        <li class="page-item disabled">
                            <a class="page-link" href="#" tabindex="-1" aria-disabled="true">
                                <i class="fas fa-chevron-left me-1"></i>Pr&eacute;c&eacute;dent
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

<script>
document.addEventListener('DOMContentLoaded', function() {
    // Search Input Enhancement
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
        });
        
        clearSearchBtn.addEventListener('click', function() {
            searchInput.value = '';
            clearSearchBtn.classList.add('d-none');
            searchInput.focus();
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
                    
                    const imgContainer = card.querySelector('.position-relative');
                    const cardBody = card.querySelector('.card-body');
                    const img = card.querySelector('.card-img-top');
                    
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
                    
                    if (img) {
                        img.style.width = '100%';
                        img.style.height = '100%';
                        img.style.objectFit = 'cover';
                        img.style.objectPosition = 'center';
                        img.style.borderRadius = '1rem 0 0 1rem';
                        img.style.transition = 'transform 0.3s ease';
                    }
                    
                    if (cardBody) {
                        cardBody.style.flex = '1';
                        cardBody.style.display = 'flex';
                        cardBody.style.flexDirection = 'column';
                        cardBody.style.justifyContent = 'space-between';
                        cardBody.style.padding = '1.5rem 2rem';
                    }
                    
                    // Optimize content layout for list view
                    const categoryBadge = card.querySelector('.badge');
                    if (categoryBadge) {
                        categoryBadge.style.marginBottom = '0.5rem';
                        categoryBadge.style.fontSize = '0.75rem';
                    }
                    
                    const cardTitle = card.querySelector('.card-title');
                    if (cardTitle) {
                        cardTitle.style.fontSize = '1.25rem';
                        cardTitle.style.fontWeight = '700';
                        cardTitle.style.marginBottom = '0.5rem';
                        cardTitle.style.lineHeight = '1.3';
                    }
                    
                    const cardText = card.querySelector('.card-text');
                    if (cardText) {
                        cardText.style.fontSize = '0.9rem';
                        cardText.style.lineHeight = '1.5';
                        cardText.style.marginBottom = '0.75rem';
                        cardText.style.display = '-webkit-box';
                        cardText.style.webkitLineClamp = '2';
                        cardText.style.webkitBoxOrient = 'vertical';
                        cardText.style.overflow = 'hidden';
                    }
                    
                    const ratingContainer = card.querySelector('.d-flex.align-items-center.mb-3');
                    if (ratingContainer) {
                        ratingContainer.style.marginBottom = '1rem';
                    }
                    
                    // Adjust button container
                    const buttonContainer = card.querySelector('.d-flex.justify-content-between.align-items-center');
                    if (buttonContainer) {
                        buttonContainer.style.marginTop = 'auto';
                        buttonContainer.style.gap = '0.75rem';
                    }
                    
                    // Add hover effect
                    card.addEventListener('mouseenter', function() {
                        this.style.transform = 'translateY(-2px)';
                        this.style.boxShadow = '0 8px 25px rgba(0, 0, 0, 0.12)';
                        const cardImg = this.querySelector('.card-img-top');
                        if (cardImg) cardImg.style.transform = 'scale(1.05)';
                    });
                    
                    card.addEventListener('mouseleave', function() {
                        this.style.transform = 'translateY(0)';
                        this.style.boxShadow = '0 4px 12px rgba(0, 0, 0, 0.08)';
                        const cardImg = this.querySelector('.card-img-top');
                        if (cardImg) cardImg.style.transform = 'scale(1)';
                    });
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
                    
                    const imgContainer = card.querySelector('.position-relative');
                    const cardBody = card.querySelector('.card-body');
                    const img = card.querySelector('.card-img-top');
                    
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
                    
                    if (img) {
                        img.style.width = '100%';
                        img.style.height = '250px';
                        img.style.objectFit = 'cover';
                        img.style.objectPosition = 'center';
                        img.style.borderRadius = '1rem 1rem 0 0';
                        img.style.transition = 'transform 0.3s ease';
                    }
                    
                    if (cardBody) {
                        cardBody.style.flex = '1';
                        cardBody.style.display = 'flex';
                        cardBody.style.flexDirection = 'column';
                        cardBody.style.justifyContent = 'space-between';
                        cardBody.style.padding = '1.5rem';
""                    }
                    
                    // Reset content styling for grid view
                    const categoryBadge = card.querySelector('.badge');
                    if (categoryBadge) {
                        categoryBadge.style.marginBottom = '';
                        categoryBadge.style.fontSize = '';
                    }
                    
                    const cardTitle = card.querySelector('.card-title');
                    if (cardTitle) {
                        cardTitle.style.fontSize = '';
                        cardTitle.style.fontWeight = '';
                        cardTitle.style.marginBottom = '';
                        cardTitle.style.lineHeight = '';
                    }
                    
                    const cardText = card.querySelector('.card-text');
                    if (cardText) {
                        cardText.style.fontSize = '';
                        cardText.style.lineHeight = '';
                        cardText.style.marginBottom = '';
                        cardText.style.display = '';
                        cardText.style.webkitLineClamp = '';
                        cardText.style.webkitBoxOrient = '';
                        cardText.style.overflow = '';
                    }
                    
                    const ratingContainer = card.querySelector('.d-flex.align-items-center.mb-3');
                    if (ratingContainer) {
                        ratingContainer.style.marginBottom = '';
                    }
                    
                    // Reset button container
                    const buttonContainer = card.querySelector('.d-flex.justify-content-between.align-items-center');
                    if (buttonContainer) {
                        buttonContainer.style.marginTop = '';
                        buttonContainer.style.gap = '';
                    }
                    
                    // Add hover effect for grid view
                    card.addEventListener('mouseenter', function() {
                        this.style.transform = 'translateY(-4px)';
                        this.style.boxShadow = '0 8px 25px rgba(0, 0, 0, 0.15)';
                        const cardImg = this.querySelector('.card-img-top');
                        if (cardImg) cardImg.style.transform = 'scale(1.05)';
                    });
                    
                    card.addEventListener('mouseleave', function() {
                        this.style.transform = 'translateY(0)';
                        this.style.boxShadow = '0 2px 8px rgba(0, 0, 0, 0.06)';
                        const cardImg = this.querySelector('.card-img-top');
                        if (cardImg) cardImg.style.transform = 'scale(1)';
                    });
                });
                
                equipmentGrid.classList.remove('g-3');
                equipmentGrid.classList.add('g-4');
            }
        });
    });
    
    // Advanced filter panel toggle
    const advancedFilterToggle = document.getElementById('advancedFilterToggle');
    const advancedFiltersPanel = document.getElementById('advancedFiltersPanel');
    const closeAdvancedFilters = document.getElementById('closeAdvancedFilters');
    const resetFilters = document.getElementById('resetFilters');
    
    if (advancedFilterToggle && advancedFiltersPanel) {
        // Toggle panel
        advancedFilterToggle.addEventListener('click', function() {
            if (advancedFiltersPanel.style.display === 'none') {
                advancedFiltersPanel.style.display = 'block';
                advancedFiltersPanel.style.animation = 'slideDown 0.3s ease';
                this.style.background = 'linear-gradient(135deg, var(--primary-700), var(--primary-800))';
            } else {
                advancedFiltersPanel.style.display = 'none';
                this.style.background = 'linear-gradient(135deg, var(--primary-600), var(--primary-700))';
            }
        });
        
        // Close panel
        if (closeAdvancedFilters) {
            closeAdvancedFilters.addEventListener('click', function() {
                advancedFiltersPanel.style.display = 'none';
                advancedFilterToggle.style.background = 'linear-gradient(135deg, var(--primary-600), var(--primary-700))';
            });
        }
        
        // Reset filters
        if (resetFilters) {
            resetFilters.addEventListener('click', function() {
                // Reset all form inputs in the advanced filter panel
                const inputs = advancedFiltersPanel.querySelectorAll('input, select');
                inputs.forEach(input => {
                    if (input.tagName === 'SELECT') {
                        input.selectedIndex = 0;
                    } else {
                        input.value = '';
                    }
                });
            });
        }
        
        // Hover effect
        advancedFilterToggle.addEventListener('mouseenter', function() {
            this.style.transform = 'translateY(-2px)';
            this.style.boxShadow = '0 6px 20px -2px rgba(37, 99, 235, 0.5)';
        });
        
        advancedFilterToggle.addEventListener('mouseleave', function() {
            this.style.transform = 'translateY(0)';
            this.style.boxShadow = '0 4px 12px -2px rgba(37, 99, 235, 0.4)';
        });
    }
});
</script>

<%@ include file="../../layouts/footer.jsp" %>

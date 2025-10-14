<%@ include file="../../layouts/header.jsp" %>
<%@ include file="../../layouts/navbar.jsp" %>

<!-- Page Header -->
<section class="py-5" style="background: linear-gradient(135deg, #1e40af 0%, #1e3a8a 50%, #1e293b 100%); margin-top: -80px; padding-top: calc(80px + 4rem) !important; position: relative; overflow: hidden;">
    <div style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; background: radial-gradient(circle at 20% 50%, rgba(59, 130, 246, 0.15) 0%, transparent 50%); opacity: 1;"></div>
    <div class="container" style="position: relative; z-index: 2;">
        <div class="row">
            <div class="col-lg-10 mx-auto text-center">
                <h1 class="display-4 fw-bold mb-3" style="color: white; text-shadow: 0 2px 10px rgba(0,0,0,0.2);">Mat&eacute;riel Disponible</h1>
                <p class="lead mb-4" style="color: rgba(255, 255, 255, 0.9); max-width: 700px; margin: 0 auto;">
                    D&eacute;couvrez notre large s&eacute;lection d'&eacute;quipements professionnels disponibles &agrave; la location
                </p>
                
                <!-- Quick Stats -->
                <div class="row g-3 mt-2">
                    <div class="col-md-4">
                        <div class="d-flex align-items-center justify-content-center" style="background: rgba(255, 255, 255, 0.1); backdrop-filter: blur(10px); border-radius: 1rem; padding: 1rem; border: 1px solid rgba(255, 255, 255, 0.2);">
                            <i class="fas fa-boxes me-2" style="color: rgba(255, 255, 255, 0.9); font-size: 1.5rem;"></i>
                            <div class="text-start">
                                <div style="color: white; font-size: 1.5rem; font-weight: 700;">500+</div>
                                <div style="color: rgba(255, 255, 255, 0.8); font-size: 0.875rem;">Équipements</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="d-flex align-items-center justify-content-center" style="background: rgba(255, 255, 255, 0.1); backdrop-filter: blur(10px); border-radius: 1rem; padding: 1rem; border: 1px solid rgba(255, 255, 255, 0.2);">
                            <i class="fas fa-check-circle me-2" style="color: rgba(16, 185, 129, 1); font-size: 1.5rem;"></i>
                            <div class="text-start">
                                <div style="color: white; font-size: 1.5rem; font-weight: 700;">95%</div>
                                <div style="color: rgba(255, 255, 255, 0.8); font-size: 0.875rem;">Disponibles</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="d-flex align-items-center justify-content-center" style="background: rgba(255, 255, 255, 0.1); backdrop-filter: blur(10px); border-radius: 1rem; padding: 1rem; border: 1px solid rgba(255, 255, 255, 0.2);">
                            <i class="fas fa-shipping-fast me-2" style="color: rgba(245, 158, 11, 1); font-size: 1.5rem;"></i>
                            <div class="text-start">
                                <div style="color: white; font-size: 1.5rem; font-weight: 700;">24h</div>
                                <div style="color: rgba(255, 255, 255, 0.8); font-size: 0.875rem;">Livraison</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Equipment Grid -->
<div class="container py-5">
    <div class="row">
        <div class="col-12">
            <!-- Filter Bar -->
            <div class="mb-4 p-4" style="background: white; border-radius: 1rem; box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.08); border: 1px solid var(--gray-200);">
                <div class="row g-3 align-items-center">
                    <div class="col-md-5">
                        <div class="position-relative">
                            <i class="fas fa-search position-absolute" style="left: 1rem; top: 50%; transform: translateY(-50%); color: var(--gray-400);"></i>
                            <input type="text" class="form-control" placeholder="Rechercher un équipement..." 
                                   style="padding-left: 2.75rem; border-radius: 0.75rem; border: 2px solid var(--gray-200);">
                        </div>
                    </div>
                    <div class="col-md-3">
                        <select class="form-select" style="border-radius: 0.75rem; border: 2px solid var(--gray-200);">
                            <option selected>Toutes catégories</option>
                            <option value="1">Photographie</option>
                            <option value="2">Vidéo</option>
                            <option value="3">Informatique</option>
                            <option value="4">Audio</option>
                            <option value="5">Gaming</option>
                            <option value="6">Éclairage</option>
                        </select>
                    </div>
                    <div class="col-md-3">
                        <select class="form-select" style="border-radius: 0.75rem; border: 2px solid var(--gray-200);">
                            <option selected>Trier par popularité</option>
                            <option value="1">Prix croissant</option>
                            <option value="2">Prix décroissant</option>
                            <option value="3">Nouveautés</option>
                            <option value="4">Meilleures notes</option>
                        </select>
                    </div>
                    <div class="col-md-1">
                        <button class="btn btn-outline-primary w-100" style="border-radius: 0.75rem;" title="Filtres avancés">
                            <i class="fas fa-sliders-h"></i>
                        </button>
                    </div>
                </div>
            </div>
            <div class="row g-4">
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
                            <div class="d-flex justify-content-between align-items-center">
                                <a href="${pageContext.request.contextPath}/pages/equipment/detail.jsp?id=1" class="btn btn-primary btn-sm" style="flex: 1; margin-right: 0.5rem;">
                                    <i class="fas fa-eye me-1"></i>Voir
                                </a>
                                <button class="btn btn-outline-primary btn-sm" style="flex: 1;">
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
                            <div class="d-flex justify-content-between align-items-center">
                                <a href="${pageContext.request.contextPath}/pages/equipment/detail.jsp?id=2" class="btn btn-primary btn-sm" style="flex: 1; margin-right: 0.5rem;">
                                    <i class="fas fa-eye me-1"></i>Voir
                                </a>
                                <button class="btn btn-outline-primary btn-sm" style="flex: 1;">
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
                            <div class="d-flex justify-content-between align-items-center">
                                <a href="${pageContext.request.contextPath}/pages/equipment/detail.jsp?id=3" class="btn btn-primary btn-sm" style="flex: 1; margin-right: 0.5rem;">
                                    <i class="fas fa-eye me-1"></i>Voir
                                </a>
                                <button class="btn btn-outline-primary btn-sm" style="flex: 1;">
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
                            <div class="d-flex justify-content-between align-items-center">
                                <a href="${pageContext.request.contextPath}/pages/equipment/detail.jsp?id=4" class="btn btn-primary btn-sm" style="flex: 1; margin-right: 0.5rem;">
                                    <i class="fas fa-eye me-1"></i>Voir
                                </a>
                                <button class="btn btn-outline-primary btn-sm" style="flex: 1;">
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
                                    <i class="fas fa-video me-1"></i>Vidéo
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
                            <div class="d-flex justify-content-between align-items-center">
                                <a href="${pageContext.request.contextPath}/pages/equipment/detail.jsp?id=5" class="btn btn-primary btn-sm" style="flex: 1; margin-right: 0.5rem;">
                                    <i class="fas fa-eye me-1"></i>Voir
                                </a>
                                <button class="btn btn-outline-primary btn-sm" style="flex: 1;">
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
                            <div class="d-flex justify-content-between align-items-center">
                                <a href="${pageContext.request.contextPath}/pages/equipment/detail.jsp?id=6" class="btn btn-primary btn-sm" style="flex: 1; margin-right: 0.5rem;">
                                    <i class="fas fa-eye me-1"></i>Voir
                                </a>
                                <button class="btn btn-outline-primary btn-sm" style="flex: 1;">
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

<%@ include file="../../layouts/footer.jsp" %>

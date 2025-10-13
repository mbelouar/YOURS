<%@ include file="layouts/header.jsp" %>
<%@ include file="layouts/navbar.jsp" %>

<!-- Hero Section -->
<section class="hero-section">
    <div class="container">
        <div class="row align-items-center min-vh-100">
            <div class="col-lg-6 hero-content">
                <h1 class="hero-title animate-fade-in-left">
                    Location Intelligente de Mat&eacute;riel Professionnel
                </h1>
                <p class="hero-subtitle animate-fade-in-left" style="animation-delay: 0.2s;">
                    D&eacute;couvrez notre plateforme r&eacute;volutionnaire qui utilise l'intelligence artificielle 
                    pour vous recommander le mat&eacute;riel parfait selon vos besoins.
                </p>
                <div class="d-flex flex-wrap gap-3 animate-fade-in-left" style="animation-delay: 0.4s;">
                    <a href="${pageContext.request.contextPath}/pages/equipment/list-simple.jsp" class="btn btn-glass btn-lg">
                        <i class="fas fa-search me-2"></i>Explorer le Mat&eacute;riel
                    </a>
                    <a href="${pageContext.request.contextPath}/pages/auth/register-client.jsp" class="btn btn-gradient btn-lg">
                        <i class="fas fa-rocket me-2"></i>Commencer Gratuitement
                    </a>
                </div>
            </div>
            <div class="col-lg-6 text-center animate-fade-in-right">
                <div style="position: relative; display: inline-block;">
                    <img src="${pageContext.request.contextPath}/assets/images/hero-equipment.jpg" 
                         alt="Matériel professionnel" class="img-fluid shadow-2xl" 
                         style="border-radius: 2rem; max-width: 90%;">
                    <div style="position: absolute; top: -20px; right: -20px; background: linear-gradient(135deg, var(--accent-color), #f59e0b); color: white; padding: 1rem; border-radius: 1rem; font-weight: 600; box-shadow: 0 10px 15px -3px rgba(245, 158, 11, 0.3);">
                        <i class="fas fa-star me-1"></i>
                        IA Intégrée
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Stats Section -->
<section class="py-5" style="background: var(--gray-50);">
    <div class="container">
        <div class="row g-4">
            <div class="col-lg-3 col-md-6">
                <div class="stats-card animate-fade-in-up">
                    <i class="fas fa-camera fa-3x text-primary mb-3"></i>
                    <span class="stats-number">500+</span>
                    <span class="stats-label">Équipements Disponibles</span>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="stats-card animate-fade-in-up" style="animation-delay: 0.1s;">
                    <i class="fas fa-users fa-3x text-success mb-3"></i>
                    <span class="stats-number">1,200+</span>
                    <span class="stats-label">Clients Satisfaits</span>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="stats-card animate-fade-in-up" style="animation-delay: 0.2s;">
                    <i class="fas fa-handshake fa-3x text-warning mb-3"></i>
                    <span class="stats-number">150+</span>
                    <span class="stats-label">Partenaires</span>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="stats-card animate-fade-in-up" style="animation-delay: 0.3s;">
                    <i class="fas fa-clock fa-3x text-info mb-3"></i>
                    <span class="stats-number">24/7</span>
                    <span class="stats-label">Support Client</span>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Featured Equipment Section -->
<section class="py-5">
    <div class="container">
        <div class="text-center mb-5">
            <h2 class="display-5 fw-bold text-primary mb-3">Mat&eacute;riel en Vedette</h2>
            <p class="lead text-muted">D&eacute;couvrez notre s&eacute;lection d'&eacute;quipements les plus populaires</p>
        </div>
        
        <div class="row g-4">
            <div class="col-lg-4 col-md-6">
                <div class="card card-modern card-equipment">
                    <div class="position-relative">
                        <img src="${pageContext.request.contextPath}/assets/images/placeholder-equipment.jpg" 
                             class="card-img-top" alt="Canon EOS R5">
                        <div class="availability-badge">Disponible</div>
                        <div class="price-badge">240 MAD/jour</div>
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Canon EOS R5</h5>
                        <p class="card-text text-muted">Appareil photo professionnel 45MP avec stabilisation int&eacute;gr&eacute;e</p>
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="rating">
                                <i class="fas fa-star text-warning"></i>
                                <i class="fas fa-star text-warning"></i>
                                <i class="fas fa-star text-warning"></i>
                                <i class="fas fa-star text-warning"></i>
                                <i class="fas fa-star text-warning"></i>
                                <small class="text-muted ms-1">(4.9)</small>
                            </div>
                            <a href="${pageContext.request.contextPath}/pages/equipment/detail.jsp?id=1" class="btn btn-primary btn-sm">
                                Voir détails
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-4 col-md-6">
                <div class="card card-modern card-equipment">
                    <div class="position-relative">
                        <img src="${pageContext.request.contextPath}/assets/images/placeholder-equipment.jpg" 
                             class="card-img-top" alt="MacBook Pro">
                        <div class="availability-badge">Disponible</div>
                        <div class="price-badge">150 MAD/jour</div>
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">MacBook Pro 16"</h5>
                        <p class="card-text text-muted">Ordinateur portable M2 Pro pour montage vid&eacute;o professionnel</p>
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="rating">
                                <i class="fas fa-star text-warning"></i>
                                <i class="fas fa-star text-warning"></i>
                                <i class="fas fa-star text-warning"></i>
                                <i class="fas fa-star text-warning"></i>
                                <i class="fas fa-star text-warning"></i>
                                <small class="text-muted ms-1">(4.8)</small>
                            </div>
                            <a href="${pageContext.request.contextPath}/pages/equipment/detail.jsp?id=2" class="btn btn-primary btn-sm">
                                Voir détails
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-4 col-md-6">
                <div class="card card-modern card-equipment">
                    <div class="position-relative">
                        <img src="${pageContext.request.contextPath}/assets/images/placeholder-equipment.jpg" 
                             class="card-img-top" alt="DJI Mavic">
                        <div class="availability-badge">Disponible</div>
                        <div class="price-badge">120 MAD/jour</div>
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">DJI Mavic Air 2</h5>
                        <p class="card-text text-muted">Drone professionnel 4K avec stabilisation 3 axes</p>
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="rating">
                                <i class="fas fa-star text-warning"></i>
                                <i class="fas fa-star text-warning"></i>
                                <i class="fas fa-star text-warning"></i>
                                <i class="fas fa-star text-warning"></i>
                                <i class="fas fa-star text-muted"></i>
                                <small class="text-muted ms-1">(4.6)</small>
                            </div>
                            <a href="${pageContext.request.contextPath}/pages/equipment/detail.jsp?id=3" class="btn btn-primary btn-sm">
                                Voir détails
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="text-center mt-5">
            <a href="${pageContext.request.contextPath}/pages/equipment/list-simple.jsp" class="btn btn-outline-primary btn-lg">
                <i class="fas fa-th-large me-2"></i>Voir Tout le Matériel
            </a>
        </div>
    </div>
</section>

<!-- Categories Section -->
<section class="py-5" style="background: var(--gray-50);">
    <div class="container">
        <div class="text-center mb-5">
            <h2 class="display-5 fw-bold text-primary mb-3">Cat&eacute;gories Populaires</h2>
            <p class="lead text-muted">Explorez nos diff&eacute;rentes cat&eacute;gories d'&eacute;quipements</p>
        </div>
        
        <div class="row g-4">
            <div class="col-lg-3 col-md-6">
                <div class="card card-modern text-center h-100">
                    <div class="card-body p-4">
                        <i class="fas fa-camera fa-4x text-primary mb-3"></i>
                        <h5 class="card-title">Photographie</h5>
                        <p class="card-text text-muted">Appareils photo, objectifs, éclairage</p>
                        <a href="${pageContext.request.contextPath}/pages/categories.jsp" class="btn btn-outline-primary">
                            Explorer <i class="fas fa-arrow-right ms-1"></i>
                        </a>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6">
                <div class="card card-modern text-center h-100">
                    <div class="card-body p-4">
                        <i class="fas fa-video fa-4x text-success mb-3"></i>
                        <h5 class="card-title">Vid&eacute;o</h5>
                        <p class="card-text text-muted">Cam&eacute;ras, stabilisateurs, micros</p>
                        <a href="${pageContext.request.contextPath}/pages/categories.jsp" class="btn btn-outline-success">
                            Explorer <i class="fas fa-arrow-right ms-1"></i>
                        </a>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6">
                <div class="card card-modern text-center h-100">
                    <div class="card-body p-4">
                        <i class="fas fa-laptop fa-4x text-warning mb-3"></i>
                        <h5 class="card-title">Informatique</h5>
                        <p class="card-text text-muted">Ordinateurs, tablettes, écrans</p>
                        <a href="${pageContext.request.contextPath}/pages/categories.jsp" class="btn btn-outline-warning">
                            Explorer <i class="fas fa-arrow-right ms-1"></i>
                        </a>
                    </div>
                </div>
            </div>

            <div class="col-lg-3 col-md-6">
                <div class="card card-modern text-center h-100">
                    <div class="card-body p-4">
                        <i class="fas fa-music fa-4x text-info mb-3"></i>
                        <h5 class="card-title">Audio</h5>
                        <p class="card-text text-muted">Micros, enregistreurs, enceintes</p>
                        <a href="${pageContext.request.contextPath}/pages/categories.jsp" class="btn btn-outline-info">
                            Explorer <i class="fas fa-arrow-right ms-1"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- CTA Section -->
<section class="py-5" style="background: linear-gradient(135deg, var(--primary-600), var(--primary-800)); color: white;">
    <div class="container text-center">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <h2 class="display-5 fw-bold mb-4">Pr&ecirc;t &agrave; Commencer ?</h2>
                <p class="lead mb-4">
                    Rejoignez des milliers de professionnels qui font confiance &agrave; YOURS 
                    pour leurs besoins en location de mat&eacute;riel.
                </p>
                <div class="d-flex flex-wrap justify-content-center gap-3">
                    <a href="${pageContext.request.contextPath}/pages/auth/register-client.jsp" class="btn btn-glass btn-lg">
                        <i class="fas fa-user-plus me-2"></i>Cr&eacute;er un Compte Client
                    </a>
                    <a href="${pageContext.request.contextPath}/pages/auth/register-partner.jsp" class="btn btn-outline-light btn-lg">
                        <i class="fas fa-handshake me-2"></i>Devenir Partenaire
                    </a>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Floating Action Button -->
<a href="${pageContext.request.contextPath}/pages/auth/login.jsp" class="btn-floating" title="Se connecter">
    <i class="fas fa-user"></i>
</a>

<%@ include file="layouts/footer.jsp" %>
<%@ include file="layouts/header.jsp" %>
<%@ include file="layouts/navbar.jsp" %>

<!-- Hero Section -->
<section id="accueil" class="hero-section">
    <div class="container">
        <div class="row align-items-center g-5">
            <div class="col-lg-6 hero-content">
                <h1 class="hero-title animate-fade-in-left">
                    Location Intelligente de Mat&eacute;riel Professionnel
                </h1>
                <p class="hero-subtitle animate-fade-in-left" style="animation-delay: 0.2s;">
                    D&eacute;couvrez notre plateforme r&eacute;volutionnaire qui utilise l'intelligence artificielle 
                    pour vous recommander le mat&eacute;riel parfait adapt&eacute; &agrave; vos besoins sp&eacute;cifiques.
                </p>
                <div class="d-flex flex-wrap gap-3 animate-fade-in-left" style="animation-delay: 0.4s;">
                    <a href="${pageContext.request.contextPath}/pages/auth/login.jsp?redirect=%2Fpages%2Fequipment%2Flist-simple.jsp" class="btn btn-glass btn-lg">
                        <i class="fas fa-search me-2"></i>Explorer le Mat&eacute;riel
                    </a>
                    <a href="${pageContext.request.contextPath}/pages/auth/register-client.jsp" class="btn btn-gradient btn-lg">
                        <i class="fas fa-rocket me-2"></i>Commencer Maintenant
                    </a>
                </div>
            </div>
            <div class="col-lg-6 text-center animate-fade-in-right">
                <div class="position-relative d-inline-block" style="max-width: 550px;">
                    <img src="https://images.unsplash.com/photo-1492691527719-9d1e07e534b4?w=1200&auto=format&fit=crop&q=80" 
                         alt="Mat&eacute;riel professionnel" 
                         class="img-fluid" 
                         style="border-radius: 1.5rem; box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.4); object-fit: cover; width: 100%;">
                    <div class="position-absolute badge-ai">
                        <i class="fas fa-brain me-2"></i>
                        IA Int&eacute;gr&eacute;e
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Stats Section -->
<section id="chiffres" class="py-5" style="background: linear-gradient(180deg, var(--gray-50) 0%, var(--white) 100%);">
    <div class="container">
        <div class="text-center mb-5 pb-2">
            <h2 class="display-6 fw-bold mb-3" style="color: var(--gray-900);">YOURS en Chiffres</h2>
            <p class="lead text-muted mb-0">La confiance de nos clients en quelques chiffres</p>
        </div>
        <div class="row g-4">
            <div class="col-lg-3 col-md-6">
                <div class="stats-card animate-fade-in-up">
                    <i class="fas fa-boxes fa-3x mb-4" style="color: var(--primary-600);"></i>
                    <span class="stats-number">500+</span>
                    <span class="stats-label">&Eacute;quipements Disponibles</span>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="stats-card animate-fade-in-up" style="animation-delay: 0.1s;">
                    <i class="fas fa-users fa-3x mb-4" style="color: var(--success-color);"></i>
                    <span class="stats-number">1,200+</span>
                    <span class="stats-label">Clients Satisfaits</span>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="stats-card animate-fade-in-up" style="animation-delay: 0.2s;">
                    <i class="fas fa-handshake fa-3x mb-4" style="color: var(--warning-color);"></i>
                    <span class="stats-number">150+</span>
                    <span class="stats-label">Partenaires Certifi&eacute;s</span>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="stats-card animate-fade-in-up" style="animation-delay: 0.3s;">
                    <i class="fas fa-headset fa-3x mb-4" style="color: var(--info-color);"></i>
                    <span class="stats-number">24/7</span>
                    <span class="stats-label">Support Client</span>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Featured Equipment Section -->
<section id="materiel" class="py-5" style="background: linear-gradient(135deg, #1e40af 0%, #1e3a8a 50%, #1e293b 100%); position: relative; overflow: hidden;">
    <div style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; background: radial-gradient(circle at 20% 50%, rgba(59, 130, 246, 0.15) 0%, transparent 50%), radial-gradient(circle at 80% 80%, rgba(147, 51, 234, 0.1) 0%, transparent 50%); opacity: 1;"></div>
    <div style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; background: url('data:image/svg+xml,<svg xmlns=&quot;http://www.w3.org/2000/svg&quot; viewBox=&quot;0 0 100 100&quot;><defs><pattern id=&quot;grid&quot; width=&quot;10&quot; height=&quot;10&quot; patternUnits=&quot;userSpaceOnUse&quot;><path d=&quot;M 10 0 L 0 0 0 10&quot; fill=&quot;none&quot; stroke=&quot;rgba(255,255,255,0.05)&quot; stroke-width=&quot;0.5&quot;/></pattern></defs><rect width=&quot;100&quot; height=&quot;100&quot; fill=&quot;url(%23grid)&quot;/></svg>'); opacity: 0.4;"></div>
    <div class="container" style="position: relative; z-index: 2;">
        <div class="text-center mb-5 pb-2">
            <h2 class="display-5 fw-bold mb-3" style="color: white;">Mat&eacute;riel en Vedette</h2>
            <p class="lead mb-0" style="color: rgba(255, 255, 255, 0.9);">D&eacute;couvrez notre s&eacute;lection d'&eacute;quipements les plus populaires</p>
        </div>
        
        <div class="row g-4">
            <div class="col-lg-4 col-md-6">
                <div class="card card-modern card-equipment">
                    <div class="position-relative">
                        <img src="https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600&auto=format&fit=crop&q=80" 
                             class="card-img-top" alt="Canon EOS R5" style="height: 250px; object-fit: cover;">
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
                            <a href="${pageContext.request.contextPath}/pages/auth/login.jsp?redirect=${pageContext.request.contextPath}/pages/equipment/detail.jsp?id=1" class="btn btn-primary btn-sm">
                                Voir d&eacute;tails
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-4 col-md-6">
                <div class="card card-modern card-equipment">
                    <div class="position-relative">
                        <img src="https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600&auto=format&fit=crop&q=80" 
                             class="card-img-top" alt="MacBook Pro" style="height: 250px; object-fit: cover;">
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
                            <a href="${pageContext.request.contextPath}/pages/auth/login.jsp?redirect=${pageContext.request.contextPath}/pages/equipment/detail.jsp?id=1" class="btn btn-primary btn-sm">
                                Voir d&eacute;tails
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-4 col-md-6">
                <div class="card card-modern card-equipment">
                    <div class="position-relative">
                        <img src="https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600&auto=format&fit=crop&q=80" 
                             class="card-img-top" alt="DJI Mavic" style="height: 250px; object-fit: cover;">
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
                            <a href="${pageContext.request.contextPath}/pages/auth/login.jsp?redirect=${pageContext.request.contextPath}/pages/equipment/detail.jsp?id=1" class="btn btn-primary btn-sm">
                                Voir d&eacute;tails
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="text-center mt-5">
            <a href="${pageContext.request.contextPath}/pages/auth/login.jsp?redirect=%2Fpages%2Fequipment%2Flist-simple.jsp" class="btn btn-glass btn-lg">
                <i class="fas fa-th-large me-2"></i>Voir Tout le Mat&eacute;riel
            </a>
        </div>
    </div>
</section>

<!-- Categories Section -->
<section id="categories" class="py-5" style="background: linear-gradient(180deg, var(--gray-50) 0%, var(--white) 100%);">
    <div class="container">
        <div class="text-center mb-5 pb-3">
            <h2 class="display-5 fw-bold mb-3" style="color: var(--gray-900);">Cat&eacute;gories Populaires</h2>
            <p class="lead mb-0" style="color: var(--gray-600); max-width: 700px; margin-left: auto; margin-right: auto;">
                Explorez nos diff&eacute;rentes cat&eacute;gories d'&eacute;quipements professionnels
            </p>
        </div>
        
        <div class="row g-3">
            <div class="col-lg-2 col-md-4 col-sm-6">
                <a href="${pageContext.request.contextPath}/pages/auth/login.jsp?redirect=${pageContext.request.contextPath}/pages/equipment/list-simple.jsp" class="text-decoration-none">
                    <div class="category-card category-card-compact" data-category="primary">
                        <div class="category-icon-wrapper">
                            <i class="fas fa-camera"></i>
                        </div>
                        <h5 class="category-title">Photographie</h5>
                        <p class="category-description">Appareils photo, objectifs, &eacute;clairage</p>
                        <div class="category-arrow">
                            <i class="fas fa-arrow-right"></i>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-lg-2 col-md-4 col-sm-6">
                <a href="${pageContext.request.contextPath}/pages/auth/login.jsp?redirect=${pageContext.request.contextPath}/pages/equipment/list-simple.jsp" class="text-decoration-none">
                    <div class="category-card category-card-compact" data-category="success">
                        <div class="category-icon-wrapper">
                            <i class="fas fa-video"></i>
                        </div>
                        <h5 class="category-title">Vid&eacute;o</h5>
                        <p class="category-description">Cam&eacute;ras, stabilisateurs, micros</p>
                        <div class="category-arrow">
                            <i class="fas fa-arrow-right"></i>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-lg-2 col-md-4 col-sm-6">
                <a href="${pageContext.request.contextPath}/pages/auth/login.jsp?redirect=${pageContext.request.contextPath}/pages/equipment/list-simple.jsp" class="text-decoration-none">
                    <div class="category-card category-card-compact" data-category="warning">
                        <div class="category-icon-wrapper">
                            <i class="fas fa-laptop"></i>
                        </div>
                        <h5 class="category-title">Informatique</h5>
                        <p class="category-description">Ordinateurs, tablettes, &eacute;crans</p>
                        <div class="category-arrow">
                            <i class="fas fa-arrow-right"></i>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-lg-2 col-md-4 col-sm-6">
                <a href="${pageContext.request.contextPath}/pages/auth/login.jsp?redirect=${pageContext.request.contextPath}/pages/equipment/list-simple.jsp" class="text-decoration-none">
                    <div class="category-card category-card-compact" data-category="info">
                        <div class="category-icon-wrapper">
                            <i class="fas fa-headphones"></i>
                        </div>
                        <h5 class="category-title">Audio</h5>
                        <p class="category-description">Micros, enregistreurs, enceintes</p>
                        <div class="category-arrow">
                            <i class="fas fa-arrow-right"></i>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-lg-2 col-md-4 col-sm-6">
                <a href="${pageContext.request.contextPath}/pages/auth/login.jsp?redirect=${pageContext.request.contextPath}/pages/equipment/list-simple.jsp" class="text-decoration-none">
                    <div class="category-card category-card-compact" data-category="danger">
                        <div class="category-icon-wrapper">
                            <i class="fas fa-gamepad"></i>
                        </div>
                        <h5 class="category-title">Gaming</h5>
                        <p class="category-description">Consoles, PC gaming, accessoires</p>
                        <div class="category-arrow">
                            <i class="fas fa-arrow-right"></i>
                        </div>
                    </div>
                </a>
            </div>

            <div class="col-lg-2 col-md-4 col-sm-6">
                <a href="${pageContext.request.contextPath}/pages/auth/login.jsp?redirect=${pageContext.request.contextPath}/pages/equipment/list-simple.jsp" class="text-decoration-none">
                    <div class="category-card category-card-compact" data-category="secondary">
                        <div class="category-icon-wrapper">
                            <i class="fas fa-lightbulb"></i>
                        </div>
                        <h5 class="category-title">&Eacute;clairage</h5>
                        <p class="category-description">Lumi&egrave;res LED, projecteurs, studios</p>
                        <div class="category-arrow">
                            <i class="fas fa-arrow-right"></i>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </div>
</section>

<!-- CTA Section -->
<section id="contact" class="py-5" style="background: linear-gradient(135deg, #1e40af 0%, #1e3a8a 50%, #1e293b 100%); color: white; position: relative; overflow: hidden;">
    <div style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; background: radial-gradient(circle at 30% 50%, rgba(59, 130, 246, 0.2) 0%, transparent 50%); opacity: 0.6;"></div>
    <div class="container text-center position-relative" style="z-index: 2; padding: 3rem 0;">
        <div class="row justify-content-center">
            <div class="col-lg-10">
                <h2 class="display-5 fw-bold mb-4" style="color: white; text-shadow: 0 2px 10px rgba(0,0,0,0.2);">
                    Pr&ecirc;t &agrave; Commencer Votre Aventure ?
                </h2>
                <p class="lead mb-5" style="color: rgba(255,255,255,0.95); font-size: 1.2rem; max-width: 700px; margin-left: auto; margin-right: auto;">
                    Rejoignez des milliers de professionnels qui font confiance &agrave; YOURS 
                    pour leurs besoins en location de mat&eacute;riel de qualit&eacute;.
                </p>
                <div class="d-flex flex-wrap justify-content-center gap-3">
                    <a href="${pageContext.request.contextPath}/pages/auth/register-client.jsp" class="btn btn-glass btn-lg">
                        <i class="fas fa-user-plus me-2"></i>Cr&eacute;er un Compte
                    </a>
                    <a href="${pageContext.request.contextPath}/pages/auth/register-client.jsp?mode=partner" class="btn btn-outline-light btn-lg">
                        <i class="fas fa-handshake me-2"></i>Devenir Partenaire
                    </a>
                </div>
            </div>
        </div>
    </div>
</section>

<%@ include file="layouts/footer.jsp" %>
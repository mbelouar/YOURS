<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>YOURS - Location de Matériel Intelligent</title>
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/main.css">
    <link rel="stylesheet" href="css/components.css">
    <link rel="stylesheet" href="css/responsive.css">
</head>
<body>
    <!-- Include Navbar -->
    <jsp:include page="layouts/navbar.jsp" />

    <!-- Hero Section -->
    <section class="hero-section">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-6 hero-content">
                    <h1 class="display-4 fw-bold mb-4 fade-in">
                        Louez du matériel professionnel 
                        <span class="text-gradient">en toute simplicité</span>
                    </h1>
                    <p class="lead mb-4 slide-up">
                        Découvrez notre large gamme d'équipements professionnels : caméras, éclairage, audio, 
                        et bien plus encore. Réservez en ligne et récupérez votre matériel rapidement.
                    </p>
                    
                    <!-- CTA Buttons -->
                    <div class="d-flex flex-wrap gap-3">
                        <a href="pages/equipment/list.jsp" class="btn btn-light btn-lg">
                            <i class="bi bi-grid me-2"></i>Parcourir le matériel
                        </a>
                        <a href="pages/auth/register-client.jsp" class="btn btn-outline-light btn-lg">
                            <i class="bi bi-person-plus me-2"></i>Créer un compte
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Stats Section -->
    <section class="py-5 bg-light">
        <div class="container">
            <div class="row stats-grid">
                <div class="col-md-3 col-sm-6 mb-4">
                    <div class="stats-card">
                        <div class="stats-icon">
                            <i class="bi bi-camera-video"></i>
                        </div>
                        <div class="stats-number" data-count="276">276</div>
                        <div class="stats-label">Équipements disponibles</div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 mb-4">
                    <div class="stats-card">
                        <div class="stats-icon">
                            <i class="bi bi-people"></i>
                        </div>
                        <div class="stats-number" data-count="1247">1247</div>
                        <div class="stats-label">Clients satisfaits</div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 mb-4">
                    <div class="stats-card">
                        <div class="stats-icon">
                            <i class="bi bi-calendar-check"></i>
                        </div>
                        <div class="stats-number" data-count="3456">3456</div>
                        <div class="stats-label">Réservations réussies</div>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6 mb-4">
                    <div class="stats-card">
                        <div class="stats-icon">
                            <i class="bi bi-star-fill"></i>
                        </div>
                        <div class="stats-number" data-count="4.8">4.8</div>
                        <div class="stats-label">Note moyenne</div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- How It Works Section -->
    <section class="py-5">
        <div class="container">
            <div class="text-center mb-5">
                <h2 class="display-5 fw-bold mb-3">Comment ça marche</h2>
                <p class="lead text-muted">Louez votre matériel en 3 étapes simples</p>
            </div>
            
            <div class="row features-grid">
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="feature-card">
                        <div class="feature-icon">
                            <i class="bi bi-search"></i>
                        </div>
                        <h4 class="feature-title">1. Recherchez</h4>
                        <p class="feature-description">
                            Parcourez notre catalogue et trouvez l'équipement qui correspond à vos besoins. 
                            Utilisez nos filtres pour affiner votre recherche.
                        </p>
                    </div>
                </div>
                
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="feature-card">
                        <div class="feature-icon">
                            <i class="bi bi-calendar-check"></i>
                        </div>
                        <h4 class="feature-title">2. Réservez</h4>
                        <p class="feature-description">
                            Sélectionnez vos dates de location et confirmez votre réservation en ligne. 
                            Paiement sécurisé et confirmation immédiate.
                        </p>
                    </div>
                </div>
                
                <div class="col-lg-4 col-md-6 mb-4">
                    <div class="feature-card">
                        <div class="feature-icon">
                            <i class="bi bi-box-seam"></i>
                        </div>
                        <h4 class="feature-title">3. Récupérez</h4>
                        <p class="feature-description">
                            Récupérez votre matériel chez notre partenaire ou optez pour la livraison. 
                            Profitez de votre équipement professionnel !
                        </p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- CTA Section -->
    <section class="py-5 bg-gradient-primary text-white">
        <div class="container text-center">
            <div class="row justify-content-center">
                <div class="col-lg-8">
                    <h2 class="display-5 fw-bold mb-4">Prêt à commencer ?</h2>
                    <p class="lead mb-4">
                        Rejoignez des milliers de professionnels qui font confiance à YOURS 
                        pour leurs besoins en équipement.
                    </p>
                    <div class="d-flex flex-wrap justify-content-center gap-3">
                        <a href="pages/auth/register-client.jsp" class="btn btn-light btn-lg">
                            <i class="bi bi-person-plus me-2"></i>Créer un compte
                        </a>
                        <a href="pages/equipment/list.jsp" class="btn btn-outline-light btn-lg">
                            <i class="bi bi-grid me-2"></i>Parcourir le matériel
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Include Footer -->
    <jsp:include page="layouts/footer.jsp" />

    <!-- Bootstrap 5 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Custom JavaScript -->
    <script src="js/main.js"></script>
    <script src="js/mock-data.js"></script>
</body>
</html>
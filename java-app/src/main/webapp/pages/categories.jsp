<%@ include file="../layouts/header.jsp" %>
<%@ include file="../layouts/navbar.jsp" %>

<div class="container py-5">
    <div class="row">
        <div class="col-12">
            <div class="text-center mb-5">
                <h1 class="display-4 fw-bold text-primary">Cat&eacute;gories de Mat&eacute;riel</h1>
                <p class="lead text-muted">D&eacute;couvrez notre large gamme d'&eacute;quipements professionnels</p>
            </div>

            <div class="row g-4">
                <div class="col-lg-4 col-md-6">
                    <div class="card h-100 border-0 shadow-sm category-card">
                        <div class="card-body text-center p-4">
                            <i class="fas fa-camera fa-4x text-primary mb-3"></i>
                            <h4 class="card-title">Photographie</h4>
                            <p class="card-text text-muted">Appareils photo, objectifs, &eacute;clairage, tr&eacute;pieds et accessoires photo professionnels.</p>
                            <a href="${pageContext.request.contextPath}/pages/equipment/list.jsp?category=photo" class="btn btn-outline-primary">
                                Voir les &eacute;quipements <i class="fas fa-arrow-right ms-1"></i>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="card h-100 border-0 shadow-sm category-card">
                        <div class="card-body text-center p-4">
                            <i class="fas fa-video fa-4x text-primary mb-3"></i>
                            <h4 class="card-title">Vid&eacute;o</h4>
                            <p class="card-text text-muted">Cam&eacute;ras, stabilisateurs, micros, &eacute;clairage et &eacute;quipements de tournage.</p>
                            <a href="${pageContext.request.contextPath}/pages/equipment/list.jsp?category=video" class="btn btn-outline-primary">
                                Voir les &eacute;quipements <i class="fas fa-arrow-right ms-1"></i>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="card h-100 border-0 shadow-sm category-card">
                        <div class="card-body text-center p-4">
                            <i class="fas fa-music fa-4x text-primary mb-3"></i>
                            <h4 class="card-title">Audio</h4>
                            <p class="card-text text-muted">Micros, enregistreurs, mixeurs, enceintes et &eacute;quipements sonores.</p>
                            <a href="${pageContext.request.contextPath}/pages/equipment/list.jsp?category=audio" class="btn btn-outline-primary">
                                Voir les &eacute;quipements <i class="fas fa-arrow-right ms-1"></i>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="card h-100 border-0 shadow-sm category-card">
                        <div class="card-body text-center p-4">
                            <i class="fas fa-lightbulb fa-4x text-primary mb-3"></i>
                            <h4 class="card-title">&Eacute;clairage</h4>
                            <p class="card-text text-muted">Projecteurs, LED, softbox, parapluies et accessoires d'&eacute;clairage.</p>
                            <a href="${pageContext.request.contextPath}/pages/equipment/list.jsp?category=lighting" class="btn btn-outline-primary">
                                Voir les &eacute;quipements <i class="fas fa-arrow-right ms-1"></i>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="card h-100 border-0 shadow-sm category-card">
                        <div class="card-body text-center p-4">
                            <i class="fas fa-laptop fa-4x text-primary mb-3"></i>
                            <h4 class="card-title">Informatique</h4>
                            <p class="card-text text-muted">Ordinateurs, tablettes, &eacute;crans, projecteurs et &eacute;quipements IT.</p>
                            <a href="${pageContext.request.contextPath}/pages/equipment/list.jsp?category=it" class="btn btn-outline-primary">
                                Voir les &eacute;quipements <i class="fas fa-arrow-right ms-1"></i>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="card h-100 border-0 shadow-sm category-card">
                        <div class="card-body text-center p-4">
                            <i class="fas fa-tools fa-4x text-primary mb-3"></i>
                            <h4 class="card-title">Outillage</h4>
                            <p class="card-text text-muted">Outils &eacute;lectriques, perceuses, scies et &eacute;quipements de construction.</p>
                            <a href="${pageContext.request.contextPath}/pages/equipment/list.jsp?category=tools" class="btn btn-outline-primary">
                                Voir les &eacute;quipements <i class="fas fa-arrow-right ms-1"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="text-center mt-5">
                <h3 class="mb-3">Vous ne trouvez pas ce que vous cherchez ?</h3>
                <p class="text-muted mb-4">Contactez-nous pour des demandes sp&eacute;ciales ou des &eacute;quipements sur mesure.</p>
                <a href="#" class="btn btn-primary btn-lg">
                    <i class="fas fa-envelope me-2"></i>Nous Contacter
                </a>
            </div>
        </div>
    </div>
</div>

<style>
.category-card {
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.category-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 10px 25px rgba(0,0,0,0.1) !important;
}
</style>

<%@ include file="../layouts/footer.jsp" %>

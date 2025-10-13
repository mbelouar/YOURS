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
                    <div class="card h-100 border-0 shadow-sm category-card overflow-hidden">
                        <img src="https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f?w=600&auto=format&fit=crop&q=80" 
                             class="card-img-top" alt="Photographie" style="height: 200px; object-fit: cover;">
                        <div class="card-body text-center p-4">
                            <i class="fas fa-camera fa-3x text-primary mb-3"></i>
                            <h4 class="card-title text-primary fw-bold">Photographie</h4>
                            <p class="card-text text-muted">Appareils photo, objectifs, tr&eacute;pieds, sacs photo et accessoires photographiques.</p>
                            <a href="${pageContext.request.contextPath}/pages/equipment/list.jsp?category=photo" class="btn btn-outline-primary">
                                Voir les &eacute;quipements <i class="fas fa-arrow-right ms-1"></i>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="card h-100 border-0 shadow-sm category-card overflow-hidden">
                        <img src="https://images.unsplash.com/photo-1492619375914-88005aa9e8fb?w=600&auto=format&fit=crop&q=80" 
                             class="card-img-top" alt="Vid&eacute;o" style="height: 200px; object-fit: cover;">
                        <div class="card-body text-center p-4">
                            <i class="fas fa-video fa-3x text-primary mb-3"></i>
                            <h4 class="card-title text-primary fw-bold">Vid&eacute;o</h4>
                            <p class="card-text text-muted">Cam&eacute;ras vid&eacute;o, stabilisateurs, drones, enregistreurs et accessoires de tournage.</p>
                            <a href="${pageContext.request.contextPath}/pages/equipment/list.jsp?category=video" class="btn btn-outline-primary">
                                Voir les &eacute;quipements <i class="fas fa-arrow-right ms-1"></i>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="card h-100 border-0 shadow-sm category-card overflow-hidden">
                        <img src="https://images.unsplash.com/photo-1598488035139-bdbb2231ce04?w=600&auto=format&fit=crop&q=80" 
                             class="card-img-top" alt="Audio" style="height: 200px; object-fit: cover;">
                        <div class="card-body text-center p-4">
                            <i class="fas fa-music fa-3x text-primary mb-3"></i>
                            <h4 class="card-title text-primary fw-bold">Audio</h4>
                            <p class="card-text text-muted">Microphones, casques, mixeurs, tables de mixage et &eacute;quipements audio.</p>
                            <a href="${pageContext.request.contextPath}/pages/equipment/list.jsp?category=audio" class="btn btn-outline-primary">
                                Voir les &eacute;quipements <i class="fas fa-arrow-right ms-1"></i>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="card h-100 border-0 shadow-sm category-card overflow-hidden">
                        <img src="https://images.unsplash.com/photo-1556656793-08538906a9f8?w=600&auto=format&fit=crop&q=80" 
                             class="card-img-top" alt="&Eacute;clairage" style="height: 200px; object-fit: cover;">
                        <div class="card-body text-center p-4">
                            <i class="fas fa-lightbulb fa-3x text-primary mb-3"></i>
                            <h4 class="card-title text-primary fw-bold">&Eacute;clairage</h4>
                            <p class="card-text text-muted">Projecteurs, LED, softbox, parapluies et accessoires d'&eacute;clairage.</p>
                            <a href="${pageContext.request.contextPath}/pages/equipment/list.jsp?category=lighting" class="btn btn-outline-primary">
                                Voir les &eacute;quipements <i class="fas fa-arrow-right ms-1"></i>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="card h-100 border-0 shadow-sm category-card overflow-hidden">
                        <img src="https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=600&auto=format&fit=crop&q=80" 
                             class="card-img-top" alt="Informatique" style="height: 200px; object-fit: cover;">
                        <div class="card-body text-center p-4">
                            <i class="fas fa-laptop fa-3x text-primary mb-3"></i>
                            <h4 class="card-title text-primary fw-bold">Informatique</h4>
                            <p class="card-text text-muted">Ordinateurs, tablettes, &eacute;crans, claviers, souris et accessoires informatiques.</p>
                            <a href="${pageContext.request.contextPath}/pages/equipment/list.jsp?category=it" class="btn btn-outline-primary">
                                Voir les &eacute;quipements <i class="fas fa-arrow-right ms-1"></i>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="card h-100 border-0 shadow-sm category-card overflow-hidden">
                        <img src="https://images.unsplash.com/photo-1530124566582-a618bc2615dc?w=600&auto=format&fit=crop&q=80" 
                             class="card-img-top" alt="Outillage" style="height: 200px; object-fit: cover;">
                        <div class="card-body text-center p-4">
                            <i class="fas fa-tools fa-3x text-primary mb-3"></i>
                            <h4 class="card-title text-primary fw-bold">Outillage</h4>
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

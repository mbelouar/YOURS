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
                        <img src="https://thefoxmagazine.com/wp-content/uploads/2021/07/alejandro-luengo-0A6_DK8hfiI-unsplash-scaled.jpg" 
                             class="card-img-top" alt="Photographie" style="height: 250px; object-fit: cover;">
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
                        <img src="https://images.ctfassets.net/et769tc4wc1v/3BVyScrKYEsMuEM5cIEfiq/d14ac33cd95642f18cf8c72695f8ee46/Copy-of-In-Blog-Image-Template-2022-01-25T104132.827-1.png?w=1025&h=500&q=50&fm=png&bg=transparent" 
                             class="card-img-top" alt="Vid&eacute;o" style="height: 250px; object-fit: cover;">
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
                        <img src="https://article.images.consumerreports.org/image/upload/t_article_tout/v1680190819/prod/content/dam/CRO-Images-2023/03March/Electronics/CR-Tech-Inlinehero-Sony-Speakers-0323" 
                             class="card-img-top" alt="Audio" style="height: 250px; object-fit: cover;">
                        <div class="card-body text-center p-4">
                            <i class="fas fa-music fa-3x text-primary mb-3"></i>
                            <h4 class="card-title text-primary fw-bold">Audio</h4>
                            <p class="card-text text-muted">Microphones, casques, speakers, tables de mixage et &eacute;quipements audio.</p>
                            <a href="${pageContext.request.contextPath}/pages/equipment/list.jsp?category=audio" class="btn btn-outline-primary">
                                Voir les &eacute;quipements <i class="fas fa-arrow-right ms-1"></i>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="card h-100 border-0 shadow-sm category-card overflow-hidden">
                        <img src="https://sourcinbox-app.oss-us-west-1.aliyuncs.com/ad8a8a26271b47079c041efb5d3509451661301383385473024.jpg" 
                             class="card-img-top" alt="Gaming" style="height: 250px; object-fit: cover;">
                        <div class="card-body text-center p-4">
                            <i class="fas fa-gamepad fa-3x text-primary mb-3"></i>
                            <h4 class="card-title text-primary fw-bold">Gaming</h4>
                            <p class="card-text text-muted">Consoles, PC gaming, p&eacute;riph&eacute;riques, casques et accessoires gaming.</p>
                            <a href="${pageContext.request.contextPath}/pages/equipment/list.jsp?category=gaming" class="btn btn-outline-primary">
                                Voir les &eacute;quipements <i class="fas fa-arrow-right ms-1"></i>
                            </a>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="card h-100 border-0 shadow-sm category-card overflow-hidden">
                        <img src="https://static.wixstatic.com/media/11062b_5f9ecce43b0a4acab4ca3b05fb7a233d~mv2.jpg/v1/fill/w_640,h_688,al_c,q_85,usm_0.66_1.00_0.01,enc_avif,quality_auto/11062b_5f9ecce43b0a4acab4ca3b05fb7a233d~mv2.jpg" 
                             class="card-img-top" alt="Informatique" style="height: 250px; object-fit: cover;">
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
                        <img src="https://m.media-amazon.com/images/I/61HbfYLOzbL._UF894,1000_QL80_.jpg" 
                             class="card-img-top" alt="&Eacute;clairage" style="height: 250px; object-fit: cover;">
                        <div class="card-body text-center p-4">
                            <i class="fas fa-lightbulb fa-3x text-primary mb-3"></i>
                            <h4 class="card-title text-primary fw-bold">&Eacute;clairage</h4>
                            <p class="card-text text-muted">Projecteurs LED, ring lights, softbox, parapluies et &eacute;clairage de studio.</p>
                            <a href="${pageContext.request.contextPath}/pages/equipment/list.jsp?category=lighting" class="btn btn-outline-primary">
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

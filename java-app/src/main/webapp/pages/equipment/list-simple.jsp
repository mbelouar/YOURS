<%@ include file="../../layouts/header.jsp" %>
<%@ include file="../../layouts/navbar.jsp" %>

<div class="container py-5">
    <div class="row">
        <div class="col-12">
            <h1 class="display-4 fw-bold text-primary mb-4">Mat&eacute;riel Disponible</h1>
            
            <div class="row g-4">
                <div class="col-lg-4 col-md-6">
                    <div class="card card-modern card-equipment h-100">
                        <div class="position-relative">
                            <img src="https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f?w=600&auto=format&fit=crop&q=80" 
                                 class="card-img-top" alt="Canon EOS R5" style="height: 200px; object-fit: cover;">
                            <div class="availability-badge">Disponible</div>
                            <div class="price-badge">240 MAD/jour</div>
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">Canon EOS R5</h5>
                            <p class="card-text text-muted">Appareil photo professionnel 45MP</p>
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
                    <div class="card card-modern card-equipment h-100">
                        <div class="position-relative">
                            <img src="https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=600&auto=format&fit=crop&q=80" 
                                 class="card-img-top" alt="MacBook Pro" style="height: 200px; object-fit: cover;">
                            <div class="availability-badge">Disponible</div>
                            <div class="price-badge">150 MAD/jour</div>
                        </div>
                        <div class="card-body">
                            <h5 class="card-title">MacBook Pro 16"</h5>
                            <p class="card-text text-muted">Ordinateur portable M2 Pro</p>
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
                    <div class="card card-modern card-equipment h-100">
                            <img src="https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600&auto=format&fit=crop&q=80"
                             class="card-img-top" alt="Sony A7 III" style="height: 200px; object-fit: cover;">
                        <div class="card-body">
                            <h5 class="card-title">Sony A7 III</h5>
                            <p class="card-text text-muted">Appareil photo hybride 24MP</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <span class="fw-bold text-primary">180 MAD/jour</span>
                                <a href="${pageContext.request.contextPath}/pages/equipment/detail.jsp?id=3" class="btn btn-primary btn-sm">
                                    Voir détails
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="card card-modern card-equipment h-100">
                            <img src="https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600&auto=format&fit=crop&q=80"
                             class="card-img-top" alt="iPad Pro" style="height: 200px; object-fit: cover;">
                        <div class="card-body">
                            <h5 class="card-title">iPad Pro 12.9"</h5>
                            <p class="card-text text-muted">Tablette professionnelle M2</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <span class="fw-bold text-primary">75 MAD/jour</span>
                                <a href="${pageContext.request.contextPath}/pages/equipment/detail.jsp?id=4" class="btn btn-primary btn-sm">
                                    Voir détails
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="card card-modern card-equipment h-100">
                            <img src="https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600&auto=format&fit=crop&q=80"
                             class="card-img-top" alt="DJI Mavic" style="height: 200px; object-fit: cover;">
                        <div class="card-body">
                            <h5 class="card-title">DJI Mavic Air 2</h5>
                            <p class="card-text text-muted">Drone professionnel 4K</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <span class="fw-bold text-primary">120 MAD/jour</span>
                                <a href="${pageContext.request.contextPath}/pages/equipment/detail.jsp?id=5" class="btn btn-primary btn-sm">
                                    Voir détails
                                </a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-4 col-md-6">
                    <div class="card card-modern card-equipment h-100">
                            <img src="https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600&auto=format&fit=crop&q=80"
                             class="card-img-top" alt="Rode Microphone" style="height: 200px; object-fit: cover;">
                        <div class="card-body">
                            <h5 class="card-title">Rode PodMic</h5>
                            <p class="card-text text-muted">Microphone professionnel</p>
                            <div class="d-flex justify-content-between align-items-center">
                                <span class="fw-bold text-primary">30 MAD/jour</span>
                                <a href="${pageContext.request.contextPath}/pages/equipment/detail.jsp?id=6" class="btn btn-primary btn-sm">
                                    Voir détails
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="text-center mt-5">
                <nav aria-label="Equipment pagination">
                    <ul class="pagination justify-content-center">
                        <li class="page-item disabled">
                            <a class="page-link" href="#" tabindex="-1">Précédent</a>
                        </li>
                        <li class="page-item active">
                            <a class="page-link" href="#">1</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">2</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">3</a>
                        </li>
                        <li class="page-item">
                            <a class="page-link" href="#">Suivant</a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>
    </div>
</div>

<%@ include file="../../layouts/footer.jsp" %>

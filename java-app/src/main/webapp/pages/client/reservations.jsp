<%@ include file="../../layouts/header.jsp" %>
<%@ include file="../../layouts/navbar.jsp" %>

<div class="container py-4" style="margin-top: 80px;">
    <!-- Breadcrumb -->
    <nav aria-label="breadcrumb" class="mb-4">
        <ol class="breadcrumb breadcrumb-custom">
            <li class="breadcrumb-item">
                <a href="${pageContext.request.contextPath}/pages/client/dashboard.jsp">
                    <i class="bi bi-house me-1"></i>Tableau de bord
                </a>
            </li>
            <li class="breadcrumb-item active">Mes Réservations</li>
        </ol>
    </nav>
    <div class="row">
        <div class="col-12">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h1 class="display-5 fw-bold text-primary">Mes Réservations</h1>
                <a href="${pageContext.request.contextPath}/pages/equipment/list.jsp" class="btn btn-primary">
                    <i class="fas fa-plus me-1"></i>Nouvelle Réservation
                </a>
            </div>

            <!-- Filter tabs -->
            <ul class="nav nav-pills mb-4" id="reservationTabs" role="tablist">
                <li class="nav-item" role="presentation">
                    <button class="nav-link active" id="all-tab" data-bs-toggle="pill" data-bs-target="#all" type="button" role="tab">
                        Toutes <span class="badge bg-secondary ms-1">5</span>
                    </button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="active-tab" data-bs-toggle="pill" data-bs-target="#active" type="button" role="tab">
                        En cours <span class="badge bg-primary ms-1">2</span>
                    </button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="upcoming-tab" data-bs-toggle="pill" data-bs-target="#upcoming" type="button" role="tab">
                        À venir <span class="badge bg-warning ms-1">1</span>
                    </button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="completed-tab" data-bs-toggle="pill" data-bs-target="#completed" type="button" role="tab">
                        Terminées <span class="badge bg-success ms-1">2</span>
                    </button>
                </li>
            </ul>

            <div class="tab-content" id="reservationTabsContent">
                <div class="tab-pane fade show active" id="all" role="tabpanel">
                    <div class="row g-4">
                        <!-- Active Reservation 1 -->
                        <div class="col-lg-6">
                            <div class="card border-0 shadow-sm">
                                <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                                    <h6 class="mb-0">Réservation #R001</h6>
                                    <span class="badge bg-light text-primary">En cours</span>
                                </div>
                                <div class="card-body">
                                    <div class="d-flex align-items-center mb-3">
                                        <img src="${pageContext.request.contextPath}/assets/images/placeholder-equipment.jpg" 
                                             alt="Canon EOS R5" class="rounded me-3" style="width: 60px; height: 60px; object-fit: cover;">
                                        <div>
                                            <h6 class="mb-1">Canon EOS R5</h6>
                                            <small class="text-muted">Appareil photo professionnel</small>
                                        </div>
                                    </div>
                                    <div class="row g-2 mb-3">
                                        <div class="col-6">
                                            <small class="text-muted">Début:</small><br>
                                            <strong>15 Oct 2025</strong>
                                        </div>
                                        <div class="col-6">
                                            <small class="text-muted">Fin:</small><br>
                                            <strong>20 Oct 2025</strong>
                                        </div>
                                    </div>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <span class="fw-bold text-primary">1,200 MAD</span>
                                        <div>
                                            <button class="btn btn-sm btn-outline-primary me-1">
                                                <i class="fas fa-eye"></i>
                                            </button>
                                            <button class="btn btn-sm btn-outline-danger">
                                                <i class="fas fa-times"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Active Reservation 2 -->
                        <div class="col-lg-6">
                            <div class="card border-0 shadow-sm">
                                <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
                                    <h6 class="mb-0">Réservation #R002</h6>
                                    <span class="badge bg-light text-primary">En cours</span>
                                </div>
                                <div class="card-body">
                                    <div class="d-flex align-items-center mb-3">
                                        <img src="${pageContext.request.contextPath}/assets/images/placeholder-equipment.jpg" 
                                             alt="MacBook Pro" class="rounded me-3" style="width: 60px; height: 60px; object-fit: cover;">
                                        <div>
                                            <h6 class="mb-1">MacBook Pro 16"</h6>
                                            <small class="text-muted">Ordinateur portable</small>
                                        </div>
                                    </div>
                                    <div class="row g-2 mb-3">
                                        <div class="col-6">
                                            <small class="text-muted">Début:</small><br>
                                            <strong>10 Oct 2025</strong>
                                        </div>
                                        <div class="col-6">
                                            <small class="text-muted">Fin:</small><br>
                                            <strong>25 Oct 2025</strong>
                                        </div>
                                    </div>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <span class="fw-bold text-primary">2,250 MAD</span>
                                        <div>
                                            <button class="btn btn-sm btn-outline-primary me-1">
                                                <i class="fas fa-eye"></i>
                                            </button>
                                            <button class="btn btn-sm btn-outline-danger">
                                                <i class="fas fa-times"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Upcoming Reservation -->
                        <div class="col-lg-6">
                            <div class="card border-0 shadow-sm">
                                <div class="card-header bg-warning text-dark d-flex justify-content-between align-items-center">
                                    <h6 class="mb-0">Réservation #R003</h6>
                                    <span class="badge bg-dark">À venir</span>
                                </div>
                                <div class="card-body">
                                    <div class="d-flex align-items-center mb-3">
                                        <img src="${pageContext.request.contextPath}/assets/images/placeholder-equipment.jpg" 
                                             alt="Sony A7 III" class="rounded me-3" style="width: 60px; height: 60px; object-fit: cover;">
                                        <div>
                                            <h6 class="mb-1">Sony A7 III</h6>
                                            <small class="text-muted">Appareil photo hybride</small>
                                        </div>
                                    </div>
                                    <div class="row g-2 mb-3">
                                        <div class="col-6">
                                            <small class="text-muted">Début:</small><br>
                                            <strong>25 Oct 2025</strong>
                                        </div>
                                        <div class="col-6">
                                            <small class="text-muted">Fin:</small><br>
                                            <strong>30 Oct 2025</strong>
                                        </div>
                                    </div>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <span class="fw-bold text-primary">900 MAD</span>
                                        <div>
                                            <button class="btn btn-sm btn-outline-primary me-1">
                                                <i class="fas fa-eye"></i>
                                            </button>
                                            <button class="btn btn-sm btn-outline-danger">
                                                <i class="fas fa-times"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Completed Reservations -->
                        <div class="col-lg-6">
                            <div class="card border-0 shadow-sm">
                                <div class="card-header bg-success text-white d-flex justify-content-between align-items-center">
                                    <h6 class="mb-0">Réservation #R004</h6>
                                    <span class="badge bg-light text-success">Terminée</span>
                                </div>
                                <div class="card-body">
                                    <div class="d-flex align-items-center mb-3">
                                        <img src="${pageContext.request.contextPath}/assets/images/placeholder-equipment.jpg" 
                                             alt="iPad Pro" class="rounded me-3" style="width: 60px; height: 60px; object-fit: cover;">
                                        <div>
                                            <h6 class="mb-1">iPad Pro 12.9"</h6>
                                            <small class="text-muted">Tablette professionnelle</small>
                                        </div>
                                    </div>
                                    <div class="row g-2 mb-3">
                                        <div class="col-6">
                                            <small class="text-muted">Début:</small><br>
                                            <strong>01 Oct 2025</strong>
                                        </div>
                                        <div class="col-6">
                                            <small class="text-muted">Fin:</small><br>
                                            <strong>10 Oct 2025</strong>
                                        </div>
                                    </div>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <span class="fw-bold text-success">750 MAD</span>
                                        <div>
                                            <button class="btn btn-sm btn-outline-primary me-1">
                                                <i class="fas fa-eye"></i>
                                            </button>
                                            <button class="btn btn-sm btn-outline-secondary">
                                                <i class="fas fa-star"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-6">
                            <div class="card border-0 shadow-sm">
                                <div class="card-header bg-success text-white d-flex justify-content-between align-items-center">
                                    <h6 class="mb-0">Réservation #R005</h6>
                                    <span class="badge bg-light text-success">Terminée</span>
                                </div>
                                <div class="card-body">
                                    <div class="d-flex align-items-center mb-3">
                                        <img src="${pageContext.request.contextPath}/assets/images/placeholder-equipment.jpg" 
                                             alt="DJI Mavic" class="rounded me-3" style="width: 60px; height: 60px; object-fit: cover;">
                                        <div>
                                            <h6 class="mb-1">DJI Mavic Air 2</h6>
                                            <small class="text-muted">Drone professionnel</small>
                                        </div>
                                    </div>
                                    <div class="row g-2 mb-3">
                                        <div class="col-6">
                                            <small class="text-muted">Début:</small><br>
                                            <strong>20 Sep 2025</strong>
                                        </div>
                                        <div class="col-6">
                                            <small class="text-muted">Fin:</small><br>
                                            <strong>25 Sep 2025</strong>
                                        </div>
                                    </div>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <span class="fw-bold text-success">600 MAD</span>
                                        <div>
                                            <button class="btn btn-sm btn-outline-primary me-1">
                                                <i class="fas fa-eye"></i>
                                            </button>
                                            <button class="btn btn-sm btn-outline-secondary">
                                                <i class="fas fa-star"></i>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Other tab content would be filtered versions of the above -->
                <div class="tab-pane fade" id="active" role="tabpanel">
                    <p class="text-muted">Filtrage des réservations en cours...</p>
                </div>
                <div class="tab-pane fade" id="upcoming" role="tabpanel">
                    <p class="text-muted">Filtrage des réservations à venir...</p>
                </div>
                <div class="tab-pane fade" id="completed" role="tabpanel">
                    <p class="text-muted">Filtrage des réservations terminées...</p>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="../../layouts/footer.jsp" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setAttribute("pageTitle", "Mes Réservations - YOURS");
%>

<%@ include file="../../layouts/header.jsp" %>
<%@ include file="../../layouts/navbar.jsp" %>

<!-- Page Header -->
<section class="py-5" style="background: linear-gradient(135deg, #1e40af 0%, #1e3a8a 50%, #1e293b 100%); margin-top: -80px; padding-top: calc(80px + 6rem) !important; padding-bottom: 6rem !important; min-height: 400px; position: relative; overflow: hidden;">
    <div style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; background: radial-gradient(circle at 20% 50%, rgba(59, 130, 246, 0.15) 0%, transparent 50%); opacity: 1;"></div>
    <div class="container" style="position: relative; z-index: 2;">
        <div class="row">
            <div class="col-lg-10 mx-auto text-center">
                <!-- Badge -->
                <div class="d-inline-flex align-items-center mb-4" style="background: rgba(255, 255, 255, 0.15); backdrop-filter: blur(20px); border-radius: 50px; padding: 0.75rem 1.5rem; border: 1px solid rgba(255, 255, 255, 0.2); box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);">
                    <i class="fas fa-calendar-check me-2" style="color: #fbbf24; font-size: 1rem;"></i>
                    <span style="color: white; font-weight: 600; font-size: 0.875rem; letter-spacing: 0.5px;">GESTION DES RÉSERVATIONS</span>
                </div>
                
                <!-- Main Title -->
                <h1 class="display-2 fw-bold mb-4" style="color: white; text-shadow: 0 4px 20px rgba(0,0,0,0.3); letter-spacing: -0.03em; line-height: 1.1;">
                    Mes <span style="background: linear-gradient(135deg, #fbbf24, #f59e0b); -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text;">Réservations</span>
                </h1>
                
                <!-- Subtitle -->
                <div class="mb-4" style="max-width: 700px; margin: 0 auto;">
                    <p class="lead mb-2" style="color: rgba(255, 255, 255, 0.95); font-size: 1.375rem; font-weight: 400; line-height: 1.6; letter-spacing: -0.01em;">
                        Suivez et gérez toutes vos réservations de matériel professionnel
                    </p>
                    <p class="mb-0" style="color: rgba(255, 255, 255, 0.8); font-size: 1.1rem; font-weight: 300; line-height: 1.7;">
                        Historique complet • Statuts en temps réel • Gestion simplifiée
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

<!-- Reservations Content -->
<div class="container py-5">
    <div class="row">
        <div class="col-12">
            <!-- Action Bar -->
            <div class="d-flex flex-wrap justify-content-between align-items-center gap-3 mb-5">
                <!-- Stats Summary -->
                <div class="d-flex align-items-center bg-white px-4 py-2 rounded-3 shadow-sm border-0" style="border-left: 4px solid var(--primary-600) !important;">
                    <div class="me-3">
                        <div class="bg-primary rounded-2 d-flex align-items-center justify-content-center" style="width: 48px; height: 48px;">
                            <i class="fas fa-calendar-check text-white" style="font-size: 1.125rem;"></i>
                        </div>
                    </div>
                    <div>
                        <div class="h4 mb-0 text-dark fw-bold">5</div>
                        <small class="text-muted fw-medium">Réservations totales</small>
                    </div>
                </div>
                
                <!-- New Reservation Button -->
                <a href="${pageContext.request.contextPath}/pages/equipment/list-simple.jsp" 
                   class="btn btn-primary btn-lg d-flex align-items-center gap-2 px-4 py-3 rounded-4 shadow-sm border-0 fw-semibold" 
                   style="min-height: 64px; background: var(--primary-600) !important; border: none !important; transition: all 0.2s ease;">
                    <i class="fas fa-plus" style="font-size: 0.875rem;"></i>
                    Nouvelle Réservation
                </a>
            </div>

            <!-- Filter Tabs -->
            <div class="mb-4">
                <div class="nav nav-pills nav-pills-modern" role="tablist" style="background: white; border-radius: 1rem; padding: 0.5rem; box-shadow: 0 4px 20px -2px rgba(0, 0, 0, 0.08); border: 1px solid rgba(226, 232, 240, 0.8);">
                    <button class="nav-link active" id="all-tab" data-bs-toggle="pill" data-bs-target="#all" type="button" role="tab" 
                            style="border-radius: 0.75rem; padding: 0.75rem 1.5rem; font-weight: 600; transition: all 0.3s ease; background: linear-gradient(135deg, var(--primary-600), var(--primary-700)); color: white;">
                        <i class="fas fa-list me-2"></i>Toutes <span class="badge bg-light text-primary ms-2">5</span>
                    </button>
                    <button class="nav-link" id="active-tab" data-bs-toggle="pill" data-bs-target="#active" type="button" role="tab"
                            style="border-radius: 0.75rem; padding: 0.75rem 1.5rem; font-weight: 600; transition: all 0.3s ease; color: var(--gray-700);">
                        <i class="fas fa-play-circle me-2"></i>En cours <span class="badge bg-primary ms-2">2</span>
                    </button>
                    <button class="nav-link" id="upcoming-tab" data-bs-toggle="pill" data-bs-target="#upcoming" type="button" role="tab"
                            style="border-radius: 0.75rem; padding: 0.75rem 1.5rem; font-weight: 600; transition: all 0.3s ease; color: var(--gray-700);">
                        <i class="fas fa-clock me-2"></i>À venir <span class="badge bg-warning ms-2">1</span>
                    </button>
                    <button class="nav-link" id="completed-tab" data-bs-toggle="pill" data-bs-target="#completed" type="button" role="tab"
                            style="border-radius: 0.75rem; padding: 0.75rem 1.5rem; font-weight: 600; transition: all 0.3s ease; color: var(--gray-700);">
                        <i class="fas fa-check-circle me-2"></i>Terminées <span class="badge bg-success ms-2">2</span>
                    </button>
                </div>
            </div>

            <!-- Tab Content -->
            <div class="tab-content" id="reservationTabsContent">
                <!-- All Reservations -->
                <div class="tab-pane fade show active" id="all" role="tabpanel">
                    <div class="row g-4">
                        <!-- Active Reservation 1 -->
                        <div class="col-lg-6">
                            <div class="card card-modern card-reservation h-100" style="border: none; border-radius: 1.25rem; box-shadow: 0 8px 32px -4px rgba(0, 0, 0, 0.12); transition: all 0.3s ease; background: linear-gradient(135deg, #ffffff 0%, #f8fafc 100%);">
                                <div class="card-header" style="background: linear-gradient(135deg, var(--primary-600), var(--primary-700)); border-radius: 1.25rem 1.25rem 0 0; border: none; padding: 1.5rem;">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <h6 class="mb-0 text-white fw-bold" style="font-size: 1rem; letter-spacing: -0.01em;">
                                            <i class="fas fa-hashtag me-2" style="opacity: 0.8;"></i>Réservation R001
                                        </h6>
                                        <span class="badge" style="background: rgba(255, 255, 255, 0.2); color: white; font-weight: 600; padding: 0.5rem 1rem; border-radius: 0.75rem; font-size: 0.875rem;">
                                            <i class="fas fa-play-circle me-1"></i>En cours
                                        </span>
                                    </div>
                                </div>
                                <div class="card-body" style="padding: 1.5rem;">
                                    <div class="d-flex align-items-center mb-4">
                                        <div class="position-relative me-3">
                                            <img src="https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=300&auto=format&fit=crop&q=80" 
                                                 alt="Canon EOS R5" 
                                                 style="width: 80px; height: 80px; object-fit: cover; border-radius: 1rem; box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);">
                                            <div class="position-absolute top-0 end-0" style="width: 12px; height: 12px; background: #10b981; border-radius: 50%; border: 2px solid white;"></div>
                                        </div>
                                        <div class="flex-grow-1">
                                            <h6 class="mb-1 fw-bold" style="color: var(--gray-900); font-size: 1.125rem;">Canon EOS R5</h6>
                                            <p class="text-muted mb-0" style="font-size: 0.875rem; line-height: 1.4;">Appareil photo professionnel 45MP</p>
                                            <div class="d-flex align-items-center mt-1">
                                                <div class="rating me-2">
                                                    <i class="fas fa-star" style="color: #fbbf24; font-size: 0.75rem;"></i>
                                                    <i class="fas fa-star" style="color: #fbbf24; font-size: 0.75rem;"></i>
                                                    <i class="fas fa-star" style="color: #fbbf24; font-size: 0.75rem;"></i>
                                                    <i class="fas fa-star" style="color: #fbbf24; font-size: 0.75rem;"></i>
                                                    <i class="fas fa-star" style="color: #fbbf24; font-size: 0.75rem;"></i>
                                                </div>
                                                <small class="text-muted">(4.9)</small>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="row g-3 mb-4">
                                        <div class="col-6">
                                            <div style="background: rgba(37, 99, 235, 0.05); padding: 1rem; border-radius: 0.75rem; border-left: 4px solid var(--primary-600);">
                                                <small class="text-muted d-block" style="font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.5px;">Début</small>
                                                <strong style="color: var(--gray-900); font-size: 0.875rem;">15 Oct 2025</strong>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div style="background: rgba(239, 68, 68, 0.05); padding: 1rem; border-radius: 0.75rem; border-left: 4px solid #ef4444;">
                                                <small class="text-muted d-block" style="font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.5px;">Fin</small>
                                                <strong style="color: var(--gray-900); font-size: 0.875rem;">20 Oct 2025</strong>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <small class="text-muted d-block" style="font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.5px;">Total</small>
                                            <span class="fw-bold" style="color: var(--primary-600); font-size: 1.25rem;">1,200 MAD</span>
                                        </div>
                                        <div class="d-flex gap-2">
                                            <a href="${pageContext.request.contextPath}/pages/equipment/detail.jsp?id=1" class="btn btn-sm" style="background: rgba(37, 99, 235, 0.1); color: var(--primary-600); border: none; border-radius: 0.5rem; padding: 0.5rem 1rem; font-weight: 600; transition: all 0.3s ease; text-decoration: none;">
                                                <i class="fas fa-eye me-1"></i>Voir
                                            </a>
                                            <button class="btn btn-sm annuler-btn" style="background: rgba(239, 68, 68, 0.1); color: #ef4444; border: none; border-radius: 0.5rem; padding: 0.5rem 1rem; font-weight: 600; transition: all 0.3s ease;" data-reservation-id="R001" data-equipment-name="Canon EOS R5">
                                                <i class="fas fa-times me-1"></i>Annuler
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Active Reservation 2 -->
                        <div class="col-lg-6">
                            <div class="card card-modern card-reservation h-100" style="border: none; border-radius: 1.25rem; box-shadow: 0 8px 32px -4px rgba(0, 0, 0, 0.12); transition: all 0.3s ease; background: linear-gradient(135deg, #ffffff 0%, #f8fafc 100%);">
                                <div class="card-header" style="background: linear-gradient(135deg, var(--primary-600), var(--primary-700)); border-radius: 1.25rem 1.25rem 0 0; border: none; padding: 1.5rem;">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <h6 class="mb-0 text-white fw-bold" style="font-size: 1rem; letter-spacing: -0.01em;">
                                            <i class="fas fa-hashtag me-2" style="opacity: 0.8;"></i>Réservation R002
                                        </h6>
                                        <span class="badge" style="background: rgba(255, 255, 255, 0.2); color: white; font-weight: 600; padding: 0.5rem 1rem; border-radius: 0.75rem; font-size: 0.875rem;">
                                            <i class="fas fa-play-circle me-1"></i>En cours
                                        </span>
                                    </div>
                                </div>
                                <div class="card-body" style="padding: 1.5rem;">
                                    <div class="d-flex align-items-center mb-4">
                                        <div class="position-relative me-3">
                                            <img src="https://images.unsplash.com/photo-1496181133206-80ce9b88a853?w=300&auto=format&fit=crop&q=80" 
                                                 alt="MacBook Pro" 
                                                 style="width: 80px; height: 80px; object-fit: cover; border-radius: 1rem; box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);">
                                            <div class="position-absolute top-0 end-0" style="width: 12px; height: 12px; background: #10b981; border-radius: 50%; border: 2px solid white;"></div>
                                        </div>
                                        <div class="flex-grow-1">
                                            <h6 class="mb-1 fw-bold" style="color: var(--gray-900); font-size: 1.125rem;">MacBook Pro 16"</h6>
                                            <p class="text-muted mb-0" style="font-size: 0.875rem; line-height: 1.4;">Ordinateur portable M2 Pro</p>
                                            <div class="d-flex align-items-center mt-1">
                                                <div class="rating me-2">
                                                    <i class="fas fa-star" style="color: #fbbf24; font-size: 0.75rem;"></i>
                                                    <i class="fas fa-star" style="color: #fbbf24; font-size: 0.75rem;"></i>
                                                    <i class="fas fa-star" style="color: #fbbf24; font-size: 0.75rem;"></i>
                                                    <i class="fas fa-star" style="color: #fbbf24; font-size: 0.75rem;"></i>
                                                    <i class="fas fa-star" style="color: #fbbf24; font-size: 0.75rem;"></i>
                                                </div>
                                                <small class="text-muted">(4.8)</small>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="row g-3 mb-4">
                                        <div class="col-6">
                                            <div style="background: rgba(37, 99, 235, 0.05); padding: 1rem; border-radius: 0.75rem; border-left: 4px solid var(--primary-600);">
                                                <small class="text-muted d-block" style="font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.5px;">Début</small>
                                                <strong style="color: var(--gray-900); font-size: 0.875rem;">10 Oct 2025</strong>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div style="background: rgba(239, 68, 68, 0.05); padding: 1rem; border-radius: 0.75rem; border-left: 4px solid #ef4444;">
                                                <small class="text-muted d-block" style="font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.5px;">Fin</small>
                                                <strong style="color: var(--gray-900); font-size: 0.875rem;">25 Oct 2025</strong>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <small class="text-muted d-block" style="font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.5px;">Total</small>
                                            <span class="fw-bold" style="color: var(--primary-600); font-size: 1.25rem;">2,250 MAD</span>
                                        </div>
                                        <div class="d-flex gap-2">
                                            <a href="${pageContext.request.contextPath}/pages/equipment/detail.jsp?id=2" class="btn btn-sm" style="background: rgba(37, 99, 235, 0.1); color: var(--primary-600); border: none; border-radius: 0.5rem; padding: 0.5rem 1rem; font-weight: 600; transition: all 0.3s ease; text-decoration: none;">
                                                <i class="fas fa-eye me-1"></i>Voir
                                            </a>
                                            <button class="btn btn-sm annuler-btn" style="background: rgba(239, 68, 68, 0.1); color: #ef4444; border: none; border-radius: 0.5rem; padding: 0.5rem 1rem; font-weight: 600; transition: all 0.3s ease;" data-reservation-id="R002" data-equipment-name="MacBook Pro 16\"">
                                                <i class="fas fa-times me-1"></i>Annuler
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Upcoming Reservation -->
                        <div class="col-lg-6">
                            <div class="card card-modern card-reservation h-100" style="border: none; border-radius: 1.25rem; box-shadow: 0 8px 32px -4px rgba(0, 0, 0, 0.12); transition: all 0.3s ease; background: linear-gradient(135deg, #ffffff 0%, #f8fafc 100%);">
                                <div class="card-header" style="background: linear-gradient(135deg, #f59e0b, #d97706); border-radius: 1.25rem 1.25rem 0 0; border: none; padding: 1.5rem;">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <h6 class="mb-0 text-white fw-bold" style="font-size: 1rem; letter-spacing: -0.01em;">
                                            <i class="fas fa-hashtag me-2" style="opacity: 0.8;"></i>Réservation R003
                                        </h6>
                                        <span class="badge" style="background: rgba(255, 255, 255, 0.2); color: white; font-weight: 600; padding: 0.5rem 1rem; border-radius: 0.75rem; font-size: 0.875rem;">
                                            <i class="fas fa-clock me-1"></i>À venir
                                        </span>
                                    </div>
                                </div>
                                <div class="card-body" style="padding: 1.5rem;">
                                    <div class="d-flex align-items-center mb-4">
                                        <div class="position-relative me-3">
                                            <img src="https://images.unsplash.com/photo-1606983340126-99ab4feaa64a?w=300&auto=format&fit=crop&q=80" 
                                                 alt="Sony A7 III" 
                                                 style="width: 80px; height: 80px; object-fit: cover; border-radius: 1rem; box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);">
                                            <div class="position-absolute top-0 end-0" style="width: 12px; height: 12px; background: #f59e0b; border-radius: 50%; border: 2px solid white;"></div>
                                        </div>
                                        <div class="flex-grow-1">
                                            <h6 class="mb-1 fw-bold" style="color: var(--gray-900); font-size: 1.125rem;">Sony A7 III</h6>
                                            <p class="text-muted mb-0" style="font-size: 0.875rem; line-height: 1.4;">Appareil photo hybride 24MP</p>
                                            <div class="d-flex align-items-center mt-1">
                                                <div class="rating me-2">
                                                    <i class="fas fa-star" style="color: #fbbf24; font-size: 0.75rem;"></i>
                                                    <i class="fas fa-star" style="color: #fbbf24; font-size: 0.75rem;"></i>
                                                    <i class="fas fa-star" style="color: #fbbf24; font-size: 0.75rem;"></i>
                                                    <i class="fas fa-star" style="color: #fbbf24; font-size: 0.75rem;"></i>
                                                    <i class="fas fa-star-half-alt" style="color: #fbbf24; font-size: 0.75rem;"></i>
                                                </div>
                                                <small class="text-muted">(4.7)</small>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="row g-3 mb-4">
                                        <div class="col-6">
                                            <div style="background: rgba(245, 158, 11, 0.05); padding: 1rem; border-radius: 0.75rem; border-left: 4px solid #f59e0b;">
                                                <small class="text-muted d-block" style="font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.5px;">Début</small>
                                                <strong style="color: var(--gray-900); font-size: 0.875rem;">25 Oct 2025</strong>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div style="background: rgba(239, 68, 68, 0.05); padding: 1rem; border-radius: 0.75rem; border-left: 4px solid #ef4444;">
                                                <small class="text-muted d-block" style="font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.5px;">Fin</small>
                                                <strong style="color: var(--gray-900); font-size: 0.875rem;">30 Oct 2025</strong>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <small class="text-muted d-block" style="font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.5px;">Total</small>
                                            <span class="fw-bold" style="color: #f59e0b; font-size: 1.25rem;">900 MAD</span>
                                        </div>
                                        <div class="d-flex gap-2">
                                            <a href="${pageContext.request.contextPath}/pages/equipment/detail.jsp?id=3" class="btn btn-sm" style="background: rgba(37, 99, 235, 0.1); color: var(--primary-600); border: none; border-radius: 0.5rem; padding: 0.5rem 1rem; font-weight: 600; transition: all 0.3s ease; text-decoration: none;">
                                                <i class="fas fa-eye me-1"></i>Voir
                                            </a>
                                            <button class="btn btn-sm annuler-btn" style="background: rgba(239, 68, 68, 0.1); color: #ef4444; border: none; border-radius: 0.5rem; padding: 0.5rem 1rem; font-weight: 600; transition: all 0.3s ease;" data-reservation-id="R003" data-equipment-name="Sony A7 III">
                                                <i class="fas fa-times me-1"></i>Annuler
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Completed Reservations -->
                        <div class="col-lg-6">
                            <div class="card card-modern card-reservation h-100" style="border: none; border-radius: 1.25rem; box-shadow: 0 8px 32px -4px rgba(0, 0, 0, 0.12); transition: all 0.3s ease; background: linear-gradient(135deg, #ffffff 0%, #f8fafc 100%);">
                                <div class="card-header" style="background: linear-gradient(135deg, #10b981, #059669); border-radius: 1.25rem 1.25rem 0 0; border: none; padding: 1.5rem;">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <h6 class="mb-0 text-white fw-bold" style="font-size: 1rem; letter-spacing: -0.01em;">
                                            <i class="fas fa-hashtag me-2" style="opacity: 0.8;"></i>Réservation R004
                                        </h6>
                                        <span class="badge" style="background: rgba(255, 255, 255, 0.2); color: white; font-weight: 600; padding: 0.5rem 1rem; border-radius: 0.75rem; font-size: 0.875rem;">
                                            <i class="fas fa-check-circle me-1"></i>Terminée
                                        </span>
                                    </div>
                                </div>
                                <div class="card-body" style="padding: 1.5rem;">
                                    <div class="d-flex align-items-center mb-4">
                                        <div class="position-relative me-3">
                                            <img src="https://images.unsplash.com/photo-1544244015-0df4b3ffc6b0?w=300&auto=format&fit=crop&q=80" 
                                                 alt="iPad Pro" 
                                                 style="width: 80px; height: 80px; object-fit: cover; border-radius: 1rem; box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);">
                                            <div class="position-absolute top-0 end-0" style="width: 12px; height: 12px; background: #10b981; border-radius: 50%; border: 2px solid white;"></div>
                                        </div>
                                        <div class="flex-grow-1">
                                            <h6 class="mb-1 fw-bold" style="color: var(--gray-900); font-size: 1.125rem;">iPad Pro 12.9"</h6>
                                            <p class="text-muted mb-0" style="font-size: 0.875rem; line-height: 1.4;">Tablette professionnelle M2</p>
                                            <div class="d-flex align-items-center mt-1">
                                                <div class="rating me-2">
                                                    <i class="fas fa-star" style="color: #fbbf24; font-size: 0.75rem;"></i>
                                                    <i class="fas fa-star" style="color: #fbbf24; font-size: 0.75rem;"></i>
                                                    <i class="fas fa-star" style="color: #fbbf24; font-size: 0.75rem;"></i>
                                                    <i class="fas fa-star" style="color: #fbbf24; font-size: 0.75rem;"></i>
                                                    <i class="fas fa-star" style="color: #fbbf24; font-size: 0.75rem;"></i>
                                                </div>
                                                <small class="text-muted">(5.0)</small>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="row g-3 mb-4">
                                        <div class="col-6">
                                            <div style="background: rgba(16, 185, 129, 0.05); padding: 1rem; border-radius: 0.75rem; border-left: 4px solid #10b981;">
                                                <small class="text-muted d-block" style="font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.5px;">Début</small>
                                                <strong style="color: var(--gray-900); font-size: 0.875rem;">01 Oct 2025</strong>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div style="background: rgba(16, 185, 129, 0.05); padding: 1rem; border-radius: 0.75rem; border-left: 4px solid #10b981;">
                                                <small class="text-muted d-block" style="font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.5px;">Fin</small>
                                                <strong style="color: var(--gray-900); font-size: 0.875rem;">10 Oct 2025</strong>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <small class="text-muted d-block" style="font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.5px;">Total</small>
                                            <span class="fw-bold" style="color: #10b981; font-size: 1.25rem;">750 MAD</span>
                                        </div>
                                        <div class="d-flex gap-2">
                                            <a href="${pageContext.request.contextPath}/pages/equipment/detail.jsp?id=4" class="btn btn-sm" style="background: rgba(37, 99, 235, 0.1); color: var(--primary-600); border: none; border-radius: 0.5rem; padding: 0.5rem 1rem; font-weight: 600; transition: all 0.3s ease; text-decoration: none;">
                                                <i class="fas fa-eye me-1"></i>Voir
                                            </a>
                                            <button class="btn btn-sm annuler-btn" style="background: rgba(239, 68, 68, 0.1); color: #ef4444; border: none; border-radius: 0.5rem; padding: 0.5rem 1rem; font-weight: 600; transition: all 0.3s ease;" data-reservation-id="R004" data-equipment-name="iPad Pro 12.9\"">
                                                <i class="fas fa-times me-1"></i>Annuler
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-6">
                            <div class="card card-modern card-reservation h-100" style="border: none; border-radius: 1.25rem; box-shadow: 0 8px 32px -4px rgba(0, 0, 0, 0.12); transition: all 0.3s ease; background: linear-gradient(135deg, #ffffff 0%, #f8fafc 100%);">
                                <div class="card-header" style="background: linear-gradient(135deg, #10b981, #059669); border-radius: 1.25rem 1.25rem 0 0; border: none; padding: 1.5rem;">
                                    <div class="d-flex justify-content-between align-items-center">
                                        <h6 class="mb-0 text-white fw-bold" style="font-size: 1rem; letter-spacing: -0.01em;">
                                            <i class="fas fa-hashtag me-2" style="opacity: 0.8;"></i>Réservation R005
                                        </h6>
                                        <span class="badge" style="background: rgba(255, 255, 255, 0.2); color: white; font-weight: 600; padding: 0.5rem 1rem; border-radius: 0.75rem; font-size: 0.875rem;">
                                            <i class="fas fa-check-circle me-1"></i>Terminée
                                        </span>
                                    </div>
                                </div>
                                <div class="card-body" style="padding: 1.5rem;">
                                    <div class="d-flex align-items-center mb-4">
                                        <div class="position-relative me-3">
                                            <img src="https://images.unsplash.com/photo-1473968512647-3e447244af8f?w=300&auto=format&fit=crop&q=80" 
                                                 alt="DJI Mavic" 
                                                 style="width: 80px; height: 80px; object-fit: cover; border-radius: 1rem; box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);">
                                            <div class="position-absolute top-0 end-0" style="width: 12px; height: 12px; background: #10b981; border-radius: 50%; border: 2px solid white;"></div>
                                        </div>
                                        <div class="flex-grow-1">
                                            <h6 class="mb-1 fw-bold" style="color: var(--gray-900); font-size: 1.125rem;">DJI Mavic Air 2</h6>
                                            <p class="text-muted mb-0" style="font-size: 0.875rem; line-height: 1.4;">Drone professionnel 4K</p>
                                            <div class="d-flex align-items-center mt-1">
                                                <div class="rating me-2">
                                                    <i class="fas fa-star" style="color: #fbbf24; font-size: 0.75rem;"></i>
                                                    <i class="fas fa-star" style="color: #fbbf24; font-size: 0.75rem;"></i>
                                                    <i class="fas fa-star" style="color: #fbbf24; font-size: 0.75rem;"></i>
                                                    <i class="fas fa-star" style="color: #fbbf24; font-size: 0.75rem;"></i>
                                                    <i class="far fa-star" style="color: #fbbf24; font-size: 0.75rem;"></i>
                                                </div>
                                                <small class="text-muted">(4.6)</small>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="row g-3 mb-4">
                                        <div class="col-6">
                                            <div style="background: rgba(16, 185, 129, 0.05); padding: 1rem; border-radius: 0.75rem; border-left: 4px solid #10b981;">
                                                <small class="text-muted d-block" style="font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.5px;">Début</small>
                                                <strong style="color: var(--gray-900); font-size: 0.875rem;">20 Sep 2025</strong>
                                            </div>
                                        </div>
                                        <div class="col-6">
                                            <div style="background: rgba(16, 185, 129, 0.05); padding: 1rem; border-radius: 0.75rem; border-left: 4px solid #10b981;">
                                                <small class="text-muted d-block" style="font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.5px;">Fin</small>
                                                <strong style="color: var(--gray-900); font-size: 0.875rem;">25 Sep 2025</strong>
                                            </div>
                                        </div>
                                    </div>
                                    
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <small class="text-muted d-block" style="font-size: 0.75rem; font-weight: 600; text-transform: uppercase; letter-spacing: 0.5px;">Total</small>
                                            <span class="fw-bold" style="color: #10b981; font-size: 1.25rem;">600 MAD</span>
                                        </div>
                                        <div class="d-flex gap-2">
                                            <a href="${pageContext.request.contextPath}/pages/equipment/detail.jsp?id=5" class="btn btn-sm" style="background: rgba(37, 99, 235, 0.1); color: var(--primary-600); border: none; border-radius: 0.5rem; padding: 0.5rem 1rem; font-weight: 600; transition: all 0.3s ease; text-decoration: none;">
                                                <i class="fas fa-eye me-1"></i>Voir
                                            </a>
                                            <button class="btn btn-sm annuler-btn" style="background: rgba(239, 68, 68, 0.1); color: #ef4444; border: none; border-radius: 0.5rem; padding: 0.5rem 1rem; font-weight: 600; transition: all 0.3s ease;" data-reservation-id="R005" data-equipment-name="DJI Mavic Air 2">
                                                <i class="fas fa-times me-1"></i>Annuler
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
                    <div class="text-center py-5">
                        <div style="width: 100px; height: 100px; margin: 0 auto 2rem; background: linear-gradient(135deg, rgba(37, 99, 235, 0.1), rgba(37, 99, 235, 0.05)); border-radius: 50%; display: flex; align-items: center; justify-content: center;">
                            <i class="fas fa-play-circle" style="font-size: 3rem; color: var(--primary-600);"></i>
                        </div>
                        <h4 style="color: var(--gray-900); font-size: 1.5rem; font-weight: 700; margin-bottom: 1rem;">Réservations en cours</h4>
                        <p style="color: var(--gray-600); font-size: 1rem; max-width: 400px; margin: 0 auto;">Filtrage des réservations actuellement en cours...</p>
                    </div>
                </div>
                <div class="tab-pane fade" id="upcoming" role="tabpanel">
                    <div class="text-center py-5">
                        <div style="width: 100px; height: 100px; margin: 0 auto 2rem; background: linear-gradient(135deg, rgba(245, 158, 11, 0.1), rgba(245, 158, 11, 0.05)); border-radius: 50%; display: flex; align-items: center; justify-content: center;">
                            <i class="fas fa-clock" style="font-size: 3rem; color: #f59e0b;"></i>
                        </div>
                        <h4 style="color: var(--gray-900); font-size: 1.5rem; font-weight: 700; margin-bottom: 1rem;">Réservations à venir</h4>
                        <p style="color: var(--gray-600); font-size: 1rem; max-width: 400px; margin: 0 auto;">Filtrage des réservations programmées...</p>
                    </div>
                </div>
                <div class="tab-pane fade" id="completed" role="tabpanel">
                    <div class="text-center py-5">
                        <div style="width: 100px; height: 100px; margin: 0 auto 2rem; background: linear-gradient(135deg, rgba(16, 185, 129, 0.1), rgba(16, 185, 129, 0.05)); border-radius: 50%; display: flex; align-items: center; justify-content: center;">
                            <i class="fas fa-check-circle" style="font-size: 3rem; color: #10b981;"></i>
                        </div>
                        <h4 style="color: var(--gray-900); font-size: 1.5rem; font-weight: 700; margin-bottom: 1rem;">Réservations terminées</h4>
                        <p style="color: var(--gray-600); font-size: 1rem; max-width: 400px; margin: 0 auto;">Filtrage des réservations complétées...</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Enhanced JavaScript -->
<script>
document.addEventListener('DOMContentLoaded', function() {
    // Enhanced tab functionality
    const tabButtons = document.querySelectorAll('.nav-link[data-bs-toggle="pill"]');
    
    tabButtons.forEach(button => {
        button.addEventListener('click', function() {
            // Remove active state from all buttons
            tabButtons.forEach(btn => {
                btn.style.background = 'transparent';
                btn.style.color = 'var(--gray-700)';
                btn.classList.remove('active');
            });
            
            // Add active state to clicked button
            this.classList.add('active');
            this.style.background = 'linear-gradient(135deg, var(--primary-600), var(--primary-700))';
            this.style.color = 'white';
        });
    });
    
    // Add hover effects to reservation cards
    const reservationCards = document.querySelectorAll('.card-reservation');
    
    reservationCards.forEach(card => {
        card.addEventListener('mouseenter', function() {
            this.style.transform = 'translateY(-4px)';
            this.style.boxShadow = '0 12px 40px -8px rgba(0, 0, 0, 0.15)';
        });
        
        card.addEventListener('mouseleave', function() {
            this.style.transform = 'translateY(0)';
            this.style.boxShadow = '0 8px 32px -4px rgba(0, 0, 0, 0.12)';
        });
    });
    
    // Add subtle hover effects to action bar elements
    const statsCard = document.querySelector('.bg-white.px-4.py-3.rounded-3');
    const newReservationBtn = document.querySelector('a[href*="list-simple.jsp"]');
    
    // Stats card hover effect
    if (statsCard) {
        statsCard.addEventListener('mouseenter', function() {
            this.style.transform = 'translateY(-1px)';
            this.style.boxShadow = '0 0.5rem 1rem rgba(0, 0, 0, 0.15)';
        });
        
        statsCard.addEventListener('mouseleave', function() {
            this.style.transform = 'translateY(0)';
            this.style.boxShadow = '0 0.125rem 0.25rem rgba(0, 0, 0, 0.075)';
        });
    }
    
    // New reservation button hover effect
    if (newReservationBtn) {
        newReservationBtn.addEventListener('mouseenter', function() {
            this.style.transform = 'translateY(-1px)';
            this.style.boxShadow = '0 0.5rem 1rem rgba(37, 99, 235, 0.4)';
            this.style.background = 'var(--primary-700) !important';
        });
        
        newReservationBtn.addEventListener('mouseleave', function() {
            this.style.transform = 'translateY(0)';
            this.style.boxShadow = '0 0.125rem 0.25rem rgba(0, 0, 0, 0.075)';
            this.style.background = 'var(--primary-600) !important';
        });
    }
    
    // Add hover effects to reservation card buttons
    const actionButtons = document.querySelectorAll('.d-flex.gap-2 .btn');
    
    actionButtons.forEach(button => {
        button.addEventListener('mouseenter', function() {
            this.style.transform = 'translateY(-1px)';
            this.style.boxShadow = '0 4px 12px rgba(0, 0, 0, 0.15)';
        });
        
        button.addEventListener('mouseleave', function() {
            this.style.transform = 'translateY(0)';
            this.style.boxShadow = 'none';
        });
    });
    
    // Confirmation modal functionality
    const cancelButtons = document.querySelectorAll('.annuler-btn');
    const confirmModal = new bootstrap.Modal(document.getElementById('confirmCancelModal'));
    const modalReservationId = document.getElementById('modalReservationId');
    const modalEquipmentName = document.getElementById('modalEquipmentName');
    const confirmCancelBtn = document.getElementById('confirmCancelBtn');
    
    let currentReservationId = '';
    let currentEquipmentName = '';
    
    cancelButtons.forEach(button => {
        button.addEventListener('click', function(e) {
            e.preventDefault();
            
            currentReservationId = this.getAttribute('data-reservation-id');
            currentEquipmentName = this.getAttribute('data-equipment-name');
            
            // Update modal content
            modalReservationId.textContent = currentReservationId;
            modalEquipmentName.textContent = currentEquipmentName;
            
            // Show modal
            confirmModal.show();
        });
    });
    
    confirmCancelBtn.addEventListener('click', function() {
        // Here you would typically make an AJAX call to cancel the reservation
        // For now, we'll just show a success message and hide the reservation card
        
        // Find and hide the reservation card
        const reservationCard = document.querySelector(`[data-reservation-id="${currentReservationId}"]`).closest('.col-lg-6');
        if (reservationCard) {
            // Add a fade-out animation
            reservationCard.style.transition = 'all 0.5s ease';
            reservationCard.style.opacity = '0';
            reservationCard.style.transform = 'scale(0.95)';
            
            setTimeout(() => {
                reservationCard.style.display = 'none';
                // Update the stats
                updateReservationStats();
            }, 500);
        }
        
        // Hide modal
        confirmModal.hide();
        
        // Show success message
        showSuccessMessage(`Réservation ${currentReservationId} annulée avec succès !`);
    });
    
    function updateReservationStats() {
        // Update the reservation count
        const visibleCards = document.querySelectorAll('.col-lg-6:not([style*="display: none"])');
        const totalReservations = visibleCards.length;
        
        const statsElement = document.querySelector('.h4.mb-0.text-dark.fw-bold');
        if (statsElement) {
            statsElement.textContent = totalReservations;
        }
    }
    
    function showSuccessMessage(message) {
        // Create and show a success toast
        const toastContainer = document.createElement('div');
        toastContainer.className = 'position-fixed top-0 end-0 p-3';
        toastContainer.style.zIndex = '9999';
        
        const toast = document.createElement('div');
        toast.className = 'toast align-items-center text-white bg-success border-0';
        toast.setAttribute('role', 'alert');
        toast.setAttribute('aria-live', 'assertive');
        toast.setAttribute('aria-atomic', 'true');
        
        toast.innerHTML = `
            <div class="d-flex">
                <div class="toast-body">
                    <i class="fas fa-check-circle me-2"></i>
                    ${message}
                </div>
                <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
        `;
        
        toastContainer.appendChild(toast);
        document.body.appendChild(toastContainer);
        
        const bsToast = new bootstrap.Toast(toast);
        bsToast.show();
        
        // Remove the toast container after it's hidden
        toast.addEventListener('hidden.bs.toast', () => {
            document.body.removeChild(toastContainer);
        });
    }
});
</script>

<style>
/* Custom styles for enhanced typography and consistency */
.card-reservation {
    font-family: 'Inter', 'Poppins', -apple-system, BlinkMacSystemFont, sans-serif;
    letter-spacing: -0.01em;
}

.nav-pills-modern .nav-link {
    font-family: 'Inter', 'Poppins', -apple-system, BlinkMacSystemFont, sans-serif;
    font-weight: 600;
    letter-spacing: -0.01em;
    transition: all 0.3s ease;
}

.nav-pills-modern .nav-link:hover {
    background: rgba(37, 99, 235, 0.1);
    color: var(--primary-600);
}

/* Enhanced responsive design */
@media (max-width: 768px) {
    .card-reservation .card-body {
        padding: 1rem !important;
    }
    
    .card-reservation .d-flex {
        flex-direction: column;
        align-items: flex-start !important;
    }
    
    .card-reservation .btn-group {
        width: 100%;
        margin-top: 1rem;
    }
    
    .card-reservation .btn-group .btn {
        flex: 1;
    }
}

/* Smooth animations */
.card-reservation,
.nav-pills-modern .nav-link,
.btn-group .btn {
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
}

/* Enhanced focus states */
.nav-pills-modern .nav-link:focus {
    box-shadow: 0 0 0 4px rgba(37, 99, 235, 0.1);
}

.btn:focus {
    box-shadow: 0 0 0 4px rgba(37, 99, 235, 0.1);
}

/* Modal Enhancement Styles */
#confirmCancelModal .modal-content {
    transition: all 0.3s ease;
}

/* Button hover effects */
#confirmCancelModal .btn[data-bs-dismiss="modal"]:hover {
    background: linear-gradient(135deg, #e2e8f0, #cbd5e1) !important;
    box-shadow: 0 4px 12px -2px rgba(0, 0, 0, 0.1) !important;
}

#confirmCancelModal #confirmCancelBtn:hover {
    background: linear-gradient(135deg, #dc2626, #b91c1c) !important;
    box-shadow: 0 6px 25px -2px rgba(239, 68, 68, 0.5) !important;
}
</style>

<!-- Confirmation Modal -->
<div class="modal fade" id="confirmCancelModal" tabindex="-1" aria-labelledby="confirmCancelModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content border-0" style="border-radius: 1.5rem; box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25); overflow: hidden;">
            <!-- Header -->
            <div class="modal-header border-0 p-0" style="background: linear-gradient(135deg, #1e40af 0%, #1e3a8a 50%, #1e293b 100%); position: relative; overflow: hidden;">
                <div style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; background: radial-gradient(circle at 20% 50%, rgba(59, 130, 246, 0.15) 0%, transparent 50%); opacity: 1;"></div>
                <div class="d-flex align-items-center justify-content-between w-100 p-4" style="position: relative; z-index: 2;">
                    <div class="d-flex align-items-center">
                        <div class="d-flex align-items-center justify-content-center me-4" style="width: 64px; height: 64px; background: rgba(255, 255, 255, 0.15); backdrop-filter: blur(20px); border-radius: 1rem; border: 1px solid rgba(255, 255, 255, 0.2);">
                            <i class="fas fa-exclamation-triangle text-white" style="font-size: 1.5rem;"></i>
                        </div>
                        <div>
                            <h5 class="modal-title fw-bold mb-1 text-white" id="confirmCancelModalLabel" style="font-size: 1.25rem; letter-spacing: -0.01em;">Confirmer l'annulation</h5>
                            <small class="text-white-50 fw-medium" style="font-size: 0.875rem;">Cette action est irréversible</small>
                        </div>
                    </div>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close" style="opacity: 0.8;"></button>
                </div>
            </div>
            
            <!-- Body -->
            <div class="modal-body p-4" style="background: linear-gradient(135deg, #ffffff 0%, #f8fafc 100%);">
                <!-- Warning Alert -->
                <div class="d-flex align-items-center p-3 mb-4" style="background: linear-gradient(135deg, rgba(245, 158, 11, 0.1), rgba(251, 191, 36, 0.05)); border: 1px solid rgba(245, 158, 11, 0.2); border-radius: 1rem; backdrop-filter: blur(10px);">
                    <div class="d-flex align-items-center justify-content-center me-3" style="width: 40px; height: 40px; background: linear-gradient(135deg, #f59e0b, #d97706); border-radius: 0.75rem;">
                        <i class="fas fa-info-circle text-white" style="font-size: 1rem;"></i>
                    </div>
                    <div>
                        <span class="fw-semibold d-block" style="color: var(--gray-900); font-size: 0.95rem;">Attention</span>
                        <small class="text-muted">Vous êtes sur le point d'annuler votre réservation</small>
                    </div>
                </div>
                
                <!-- Reservation Details -->
                <div class="p-4 mb-4" style="background: white; border: 1px solid rgba(226, 232, 240, 0.8); border-radius: 1rem; box-shadow: 0 4px 20px -2px rgba(0, 0, 0, 0.08);">
                    <div class="row g-4">
                        <div class="col-6">
                            <div class="d-flex align-items-center">
                                <div class="d-flex align-items-center justify-content-center me-3" style="width: 36px; height: 36px; background: rgba(37, 99, 235, 0.1); border-radius: 0.5rem;">
                                    <i class="fas fa-receipt text-primary" style="font-size: 0.875rem;"></i>
                                </div>
                                <div>
                                    <small class="text-muted d-block fw-medium" style="font-size: 0.75rem; text-transform: uppercase; letter-spacing: 0.5px;">Réservation</small>
                                    <span class="fw-bold text-dark" id="modalReservationId" style="font-size: 1rem;">-</span>
                                </div>
                            </div>
                        </div>
                        <div class="col-6">
                            <div class="d-flex align-items-center">
                                <div class="d-flex align-items-center justify-content-center me-3" style="width: 36px; height: 36px; background: rgba(37, 99, 235, 0.1); border-radius: 0.5rem;">
                                    <i class="fas fa-box text-primary" style="font-size: 0.875rem;"></i>
                                </div>
                                <div>
                                    <small class="text-muted d-block fw-medium" style="font-size: 0.75rem; text-transform: uppercase; letter-spacing: 0.5px;">Équipement</small>
                                    <span class="fw-bold text-dark" id="modalEquipmentName" style="font-size: 1rem;">-</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <!-- Message -->
                <div class="text-center">
                    <p class="mb-0" style="color: var(--gray-700); line-height: 1.6;">
                        <strong style="color: var(--gray-900); font-size: 1.05rem;">Êtes-vous sûr de vouloir annuler cette réservation ?</strong><br>
                        <span style="font-size: 0.9rem;">Cette action libérera l'équipement pour d'autres utilisateurs et ne pourra pas être annulée.</span>
                    </p>
                </div>
            </div>
            
            <!-- Footer -->
            <div class="modal-footer border-0 p-4" style="background: white;">
                <div class="d-flex gap-3 w-100">
                    <button type="button" class="btn flex-fill" data-bs-dismiss="modal" style="background: linear-gradient(135deg, #f8fafc, #e2e8f0); color: var(--gray-700); border: 1px solid rgba(226, 232, 240, 0.8); border-radius: 1rem; font-weight: 600; padding: 0.875rem 1.5rem; transition: all 0.3s ease; box-shadow: 0 2px 8px -2px rgba(0, 0, 0, 0.05);">
                        <i class="fas fa-arrow-left me-2" style="font-size: 0.875rem;"></i>
                        Garder la réservation
                    </button>
                    <button type="button" class="btn flex-fill" id="confirmCancelBtn" style="background: linear-gradient(135deg, #ef4444, #dc2626); color: white; border: none; border-radius: 1rem; font-weight: 600; padding: 0.875rem 1.5rem; transition: all 0.3s ease; box-shadow: 0 4px 20px -2px rgba(239, 68, 68, 0.4);">
                        <i class="fas fa-check me-2" style="font-size: 0.875rem;"></i>
                        Confirmer l'annulation
                    </button>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="../../layouts/footer.jsp" %>
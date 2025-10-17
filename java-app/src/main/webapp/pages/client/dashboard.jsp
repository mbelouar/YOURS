<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    try {
        request.setAttribute("pageTitle", "Tableau de bord - YOURS");
    } catch (Exception e) {
        // Log error but don't break the page
        System.err.println("Dashboard page error: " + e.getMessage());
    }
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
                    <i class="fas fa-tachometer-alt me-2" style="color: #fbbf24; font-size: 1rem;"></i>
                    <span style="color: white; font-weight: 600; font-size: 0.875rem; letter-spacing: 0.5px;">TABLEAU DE BORD CLIENT</span>
                </div>
                
                <!-- Main Title -->
                <h1 class="display-2 fw-bold mb-4" style="color: white; text-shadow: 0 4px 20px rgba(0,0,0,0.3); letter-spacing: -0.03em; line-height: 1.1;">
                    Bonjour <span id="userName" style="background: linear-gradient(135deg, #fbbf24, #f59e0b); -webkit-background-clip: text; -webkit-text-fill-color: transparent; background-clip: text;">Client</span> !
                </h1>
                
                <!-- Subtitle -->
                <div class="mb-4" style="max-width: 700px; margin: 0 auto;">
                    <p class="lead mb-2" style="color: rgba(255, 255, 255, 0.95); font-size: 1.375rem; font-weight: 400; line-height: 1.6; letter-spacing: -0.01em;">
                        Bienvenue sur votre espace personnel
                    </p>
                    <p class="mb-0" style="color: rgba(255, 255, 255, 0.8); font-size: 1.1rem; font-weight: 300; line-height: 1.7;">
                        Gérez vos réservations • Découvrez du nouveau matériel • Suivez votre activité
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

<!-- Dashboard Content -->
<div class="container py-5">

    <!-- Quick Stats -->
    <div class="row g-4 mb-5">
        <div class="col-lg-3 col-md-6">
            <div class="d-flex align-items-center bg-white px-4 py-3 rounded-3 shadow-sm border-0" style="border-left: 4px solid var(--primary-600) !important; transition: all 0.3s ease;">
                <div class="me-3">
                    <div class="bg-primary rounded-2 d-flex align-items-center justify-content-center" style="width: 48px; height: 48px;">
                        <i class="fas fa-calendar-check text-white" style="font-size: 1.125rem;"></i>
                    </div>
                </div>
                <div class="flex-grow-1">
                    <div class="h4 mb-0 text-dark fw-bold" id="activeReservations">0</div>
                    <small class="text-muted fw-medium">Réservations actives</small>
                    <div class="mt-1">
                        <small class="text-success fw-medium">
                            <i class="fas fa-arrow-up me-1"></i>12% ce mois
                        </small>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="d-flex align-items-center bg-white px-4 py-3 rounded-3 shadow-sm border-0" style="border-left: 4px solid #10b981 !important; transition: all 0.3s ease;">
                <div class="me-3">
                    <div class="rounded-2 d-flex align-items-center justify-content-center" style="width: 48px; height: 48px; background: #10b981;">
                        <i class="fas fa-clock text-white" style="font-size: 1.125rem;"></i>
                    </div>
                </div>
                <div class="flex-grow-1">
                    <div class="h4 mb-0 text-dark fw-bold" id="totalReservations">0</div>
                    <small class="text-muted fw-medium">Total réservations</small>
                    <div class="mt-1">
                        <small class="text-muted fw-medium">
                            <i class="fas fa-chart-line me-1"></i>Tous les temps
                        </small>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="d-flex align-items-center bg-white px-4 py-3 rounded-3 shadow-sm border-0" style="border-left: 4px solid #f59e0b !important; transition: all 0.3s ease;">
                <div class="me-3">
                    <div class="rounded-2 d-flex align-items-center justify-content-center" style="width: 48px; height: 48px; background: #f59e0b;">
                        <i class="fas fa-dollar-sign text-white" style="font-size: 1.125rem;"></i>
                    </div>
                </div>
                <div class="flex-grow-1">
                    <div class="h4 mb-0 text-dark fw-bold" id="totalSpent">0</div>
                    <small class="text-muted fw-medium">Total dépensé</small>
                    <div class="mt-1">
                        <small class="text-muted fw-medium">
                            <i class="fas fa-wallet me-1"></i>En MAD
                        </small>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="d-flex align-items-center bg-white px-4 py-3 rounded-3 shadow-sm border-0" style="border-left: 4px solid #ef4444 !important; transition: all 0.3s ease;">
                <div class="me-3">
                    <div class="rounded-2 d-flex align-items-center justify-content-center" style="width: 48px; height: 48px; background: #ef4444;">
                        <i class="fas fa-heart text-white" style="font-size: 1.125rem;"></i>
                    </div>
                </div>
                <div class="flex-grow-1">
                    <div class="h4 mb-0 text-dark fw-bold" id="favoriteItems">0</div>
                    <small class="text-muted fw-medium">Favoris</small>
                    <div class="mt-1">
                        <small class="text-muted fw-medium">
                            <i class="fas fa-bookmark me-1"></i>Matériel sauvegardé
                        </small>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row g-4">
        <!-- Main Content -->
        <div class="col-lg-8">
            <!-- Current Reservations -->
            <div class="card mb-4 border-0" style="border-radius: 1.25rem; box-shadow: 0 8px 32px -4px rgba(0, 0, 0, 0.12); overflow: hidden;">
                <div class="card-header border-0 py-4" style="background: linear-gradient(135deg, #ffffff 0%, #f8fafc 100%);">
                    <h5 class="fw-bold mb-0 d-flex align-items-center" style="color: var(--gray-900); font-size: 1.125rem;">
                        <div class="d-flex align-items-center justify-content-center me-3" style="width: 40px; height: 40px; background: rgba(37, 99, 235, 0.1); border-radius: 0.75rem;">
                            <i class="fas fa-calendar-check text-primary" style="font-size: 1rem;"></i>
                        </div>
                        Réservations en cours
                    </h5>
                </div>
                <div class="card-body p-4">
                    <div id="currentReservations">
                        <!-- Sample current reservations -->
                        <div class="reservation-item mb-4 p-3" style="background: #f8fafc; border-radius: 0.75rem; border-left: 4px solid #10b981;">
                            <div class="d-flex align-items-center">
                                <img src="${pageContext.request.contextPath}/assets/images/placeholder-equipment.jpg" 
                                     alt="Canon EOS R5" class="rounded me-3" 
                                     style="width: 60px; height: 60px; object-fit: cover;">
                                <div class="flex-grow-1">
                                    <h6 class="mb-1 fw-bold text-dark">Canon EOS R5</h6>
                                    <small class="text-muted d-block mb-1">
                                        <i class="fas fa-calendar me-1"></i>
                                        15 Oct - 20 Oct 2024
                                    </small>
                                    <small class="text-success fw-medium">
                                        <i class="fas fa-clock me-1"></i>
                                        3 jours restants
                                    </small>
                                </div>
                                <div class="text-end">
                                    <div class="fw-bold text-primary mb-1">1,200 MAD</div>
                                    <a href="#" class="btn btn-outline-primary btn-sm">
                                        <i class="fas fa-eye me-1"></i>Détails
                                    </a>
                                </div>
                            </div>
                        </div>
                        
                        <div class="reservation-item mb-4 p-3" style="background: #f8fafc; border-radius: 0.75rem; border-left: 4px solid #f59e0b;">
                            <div class="d-flex align-items-center">
                                <img src="${pageContext.request.contextPath}/assets/images/placeholder-equipment.jpg" 
                                     alt="Sony FX3" class="rounded me-3" 
                                     style="width: 60px; height: 60px; object-fit: cover;">
                                <div class="flex-grow-1">
                                    <h6 class="mb-1 fw-bold text-dark">Sony FX3</h6>
                                    <small class="text-muted d-block mb-1">
                                        <i class="fas fa-calendar me-1"></i>
                                        22 Oct - 25 Oct 2024
                                    </small>
                                    <small class="text-warning fw-medium">
                                        <i class="fas fa-clock me-1"></i>
                                        Commence dans 2 jours
                                    </small>
                                </div>
                                <div class="text-end">
                                    <div class="fw-bold text-primary mb-1">850 MAD</div>
                                    <a href="#" class="btn btn-outline-primary btn-sm">
                                        <i class="fas fa-eye me-1"></i>Détails
                                    </a>
                                </div>
                            </div>
                        </div>
                        
                        <div class="text-center">
                            <a href="${pageContext.request.contextPath}/pages/client/reservations.jsp" 
                               class="btn btn-outline-primary">
                                <i class="fas fa-calendar-check me-2"></i>Voir toutes les réservations
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Activity Chart -->
            <div class="card mb-4 border-0" style="border-radius: 1.25rem; box-shadow: 0 8px 32px -4px rgba(0, 0, 0, 0.12); overflow: hidden;">
                <div class="card-header border-0 py-4" style="background: linear-gradient(135deg, #ffffff 0%, #f8fafc 100%);">
                    <h5 class="fw-bold mb-0 d-flex align-items-center" style="color: var(--gray-900); font-size: 1.125rem;">
                        <div class="d-flex align-items-center justify-content-center me-3" style="width: 40px; height: 40px; background: rgba(16, 185, 129, 0.1); border-radius: 0.75rem;">
                            <i class="fas fa-chart-line text-success" style="font-size: 1rem;"></i>
                        </div>
                        Historique des réservations
                    </h5>
                </div>
                <div class="card-body p-4">
                    <!-- Professional Chart Design -->
                    <div class="chart-container" style="position: relative;">
                        <!-- Chart Header with Period Selector -->
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <div>
                                <h6 class="fw-bold text-dark mb-1">Évolution des réservations</h6>
                                <small class="text-muted">Derniers 6 mois</small>
                            </div>
                            <div class="btn-group btn-group-sm" role="group">
                                <button type="button" class="btn btn-outline-primary active">6M</button>
                                <button type="button" class="btn btn-outline-primary">1A</button>
                                <button type="button" class="btn btn-outline-primary">Tout</button>
                            </div>
                        </div>
                        
                        <!-- Professional Chart Area -->
                        <div class="chart-area" style="position: relative; height: 280px; background: linear-gradient(135deg, #f8fafc 0%, #f1f5f9 100%); border-radius: 1rem; padding: 1.5rem; margin-bottom: 1.5rem;">
                            <!-- Grid Lines -->
                            <div class="chart-grid" style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; padding: 1.5rem;">
                                <div class="d-flex h-100">
                                    <div class="flex-grow-1 d-flex flex-column justify-content-between">
                                        <div style="height: 1px; background: rgba(148, 163, 184, 0.2);"></div>
                                        <div style="height: 1px; background: rgba(148, 163, 184, 0.2);"></div>
                                        <div style="height: 1px; background: rgba(148, 163, 184, 0.2);"></div>
                                        <div style="height: 1px; background: rgba(148, 163, 184, 0.2);"></div>
                                        <div style="height: 1px; background: rgba(148, 163, 184, 0.2);"></div>
                                    </div>
                </div>
            </div>

                            <!-- Chart Bars with Gradient -->
                            <div class="d-flex align-items-end justify-content-between h-100" style="padding-top: 1rem;">
                                <div class="chart-bar-container d-flex flex-column align-items-center position-relative">
                                    <div class="chart-bar" style="width: 40px; height: 45px; background: linear-gradient(135deg, #3b82f6, #1d4ed8); border-radius: 8px 8px 0 0; margin-bottom: 0.75rem; position: relative; box-shadow: 0 4px 12px rgba(59, 130, 246, 0.3);">
                                        <div class="chart-value" style="position: absolute; top: -25px; left: 50%; transform: translateX(-50%); background: #1e293b; color: white; padding: 0.25rem 0.5rem; border-radius: 0.375rem; font-size: 0.75rem; font-weight: 600;">3</div>
                                    </div>
                                    <small class="text-muted fw-medium">Jan</small>
                                </div>
                                <div class="chart-bar-container d-flex flex-column align-items-center position-relative">
                                    <div class="chart-bar" style="width: 40px; height: 75px; background: linear-gradient(135deg, #3b82f6, #1d4ed8); border-radius: 8px 8px 0 0; margin-bottom: 0.75rem; position: relative; box-shadow: 0 4px 12px rgba(59, 130, 246, 0.3);">
                                        <div class="chart-value" style="position: absolute; top: -25px; left: 50%; transform: translateX(-50%); background: #1e293b; color: white; padding: 0.25rem 0.5rem; border-radius: 0.375rem; font-size: 0.75rem; font-weight: 600;">5</div>
                                    </div>
                                    <small class="text-muted fw-medium">Fév</small>
                                </div>
                                <div class="chart-bar-container d-flex flex-column align-items-center position-relative">
                                    <div class="chart-bar" style="width: 40px; height: 30px; background: linear-gradient(135deg, #3b82f6, #1d4ed8); border-radius: 8px 8px 0 0; margin-bottom: 0.75rem; position: relative; box-shadow: 0 4px 12px rgba(59, 130, 246, 0.3);">
                                        <div class="chart-value" style="position: absolute; top: -25px; left: 50%; transform: translateX(-50%); background: #1e293b; color: white; padding: 0.25rem 0.5rem; border-radius: 0.375rem; font-size: 0.75rem; font-weight: 600;">2</div>
                                    </div>
                                    <small class="text-muted fw-medium">Mar</small>
                                </div>
                                <div class="chart-bar-container d-flex flex-column align-items-center position-relative">
                                    <div class="chart-bar" style="width: 40px; height: 105px; background: linear-gradient(135deg, #10b981, #059669); border-radius: 8px 8px 0 0; margin-bottom: 0.75rem; position: relative; box-shadow: 0 4px 12px rgba(16, 185, 129, 0.3);">
                                        <div class="chart-value" style="position: absolute; top: -25px; left: 50%; transform: translateX(-50%); background: #1e293b; color: white; padding: 0.25rem 0.5rem; border-radius: 0.375rem; font-size: 0.75rem; font-weight: 600;">7</div>
                                    </div>
                                    <small class="text-muted fw-medium">Avr</small>
                                </div>
                                <div class="chart-bar-container d-flex flex-column align-items-center position-relative">
                                    <div class="chart-bar" style="width: 40px; height: 90px; background: linear-gradient(135deg, #3b82f6, #1d4ed8); border-radius: 8px 8px 0 0; margin-bottom: 0.75rem; position: relative; box-shadow: 0 4px 12px rgba(59, 130, 246, 0.3);">
                                        <div class="chart-value" style="position: absolute; top: -25px; left: 50%; transform: translateX(-50%); background: #1e293b; color: white; padding: 0.25rem 0.5rem; border-radius: 0.375rem; font-size: 0.75rem; font-weight: 600;">6</div>
                                    </div>
                                    <small class="text-muted fw-medium">Mai</small>
                                </div>
                                <div class="chart-bar-container d-flex flex-column align-items-center position-relative">
                                    <div class="chart-bar" style="width: 40px; height: 120px; background: linear-gradient(135deg, #f59e0b, #d97706); border-radius: 8px 8px 0 0; margin-bottom: 0.75rem; position: relative; box-shadow: 0 4px 12px rgba(245, 158, 11, 0.3);">
                                        <div class="chart-value" style="position: absolute; top: -25px; left: 50%; transform: translateX(-50%); background: #1e293b; color: white; padding: 0.25rem 0.5rem; border-radius: 0.375rem; font-size: 0.75rem; font-weight: 600;">8</div>
                                    </div>
                                    <small class="text-muted fw-medium">Jun</small>
                                </div>
                            </div>
                        </div>
                        
                        <!-- Professional Summary Cards -->
                        <div class="row g-3">
                            <div class="col-md-4">
                                <div class="summary-card p-3" style="background: linear-gradient(135deg, #f0f9ff, #e0f2fe); border-radius: 0.75rem; border: 1px solid rgba(59, 130, 246, 0.2); text-align: center;">
                                    <div class="d-flex align-items-center justify-content-center mb-2">
                                        <div class="summary-icon" style="width: 40px; height: 40px; background: linear-gradient(135deg, #3b82f6, #1d4ed8); border-radius: 50%; display: flex; align-items: center; justify-content: center; margin-right: 0.75rem;">
                                            <i class="fas fa-calendar-check text-white" style="font-size: 1rem;"></i>
                                        </div>
                                        <div>
                                            <div class="fw-bold text-primary" style="font-size: 1.75rem; line-height: 1;">31</div>
                                            <small class="text-muted">Total réservations</small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="summary-card p-3" style="background: linear-gradient(135deg, #f0fdf4, #dcfce7); border-radius: 0.75rem; border: 1px solid rgba(16, 185, 129, 0.2); text-align: center;">
                                    <div class="d-flex align-items-center justify-content-center mb-2">
                                        <div class="summary-icon" style="width: 40px; height: 40px; background: linear-gradient(135deg, #10b981, #059669); border-radius: 50%; display: flex; align-items: center; justify-content: center; margin-right: 0.75rem;">
                                            <i class="fas fa-chart-line text-white" style="font-size: 1rem;"></i>
                                        </div>
                                        <div>
                                            <div class="fw-bold text-success" style="font-size: 1.75rem; line-height: 1;">5.2</div>
                                            <small class="text-muted">Moyenne/mois</small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="summary-card p-3" style="background: linear-gradient(135deg, #fffbeb, #fef3c7); border-radius: 0.75rem; border: 1px solid rgba(245, 158, 11, 0.2); text-align: center;">
                                    <div class="d-flex align-items-center justify-content-center mb-2">
                                        <div class="summary-icon" style="width: 40px; height: 40px; background: linear-gradient(135deg, #f59e0b, #d97706); border-radius: 50%; display: flex; align-items: center; justify-content: center; margin-right: 0.75rem;">
                                            <i class="fas fa-arrow-up text-white" style="font-size: 1rem;"></i>
                                        </div>
                                        <div>
                                            <div class="fw-bold text-warning" style="font-size: 1.75rem; line-height: 1;">+23%</div>
                                            <small class="text-muted">vs mois dernier</small>
                                        </div>
                                    </div>
                                </div>
                            </div>
                </div>
                    </div>
                </div>
            </div>

        </div>

        <!-- Sidebar -->
        <div class="col-lg-4">
            <!-- Quick Actions -->
            <div class="card mb-4 border-0" style="border-radius: 1.25rem; box-shadow: 0 8px 32px -4px rgba(0, 0, 0, 0.12); overflow: hidden;">
                <div class="card-header border-0 py-4" style="background: linear-gradient(135deg, var(--primary-600), var(--primary-700));">
                    <h5 class="fw-bold mb-0 d-flex align-items-center text-white" style="font-size: 1.125rem;">
                        <div class="d-flex align-items-center justify-content-center me-3" style="width: 40px; height: 40px; background: rgba(255, 255, 255, 0.15); border-radius: 0.75rem;">
                            <i class="fas fa-bolt text-white" style="font-size: 1rem;"></i>
                        </div>
                        Actions rapides
                    </h5>
                </div>
                <div class="card-body p-4">
                    <div class="d-grid gap-3">
                        <a href="${pageContext.request.contextPath}/pages/equipment/list-simple.jsp" class="btn btn-primary d-flex align-items-center gap-2" style="border-radius: 0.75rem; font-weight: 600; padding: 0.75rem 1rem;">
                            <i class="fas fa-search" style="font-size: 0.875rem;"></i>
                            Parcourir le matériel
                        </a>
                        <a href="${pageContext.request.contextPath}/pages/client/reservations.jsp" class="btn btn-outline-primary d-flex align-items-center gap-2" style="border-radius: 0.75rem; font-weight: 600; padding: 0.75rem 1rem;">
                            <i class="fas fa-calendar" style="font-size: 0.875rem;"></i>
                            Mes réservations
                        </a>
                        <a href="${pageContext.request.contextPath}/pages/client/invoices.jsp" class="btn btn-outline-secondary d-flex align-items-center gap-2" style="border-radius: 0.75rem; font-weight: 600; padding: 0.75rem 1rem;">
                            <i class="fas fa-receipt" style="font-size: 0.875rem;"></i>
                            Mes factures
                        </a>
                        <a href="${pageContext.request.contextPath}/pages/client/favorites.jsp" class="btn btn-outline-secondary d-flex align-items-center gap-2" style="border-radius: 0.75rem; font-weight: 600; padding: 0.75rem 1rem;">
                            <i class="fas fa-heart" style="font-size: 0.875rem;"></i>
                            Mes favoris
                        </a>
                    </div>
                </div>
            </div>

            <!-- Upcoming Reservations -->
            <div class="card mb-4 border-0" style="border-radius: 1.25rem; box-shadow: 0 8px 32px -4px rgba(0, 0, 0, 0.12); overflow: hidden;">
                <div class="card-header border-0 py-4" style="background: linear-gradient(135deg, #ffffff 0%, #f8fafc 100%);">
                    <h5 class="fw-bold mb-0 d-flex align-items-center" style="color: var(--gray-900); font-size: 1.125rem;">
                        <div class="d-flex align-items-center justify-content-center me-3" style="width: 40px; height: 40px; background: rgba(245, 158, 11, 0.1); border-radius: 0.75rem;">
                            <i class="fas fa-calendar-plus text-warning" style="font-size: 1rem;"></i>
                        </div>
                        Prochaines réservations
                    </h5>
                </div>
                <div class="card-body p-4">
                    <div id="upcomingReservations">
                        <!-- Upcoming reservations will be loaded here -->
                    </div>
                </div>
            </div>

            <!-- Recent Activity -->
            <div class="card mb-4 border-0" style="border-radius: 1.25rem; box-shadow: 0 8px 32px -4px rgba(0, 0, 0, 0.12); overflow: hidden;">
                <div class="card-header border-0 py-4" style="background: linear-gradient(135deg, #ffffff 0%, #f8fafc 100%);">
                    <h5 class="fw-bold mb-0 d-flex align-items-center" style="color: var(--gray-900); font-size: 1.125rem;">
                        <div class="d-flex align-items-center justify-content-center me-3" style="width: 40px; height: 40px; background: rgba(16, 185, 129, 0.1); border-radius: 0.75rem;">
                            <i class="fas fa-history text-success" style="font-size: 1rem;"></i>
                        </div>
                        Activité récente
                    </h5>
                </div>
                <div class="card-body p-4">
                    <div class="activity-timeline" id="recentActivity">
                        <!-- Recent activity will be loaded here -->
                    </div>
                </div>
            </div>

            <!-- Support -->
            <div class="card border-0" style="border-radius: 1.25rem; box-shadow: 0 8px 32px -4px rgba(0, 0, 0, 0.12); overflow: hidden;">
                <div class="card-header border-0 py-4" style="background: linear-gradient(135deg, #ffffff 0%, #f8fafc 100%);">
                    <h5 class="fw-bold mb-0 d-flex align-items-center" style="color: var(--gray-900); font-size: 1.125rem;">
                        <div class="d-flex align-items-center justify-content-center me-3" style="width: 40px; height: 40px; background: rgba(37, 99, 235, 0.1); border-radius: 0.75rem;">
                            <i class="fas fa-headset text-primary" style="font-size: 1rem;"></i>
                        </div>
                        Besoin d'aide ?
                    </h5>
                </div>
                <div class="card-body p-4">
                    <p class="text-muted mb-4" style="line-height: 1.6;">Notre équipe est là pour vous accompagner dans vos projets.</p>
                    <div class="d-grid gap-3">
                        <a href="mailto:support@yours.ma" class="btn btn-outline-primary d-flex align-items-center gap-2" style="border-radius: 0.75rem; font-weight: 600; padding: 0.75rem 1rem;">
                            <i class="fas fa-envelope" style="font-size: 0.875rem;"></i>
                            support@yours.ma
                        </a>
                        <a href="tel:+212522123456" class="btn btn-outline-primary d-flex align-items-center gap-2" style="border-radius: 0.75rem; font-weight: 600; padding: 0.75rem 1rem;">
                            <i class="fas fa-phone" style="font-size: 0.875rem;"></i>
                            +212 522 123 456
                        </a>
                        <button class="btn btn-primary d-flex align-items-center gap-2" onclick="openChat()" style="border-radius: 0.75rem; font-weight: 600; padding: 0.75rem 1rem;">
                            <i class="fas fa-comments" style="font-size: 0.875rem;"></i>
                            Chat en direct
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Client Dashboard JavaScript -->
<script>
// Basic dashboard functionality without complex features
document.addEventListener('DOMContentLoaded', function() {
    console.log('Dashboard loaded successfully');
    
    // Set basic user name
    const userName = document.getElementById('userName');
    if (userName) {
        userName.textContent = 'Client';
    }
    
    // Set basic stats
    const activeReservations = document.getElementById('activeReservations');
    const totalReservations = document.getElementById('totalReservations');
    const totalSpent = document.getElementById('totalSpent');
    const favoriteItems = document.getElementById('favoriteItems');
    
    if (activeReservations) activeReservations.textContent = '2';
    if (totalReservations) totalReservations.textContent = '5';
    if (totalSpent) totalSpent.textContent = '4,350 MAD';
    if (favoriteItems) favoriteItems.textContent = '3';
});
</script>

<style>
/* Dashboard Enhancement Styles */
.d-flex.align-items-center.bg-white.px-4.py-3.rounded-3 {
    transition: all 0.3s ease;
}

.d-flex.align-items-center.bg-white.px-4.py-3.rounded-3:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 32px -4px rgba(0, 0, 0, 0.15) !important;
}

.card:hover {
    transform: translateY(-2px);
    box-shadow: 0 12px 40px -8px rgba(0, 0, 0, 0.15) !important;
}

.btn:hover {
    transform: translateY(-1px);
}

/* Header button hover effects */
.btn[style*="background: linear-gradient(135deg, #ffffff, #f8fafc)"]:hover {
    background: linear-gradient(135deg, #f8fafc, #e2e8f0) !important;
    box-shadow: 0 12px 40px -8px rgba(255, 255, 255, 0.4) !important;
}

.btn[style*="background: rgba(255, 255, 255, 0.15)"]:hover {
    background: rgba(255, 255, 255, 0.25) !important;
    transform: translateY(-2px);
}

/* Stats card hover effects */
.d-flex.align-items-center.bg-white.px-4.py-3.rounded-3:hover .rounded-2 {
    transform: scale(1.05);
}

/* Card header hover effects */
.card-header:hover .d-flex.align-items-center.justify-content-center {
    transform: scale(1.05);
}

/* Enhanced focus states */
.btn:focus {
    box-shadow: 0 0 0 4px rgba(37, 99, 235, 0.1);
}

/* Smooth transitions */
* {
    transition: all 0.3s ease;
}

/* Typography improvements */
h1, h2, h3, h4, h5, h6 {
    font-family: 'Inter', -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
    letter-spacing: -0.01em;
}

/* Icon animations */
.fas, .far, .fab {
    transition: all 0.3s ease;
}

/* Button enhancements */
.btn {
    border: none;
    font-weight: 600;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
}

.btn:hover {
    transform: translateY(-1px);
}

/* Custom scrollbar */
::-webkit-scrollbar {
    width: 8px;
}

::-webkit-scrollbar-track {
    background: #f1f5f9;
    border-radius: 4px;
}

::-webkit-scrollbar-thumb {
    background: #cbd5e1;
    border-radius: 4px;
}

::-webkit-scrollbar-thumb:hover {
    background: #94a3b8;
}

/* Loading states */
.loading {
    opacity: 0.6;
    pointer-events: none;
}

/* Responsive improvements */
@media (max-width: 768px) {
    .display-2 {
        font-size: 2.5rem !important;
    }
    
    .lead {
        font-size: 1.125rem !important;
    }
    
    .d-flex.gap-3 {
        flex-direction: column;
        align-items: center;
    }
    
    .btn {
        width: 100%;
        max-width: 300px;
    }
}
</style>

<%@ include file="../../layouts/footer.jsp" %>

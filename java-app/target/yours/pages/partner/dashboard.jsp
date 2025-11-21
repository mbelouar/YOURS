<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    try {
        request.setAttribute("pageTitle", "Tableau de bord Partenaire - YOURS");
    } catch (Exception e) {
        System.err.println("Partner dashboard page error: " + e.getMessage());
    }
%>

<%@ include file="../../layouts/header.jsp" %>
<%@ include file="../../layouts/navbar.jsp" %>

<!-- Page Header -->
<section class="py-5" style="background: linear-gradient(135deg, #1e40af 0%, #1e3a8a 50%, #1e293b 100%); margin-top: -80px; padding-top: calc(80px + 6rem) !important; padding-bottom: 6rem !important; min-height: 500px; height: 500px; position: relative; overflow: hidden;">
    <div style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; background: radial-gradient(circle at 20% 50%, rgba(59, 130, 246, 0.15) 0%, transparent 50%); opacity: 1;"></div>
    <div class="container" style="position: relative; z-index: 2;">
        <div class="row">
            <div class="col-lg-10 mx-auto text-center">
                <!-- Badge -->
                <div class="d-inline-flex align-items-center mb-4" style="background: rgba(255, 255, 255, 0.15); backdrop-filter: blur(20px); border-radius: 50px; padding: 0.75rem 1.5rem; border: 1px solid rgba(255, 255, 255, 0.2); box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);">
                    <i class="fas fa-handshake me-2" style="color: #fbbf24; font-size: 1rem;"></i>
                    <span style="color: white; font-weight: 600; font-size: 0.875rem; letter-spacing: 0.5px;">TABLEAU DE BORD PARTENAIRE</span>
                </div>
                
                <!-- Main Title -->
                <h1 class="display-2 fw-bold mb-4" style="color: white; text-shadow: 0 4px 20px rgba(0,0,0,0.3); letter-spacing: -0.03em; line-height: 1.1;">
                    Bonjour <span id="partnerName" style="background: linear-gradient(135deg, #fbbf24, #f59e0b); background-clip: text; -webkit-background-clip: text; -webkit-text-fill-color: transparent;">Partenaire</span> !
                </h1>
                
                <!-- Subtitle -->
                <div class="mb-4" style="max-width: 700px; margin: 0 auto;">
                    <p class="lead mb-2" style="color: rgba(255, 255, 255, 0.95); font-size: 1.375rem; font-weight: 400; line-height: 1.6; letter-spacing: -0.01em;">
                        Gérez votre activité de location
                    </p>
                    <p class="mb-0" style="color: rgba(255, 255, 255, 0.8); font-size: 1.1rem; font-weight: 300; line-height: 1.7;">
                        Suivez vos revenus • Gérez votre matériel • Analysez vos performances
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
    <div class="row g-4 mb-4">
        <div class="col-lg-3 col-md-6">
            <div class="card border-0 shadow-sm h-100 revenue-stats-container">
                <div class="card-header revenue-stats-header border-0 py-3">
                    <div class="d-flex align-items-center">
                        <div class="metric-icon me-3">
                            <i class="fas fa-dollar-sign"></i>
                        </div>
                        <div>
                            <h6 class="mb-0 fw-bold text-white">Revenus totaux</h6>
                        </div>
                    </div>
                </div>
                <div class="card-body p-4" style="background: linear-gradient(135deg, var(--gray-50) 0%, var(--white) 100%);">
                    <div class="text-center">
                        <h2 class="h3 fw-bold mb-2 text-success" id="totalRevenue">0 MAD</h2>
                        <small class="text-muted"><i class="fas fa-arrow-up me-1"></i>23% ce mois</small>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="card border-0 shadow-sm h-100 equipment-stats-container">
                <div class="card-header equipment-stats-header border-0 py-3">
                    <div class="d-flex align-items-center">
                        <div class="metric-icon me-3">
                            <i class="fas fa-box"></i>
                        </div>
                        <div>
                            <h6 class="mb-0 fw-bold text-white">Matériel disponible</h6>
                        </div>
                    </div>
                </div>
                <div class="card-body p-4" style="background: linear-gradient(135deg, var(--gray-50) 0%, var(--white) 100%);">
                    <div class="text-center">
                        <h2 class="h3 fw-bold mb-2 text-primary" id="totalEquipment">0</h2>
                        <small class="text-muted"><i class="fas fa-check-circle me-1"></i>Actif</small>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="card border-0 shadow-sm h-100 bookings-stats-container">
                <div class="card-header bookings-stats-header border-0 py-3">
                    <div class="d-flex align-items-center">
                        <div class="metric-icon me-3">
                            <i class="fas fa-calendar-alt"></i>
                        </div>
                        <div>
                            <h6 class="mb-0 fw-bold text-white">Réservations actives</h6>
                        </div>
                    </div>
                </div>
                <div class="card-body p-4" style="background: linear-gradient(135deg, var(--gray-50) 0%, var(--white) 100%);">
                    <div class="text-center">
                        <h2 class="h3 fw-bold mb-2 text-warning" id="activeBookings">0</h2>
                        <small class="text-muted"><i class="fas fa-clock me-1"></i>En cours</small>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="card border-0 shadow-sm h-100 rating-stats-container">
                <div class="card-header rating-stats-header border-0 py-3">
                    <div class="d-flex align-items-center">
                        <div class="metric-icon me-3">
                            <i class="fas fa-star"></i>
                        </div>
                        <div>
                            <h6 class="mb-0 fw-bold text-white">Note moyenne</h6>
                        </div>
                    </div>
                </div>
                <div class="card-body p-4" style="background: linear-gradient(135deg, var(--gray-50) 0%, var(--white) 100%);">
                    <div class="text-center">
                        <h2 class="h3 fw-bold mb-2" style="color: #8b5cf6;" id="rating">4.8</h2>
                        <small class="text-muted"><i class="fas fa-star me-1"></i>Excellent</small>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row g-4">
        <!-- Recent Bookings -->
        <div class="col-lg-8">
            <div class="card border-0 shadow-sm recent-bookings-container">
                <div class="card-header recent-bookings-header border-0 py-4">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <h5 class="mb-1 fw-bold text-white">
                                <i class="fas fa-calendar-check me-2" style="color: var(--accent-light);"></i>Réservations récentes
                            </h5>
                            <p class="mb-0 text-white-50 small">Dernières activités de location</p>
                        </div>
                        <div class="d-flex gap-2">
                            <a href="${pageContext.request.contextPath}/pages/partner/reservations.jsp" class="btn btn-sm btn-gradient">
                                <i class="fas fa-external-link-alt me-1"></i>Voir tout
                            </a>
                        </div>
                    </div>
                </div>
                <div class="card-body p-0">
                    <div id="recentBookingsContainer" class="p-4" style="background: linear-gradient(135deg, var(--gray-50) 0%, var(--white) 100%);">
                        <!-- Loading state -->
                        <div id="bookingsLoading" class="text-center py-5" style="display: none;">
                            <div class="spinner-border text-primary" role="status">
                                <span class="visually-hidden">Chargement...</span>
                            </div>
                            <p class="mt-3 text-muted">Chargement des réservations...</p>
                        </div>
                        
                        <!-- Empty state -->
                        <div id="bookingsEmpty" class="text-center py-5">
                            <div class="mb-4">
                                <div class="d-inline-flex align-items-center justify-content-center rounded-circle bg-gradient-primary" style="width: 80px; height: 80px;">
                                    <i class="fas fa-calendar-plus fa-2x text-white"></i>
                                </div>
                            </div>
                            <h6 class="text-muted mb-2">Aucune réservation récente</h6>
                            <p class="text-muted small mb-3">Vos nouvelles réservations apparaîtront ici</p>
                            <a href="${pageContext.request.contextPath}/pages/partner/equipment.jsp" class="btn btn-outline-primary btn-sm">
                                <i class="fas fa-plus me-1"></i>Ajouter du matériel
                            </a>
                        </div>
                        
                        <!-- Bookings cards -->
                        <div id="bookingsCards" class="row g-3" style="display: none;">
                            <!-- Cards will be dynamically inserted here -->
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- AI Models Container -->
            <div class="card border-0 shadow-sm mt-4 ai-models-container">
                <div class="card-header ai-models-header border-0 py-4">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <h5 class="mb-1 fw-bold text-white">
                                <i class="fas fa-robot me-2" style="color: var(--accent-light);"></i>Modèles IA
                            </h5>
                            <p class="mb-0 text-white-50 small">Intelligence artificielle pour optimiser vos locations</p>
                        </div>
                        <div class="d-flex gap-2">
                            <a href="${pageContext.request.contextPath}/pages/partner/ai-models.jsp" class="btn btn-sm btn-gradient">
                                <i class="fas fa-external-link-alt me-1"></i>Voir tout
                            </a>
                        </div>
                    </div>
                </div>
                <div class="card-body p-0">
                    <div id="aiModelsContainer" class="p-4" style="background: linear-gradient(135deg, var(--gray-50) 0%, var(--white) 100%);">
                        <!-- AI Models Content -->
                        <div class="text-center py-5">
                            <div class="ai-icon mb-3">
                                <i class="fas fa-brain text-primary" style="font-size: 3rem; opacity: 0.7;"></i>
                            </div>
                            <h6 class="text-muted mb-2">Modèles IA en développement</h6>
                            <p class="text-muted small mb-3">Prédiction de demande, optimisation des prix et recommandations intelligentes</p>
                            <div class="d-flex justify-content-center gap-2">
                                <span class="badge bg-primary-gradient me-2">
                                    <i class="fas fa-chart-line me-1"></i>Prédiction
                                </span>
                                <span class="badge bg-success-gradient me-2">
                                    <i class="fas fa-dollar-sign me-1"></i>Pricing
                                </span>
                                <span class="badge bg-info-gradient">
                                    <i class="fas fa-lightbulb me-1"></i>Recommandations
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Quick Actions -->
        <div class="col-lg-4">
            <div class="card border-0 shadow-sm mb-4 quick-actions-container">
                <div class="card-header quick-actions-header border-0 py-4">
                    <h5 class="mb-1 fw-bold text-white">
                        <i class="fas fa-bolt me-2" style="color: var(--accent-light);"></i>Actions rapides
                    </h5>
                    <p class="mb-0 text-white-50 small">Gérez votre activité rapidement</p>
                </div>
                <div class="card-body" style="background: linear-gradient(135deg, var(--gray-50) 0%, var(--white) 100%);">
                    <a href="${pageContext.request.contextPath}/pages/partner/equipment.jsp?action=add" class="btn btn-gradient-primary w-100 mb-3 d-flex align-items-center justify-content-center">
                        <i class="fas fa-plus-circle me-2"></i>Ajouter du matériel
                    </a>
                    <a href="${pageContext.request.contextPath}/pages/partner/equipment.jsp" class="btn btn-outline-gradient w-100 mb-3 d-flex align-items-center justify-content-center">
                        <i class="fas fa-boxes me-2"></i>Gérer mon matériel
                    </a>
                    <a href="${pageContext.request.contextPath}/pages/partner/analytics.jsp" class="btn btn-outline-gradient-success w-100 mb-3 d-flex align-items-center justify-content-center">
                        <i class="fas fa-chart-line me-2"></i>Voir les statistiques
                    </a>
                    <a href="${pageContext.request.contextPath}/pages/partner/earnings.jsp" class="btn btn-outline-gradient-info w-100 d-flex align-items-center justify-content-center">
                        <i class="fas fa-wallet me-2"></i>Mes gains
                    </a>
                </div>
            </div>

            <!-- Performance Summary -->
            <div class="card border-0 shadow-sm performance-container">
                <div class="card-header performance-header border-0 py-4">
                    <h5 class="mb-1 fw-bold text-white">
                        <i class="fas fa-chart-pie me-2" style="color: var(--accent-light);"></i>Performance
                    </h5>
                    <p class="mb-0 text-white-50 small">Indicateurs clés de performance</p>
                </div>
                <div class="card-body" style="background: linear-gradient(135deg, var(--gray-50) 0%, var(--white) 100%);">
                    <div class="mb-4">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <div class="d-flex align-items-center">
                                <div class="performance-icon bg-primary-gradient me-3">
                                    <i class="fas fa-chart-bar text-white"></i>
                                </div>
                                <div>
                                    <small class="text-muted fw-medium d-block">Taux d'occupation</small>
                                    <small class="text-muted">Équipements actifs</small>
                                </div>
                            </div>
                            <div class="text-end">
                                <div class="h5 mb-0 fw-bold text-primary">78%</div>
                                <small class="text-success">
                                    <i class="fas fa-arrow-up me-1"></i>+5%
                                </small>
                            </div>
                        </div>
                        <div class="progress performance-progress">
                            <div class="progress-bar bg-gradient-primary" style="width: 78%"></div>
                        </div>
                    </div>
                    <div class="mb-4">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <div class="d-flex align-items-center">
                                <div class="performance-icon bg-success-gradient me-3">
                                    <i class="fas fa-smile text-white"></i>
                                </div>
                                <div>
                                    <small class="text-muted fw-medium d-block">Satisfaction client</small>
                                    <small class="text-muted">Note moyenne</small>
                                </div>
                            </div>
                            <div class="text-end">
                                <div class="h5 mb-0 fw-bold text-success">92%</div>
                                <small class="text-success">
                                    <i class="fas fa-arrow-up me-1"></i>+2%
                                </small>
                            </div>
                        </div>
                        <div class="progress performance-progress">
                            <div class="progress-bar bg-gradient-success" style="width: 92%"></div>
                        </div>
                    </div>
                    <div>
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <div class="d-flex align-items-center">
                                <div class="performance-icon bg-warning-gradient me-3">
                                    <i class="fas fa-reply text-white"></i>
                                </div>
                                <div>
                                    <small class="text-muted fw-medium d-block">Taux de réponse</small>
                                    <small class="text-muted">Messages traités</small>
                                </div>
                            </div>
                            <div class="text-end">
                                <div class="h5 mb-0 fw-bold text-warning">95%</div>
                                <small class="text-success">
                                    <i class="fas fa-arrow-up me-1"></i>+1%
                                </small>
                            </div>
                        </div>
                        <div class="progress performance-progress">
                            <div class="progress-bar bg-gradient-warning" style="width: 95%"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
    // Load partner data from session/localStorage
    try {
        const user = localStorage.getItem('yours_user') || sessionStorage.getItem('yours_user');
        if (user) {
            const userData = JSON.parse(user);
            if (userData.type === 'partner') {
                document.getElementById('partnerName').textContent = userData.prenom || 'Partenaire';
                
                // Simulate loading dashboard data
                loadPartnerDashboardData();
            }
        }
    } catch (error) {
        console.error('Error loading partner data:', error);
    }
});

function loadPartnerDashboardData() {
    // Simulate loading data - replace with actual API calls
    setTimeout(() => {
        document.getElementById('totalRevenue').textContent = '12,450 MAD';
        document.getElementById('totalEquipment').textContent = '8';
        document.getElementById('activeBookings').textContent = '5';
        
        // Load recent bookings
        loadRecentBookings();
    }, 500);
}

// Global bookings data
let allBookings = [];

function loadRecentBookings() {
    // Show loading state
    document.getElementById('bookingsLoading').style.display = 'block';
    document.getElementById('bookingsEmpty').style.display = 'none';
    document.getElementById('bookingsCards').style.display = 'none';
    
    // Mock data - replace with actual API call
    setTimeout(() => {
        allBookings = [
            { 
                id: 'RES-001',
                client: 'Ahmed Ben Ali', 
                clientEmail: 'ahmed.benali@email.com',
                equipment: 'Canon EOS R5', 
                equipmentImage: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=300&auto=format&fit=crop&q=80',
                period: '15-20 Jan', 
                startDate: '2024-01-15',
                endDate: '2024-01-20',
                price: '1,200 MAD',
                totalPrice: 1200,
                status: 'active',
                createdAt: '2024-01-10T10:30:00Z',
                rating: 4.8
            },
            { 
                id: 'RES-002',
                client: 'Sara Bennani', 
                clientEmail: 'sara.bennani@email.com',
                equipment: 'MacBook Pro 16"', 
                equipmentImage: 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=300&auto=format&fit=crop&q=80',
                period: '18-22 Jan', 
                startDate: '2024-01-18',
                endDate: '2024-01-22',
                price: '750 MAD',
                totalPrice: 750,
                status: 'active',
                createdAt: '2024-01-12T14:20:00Z',
                rating: 4.9
            },
            { 
                id: 'RES-003',
                client: 'Omar Khalil', 
                clientEmail: 'omar.khalil@email.com',
                equipment: 'Sony A7 III', 
                equipmentImage: 'https://images.unsplash.com/photo-1606983340126-99ab4feaa64a?w=300&auto=format&fit=crop&q=80',
                period: '20-25 Jan', 
                startDate: '2024-01-20',
                endDate: '2024-01-25',
                price: '1,050 MAD',
                totalPrice: 1050,
                status: 'pending',
                createdAt: '2024-01-14T09:15:00Z',
                rating: 4.7
            },
            { 
                id: 'RES-004',
                client: 'Fatima Zahra', 
                clientEmail: 'fatima.zahra@email.com',
                equipment: 'DJI Mavic Pro', 
                equipmentImage: 'https://images.unsplash.com/photo-1473968512647-3e447244af8f?w=300&auto=format&fit=crop&q=80',
                period: '10-12 Jan', 
                startDate: '2024-01-10',
                endDate: '2024-01-12',
                price: '600 MAD',
                totalPrice: 600,
                status: 'completed',
                createdAt: '2024-01-08T16:45:00Z',
                rating: 4.9
            }
        ];
        
        // Hide loading and render bookings
        document.getElementById('bookingsLoading').style.display = 'none';
        renderBookings();
    }, 1000);
}

function renderBookings() {
    const container = document.getElementById('bookingsCards');
    const emptyState = document.getElementById('bookingsEmpty');
    
    console.log('Rendering bookings, count:', allBookings.length);
    
    if (allBookings.length === 0) {
        container.style.display = 'none';
        emptyState.style.display = 'block';
        return;
    }
    
    emptyState.style.display = 'none';
    container.style.display = 'block';
    
    // Show only the first 2 bookings
    const recentBookings = allBookings.slice(0, 2);
    const cardsHtml = recentBookings.map(booking => createBookingCard(booking)).join('');
    console.log('Generated cards HTML:', cardsHtml.substring(0, 200) + '...');
    container.innerHTML = cardsHtml;
}

function createBookingCard(booking) {
    const statusConfig = getStatusConfig(booking.status);
    const timeAgo = getTimeAgo(booking.createdAt);
    
    let pendingActions = '';
    if (booking.status === 'pending') {
        pendingActions = '<li><hr class="dropdown-divider"></li>' +
                        '<li><a class="dropdown-item text-success" href="#" onclick="approveBooking(' + booking.id + ')">' +
                        '<i class="fas fa-check me-2"></i>Approuver</a></li>' +
                        '<li><a class="dropdown-item text-danger" href="#" onclick="rejectBooking(' + booking.id + ')">' +
                        '<i class="fas fa-times me-2"></i>Rejeter</a></li>';
    }
    
    return '<div class="col-12">' +
        '<div class="card border-0 shadow-sm h-100 booking-card" style="transition: all 0.3s ease; cursor: pointer;" ' +
        'onmouseover="this.style.transform=\'translateY(-2px)\'; this.style.boxShadow=\'0 8px 25px rgba(0,0,0,0.15)\'" ' +
        'onmouseout="this.style.transform=\'translateY(0)\'; this.style.boxShadow=\'0 4px 6px rgba(0,0,0,0.1)\'" ' +
        'onclick="viewBookingDetails(\'' + booking.id + '\')">' +
        '<div class="card-body p-4">' +
        '<div class="row align-items-center">' +
        '<div class="col-auto">' +
        '<div class="position-relative">' +
        '<img src="' + booking.equipmentImage + '" ' +
        'alt="' + booking.equipment + '" ' +
        'class="rounded-3" ' +
        'style="width: 80px; height: 80px; object-fit: cover;">' +
        '<div class="position-absolute top-0 end-0 translate-middle">' +
        '<span class="badge ' + statusConfig.badgeClass + ' px-2 py-1" style="font-size: 0.75rem;">' +
        '<i class="' + statusConfig.icon + ' me-1"></i>' + statusConfig.text +
        '</span>' +
        '</div>' +
        '</div>' +
        '</div>' +
        '<div class="col">' +
        '<div class="d-flex justify-content-between align-items-start mb-2">' +
        '<div>' +
        '<h6 class="mb-1 fw-bold text-dark">' + booking.equipment + '</h6>' +
        '<p class="mb-0 text-muted small">' +
        '<i class="fas fa-user me-1"></i>' + booking.client +
        '</p>' +
        '</div>' +
        '<div class="text-end">' +
        '<div class="h5 mb-0 fw-bold text-success">' + booking.price + '</div>' +
        '<small class="text-muted">' + timeAgo + '</small>' +
        '</div>' +
        '</div>' +
        '<div class="row g-2">' +
        '<div class="col-md-6">' +
        '<div class="d-flex align-items-center text-muted small">' +
        '<i class="fas fa-calendar-alt me-2 text-primary"></i>' +
        '<span>' + booking.period + '</span>' +
        '</div>' +
        '</div>' +
        '<div class="col-md-6">' +
        '<div class="d-flex align-items-center text-muted small">' +
        '<i class="fas fa-star me-2 text-warning"></i>' +
        '<span>' + booking.rating + '/5</span>' +
        '</div>' +
        '</div>' +
        '</div>' +
        '</div>' +
        '<div class="col-auto">' +
        '<div class="dropdown">' +
        '<button class="btn btn-sm btn-outline-secondary" type="button" data-bs-toggle="dropdown" onclick="event.stopPropagation()">' +
        '<i class="fas fa-ellipsis-v"></i>' +
        '</button>' +
        '<ul class="dropdown-menu">' +
        '<li><a class="dropdown-item" href="#" onclick="viewBookingDetails(' + booking.id + ')">' +
        '<i class="fas fa-eye me-2"></i>Voir détails</a></li>' +
        '<li><a class="dropdown-item" href="#" onclick="contactClient(\'' + booking.clientEmail + '\')">' +
        '<i class="fas fa-envelope me-2"></i>Contacter</a></li>' +
        pendingActions +
        '</ul>' +
        '</div>' +
        '</div>' +
        '</div>' +
        '</div>' +
        '</div>' +
        '</div>';
}

function getStatusConfig(status) {
    const configs = {
        'active': { text: 'Actif', badgeClass: 'bg-success', icon: 'fas fa-check-circle' },
        'pending': { text: 'En attente', badgeClass: 'bg-warning', icon: 'fas fa-clock' },
        'completed': { text: 'Terminé', badgeClass: 'bg-info', icon: 'fas fa-check-double' },
        'cancelled': { text: 'Annulé', badgeClass: 'bg-danger', icon: 'fas fa-times-circle' }
    };
    return configs[status] || configs['pending'];
}

function getTimeAgo(dateString) {
    const now = new Date();
    const date = new Date(dateString);
    const diffInHours = Math.floor((now - date) / (1000 * 60 * 60));
    
    if (diffInHours < 1) return 'Il y a moins d\'une heure';
    if (diffInHours < 24) return `Il y a ${diffInHours}h`;
    const diffInDays = Math.floor(diffInHours / 24);
    if (diffInDays < 7) return `Il y a ${diffInDays}j`;
    return date.toLocaleDateString('fr-FR');
}

function viewBookingDetails(bookingId) {
    console.log('Navigating to reservation details for ID:', bookingId);
    // Navigate to reservations page with booking ID
    const baseUrl = window.location.origin;
    const currentPath = window.location.pathname;
    const newPath = currentPath.replace('/pages/partner/dashboard.jsp', '/pages/partner/reservations.jsp');
    const fullUrl = baseUrl + newPath + '?id=' + bookingId;
    console.log('Navigating to:', fullUrl);
    window.location.href = fullUrl;
}

function contactClient(email) {
    window.location.href = `mailto:${email}`;
}

function approveBooking(bookingId) {
    if (confirm('Êtes-vous sûr de vouloir approuver cette réservation ?')) {
        // API call to approve booking
        console.log('Approving booking:', bookingId);
        // Update UI
        const booking = allBookings.find(b => b.id === bookingId);
        if (booking) {
            booking.status = 'active';
            renderBookings();
        }
    }
}

function rejectBooking(bookingId) {
    if (confirm('Êtes-vous sûr de vouloir rejeter cette réservation ?')) {
        // API call to reject booking
        console.log('Rejecting booking:', bookingId);
        // Update UI
        const booking = allBookings.find(b => b.id === bookingId);
        if (booking) {
            booking.status = 'cancelled';
            renderBookings();
        }
    }
}

function showAIModels() {
    // Placeholder function for AI models configuration
    console.log('Opening AI models configuration...');
    alert('Configuration des modèles IA - Fonctionnalité en développement');
}
</script>

<style>
/* AI Models Container */
.ai-models-container {
    background: linear-gradient(135deg, var(--primary-600), var(--primary-700));
    border-radius: 1rem;
    overflow: hidden;
}

.ai-models-header {
    background: linear-gradient(135deg, var(--primary-600), var(--primary-700));
    border: none;
}

.ai-icon {
    animation: pulse 2s infinite;
}

@keyframes pulse {
    0% { transform: scale(1); }
    50% { transform: scale(1.05); }
    100% { transform: scale(1); }
}

.bg-primary-gradient {
    background: linear-gradient(135deg, var(--primary-600), var(--primary-700)) !important;
}

.bg-success-gradient {
    background: linear-gradient(135deg, var(--success-color), var(--success-dark)) !important;
}

.bg-info-gradient {
    background: linear-gradient(135deg, var(--info-color), #0891b2) !important;
}

/* Dashboard Stats Container Styles - Matching Analytics */
.revenue-stats-container {
    background: linear-gradient(135deg, var(--success-color), var(--success-dark));
    border-radius: 1rem;
    overflow: hidden;
}

.revenue-stats-header {
    background: linear-gradient(135deg, var(--success-color), var(--success-dark));
    border: none;
}

.equipment-stats-container {
    background: linear-gradient(135deg, var(--primary-600), var(--primary-700));
    border-radius: 1rem;
    overflow: hidden;
}

.equipment-stats-header {
    background: linear-gradient(135deg, var(--primary-600), var(--primary-700));
    border: none;
}

.bookings-stats-container {
    background: linear-gradient(135deg, var(--warning-color), #d97706);
    border-radius: 1rem;
    overflow: hidden;
}

.bookings-stats-header {
    background: linear-gradient(135deg, var(--warning-color), #d97706);
    border: none;
}

.rating-stats-container {
    background: linear-gradient(135deg, #8b5cf6, #7c3aed);
    border-radius: 1rem;
    overflow: hidden;
}

.rating-stats-header {
    background: linear-gradient(135deg, #8b5cf6, #7c3aed);
    border: none;
}

.metric-icon {
    width: 40px;
    height: 40px;
    background: rgba(255, 255, 255, 0.2);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 1.2rem;
    color: white;
}
</style>

<%@ include file="../../layouts/footer.jsp" %>


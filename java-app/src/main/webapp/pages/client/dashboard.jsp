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

<div class="container-fluid px-4 py-4" style="margin-top: 80px;">
    <!-- Welcome Banner -->
    <div class="dashboard-welcome-banner">
        <div class="row align-items-center position-relative" style="z-index: 1;">
            <div class="col-lg-8">
                <h1 class="fw-bold mb-2" style="font-size: 2rem;">
                    <i class="bi bi-sun me-2"></i>
                    Bonjour <span id="userName">Client</span> !
                </h1>
                <p class="mb-3 opacity-90" style="font-size: 1.125rem;">
                    Bienvenue sur votre espace personnel. Gérez vos réservations et découvrez du nouveau matériel.
                </p>
                <div class="d-flex gap-2 flex-wrap">
                    <a href="${pageContext.request.contextPath}/pages/equipment/list.jsp" class="btn btn-light btn-lg">
                        <i class="bi bi-plus-circle me-2"></i>Nouvelle réservation
                    </a>
                    <a href="${pageContext.request.contextPath}/pages/client/profile.jsp" class="btn btn-outline-light btn-lg">
                        <i class="bi bi-person me-2"></i>Mon profil
                    </a>
                </div>
            </div>
            <div class="col-lg-4 text-end d-none d-lg-block">
                <div class="position-relative" style="z-index: 1;">
                    <i class="bi bi-speedometer2" style="font-size: 8rem; opacity: 0.15;"></i>
                </div>
            </div>
        </div>
    </div>

    <!-- Quick Stats -->
    <div class="row g-4 mb-4">
        <div class="col-lg-3 col-md-6">
            <div class="stats-card">
                <div class="stats-icon">
                    <i class="bi bi-calendar-check text-primary"></i>
                </div>
                <div class="stats-number" id="activeReservations">0</div>
                <div class="stats-label">Réservations actives</div>
                <div class="mt-3">
                    <small class="text-success">
                        <i class="bi bi-arrow-up me-1"></i>12% ce mois
                    </small>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="stats-card">
                <div class="stats-icon">
                    <i class="bi bi-clock-history text-info"></i>
                </div>
                <div class="stats-number" id="totalReservations">0</div>
                <div class="stats-label">Total réservations</div>
                <div class="mt-3">
                    <small class="text-muted">
                        <i class="bi bi-graph-up me-1"></i>Tous les temps
                    </small>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="stats-card">
                <div class="stats-icon">
                    <i class="bi bi-currency-dollar text-success"></i>
                </div>
                <div class="stats-number" id="totalSpent">0</div>
                <div class="stats-label">Total dépensé</div>
                <div class="mt-3">
                    <small class="text-muted">
                        <i class="bi bi-wallet2 me-1"></i>En MAD
                    </small>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="stats-card">
                <div class="stats-icon">
                    <i class="bi bi-heart text-danger"></i>
                </div>
                <div class="stats-number" id="favoriteItems">0</div>
                <div class="stats-label">Favoris</div>
                <div class="mt-3">
                    <small class="text-muted">
                        <i class="bi bi-bookmark me-1"></i>Matériel sauvegardé
                    </small>
                </div>
            </div>
        </div>
    </div>

    <div class="row g-4">
        <!-- Main Content -->
        <div class="col-lg-8">
            <!-- Current Reservations -->
            <div class="card mb-4 border-0 shadow-sm">
                <div class="card-header bg-white border-0 d-flex justify-content-between align-items-center py-3">
                    <h5 class="fw-bold mb-0">
                        <i class="bi bi-calendar-check me-2 text-primary"></i>Réservations en cours
                    </h5>
                    <a href="${pageContext.request.contextPath}/pages/client/reservations.jsp" class="btn btn-outline-primary btn-sm">
                        <i class="bi bi-arrow-right me-1"></i>Voir tout
                    </a>
                </div>
                <div class="card-body">
                    <div id="currentReservations">
                        <!-- Current reservations will be loaded here -->
                    </div>
                </div>
            </div>

            <!-- Activity Chart -->
            <div class="card mb-4 border-0 shadow-sm">
                <div class="card-header bg-white border-0 py-3">
                    <h5 class="fw-bold mb-0">
                        <i class="bi bi-graph-up me-2 text-primary"></i>Historique des réservations
                    </h5>
                </div>
                <div class="card-body">
                    <canvas id="reservationChart" height="80"></canvas>
                </div>
            </div>

            <!-- Recommended Equipment -->
            <div class="card border-0 shadow-sm">
                <div class="card-header bg-white border-0 py-3">
                    <h5 class="fw-bold mb-0">
                        <i class="bi bi-stars me-2 text-warning"></i>Recommandé pour vous
                    </h5>
                </div>
                <div class="card-body">
                    <div class="row g-3" id="recommendedEquipment">
                        <!-- Recommended equipment will be loaded here -->
                    </div>
                </div>
            </div>
        </div>

        <!-- Sidebar -->
        <div class="col-lg-4">
            <!-- Quick Actions -->
            <div class="card mb-4 border-0 shadow-sm">
                <div class="card-header bg-gradient text-white border-0 py-3" style="background: linear-gradient(135deg, var(--primary-600), var(--primary-700));">
                    <h5 class="fw-bold mb-0">
                        <i class="bi bi-lightning me-2"></i>Actions rapides
                    </h5>
                </div>
                <div class="card-body p-3">
                    <div class="d-grid gap-2">
                        <a href="${pageContext.request.contextPath}/pages/equipment/list.jsp" class="btn btn-primary">
                            <i class="bi bi-search me-2"></i>Parcourir le matériel
                        </a>
                        <a href="${pageContext.request.contextPath}/pages/client/reservations.jsp" class="btn btn-outline-primary">
                            <i class="bi bi-calendar me-2"></i>Mes réservations
                        </a>
                        <a href="${pageContext.request.contextPath}/pages/client/invoices.jsp" class="btn btn-outline-secondary">
                            <i class="bi bi-receipt me-2"></i>Mes factures
                        </a>
                        <a href="${pageContext.request.contextPath}/pages/client/favorites.jsp" class="btn btn-outline-secondary">
                            <i class="bi bi-heart me-2"></i>Mes favoris
                        </a>
                    </div>
                </div>
            </div>

            <!-- Upcoming Reservations -->
            <div class="card mb-4 border-0 shadow-sm">
                <div class="card-header bg-white border-0 py-3">
                    <h5 class="fw-bold mb-0">
                        <i class="bi bi-calendar-event me-2 text-primary"></i>Prochaines réservations
                    </h5>
                </div>
                <div class="card-body">
                    <div id="upcomingReservations">
                        <!-- Upcoming reservations will be loaded here -->
                    </div>
                </div>
            </div>

            <!-- Recent Activity -->
            <div class="card mb-4 border-0 shadow-sm">
                <div class="card-header bg-white border-0 py-3">
                    <h5 class="fw-bold mb-0">
                        <i class="bi bi-activity me-2 text-primary"></i>Activité récente
                    </h5>
                </div>
                <div class="card-body">
                    <div class="activity-timeline" id="recentActivity">
                        <!-- Recent activity will be loaded here -->
                    </div>
                </div>
            </div>

            <!-- Support -->
            <div class="card border-0 shadow-sm">
                <div class="card-header bg-white border-0 py-3">
                    <h5 class="fw-bold mb-0">
                        <i class="bi bi-headset me-2 text-primary"></i>Besoin d'aide ?
                    </h5>
                </div>
                <div class="card-body">
                    <p class="text-muted mb-3">Notre équipe est là pour vous accompagner.</p>
                    <div class="d-grid gap-2">
                        <a href="mailto:support@yours.ma" class="btn btn-outline-primary btn-sm">
                            <i class="bi bi-envelope me-2"></i>support@yours.ma
                        </a>
                        <a href="tel:+212522123456" class="btn btn-outline-primary btn-sm">
                            <i class="bi bi-telephone me-2"></i>+212 522 123 456
                        </a>
                        <button class="btn btn-primary btn-sm" onclick="openChat()">
                            <i class="bi bi-chat-dots me-2"></i>Chat en direct
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Client Dashboard JavaScript -->
<script>
document.addEventListener('DOMContentLoaded', function() {
    try {
        // Check if user is logged in
        checkAuthentication();
        
        // Load dashboard data
        loadDashboardData();
        
        // Initialize chart
        initializeChart();
    } catch (error) {
        console.error('Dashboard initialization error:', error);
        // Fallback: show basic dashboard without advanced features
        showBasicDashboard();
    }
});

// Fallback function for basic dashboard
function showBasicDashboard() {
    const userName = document.getElementById('userName');
    if (userName) {
        userName.textContent = 'Client';
    }
    
    // Set basic stats
    animateCounter('activeReservations', 2);
    animateCounter('totalReservations', 5);
    animateCounter('totalSpent', 4350, true);
    animateCounter('favoriteItems', 3);
}

// Check authentication
function checkAuthentication() {
    const user = YOURS.storage.get('user') || JSON.parse(sessionStorage.getItem('yours_user') || 'null');
    
    if (!user || user.type !== 'client') {
        YOURS.showToast('Veuillez vous connecter en tant que client', 'warning');
        setTimeout(() => {
            window.location.href = '${pageContext.request.contextPath}/pages/auth/login.jsp';
        }, 2000);
        return;
    }
    
    // Update user name
    const userName = document.getElementById('userName');
    if (userName) {
        userName.textContent = user.prenom || 'Client';
    }
}

// Load dashboard data
function loadDashboardData() {
    // Simulate API calls
    setTimeout(() => {
        loadStats();
        loadCurrentReservations();
        loadUpcomingReservations();
        loadRecentActivity();
        loadRecommendedEquipment();
    }, 500);
}

// Load stats
function loadStats() {
    try {
        const user = YOURS.storage.get('user') || JSON.parse(sessionStorage.getItem('yours_user') || 'null');
        
        // Get user reservations with fallback
        let userReservations = [];
        if (typeof MockDataUtils !== 'undefined' && MockDataUtils.getUserReservations) {
            userReservations = MockDataUtils.getUserReservations(user.idClient || 1);
        } else {
            // Fallback mock data
            userReservations = [
                { status: 'active', totalPrice: 1200 },
                { status: 'active', totalPrice: 2250 },
                { status: 'completed', totalPrice: 900 }
            ];
        }
        
        const activeReservations = userReservations.filter(res => res.status === 'active').length;
        const totalReservations = userReservations.length;
        const totalSpent = userReservations.reduce((sum, res) => sum + (res.totalPrice || 0), 0);
        
        // Animate counters
        animateCounter('activeReservations', activeReservations);
        animateCounter('totalReservations', totalReservations);
        animateCounter('totalSpent', totalSpent, true);
        animateCounter('favoriteItems', 5); // Mock data
    } catch (error) {
        console.error('Error loading stats:', error);
        // Set default values
        animateCounter('activeReservations', 2);
        animateCounter('totalReservations', 5);
        animateCounter('totalSpent', 4350, true);
        animateCounter('favoriteItems', 3);
    }
}

// Load current reservations
function loadCurrentReservations() {
    try {
        const container = document.getElementById('currentReservations');
        const user = YOURS.storage.get('user') || JSON.parse(sessionStorage.getItem('yours_user') || 'null');
        
        let activeReservations = [];
        if (typeof MockDataUtils !== 'undefined' && MockDataUtils.getUserReservations) {
            activeReservations = MockDataUtils.getUserReservations(user.idClient || 1, 'active');
        } else {
            // Fallback mock data
            activeReservations = [
                {
                    idReservation: 'R001',
                    status: 'active',
                    dateDebut: '2025-10-15',
                    dateFin: '2025-10-20',
                    totalPrice: 1200,
                    materiel: {
                        nom: 'Canon EOS R5',
                        images: ['${pageContext.request.contextPath}/assets/images/placeholder-equipment.jpg']
                    }
                }
            ];
        }
    
    if (activeReservations.length === 0) {
        container.innerHTML = `
            <div class="text-center py-5">
                <i class="bi bi-calendar-x text-muted" style="font-size: 4rem; opacity: 0.3;"></i>
                <h6 class="text-muted mt-3 mb-2">Aucune réservation active</h6>
                <p class="text-muted mb-4">Découvrez notre matériel et faites votre première réservation</p>
                <a href="${pageContext.request.contextPath}/pages/equipment/list.jsp" class="btn btn-primary">
                    <i class="bi bi-search me-2"></i>Parcourir le matériel
                </a>
            </div>
        `;
        return;
    }
    
    container.innerHTML = activeReservations.map(reservation => `
        <div class="reservation-card mb-3">
            <div class="reservation-header">
                <span class="reservation-id">#${reservation.idReservation}</span>
                <span class="reservation-status ${reservation.status}">${getStatusText(reservation.status)}</span>
            </div>
            <div class="d-flex align-items-center">
                <img src="${reservation.materiel.images[0]}" alt="${reservation.materiel.nom}" 
                     class="rounded me-3" style="width: 70px; height: 70px; object-fit: cover;"
                     onerror="this.src='${pageContext.request.contextPath}/assets/images/placeholder-equipment.jpg'">
                <div class="flex-grow-1">
                    <h6 class="mb-1 fw-bold">${reservation.materiel.nom}</h6>
                    <small class="text-muted d-block mb-1">
                        <i class="bi bi-calendar me-1"></i>
                        ${YOURS.formatDate(reservation.dateDebut)} - ${YOURS.formatDate(reservation.dateFin)}
                    </small>
                    <small class="text-muted">
                        <i class="bi bi-clock me-1"></i>
                        ${calculateDaysRemaining(reservation.dateFin)} jours restants
                    </small>
                </div>
                <div class="text-end">
                    <div class="fw-bold text-primary mb-2" style="font-size: 1.125rem;">${YOURS.formatCurrency(reservation.totalPrice)}</div>
                    <a href="${pageContext.request.contextPath}/pages/client/reservation-detail.jsp?id=${reservation.idReservation}" 
                       class="btn btn-outline-primary btn-sm">
                        <i class="bi bi-eye me-1"></i>Détails
                    </a>
                </div>
            </div>
        </div>
    `).join('');
    } catch (error) {
        console.error('Error loading current reservations:', error);
        if (container) {
            container.innerHTML = `
                <div class="text-center py-5">
                    <i class="bi bi-exclamation-triangle text-warning" style="font-size: 4rem; opacity: 0.3;"></i>
                    <h6 class="text-muted mt-3 mb-2">Erreur de chargement</h6>
                    <p class="text-muted mb-4">Impossible de charger les réservations</p>
                    <button class="btn btn-primary" onclick="loadCurrentReservations()">
                        <i class="bi bi-arrow-clockwise me-2"></i>Réessayer
                    </button>
                </div>
            `;
        }
    }
}

// Load upcoming reservations
function loadUpcomingReservations() {
    const container = document.getElementById('upcomingReservations');
    const user = YOURS.storage.get('user') || JSON.parse(sessionStorage.getItem('yours_user') || 'null');
    
    const upcomingReservations = MockDataUtils.getUserReservations(user.idClient || 1, 'upcoming');
    
    if (upcomingReservations.length === 0) {
        container.innerHTML = `
            <div class="text-center py-3">
                <i class="bi bi-calendar text-muted" style="font-size: 2.5rem; opacity: 0.3;"></i>
                <p class="text-muted mb-0 mt-2 small">Aucune réservation à venir</p>
            </div>
        `;
        return;
    }
    
    container.innerHTML = upcomingReservations.slice(0, 3).map(reservation => `
        <div class="d-flex align-items-center mb-3 pb-3 border-bottom">
            <img src="${reservation.materiel.images[0]}" alt="${reservation.materiel.nom}" 
                 class="rounded me-3" style="width: 50px; height: 50px; object-fit: cover;"
                 onerror="this.src='${pageContext.request.contextPath}/assets/images/placeholder-equipment.jpg'">
            <div class="flex-grow-1">
                <h6 class="mb-1 small fw-bold">${reservation.materiel.nom}</h6>
                <small class="text-muted">
                    <i class="bi bi-calendar me-1"></i>
                    ${YOURS.formatDate(reservation.dateDebut)}
                </small>
            </div>
            <div class="text-end">
                <span class="badge bg-warning text-dark">À venir</span>
            </div>
        </div>
    `).join('');
}

// Load recent activity
function loadRecentActivity() {
    const container = document.getElementById('recentActivity');
    
    const activities = [
        {
            type: 'reservation',
            icon: 'bi-calendar-check',
            color: 'success',
            title: 'Réservation confirmée',
            description: 'Canon EOS R5',
            time: 'Il y a 2 heures'
        },
        {
            type: 'payment',
            icon: 'bi-credit-card',
            color: 'info',
            title: 'Paiement effectué',
            description: '450.00 MAD',
            time: 'Il y a 1 jour'
        },
        {
            type: 'favorite',
            icon: 'bi-heart',
            color: 'danger',
            title: 'Ajouté aux favoris',
            description: 'Sony FX3',
            time: 'Il y a 3 jours'
        }
    ];
    
    container.innerHTML = activities.map(activity => `
        <div class="activity-timeline-item">
            <div class="d-flex align-items-start">
                <div class="flex-shrink-0 me-3">
                    <div class="rounded-circle bg-${activity.color} bg-opacity-10 p-2" style="width: 40px; height: 40px; display: flex; align-items: center; justify-content: center;">
                        <i class="${activity.icon} text-${activity.color}"></i>
                    </div>
                </div>
                <div class="flex-grow-1">
                    <h6 class="mb-1 small fw-bold">${activity.title}</h6>
                    <p class="text-muted mb-1 small">${activity.description}</p>
                    <small class="text-muted" style="font-size: 0.75rem;">${activity.time}</small>
                </div>
            </div>
        </div>
    `).join('');
}

// Load recommended equipment
function loadRecommendedEquipment() {
    const container = document.getElementById('recommendedEquipment');
    
    // Get popular equipment as recommendations
    const recommendations = MockDataUtils.getPopularEquipment(3);
    
    container.innerHTML = recommendations.map(equipment => `
        <div class="col-md-4">
            <div class="card h-100 border-0 shadow-sm">
                <div class="position-relative">
                    <img src="${equipment.images[0]}" class="card-img-top" alt="${equipment.nom}" 
                         style="height: 180px; object-fit: cover;"
                         onerror="this.src='${pageContext.request.contextPath}/assets/images/placeholder-equipment.jpg'">
                    <span class="badge bg-success position-absolute top-0 end-0 m-2">Populaire</span>
                </div>
                <div class="card-body">
                    <h6 class="card-title fw-bold mb-2">${equipment.nom}</h6>
                    <p class="card-text small text-muted mb-3">${equipment.description.substring(0, 80)}...</p>
                    <div class="d-flex justify-content-between align-items-center">
                        <span class="fw-bold text-primary">${YOURS.formatCurrency(equipment.prix)}/j</span>
                        <a href="${pageContext.request.contextPath}/pages/equipment/detail.jsp?id=${equipment.idMateriel}" 
                           class="btn btn-outline-primary btn-sm">
                            <i class="bi bi-eye"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    `).join('');
}

// Initialize chart
function initializeChart() {
    try {
        const ctx = document.getElementById('reservationChart');
        if (!ctx) return;
        
        // Check if Chart.js is available
        if (typeof Chart === 'undefined') {
            console.warn('Chart.js not available, skipping chart initialization');
            ctx.parentElement.innerHTML = '<div class="text-center py-4"><i class="bi bi-bar-chart text-muted" style="font-size: 3rem; opacity: 0.3;"></i><p class="text-muted mt-2">Graphique non disponible</p></div>';
            return;
        }
        
        new Chart(ctx, {
        type: 'line',
        data: {
            labels: ['Jan', 'Fév', 'Mar', 'Avr', 'Mai', 'Jun'],
            datasets: [{
                label: 'Réservations',
                data: [3, 5, 2, 8, 6, 9],
                borderColor: 'rgb(37, 99, 235)',
                backgroundColor: 'rgba(37, 99, 235, 0.1)',
                tension: 0.4,
                fill: true
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: true,
            plugins: {
                legend: {
                    display: false
                }
            },
            scales: {
                y: {
                    beginAtZero: true,
                    ticks: {
                        stepSize: 2
                    }
                }
            }
        }
    });
    } catch (error) {
        console.error('Error initializing chart:', error);
        const ctx = document.getElementById('reservationChart');
        if (ctx && ctx.parentElement) {
            ctx.parentElement.innerHTML = '<div class="text-center py-4"><i class="bi bi-exclamation-triangle text-warning" style="font-size: 3rem; opacity: 0.3;"></i><p class="text-muted mt-2">Erreur de chargement du graphique</p></div>';
        }
    }
}

// Animate counter
function animateCounter(elementId, targetValue, isCurrency = false) {
    const element = document.getElementById(elementId);
    if (!element) return;
    
    const increment = targetValue / 50;
    let current = 0;
    
    const timer = setInterval(() => {
        current += increment;
        if (current >= targetValue) {
            current = targetValue;
            clearInterval(timer);
        }
        
        if (isCurrency) {
            element.textContent = YOURS.formatCurrency(current);
        } else {
            element.textContent = Math.floor(current);
        }
    }, 30);
}

// Get status text
function getStatusText(status) {
    const statusMap = {
        'active': 'En cours',
        'upcoming': 'À venir',
        'completed': 'Terminé',
        'cancelled': 'Annulé'
    };
    return statusMap[status] || status;
}

// Calculate days remaining
function calculateDaysRemaining(endDate) {
    const today = new Date();
    const end = new Date(endDate);
    const diffTime = Math.abs(end - today);
    return Math.ceil(diffTime / (1000 * 60 * 60 * 24));
}

// Open chat
function openChat() {
    YOURS.showToast('Chat en direct bientôt disponible !', 'info');
}
</script>

<%@ include file="../../layouts/footer.jsp" %>

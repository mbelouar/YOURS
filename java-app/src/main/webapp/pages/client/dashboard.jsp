<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setAttribute("pageTitle", "Tableau de bord - YOURS");
%>

<%@ include file="../../layouts/header.jsp" %>
<%@ include file="../../layouts/navbar.jsp" %>

<!-- Breadcrumb -->
<div class="container py-3">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb breadcrumb-custom">
            <li class="breadcrumb-item">
                <a href="${pageContext.request.contextPath}/" class="text-decoration-none">
                    <i class="bi bi-house me-1"></i>Accueil
                </a>
            </li>
            <li class="breadcrumb-item active">Tableau de bord</li>
        </ol>
    </nav>
</div>

<div class="container py-4">
    <!-- Welcome Header -->
    <div class="row mb-4">
        <div class="col-12">
            <div class="d-flex justify-content-between align-items-center">
                <div>
                    <h1 class="fw-bold mb-2">
                        <i class="bi bi-speedometer2 me-2"></i>
                        Bonjour <span id="userName">Client</span> !
                    </h1>
                    <p class="text-muted mb-0">Gérez vos réservations et découvrez du nouveau matériel</p>
                </div>
                <div class="d-flex gap-2">
                    <a href="${pageContext.request.contextPath}/pages/equipment/list.jsp" class="btn btn-primary">
                        <i class="bi bi-plus-circle me-2"></i>Nouvelle réservation
                    </a>
                    <a href="${pageContext.request.contextPath}/pages/client/profile.jsp" class="btn btn-outline-secondary">
                        <i class="bi bi-person me-2"></i>Mon profil
                    </a>
                </div>
            </div>
        </div>
    </div>

    <!-- Stats Cards -->
    <div class="row mb-5">
        <div class="col-lg-3 col-md-6 mb-4">
            <div class="stats-card">
                <div class="stats-icon">
                    <i class="bi bi-calendar-check text-primary"></i>
                </div>
                <div class="stats-number" id="activeReservations">0</div>
                <div class="stats-label">Réservations actives</div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 mb-4">
            <div class="stats-card">
                <div class="stats-icon">
                    <i class="bi bi-clock-history text-info"></i>
                </div>
                <div class="stats-number" id="totalReservations">0</div>
                <div class="stats-label">Total réservations</div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 mb-4">
            <div class="stats-card">
                <div class="stats-icon">
                    <i class="bi bi-currency-dollar text-success"></i>
                </div>
                <div class="stats-number" id="totalSpent">0</div>
                <div class="stats-label">Total dépensé</div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6 mb-4">
            <div class="stats-card">
                <div class="stats-icon">
                    <i class="bi bi-heart text-danger"></i>
                </div>
                <div class="stats-number" id="favoriteItems">0</div>
                <div class="stats-label">Favoris</div>
            </div>
        </div>
    </div>

    <div class="row">
        <!-- Main Content -->
        <div class="col-lg-8">
            <!-- Current Reservations -->
            <div class="card mb-4">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h5 class="fw-bold mb-0">
                        <i class="bi bi-calendar-check me-2"></i>Réservations en cours
                    </h5>
                    <a href="${pageContext.request.contextPath}/pages/client/reservations.jsp" class="btn btn-outline-primary btn-sm">
                        Voir tout
                    </a>
                </div>
                <div class="card-body">
                    <div id="currentReservations">
                        <!-- Current reservations will be loaded here -->
                    </div>
                </div>
            </div>

            <!-- Recent Activity -->
            <div class="card mb-4">
                <div class="card-header">
                    <h5 class="fw-bold mb-0">
                        <i class="bi bi-activity me-2"></i>Activité récente
                    </h5>
                </div>
                <div class="card-body">
                    <div id="recentActivity">
                        <!-- Recent activity will be loaded here -->
                    </div>
                </div>
            </div>

            <!-- Recommended Equipment -->
            <div class="card">
                <div class="card-header">
                    <h5 class="fw-bold mb-0">
                        <i class="bi bi-stars me-2"></i>Recommandé pour vous
                    </h5>
                </div>
                <div class="card-body">
                    <div class="row" id="recommendedEquipment">
                        <!-- Recommended equipment will be loaded here -->
                    </div>
                </div>
            </div>
        </div>

        <!-- Sidebar -->
        <div class="col-lg-4">
            <!-- Quick Actions -->
            <div class="card mb-4">
                <div class="card-header">
                    <h5 class="fw-bold mb-0">
                        <i class="bi bi-lightning me-2"></i>Actions rapides
                    </h5>
                </div>
                <div class="card-body">
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
            <div class="card mb-4">
                <div class="card-header">
                    <h5 class="fw-bold mb-0">
                        <i class="bi bi-calendar-event me-2"></i>Prochaines réservations
                    </h5>
                </div>
                <div class="card-body">
                    <div id="upcomingReservations">
                        <!-- Upcoming reservations will be loaded here -->
                    </div>
                </div>
            </div>

            <!-- Support -->
            <div class="card">
                <div class="card-header">
                    <h5 class="fw-bold mb-0">
                        <i class="bi bi-headset me-2"></i>Support
                    </h5>
                </div>
                <div class="card-body">
                    <p class="text-muted mb-3">Besoin d'aide ? Notre équipe est là pour vous.</p>
                    <div class="d-grid gap-2">
                        <a href="mailto:support@yours.ma" class="btn btn-outline-primary btn-sm">
                            <i class="bi bi-envelope me-2"></i>Email
                        </a>
                        <a href="tel:+212522123456" class="btn btn-outline-primary btn-sm">
                            <i class="bi bi-telephone me-2"></i>Téléphone
                        </a>
                        <button class="btn btn-outline-primary btn-sm" onclick="openChat()">
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
    // Check if user is logged in
    checkAuthentication();
    
    // Load dashboard data
    loadDashboardData();
});

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
    document.getElementById('userName').textContent = `${user.prenom} ${user.nom}`;
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
    const user = YOURS.storage.get('user') || JSON.parse(sessionStorage.getItem('yours_user') || 'null');
    
    // Get user reservations
    const userReservations = MockDataUtils.getUserReservations(user.idClient || 1);
    const activeReservations = userReservations.filter(res => res.status === 'active').length;
    const totalReservations = userReservations.length;
    const totalSpent = userReservations.reduce((sum, res) => sum + res.totalPrice, 0);
    
    // Animate counters
    animateCounter('activeReservations', activeReservations);
    animateCounter('totalReservations', totalReservations);
    animateCounter('totalSpent', totalSpent, true);
    animateCounter('favoriteItems', 5); // Mock data
}

// Load current reservations
function loadCurrentReservations() {
    const container = document.getElementById('currentReservations');
    const user = YOURS.storage.get('user') || JSON.parse(sessionStorage.getItem('yours_user') || 'null');
    
    const activeReservations = MockDataUtils.getUserReservations(user.idClient || 1, 'active');
    
    if (activeReservations.length === 0) {
        container.innerHTML = `
            <div class="text-center py-4">
                <i class="bi bi-calendar-x text-muted" style="font-size: 3rem;"></i>
                <h6 class="text-muted mt-2">Aucune réservation active</h6>
                <p class="text-muted mb-3">Découvrez notre matériel et faites votre première réservation</p>
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
                     class="rounded me-3" style="width: 60px; height: 60px; object-fit: cover;"
                     onerror="this.src='assets/images/placeholder-equipment.jpg'">
                <div class="flex-grow-1">
                    <h6 class="mb-1">${reservation.materiel.nom}</h6>
                    <small class="text-muted">
                        <i class="bi bi-calendar me-1"></i>
                        ${YOURS.formatDate(reservation.dateDebut)} - ${YOURS.formatDate(reservation.dateFin)}
                    </small>
                </div>
                <div class="text-end">
                    <div class="fw-bold text-primary">${YOURS.formatCurrency(reservation.totalPrice)}</div>
                    <a href="${pageContext.request.contextPath}/pages/client/reservation-detail.jsp?id=${reservation.idReservation}" 
                       class="btn btn-outline-primary btn-sm">
                        <i class="bi bi-eye me-1"></i>Voir
                    </a>
                </div>
            </div>
        </div>
    `).join('');
}

// Load upcoming reservations
function loadUpcomingReservations() {
    const container = document.getElementById('upcomingReservations');
    const user = YOURS.storage.get('user') || JSON.parse(sessionStorage.getItem('yours_user') || 'null');
    
    const upcomingReservations = MockDataUtils.getUserReservations(user.idClient || 1, 'upcoming');
    
    if (upcomingReservations.length === 0) {
        container.innerHTML = `
            <div class="text-center py-3">
                <i class="bi bi-calendar text-muted" style="font-size: 2rem;"></i>
                <p class="text-muted mb-0 mt-2">Aucune réservation à venir</p>
            </div>
        `;
        return;
    }
    
    container.innerHTML = upcomingReservations.slice(0, 3).map(reservation => `
        <div class="d-flex align-items-center mb-3 pb-3 border-bottom">
            <img src="${reservation.materiel.images[0]}" alt="${reservation.materiel.nom}" 
                 class="rounded me-3" style="width: 40px; height: 40px; object-fit: cover;"
                 onerror="this.src='assets/images/placeholder-equipment.jpg'">
            <div class="flex-grow-1">
                <h6 class="mb-1 small">${reservation.materiel.nom}</h6>
                <small class="text-muted">
                    <i class="bi bi-calendar me-1"></i>
                    ${YOURS.formatDate(reservation.dateDebut)}
                </small>
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
            description: 'Canon EOS R5 - 15-18 Jan 2024',
            time: '2 heures'
        },
        {
            type: 'payment',
            icon: 'bi-credit-card',
            color: 'info',
            title: 'Paiement effectué',
            description: '450.00 MAD - Réservation #1',
            time: '1 jour'
        },
        {
            type: 'favorite',
            icon: 'bi-heart',
            color: 'danger',
            title: 'Ajouté aux favoris',
            description: 'Sony FX3',
            time: '3 jours'
        },
        {
            type: 'review',
            icon: 'bi-star',
            color: 'warning',
            title: 'Avis laissé',
            description: '5 étoiles pour DJI Ronin 4D',
            time: '1 semaine'
        }
    ];
    
    container.innerHTML = activities.map(activity => `
        <div class="d-flex align-items-center mb-3 pb-3 border-bottom">
            <div class="flex-shrink-0 me-3">
                <div class="rounded-circle bg-${activity.color} bg-opacity-10 p-2">
                    <i class="${activity.icon} text-${activity.color}"></i>
                </div>
            </div>
            <div class="flex-grow-1">
                <h6 class="mb-1">${activity.title}</h6>
                <p class="text-muted mb-0 small">${activity.description}</p>
            </div>
            <small class="text-muted">Il y a ${activity.time}</small>
        </div>
    `).join('');
}

// Load recommended equipment
function loadRecommendedEquipment() {
    const container = document.getElementById('recommendedEquipment');
    
    // Get popular equipment as recommendations
    const recommendations = MockDataUtils.getPopularEquipment(3);
    
    container.innerHTML = recommendations.map(equipment => `
        <div class="col-md-4 mb-3">
            <div class="card h-100">
                <img src="${equipment.images[0]}" class="card-img-top" alt="${equipment.nom}" 
                     style="height: 150px; object-fit: cover;"
                     onerror="this.src='assets/images/placeholder-equipment.jpg'">
                <div class="card-body">
                    <h6 class="card-title">${equipment.nom}</h6>
                    <p class="card-text small text-muted">${equipment.description.substring(0, 80)}...</p>
                    <div class="d-flex justify-content-between align-items-center">
                        <span class="fw-bold text-primary">${YOURS.formatCurrency(equipment.prix)}/j</span>
                        <a href="${pageContext.request.contextPath}/pages/equipment/detail.jsp?id=${equipment.idMateriel}" 
                           class="btn btn-outline-primary btn-sm">
                            <i class="bi bi-eye me-1"></i>Voir
                        </a>
                    </div>
                </div>
            </div>
        </div>
    `).join('');
}

// Animate counter
function animateCounter(elementId, targetValue, isCurrency = false) {
    const element = document.getElementById(elementId);
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

// Open chat
function openChat() {
    YOURS.showToast('Chat en direct bientôt disponible !', 'info');
}
</script>

<%@ include file="../../layouts/footer.jsp" %>

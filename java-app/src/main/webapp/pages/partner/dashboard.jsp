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
<section class="py-5" style="background: linear-gradient(135deg, #059669 0%, #047857 50%, #065f46 100%); margin-top: -80px; padding-top: calc(80px + 6rem) !important; padding-bottom: 6rem !important; min-height: 400px; position: relative; overflow: hidden;">
    <div style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; background: radial-gradient(circle at 20% 50%, rgba(16, 185, 129, 0.15) 0%, transparent 50%); opacity: 1;"></div>
    <div class="container" style="position: relative; z-index: 2;">
        <div class="row">
            <div class="col-lg-10 mx-auto text-center">
                <!-- Badge -->
                <div class="d-inline-flex align-items-center mb-4" style="background: rgba(255, 255, 255, 0.15); backdrop-filter: blur(20px); border-radius: 50px; padding: 0.75rem 1.5rem; border: 1px solid rgba(255, 255, 255, 0.2); box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);">
                    <i class="fas fa-handshake me-2" style="color: #34d399; font-size: 1rem;"></i>
                    <span style="color: white; font-weight: 600; font-size: 0.875rem; letter-spacing: 0.5px;">TABLEAU DE BORD PARTENAIRE</span>
                </div>
                
                <!-- Main Title -->
                <h1 class="display-2 fw-bold mb-4" style="color: white; text-shadow: 0 4px 20px rgba(0,0,0,0.3); letter-spacing: -0.03em; line-height: 1.1;">
                    Bonjour <span id="partnerName" style="background: linear-gradient(135deg, #34d399, #10b981); background-clip: text; -webkit-background-clip: text; -webkit-text-fill-color: transparent;">Partenaire</span> !
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
                    <div style="width: 8px; height: 8px; background: rgba(52, 211, 153, 0.8); border-radius: 50%; box-shadow: 0 0 20px rgba(52, 211, 153, 0.5);"></div>
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
            <div class="d-flex align-items-center bg-white px-4 py-3 rounded-3 shadow-sm border-0" style="border-left: 4px solid #10b981 !important; transition: all 0.3s ease;">
                <div class="me-3">
                    <div class="rounded-2 d-flex align-items-center justify-content-center" style="width: 48px; height: 48px; background: #10b981;">
                        <i class="fas fa-dollar-sign text-white" style="font-size: 1.125rem;"></i>
                    </div>
                </div>
                <div class="flex-grow-1">
                    <div class="h4 mb-0 text-dark fw-bold" id="totalRevenue">0 MAD</div>
                    <small class="text-muted fw-medium">Revenus totaux</small>
                    <div class="mt-1">
                        <small class="text-success fw-medium">
                            <i class="fas fa-arrow-up me-1"></i>23% ce mois
                        </small>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="d-flex align-items-center bg-white px-4 py-3 rounded-3 shadow-sm border-0" style="border-left: 4px solid var(--primary-600) !important; transition: all 0.3s ease;">
                <div class="me-3">
                    <div class="bg-primary rounded-2 d-flex align-items-center justify-content-center" style="width: 48px; height: 48px;">
                        <i class="fas fa-box text-white" style="font-size: 1.125rem;"></i>
                    </div>
                </div>
                <div class="flex-grow-1">
                    <div class="h4 mb-0 text-dark fw-bold" id="totalEquipment">0</div>
                    <small class="text-muted fw-medium">Matériel disponible</small>
                    <div class="mt-1">
                        <small class="text-primary fw-medium">
                            <i class="fas fa-check-circle me-1"></i>Actif
                        </small>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="d-flex align-items-center bg-white px-4 py-3 rounded-3 shadow-sm border-0" style="border-left: 4px solid #f59e0b !important; transition: all 0.3s ease;">
                <div class="me-3">
                    <div class="rounded-2 d-flex align-items-center justify-content-center" style="width: 48px; height: 48px; background: #f59e0b;">
                        <i class="fas fa-calendar-alt text-white" style="font-size: 1.125rem;"></i>
                    </div>
                </div>
                <div class="flex-grow-1">
                    <div class="h4 mb-0 text-dark fw-bold" id="activeBookings">0</div>
                    <small class="text-muted fw-medium">Réservations actives</small>
                    <div class="mt-1">
                        <small class="text-muted fw-medium">
                            <i class="fas fa-clock me-1"></i>En cours
                        </small>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="d-flex align-items-center bg-white px-4 py-3 rounded-3 shadow-sm border-0" style="border-left: 4px solid #8b5cf6 !important; transition: all 0.3s ease;">
                <div class="me-3">
                    <div class="rounded-2 d-flex align-items-center justify-content-center" style="width: 48px; height: 48px; background: #8b5cf6;">
                        <i class="fas fa-star text-white" style="font-size: 1.125rem;"></i>
                    </div>
                </div>
                <div class="flex-grow-1">
                    <div class="h4 mb-0 text-dark fw-bold" id="rating">4.8</div>
                    <small class="text-muted fw-medium">Note moyenne</small>
                    <div class="mt-1">
                        <small class="text-warning fw-medium">
                            <i class="fas fa-star me-1"></i>Excellent
                        </small>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row g-4">
        <!-- Recent Bookings -->
        <div class="col-lg-8">
            <div class="card border-0 shadow-sm">
                <div class="card-header bg-white border-0 py-3">
                    <div class="d-flex justify-content-between align-items-center">
                        <h5 class="mb-0 fw-bold text-dark">
                            <i class="fas fa-calendar-check me-2 text-primary"></i>Réservations récentes
                        </h5>
                        <a href="${pageContext.request.contextPath}/pages/partner/reservations.jsp" class="btn btn-sm btn-outline-primary">
                            Voir tout
                        </a>
                    </div>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover mb-0">
                            <thead class="bg-light">
                                <tr>
                                    <th class="border-0 fw-semibold text-muted" style="font-size: 0.875rem;">Client</th>
                                    <th class="border-0 fw-semibold text-muted" style="font-size: 0.875rem;">Matériel</th>
                                    <th class="border-0 fw-semibold text-muted" style="font-size: 0.875rem;">Période</th>
                                    <th class="border-0 fw-semibold text-muted" style="font-size: 0.875rem;">Prix</th>
                                    <th class="border-0 fw-semibold text-muted" style="font-size: 0.875rem;">Statut</th>
                                </tr>
                            </thead>
                            <tbody id="recentBookingsTable">
                                <tr>
                                    <td colspan="5" class="text-center py-5 text-muted">
                                        <i class="fas fa-inbox fa-3x mb-3 d-block" style="opacity: 0.3;"></i>
                                        Aucune réservation pour le moment
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!-- Quick Actions -->
        <div class="col-lg-4">
            <div class="card border-0 shadow-sm mb-4">
                <div class="card-header bg-white border-0 py-3">
                    <h5 class="mb-0 fw-bold text-dark">
                        <i class="fas fa-bolt me-2 text-warning"></i>Actions rapides
                    </h5>
                </div>
                <div class="card-body">
                    <a href="${pageContext.request.contextPath}/pages/partner/equipment.jsp?action=add" class="btn btn-primary w-100 mb-2 d-flex align-items-center justify-content-center">
                        <i class="fas fa-plus-circle me-2"></i>Ajouter du matériel
                    </a>
                    <a href="${pageContext.request.contextPath}/pages/partner/equipment.jsp" class="btn btn-outline-primary w-100 mb-2 d-flex align-items-center justify-content-center">
                        <i class="fas fa-boxes me-2"></i>Gérer mon matériel
                    </a>
                    <a href="${pageContext.request.contextPath}/pages/partner/analytics.jsp" class="btn btn-outline-success w-100 mb-2 d-flex align-items-center justify-content-center">
                        <i class="fas fa-chart-line me-2"></i>Voir les statistiques
                    </a>
                    <a href="${pageContext.request.contextPath}/pages/partner/earnings.jsp" class="btn btn-outline-info w-100 d-flex align-items-center justify-content-center">
                        <i class="fas fa-wallet me-2"></i>Mes gains
                    </a>
                </div>
            </div>

            <!-- Performance Summary -->
            <div class="card border-0 shadow-sm">
                <div class="card-header bg-white border-0 py-3">
                    <h5 class="mb-0 fw-bold text-dark">
                        <i class="fas fa-chart-pie me-2 text-info"></i>Performance
                    </h5>
                </div>
                <div class="card-body">
                    <div class="mb-3">
                        <div class="d-flex justify-content-between mb-2">
                            <small class="text-muted fw-medium">Taux d'occupation</small>
                            <small class="fw-bold text-dark">78%</small>
                        </div>
                        <div class="progress" style="height: 8px;">
                            <div class="progress-bar bg-primary" style="width: 78%"></div>
                        </div>
                    </div>
                    <div class="mb-3">
                        <div class="d-flex justify-content-between mb-2">
                            <small class="text-muted fw-medium">Satisfaction client</small>
                            <small class="fw-bold text-dark">92%</small>
                        </div>
                        <div class="progress" style="height: 8px;">
                            <div class="progress-bar bg-success" style="width: 92%"></div>
                        </div>
                    </div>
                    <div>
                        <div class="d-flex justify-content-between mb-2">
                            <small class="text-muted fw-medium">Taux de réponse</small>
                            <small class="fw-bold text-dark">95%</small>
                        </div>
                        <div class="progress" style="height: 8px;">
                            <div class="progress-bar bg-warning" style="width: 95%"></div>
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

function loadRecentBookings() {
    // Mock data - replace with actual API call
    const bookings = [
        { client: 'Ahmed Ben Ali', equipment: 'Canon EOS R5', period: '15-20 Jan', price: '1,200 MAD', status: 'active' },
        { client: 'Sara Bennani', equipment: 'MacBook Pro 16"', period: '18-22 Jan', price: '750 MAD', status: 'active' },
        { client: 'Omar Khalil', equipment: 'Sony A7 III', period: '20-25 Jan', price: '1,050 MAD', status: 'pending' }
    ];
    
    const tableBody = document.getElementById('recentBookingsTable');
    if (bookings.length > 0) {
        tableBody.innerHTML = bookings.map(booking => {
            const statusClass = booking.status === 'active' ? 'bg-success' : 'bg-warning';
            const statusText = booking.status === 'active' ? 'Actif' : 'En attente';
            return '<tr>' +
                '<td class="fw-medium">' + booking.client + '</td>' +
                '<td>' + booking.equipment + '</td>' +
                '<td><small class="text-muted">' + booking.period + '</small></td>' +
                '<td class="fw-bold text-success">' + booking.price + '</td>' +
                '<td>' +
                    '<span class="badge ' + statusClass + '">' +
                        statusText +
                    '</span>' +
                '</td>' +
            '</tr>';
        }).join('');
    }
}
</script>

<%@ include file="../../layouts/footer.jsp" %>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setAttribute("pageTitle", "Analytiques - YOURS");
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
                    <i class="fas fa-chart-bar me-2" style="color: #fbbf24; font-size: 1rem;"></i>
                    <span style="color: white; font-weight: 600; font-size: 0.875rem; letter-spacing: 0.5px;">ANALYTIQUES & STATISTIQUES</span>
                </div>
                
                <!-- Main Title -->
                <h1 class="display-2 fw-bold mb-4" style="color: white; text-shadow: 0 4px 20px rgba(0,0,0,0.3); letter-spacing: -0.03em; line-height: 1.1;">
                    <span style="background: linear-gradient(135deg, #fbbf24, #f59e0b); background-clip: text; -webkit-background-clip: text; -webkit-text-fill-color: transparent;">Analytiques</span>
                </h1>
                
                <!-- Subtitle -->
                <div class="mb-4" style="max-width: 700px; margin: 0 auto;">
                    <p class="lead mb-2" style="color: rgba(255, 255, 255, 0.95); font-size: 1.375rem; font-weight: 400; line-height: 1.6; letter-spacing: -0.01em;">
                        Analysez vos performances et optimisez votre activité
                    </p>
                    <p class="mb-0" style="color: rgba(255, 255, 255, 0.8); font-size: 1.1rem; font-weight: 300; line-height: 1.7;">
                        Graphiques détaillés • Métriques clés • Insights business
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

<!-- Analytics Content -->
<div class="container-fluid py-4">
    <!-- Key Metrics -->
    <div class="row g-4 mb-4">
        <div class="col-lg-3 col-md-6">
            <div class="card border-0 shadow-sm h-100 occupancy-metric-container">
                <div class="card-header occupancy-metric-header border-0 py-3">
                    <div class="d-flex align-items-center">
                        <div class="metric-icon me-3">
                            <i class="fas fa-percentage"></i>
                        </div>
                        <div>
                            <h6 class="mb-0 fw-bold text-white">Taux d'occupation</h6>
                        </div>
                    </div>
                </div>
                <div class="card-body p-4" style="background: linear-gradient(135deg, var(--gray-50) 0%, var(--white) 100%);">
                    <div class="text-center">
                        <h2 class="h3 fw-bold mb-2 text-primary">78%</h2>
                        <small class="text-success"><i class="fas fa-arrow-up me-1"></i>+5% vs mois dernier</small>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="card border-0 shadow-sm h-100 revenue-metric-container">
                <div class="card-header revenue-metric-header border-0 py-3">
                    <div class="d-flex align-items-center">
                        <div class="metric-icon me-3">
                            <i class="fas fa-chart-line"></i>
                        </div>
                        <div>
                            <h6 class="mb-0 fw-bold text-white">Revenus moyens</h6>
                        </div>
                    </div>
                </div>
                <div class="card-body p-4" style="background: linear-gradient(135deg, var(--gray-50) 0%, var(--white) 100%);">
                    <div class="text-center">
                        <h2 class="h3 fw-bold mb-2 text-success">485 MAD</h2>
                        <small class="text-success"><i class="fas fa-arrow-up me-1"></i>+12% vs mois dernier</small>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="card border-0 shadow-sm h-100 rating-metric-container">
                <div class="card-header rating-metric-header border-0 py-3">
                    <div class="d-flex align-items-center">
                        <div class="metric-icon me-3">
                            <i class="fas fa-star"></i>
                        </div>
                        <div>
                            <h6 class="mb-0 fw-bold text-white">Note client</h6>
                        </div>
                    </div>
                </div>
                <div class="card-body p-4" style="background: linear-gradient(135deg, var(--gray-50) 0%, var(--white) 100%);">
                    <div class="text-center">
                        <h2 class="h3 fw-bold mb-2 text-warning">4.8/5</h2>
                        <small class="text-muted">42 avis</small>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="card border-0 shadow-sm h-100 response-metric-container">
                <div class="card-header response-metric-header border-0 py-3">
                    <div class="d-flex align-items-center">
                        <div class="metric-icon me-3">
                            <i class="fas fa-comments"></i>
                        </div>
                        <div>
                            <h6 class="mb-0 fw-bold text-white">Taux de réponse</h6>
                        </div>
                    </div>
                </div>
                <div class="card-body p-4" style="background: linear-gradient(135deg, var(--gray-50) 0%, var(--white) 100%);">
                    <div class="text-center">
                        <h2 class="h3 fw-bold mb-2 text-info">95%</h2>
                        <small class="text-success">Excellent</small>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Charts -->
    <div class="row g-4">
        <div class="col-lg-8">
            <div class="card border-0 shadow-sm bookings-chart-container">
                <div class="card-header bookings-chart-header border-0 py-4">
                    <h5 class="mb-1 fw-bold text-white">
                        <i class="fas fa-chart-line me-2" style="color: var(--accent-light);"></i>Réservations par mois
                    </h5>
                    <p class="mb-0 text-white-50 small">Évolution des réservations sur 12 mois</p>
                </div>
                <div class="card-body p-4" style="background: linear-gradient(135deg, var(--gray-50) 0%, var(--white) 100%);">
                    <canvas id="bookingsChart" height="80"></canvas>
                </div>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="card border-0 shadow-sm categories-chart-container">
                <div class="card-header categories-chart-header border-0 py-4">
                    <h5 class="mb-1 fw-bold text-white">
                        <i class="fas fa-chart-pie me-2" style="color: var(--accent-light);"></i>Catégories populaires
                    </h5>
                    <p class="mb-0 text-white-50 small">Répartition par type d'équipement</p>
                </div>
                <div class="card-body p-4" style="background: linear-gradient(135deg, var(--gray-50) 0%, var(--white) 100%);">
                    <canvas id="categoriesChart"></canvas>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
document.addEventListener('DOMContentLoaded', function() {
    initBookingsChart();
    initCategoriesChart();
});

function initBookingsChart() {
    const ctx = document.getElementById('bookingsChart').getContext('2d');
    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ['Jan', 'Fév', 'Mar', 'Avr', 'Mai', 'Juin'],
            datasets: [{
                label: 'Réservations',
                data: [12, 15, 10, 18, 14, 20],
                backgroundColor: '#10b981'
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: true
        }
    });
}

function initCategoriesChart() {
    const ctx = document.getElementById('categoriesChart').getContext('2d');
    new Chart(ctx, {
        type: 'doughnut',
        data: {
            labels: ['Photo', 'Vidéo', 'Audio', 'Info'],
            datasets: [{
                data: [35, 25, 20, 20],
                backgroundColor: ['#10b981', '#3b82f6', '#f59e0b', '#8b5cf6']
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: true
        }
    });
}
</script>

<style>
/* Analytics Page Container Styles - Matching Dashboard */
.occupancy-metric-container {
    background: linear-gradient(135deg, var(--primary-600), var(--primary-700));
    border-radius: 1rem;
    overflow: hidden;
}

.occupancy-metric-header {
    background: linear-gradient(135deg, var(--primary-600), var(--primary-700));
    border: none;
}

.revenue-metric-container {
    background: linear-gradient(135deg, var(--success-color), var(--success-dark));
    border-radius: 1rem;
    overflow: hidden;
}

.revenue-metric-header {
    background: linear-gradient(135deg, var(--success-color), var(--success-dark));
    border: none;
}

.rating-metric-container {
    background: linear-gradient(135deg, var(--warning-color), #d97706);
    border-radius: 1rem;
    overflow: hidden;
}

.rating-metric-header {
    background: linear-gradient(135deg, var(--warning-color), #d97706);
    border: none;
}

.response-metric-container {
    background: linear-gradient(135deg, var(--info-color), #0891b2);
    border-radius: 1rem;
    overflow: hidden;
}

.response-metric-header {
    background: linear-gradient(135deg, var(--info-color), #0891b2);
    border: none;
}

.bookings-chart-container {
    background: linear-gradient(135deg, var(--primary-600), var(--primary-700));
    border-radius: 1rem;
    overflow: hidden;
}

.bookings-chart-header {
    background: linear-gradient(135deg, var(--primary-600), var(--primary-700));
    border: none;
}

.categories-chart-container {
    background: linear-gradient(135deg, var(--success-color), var(--success-dark));
    border-radius: 1rem;
    overflow: hidden;
}

.categories-chart-header {
    background: linear-gradient(135deg, var(--success-color), var(--success-dark));
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


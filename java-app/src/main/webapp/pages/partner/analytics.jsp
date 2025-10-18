<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setAttribute("pageTitle", "Analytiques - YOURS");
%>

<%@ include file="../../layouts/header.jsp" %>
<%@ include file="../../layouts/navbar.jsp" %>

<!-- Page Header -->
<section class="py-4" style="background: linear-gradient(135deg, #1e40af 0%, #1e3a8a 50%, #1e293b 100%); margin-top: -80px; padding-top: calc(80px + 3rem) !important; padding-bottom: 3rem !important;">
    <div class="container">
        <h1 class="display-6 fw-bold mb-2" style="color: white;">
            <i class="fas fa-chart-bar me-3"></i>Analytiques & Statistiques
        </h1>
        <p class="mb-0" style="color: rgba(255, 255, 255, 0.9);">
            Analysez vos performances et optimisez votre activité
        </p>
    </div>
</section>

<!-- Analytics Content -->
<div class="container py-5">
    <!-- Key Metrics -->
    <div class="row g-4 mb-5">
        <div class="col-lg-3 col-md-6">
            <div class="card border-0 shadow-sm">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-start mb-2">
                        <small class="text-muted">Taux d'occupation</small>
                        <i class="fas fa-percentage text-primary"></i>
                    </div>
                    <h2 class="h3 fw-bold mb-1">78%</h2>
                    <small class="text-success"><i class="fas fa-arrow-up me-1"></i>+5% vs mois dernier</small>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="card border-0 shadow-sm">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-start mb-2">
                        <small class="text-muted">Revenus moyens</small>
                        <i class="fas fa-chart-line text-success"></i>
                    </div>
                    <h2 class="h3 fw-bold mb-1">485 MAD</h2>
                    <small class="text-success"><i class="fas fa-arrow-up me-1"></i>+12% vs mois dernier</small>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="card border-0 shadow-sm">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-start mb-2">
                        <small class="text-muted">Note client</small>
                        <i class="fas fa-star text-warning"></i>
                    </div>
                    <h2 class="h3 fw-bold mb-1">4.8/5</h2>
                    <small class="text-muted">42 avis</small>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="card border-0 shadow-sm">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-start mb-2">
                        <small class="text-muted">Taux de réponse</small>
                        <i class="fas fa-comments text-info"></i>
                    </div>
                    <h2 class="h3 fw-bold mb-1">95%</h2>
                    <small class="text-success">Excellent</small>
                </div>
            </div>
        </div>
    </div>

    <!-- Charts -->
    <div class="row g-4">
        <div class="col-lg-8">
            <div class="card border-0 shadow-sm">
                <div class="card-header bg-white border-0 py-3">
                    <h5 class="mb-0 fw-bold">Réservations par mois</h5>
                </div>
                <div class="card-body">
                    <canvas id="bookingsChart" height="80"></canvas>
                </div>
            </div>
        </div>
        <div class="col-lg-4">
            <div class="card border-0 shadow-sm">
                <div class="card-header bg-white border-0 py-3">
                    <h5 class="mb-0 fw-bold">Catégories populaires</h5>
                </div>
                <div class="card-body">
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

<%@ include file="../../layouts/footer.jsp" %>


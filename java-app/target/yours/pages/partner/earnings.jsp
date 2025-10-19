<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setAttribute("pageTitle", "Mes Gains - YOURS");
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
                    <i class="fas fa-wallet me-2" style="color: #fbbf24; font-size: 1rem;"></i>
                    <span style="color: white; font-weight: 600; font-size: 0.875rem; letter-spacing: 0.5px;">MES GAINS</span>
                </div>
                
                <!-- Main Title -->
                <h1 class="display-2 fw-bold mb-4" style="color: white; text-shadow: 0 4px 20px rgba(0,0,0,0.3); letter-spacing: -0.03em; line-height: 1.1;">
                    Mes <span style="background: linear-gradient(135deg, #fbbf24, #f59e0b); background-clip: text; -webkit-background-clip: text; -webkit-text-fill-color: transparent;">Gains</span>
                </h1>
                
                <!-- Subtitle -->
                <div class="mb-4" style="max-width: 700px; margin: 0 auto;">
                    <p class="lead mb-2" style="color: rgba(255, 255, 255, 0.95); font-size: 1.375rem; font-weight: 400; line-height: 1.6; letter-spacing: -0.01em;">
                        Suivez vos revenus et transactions
                    </p>
                    <p class="mb-0" style="color: rgba(255, 255, 255, 0.8); font-size: 1.1rem; font-weight: 300; line-height: 1.7;">
                        Analysez vos revenus • Suivez les paiements • Optimisez vos prix
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

<!-- Earnings Content -->
<div class="container py-5">
    
    <!-- Summary Cards -->
    <div class="row g-4 mb-5">
        <div class="col-lg-3 col-md-6">
            <div class="card border-0 shadow-sm" style="background: linear-gradient(135deg, #10b981, #059669);">
                <div class="card-body text-white">
                    <div class="d-flex justify-content-between align-items-start mb-3">
                        <div>
                            <p class="mb-1 opacity-75">Revenus Totaux</p>
                            <h2 class="h3 mb-0 fw-bold" id="totalEarnings">0 MAD</h2>
                        </div>
                        <div class="icon-box-lg bg-white bg-opacity-25">
                            <i class="fas fa-coins"></i>
                        </div>
                    </div>
                    <small class="opacity-75">
                        <i class="fas fa-arrow-up me-1"></i>+23% ce mois
                    </small>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="card border-0 shadow-sm">
                <div class="card-body">
                    <p class="text-muted mb-1">Ce Mois</p>
                    <h3 class="h4 mb-3 fw-bold text-primary" id="monthlyEarnings">0 MAD</h3>
                    <small class="text-success">
                        <i class="fas fa-check-circle me-1"></i>En progression
                    </small>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="card border-0 shadow-sm">
                <div class="card-body">
                    <p class="text-muted mb-1">En Attente</p>
                    <h3 class="h4 mb-3 fw-bold text-warning" id="pendingEarnings">0 MAD</h3>
                    <small class="text-muted">
                        <i class="fas fa-clock me-1"></i>À recevoir
                    </small>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="card border-0 shadow-sm">
                <div class="card-body">
                    <p class="text-muted mb-1">Revenus Moyens</p>
                    <h3 class="h4 mb-3 fw-bold text-info" id="averageEarnings">0 MAD</h3>
                    <small class="text-muted">
                        <i class="fas fa-chart-line me-1"></i>Par location
                    </small>
                </div>
            </div>
        </div>
    </div>

    <div class="row g-4">
        <!-- Earnings Chart -->
        <div class="col-lg-8">
            <div class="card border-0 shadow-sm">
                <div class="card-header bg-white border-0 py-3">
                    <div class="d-flex justify-content-between align-items-center">
                        <h5 class="mb-0 fw-bold">
                            <i class="fas fa-chart-line me-2 text-primary"></i>Évolution des Revenus
                        </h5>
                        <select class="form-select form-select-sm w-auto" id="chartPeriod">
                            <option value="week">7 derniers jours</option>
                            <option value="month" selected>30 derniers jours</option>
                            <option value="year">12 derniers mois</option>
                        </select>
                    </div>
                </div>
                <div class="card-body">
                    <canvas id="earningsChart" height="80"></canvas>
                </div>
            </div>

            <!-- Recent Transactions -->
            <div class="card border-0 shadow-sm mt-4">
                <div class="card-header bg-white border-0 py-3">
                    <h5 class="mb-0 fw-bold">
                        <i class="fas fa-receipt me-2 text-success"></i>Transactions Récentes
                    </h5>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-hover mb-0">
                            <thead class="bg-light">
                                <tr>
                                    <th class="border-0">Date</th>
                                    <th class="border-0">Client</th>
                                    <th class="border-0">Matériel</th>
                                    <th class="border-0">Montant</th>
                                    <th class="border-0">Statut</th>
                                </tr>
                            </thead>
                            <tbody id="transactionsTable">
                                <tr>
                                    <td colspan="5" class="text-center py-4 text-muted">
                                        <i class="fas fa-spinner fa-spin me-2"></i>Chargement...
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <!-- Side Panel -->
        <div class="col-lg-4">
            <!-- Payment Method -->
            <div class="card border-0 shadow-sm mb-4">
                <div class="card-header bg-white border-0 py-3">
                    <h5 class="mb-0 fw-bold">
                        <i class="fas fa-credit-card me-2 text-primary"></i>Méthode de Paiement
                    </h5>
                </div>
                <div class="card-body">
                    <div class="alert alert-info mb-3">
                        <i class="fas fa-info-circle me-2"></i>
                        <small>Configurez votre méthode de paiement pour recevoir vos gains</small>
                    </div>
                    <button class="btn btn-primary w-100">
                        <i class="fas fa-plus-circle me-2"></i>Ajouter une méthode
                    </button>
                </div>
            </div>

            <!-- Top Equipment -->
            <div class="card border-0 shadow-sm">
                <div class="card-header bg-white border-0 py-3">
                    <h5 class="mb-0 fw-bold">
                        <i class="fas fa-trophy me-2 text-warning"></i>Matériel le plus rentable
                    </h5>
                </div>
                <div class="card-body">
                    <div class="mb-3 pb-3 border-bottom" id="topEquipmentList">
                        <div class="d-flex justify-content-between align-items-center mb-2">
                            <span class="fw-medium">Canon EOS R5</span>
                            <span class="badge bg-success">2,880 MAD</span>
                        </div>
                        <div class="progress" style="height: 6px;">
                            <div class="progress-bar bg-success" style="width: 85%"></div>
                        </div>
                        <small class="text-muted">12 locations</small>
                    </div>
                    <div class="mb-3 pb-3 border-bottom">
                        <div class="d-flex justify-content-between align-items-center mb-2">
                            <span class="fw-medium">Sony A7 III</span>
                            <span class="badge bg-primary">2,625 MAD</span>
                        </div>
                        <div class="progress" style="height: 6px;">
                            <div class="progress-bar bg-primary" style="width: 75%"></div>
                        </div>
                        <small class="text-muted">15 locations</small>
                    </div>
                    <div>
                        <div class="d-flex justify-content-between align-items-center mb-2">
                            <span class="fw-medium">MacBook Pro 16"</span>
                            <span class="badge bg-info">1,200 MAD</span>
                        </div>
                        <div class="progress" style="height: 6px;">
                            <div class="progress-bar bg-info" style="width: 45%"></div>
                        </div>
                        <small class="text-muted">8 locations</small>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<style>
.icon-box-lg {
    width: 56px;
    height: 56px;
    border-radius: 0.875rem;
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 1.5rem;
}
</style>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
let earningsChart;

document.addEventListener('DOMContentLoaded', function() {
    loadEarningsData();
    initializeChart();
    loadTransactions();
    
    document.getElementById('chartPeriod').addEventListener('change', function() {
        updateChart(this.value);
    });
});

function loadEarningsData() {
    // Mock data - replace with actual API call
    document.getElementById('totalEarnings').textContent = '12,450 MAD';
    document.getElementById('monthlyEarnings').textContent = '3,890 MAD';
    document.getElementById('pendingEarnings').textContent = '1,250 MAD';
    document.getElementById('averageEarnings').textContent = '485 MAD';
}

function initializeChart() {
    const ctx = document.getElementById('earningsChart').getContext('2d');
    earningsChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: ['Sem 1', 'Sem 2', 'Sem 3', 'Sem 4'],
            datasets: [{
                label: 'Revenus (MAD)',
                data: [850, 1200, 980, 1450],
                borderColor: '#10b981',
                backgroundColor: 'rgba(16, 185, 129, 0.1)',
                borderWidth: 3,
                fill: true,
                tension: 0.4
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
                        callback: function(value) {
                            return value + ' MAD';
                        }
                    }
                }
            }
        }
    });
}

function updateChart(period) {
    // Update chart data based on period
    console.log('Updating chart for period:', period);
}

function loadTransactions() {
    const transactions = [
        { date: '2024-01-20', client: 'Ahmed Ben Ali', equipment: 'Canon EOS R5', amount: 1200, status: 'completed' },
        { date: '2024-01-19', client: 'Sara Bennani', equipment: 'MacBook Pro', amount: 750, status: 'completed' },
        { date: '2024-01-18', client: 'Omar Khalil', equipment: 'Sony A7 III', amount: 875, status: 'pending' }
    ];
    
    const tableBody = document.getElementById('transactionsTable');
    tableBody.innerHTML = transactions.map(t => {
        const statusClass = t.status === 'completed' ? 'bg-success' : 'bg-warning';
        const statusText = t.status === 'completed' ? 'Payé' : 'En attente';
        return '<tr>' +
            '<td>' + new Date(t.date).toLocaleDateString('fr-FR') + '</td>' +
            '<td class="fw-medium">' + t.client + '</td>' +
            '<td>' + t.equipment + '</td>' +
            '<td class="fw-bold text-success">' + t.amount + ' MAD</td>' +
            '<td>' +
                '<span class="badge ' + statusClass + '">' +
                    statusText +
                '</span>' +
            '</td>' +
        '</tr>';
    }).join('');
}
</script>

<%@ include file="../../layouts/footer.jsp" %>


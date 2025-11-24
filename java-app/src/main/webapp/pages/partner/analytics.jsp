<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setAttribute("pageTitle", "Analytiques - YOURS");
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
<div class="container py-5">
    <!-- Key Metrics -->
    <div class="row g-4 mb-4">
        <div class="col-lg-3 col-md-6">
            <div class="card border-0 shadow-sm h-100 revenue-metric-container">
                <div class="card-header revenue-metric-header border-0 py-3">
                    <div class="d-flex align-items-center">
                        <div class="metric-icon me-3">
                            <i class="fas fa-dollar-sign"></i>
                        </div>
                        <div>
                            <h6 class="mb-0 fw-bold text-white">Revenus moyens</h6>
                        </div>
                    </div>
                </div>
                <div class="card-body p-4" style="background: linear-gradient(135deg, var(--gray-50) 0%, var(--white) 100%);">
                    <div class="text-center">
                        <h2 class="h3 fw-bold mb-2 text-success">485 MAD</h2>
                        <small class="text-muted"><i class="fas fa-arrow-up me-1"></i>+12% vs mois dernier</small>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="card border-0 shadow-sm h-100 equipment-metric-container">
                <div class="card-header equipment-metric-header border-0 py-3">
                    <div class="d-flex align-items-center">
                        <div class="metric-icon me-3">
                            <i class="fas fa-box"></i>
                        </div>
                        <div>
                            <h6 class="mb-0 fw-bold text-white">Taux d'occupation</h6>
                        </div>
                    </div>
                </div>
                <div class="card-body p-4" style="background: linear-gradient(135deg, var(--gray-50) 0%, var(--white) 100%);">
                    <div class="text-center">
                        <h2 class="h3 fw-bold mb-2 text-primary">78%</h2>
                        <small class="text-muted"><i class="fas fa-arrow-up me-1"></i>+5% vs mois dernier</small>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="card border-0 shadow-sm h-100 bookings-metric-container">
                <div class="card-header bookings-metric-header border-0 py-3">
                    <div class="d-flex align-items-center">
                        <div class="metric-icon me-3">
                            <i class="fas fa-calendar-alt"></i>
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
            <div class="card border-0 shadow-sm h-100 rating-metric-container">
                <div class="card-header rating-metric-header border-0 py-3">
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
                        <h2 class="h3 fw-bold mb-2" style="color: #8b5cf6;">95%</h2>
                        <small class="text-muted">Excellent</small>
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
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <h5 class="mb-1 fw-bold text-white">
                                <i class="fas fa-chart-line me-2" style="color: var(--accent-light);"></i>Réservations par mois
                            </h5>
                            <p class="mb-0 text-white-50 small">Évolution des réservations et revenus sur 12 mois</p>
                        </div>
                        <div class="text-end">
                            <div class="d-flex align-items-center mb-1">
                                <div class="chart-legend-item me-3">
                                    <div class="legend-color" style="background: #3b82f6;"></div>
                                    <span class="text-white-50 small">Réservations</span>
                                </div>
                                <div class="chart-legend-item">
                                    <div class="legend-color" style="background: #10b981;"></div>
                                    <span class="text-white-50 small">Revenus</span>
                                </div>
                            </div>
                            <small class="text-white-50">Données en temps réel</small>
                        </div>
                    </div>
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
                    <div class="chart-container-small">
                        <canvas id="categoriesChart" height="280"></canvas>
                    </div>
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
        type: 'line',
        data: {
            labels: ['Jan', 'Fév', 'Mar', 'Avr', 'Mai', 'Juin', 'Juil', 'Août', 'Sep', 'Oct', 'Nov', 'Déc'],
            datasets: [{
                label: 'Réservations',
                data: [45, 52, 38, 67, 58, 72, 89, 95, 78, 65, 48, 42],
                borderColor: '#3b82f6',
                backgroundColor: 'rgba(59, 130, 246, 0.1)',
                borderWidth: 3,
                fill: true,
                tension: 0.4,
                pointBackgroundColor: '#3b82f6',
                pointBorderColor: '#ffffff',
                pointBorderWidth: 2,
                pointRadius: 6,
                pointHoverRadius: 8
            }, {
                label: 'Revenus (K MAD)',
                data: [12.5, 14.2, 10.8, 18.5, 16.2, 20.1, 24.8, 26.5, 21.8, 18.2, 13.5, 11.8],
                borderColor: '#10b981',
                backgroundColor: 'rgba(16, 185, 129, 0.1)',
                borderWidth: 3,
                fill: true,
                tension: 0.4,
                pointBackgroundColor: '#10b981',
                pointBorderColor: '#ffffff',
                pointBorderWidth: 2,
                pointRadius: 6,
                pointHoverRadius: 8,
                yAxisID: 'y1'
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: true,
            interaction: {
                mode: 'index',
                intersect: false,
            },
            plugins: {
                legend: {
                    position: 'top',
                    labels: {
                        usePointStyle: true,
                        padding: 20,
                        font: {
                            size: 12,
                            weight: '500'
                        }
                    }
                },
                tooltip: {
                    backgroundColor: 'rgba(0, 0, 0, 0.8)',
                    titleColor: '#ffffff',
                    bodyColor: '#ffffff',
                    borderColor: '#3b82f6',
                    borderWidth: 1,
                    cornerRadius: 8,
                    displayColors: true,
                    callbacks: {
                        title: function(context) {
                            return `Mois: ${context[0].label}`;
                        },
                        label: function(context) {
                            if (context.datasetIndex === 0) {
                                return `Réservations: ${context.parsed.y}`;
                            } else {
                                return `Revenus: ${context.parsed.y}K MAD`;
                            }
                        },
                        footer: function(context) {
                            const reservations = context.find(item => item.datasetIndex === 0)?.parsed.y || 0;
                            const revenue = context.find(item => item.datasetIndex === 1)?.parsed.y || 0;
                            const avgRevenue = reservations > 0 ? (revenue * 1000 / reservations).toFixed(0) : 0;
                            return `Revenu moyen: ${avgRevenue} MAD/réservation`;
                        }
                    }
                }
            },
            scales: {
                x: {
                    grid: {
                        display: false
                    },
                    ticks: {
                        font: {
                            size: 11,
                            weight: '500'
                        },
                        color: '#6b7280'
                    }
                },
                y: {
                    type: 'linear',
                    display: true,
                    position: 'left',
                    title: {
                        display: true,
                        text: 'Nombre de réservations',
                        color: '#3b82f6',
                        font: {
                            size: 12,
                            weight: '600'
                        }
                    },
                    grid: {
                        color: 'rgba(107, 114, 128, 0.1)'
                    },
                    ticks: {
                        font: {
                            size: 11,
                            weight: '500'
                        },
                        color: '#6b7280'
                    }
                },
                y1: {
                    type: 'linear',
                    display: true,
                    position: 'right',
                    title: {
                        display: true,
                        text: 'Revenus (K MAD)',
                        color: '#10b981',
                        font: {
                            size: 12,
                            weight: '600'
                        }
                    },
                    grid: {
                        drawOnChartArea: false,
                    },
                    ticks: {
                        font: {
                            size: 11,
                            weight: '500'
                        },
                        color: '#6b7280'
                    }
                }
            }
        }
    });
}

function initCategoriesChart() {
    const ctx = document.getElementById('categoriesChart').getContext('2d');
    new Chart(ctx, {
        type: 'doughnut',
        data: {
            labels: ['Photographie', 'Vidéo', 'Audio', 'Gaming', 'Informatique', 'Éclairage'],
            datasets: [{
                data: [28, 22, 18, 12, 15, 5],
                backgroundColor: [
                    '#10b981', // Green for Photographie
                    '#3b82f6', // Blue for Vidéo
                    '#f59e0b', // Orange for Audio
                    '#8b5cf6', // Purple for Gaming
                    '#ef4444', // Red for Informatique
                    '#fbbf24'  // Yellow for Éclairage
                ],
                borderWidth: 2,
                borderColor: '#ffffff'
            }]
        },
        options: {
            responsive: true,
            maintainAspectRatio: true,
            cutout: '75%',
            plugins: {
                legend: {
                    position: 'bottom',
                    labels: {
                        padding: 15,
                        usePointStyle: true,
                        font: {
                            size: 11
                        }
                    }
                },
                tooltip: {
                    callbacks: {
                        label: function(context) {
                            const label = context.label || '';
                            const value = context.parsed;
                            const total = context.dataset.data.reduce((a, b) => a + b, 0);
                            const percentage = ((value / total) * 100).toFixed(1);
                            return `${label}: ${value}% (${percentage}%)`;
                        }
                    }
                }
            }
        }
    });
}
</script>

<style>
/* Analytics Page Container Styles - Matching Dashboard */
.revenue-metric-container {
    background: linear-gradient(135deg, var(--success-color), var(--success-dark));
    border-radius: 1rem;
    overflow: hidden;
}

.revenue-metric-header {
    background: linear-gradient(135deg, var(--success-color), var(--success-dark));
    border: none;
}

.equipment-metric-container {
    background: linear-gradient(135deg, var(--primary-600), var(--primary-700));
    border-radius: 1rem;
    overflow: hidden;
}

.equipment-metric-header {
    background: linear-gradient(135deg, var(--primary-600), var(--primary-700));
    border: none;
}

.bookings-metric-container {
    background: linear-gradient(135deg, var(--warning-color), #d97706);
    border-radius: 1rem;
    overflow: hidden;
}

.bookings-metric-header {
    background: linear-gradient(135deg, var(--warning-color), #d97706);
    border: none;
}

.rating-metric-container {
    background: linear-gradient(135deg, #8b5cf6, #7c3aed);
    border-radius: 1rem;
    overflow: hidden;
}

.rating-metric-header {
    background: linear-gradient(135deg, #8b5cf6, #7c3aed);
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

/* Chart Legend Styles */
.chart-legend-item {
    display: flex;
    align-items: center;
    gap: 8px;
}

.legend-color {
    width: 12px;
    height: 12px;
    border-radius: 50%;
    border: 2px solid rgba(255, 255, 255, 0.3);
}

/* Small Chart Container */
.chart-container-small {
    max-width: 320px;
    max-height: 320px;
    margin: 0 auto;
    display: flex;
    justify-content: center;
    align-items: center;
}

.chart-container-small canvas {
    max-width: 280px !important;
    max-height: 280px !important;
}
</style>

<%@ include file="../../layouts/footer.jsp" %>


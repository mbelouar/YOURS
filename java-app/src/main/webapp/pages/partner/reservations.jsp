<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setAttribute("pageTitle", "Réservations - YOURS");
%>

<%@ include file="../../layouts/header.jsp" %>
<%@ include file="../../layouts/navbar.jsp" %>

<style>
/* Reservations Page Styling */
.reservations-container {
    background: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%);
    min-height: 100vh;
}

/* Status Filter Cards */
.status-filter-card {
    background: white !important;
    border: 2px solid transparent !important;
    border-radius: 1rem !important;
    box-shadow: 0 4px 20px -2px rgba(0, 0, 0, 0.08), 0 2px 8px -2px rgba(0, 0, 0, 0.04) !important;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1) !important;
    cursor: pointer !important;
    position: relative !important;
    overflow: hidden !important;
}

.status-filter-card::before {
    content: '' !important;
    position: absolute !important;
    top: 0 !important;
    left: 0 !important;
    right: 0 !important;
    bottom: 0 !important;
    background: linear-gradient(135deg, rgba(37, 99, 235, 0.05), rgba(29, 78, 216, 0.05)) !important;
    opacity: 0 !important;
    transition: opacity 0.3s ease !important;
}

.status-filter-card:hover::before {
    opacity: 1 !important;
}

.status-filter-card:hover {
    transform: translateY(-4px) !important;
    box-shadow: 0 12px 40px -8px rgba(37, 99, 235, 0.2), 0 4px 20px -4px rgba(37, 99, 235, 0.1) !important;
}

.status-filter-card.active {
    border-color: var(--primary-500) !important;
    background: linear-gradient(135deg, rgba(37, 99, 235, 0.08), rgba(29, 78, 216, 0.08)) !important;
    box-shadow: 0 8px 30px -6px rgba(37, 99, 235, 0.3), 0 4px 20px -4px rgba(37, 99, 235, 0.15) !important;
}

.status-icon {
    width: 56px !important;
    height: 56px !important;
    border-radius: 1rem !important;
    display: flex !important;
    align-items: center !important;
    justify-content: center !important;
    font-size: 1.5rem !important;
    transition: all 0.3s ease !important;
    position: relative !important;
    z-index: 2 !important;
}

.status-count {
    font-size: 2rem !important;
    font-weight: 800 !important;
    line-height: 1 !important;
    margin-bottom: 0.25rem !important;
    position: relative !important;
    z-index: 2 !important;
}

.status-label {
    font-size: 0.875rem !important;
    font-weight: 600 !important;
    text-transform: uppercase !important;
    letter-spacing: 0.5px !important;
    position: relative !important;
    z-index: 2 !important;
}

/* Search Section */
.search-section {
    background: linear-gradient(135deg, #ffffff 0%, #f8fafc 100%) !important;
    border-radius: 1.25rem !important;
    box-shadow: 0 4px 20px -2px rgba(0, 0, 0, 0.08), 0 2px 8px -2px rgba(0, 0, 0, 0.04) !important;
    border: 1px solid rgba(226, 232, 240, 0.8) !important;
    padding: 1.5rem !important;
    margin-bottom: 2rem !important;
}

.search-input-group {
    position: relative !important;
}

.search-input-group .form-control {
    border: 2px solid var(--gray-200) !important;
    border-radius: 0.875rem !important;
    padding: 0.875rem 1rem 0.875rem 3rem !important;
    font-size: 0.9375rem !important;
    transition: all 0.3s ease !important;
    background: white !important;
    height: 52px !important;
}

.search-input-group .form-control:focus {
    border-color: var(--primary-500) !important;
    box-shadow: 0 0 0 4px rgba(37, 99, 235, 0.1) !important;
    outline: none !important;
}

.search-input-group .search-icon {
    position: absolute !important;
    left: 1rem !important;
    top: 50% !important;
    transform: translateY(-50%) !important;
    color: var(--gray-400) !important;
    font-size: 1rem !important;
    z-index: 3 !important;
}

/* Reservations Table */
.reservations-table-container {
    background: #ffffff !important;
    background-color: #ffffff !important;
    border-radius: 1.25rem !important;
    box-shadow: 0 4px 20px -2px rgba(0, 0, 0, 0.08), 0 2px 8px -2px rgba(0, 0, 0, 0.04) !important;
    border: 1px solid rgba(226, 232, 240, 0.8) !important;
    overflow: hidden !important;
}

.reservations-table-container * {
    background: transparent !important;
}

.reservations-table-container .table-responsive {
    background: #ffffff !important;
    background-color: #ffffff !important;
}

.table-modern {
    margin-bottom: 0 !important;
    background: #ffffff !important;
    background-color: #ffffff !important;
}

.table-modern thead {
    background: linear-gradient(135deg, var(--primary-50), var(--primary-100)) !important;
}

.table-modern tbody {
    background: #ffffff !important;
    background-color: #ffffff !important;
}

.table-modern tbody tr {
    background: #ffffff !important;
    background-color: #ffffff !important;
}

.table-modern tbody tr:hover {
    background: linear-gradient(135deg, rgba(37, 99, 235, 0.02), rgba(29, 78, 216, 0.02)) !important;
}

/* Status column - single line display */
.table-modern th:nth-child(8),
.table-modern td:nth-child(8) {
    white-space: nowrap !important;
    overflow: hidden !important;
    text-overflow: ellipsis !important;
    max-width: 180px !important;
}

/* Duration column - ensure text visibility */
.table-modern td:nth-child(6) {
    color: #1f2937 !important;
    font-weight: 600 !important;
    font-size: 1rem !important;
    white-space: nowrap !important;
    max-width: 120px !important;
}

.table-modern td:nth-child(6) div {
    color: #1f2937 !important;
    font-weight: 400 !important;
    font-size: 1rem !important;
}

.table-modern thead th {
    background: linear-gradient(135deg, var(--primary-50), var(--primary-100)) !important;
    border: none !important;
    padding: 1.25rem 1rem !important;
    font-weight: 700 !important;
    font-size: 0.875rem !important;
    text-transform: uppercase !important;
    letter-spacing: 0.5px !important;
    color: var(--primary-700) !important;
    position: relative !important;
}

.table-modern thead th::after {
    content: '' !important;
    position: absolute !important;
    bottom: 0 !important;
    left: 0 !important;
    right: 0 !important;
    height: 2px !important;
    background: linear-gradient(90deg, var(--primary-500), var(--primary-600)) !important;
}

.table-modern tbody td {
    padding: 1.25rem 1rem !important;
    border: none !important;
    border-bottom: 1px solid var(--gray-100) !important;
    vertical-align: middle !important;
    font-size: 0.9375rem !important;
}

.table-modern tbody tr:hover {
    background: linear-gradient(135deg, rgba(37, 99, 235, 0.02), rgba(29, 78, 216, 0.02)) !important;
}

/* Status Badges */
.status-badge {
    padding: 0.5rem 1rem !important;
    border-radius: 0.75rem !important;
    font-size: 0.75rem !important;
    font-weight: 700 !important;
    text-transform: uppercase !important;
    letter-spacing: 0.5px !important;
    border: none !important;
}

.status-active {
    background: linear-gradient(135deg, #10b981, #059669) !important;
    color: white !important;
    box-shadow: 0 4px 12px rgba(16, 185, 129, 0.3) !important;
}

.status-pending {
    background: linear-gradient(135deg, #f59e0b, #d97706) !important;
    color: white !important;
    box-shadow: 0 4px 12px rgba(245, 158, 11, 0.3) !important;
}

.status-completed {
    background: linear-gradient(135deg, #6b7280, #4b5563) !important;
    color: white !important;
    box-shadow: 0 4px 12px rgba(107, 114, 128, 0.3) !important;
}

.status-cancelled {
    background: linear-gradient(135deg, #ef4444, #dc2626) !important;
    color: white !important;
    box-shadow: 0 4px 12px rgba(239, 68, 68, 0.3) !important;
}

/* Action Buttons */
.action-btn {
    padding: 0.5rem 1rem !important;
    border-radius: 0.5rem !important;
    font-size: 0.875rem !important;
    font-weight: 600 !important;
    transition: all 0.3s ease !important;
    border: 2px solid transparent !important;
}

.action-btn-primary {
    background: linear-gradient(135deg, var(--primary-600), var(--primary-700)) !important;
    color: white !important;
    box-shadow: 0 4px 12px rgba(37, 99, 235, 0.3) !important;
}

.action-btn-primary:hover {
    background: linear-gradient(135deg, var(--primary-700), var(--primary-800)) !important;
    transform: translateY(-2px) !important;
    box-shadow: 0 8px 25px rgba(37, 99, 235, 0.4) !important;
    color: white !important;
}

.action-btn-outline {
    background: white !important;
    border-color: var(--gray-300) !important;
    color: var(--gray-600) !important;
}

.action-btn-outline:hover {
    background: var(--gray-50) !important;
    border-color: var(--gray-400) !important;
    color: var(--gray-700) !important;
    transform: translateY(-1px) !important;
}

/* Empty State */
.empty-state {
    text-align: center !important;
    padding: 4rem 2rem !important;
    color: var(--gray-500) !important;
}

.empty-state i {
    font-size: 4rem !important;
    margin-bottom: 1.5rem !important;
    opacity: 0.3 !important;
}

.empty-state h4 {
    font-size: 1.25rem !important;
    font-weight: 600 !important;
    margin-bottom: 0.5rem !important;
    color: var(--gray-600) !important;
}

.empty-state p {
    font-size: 0.9375rem !important;
    margin-bottom: 0 !important;
}

/* Modal Styling */
.modal-content-modern {
    border: none !important;
    border-radius: 1.5rem !important;
    box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.25), 0 0 0 1px rgba(255, 255, 255, 0.05) !important;
    backdrop-filter: blur(20px) !important;
    background: rgba(255, 255, 255, 0.95) !important;
    overflow: hidden !important;
}

.modal-header-modern {
    background: linear-gradient(135deg, var(--primary-600), var(--primary-700)) !important;
    border: none !important;
    padding: 1.5rem !important;
    position: relative !important;
    overflow: hidden !important;
}

.modal-header-modern::before {
    content: '' !important;
    position: absolute !important;
    top: -50% !important;
    left: -50% !important;
    width: 200% !important;
    height: 200% !important;
    background: radial-gradient(circle, rgba(255, 255, 255, 0.1) 0%, transparent 70%) !important;
    animation: shimmer 3s ease-in-out infinite !important;
    pointer-events: none !important;
}

@keyframes shimmer {
    0%, 100% { transform: translateX(-100%) translateY(-100%) rotate(30deg); }
    50% { transform: translateX(100%) translateY(100%) rotate(30deg); }
}

.modal-title-modern {
    color: white !important;
    font-size: 1.5rem !important;
    font-weight: 800 !important;
    margin: 0 !important;
    text-shadow: 0 2px 8px rgba(0, 0, 0, 0.2) !important;
    letter-spacing: -0.025em !important;
}

.modal-body-modern {
    padding: 2rem !important;
    background: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%) !important;
    position: relative !important;
}

.modal-body-modern::before {
    content: '' !important;
    position: absolute !important;
    top: 0 !important;
    left: 0 !important;
    right: 0 !important;
    bottom: 0 !important;
    background: radial-gradient(circle at 80% 20%, rgba(37, 99, 235, 0.05) 0%, transparent 50%) !important;
    pointer-events: none !important;
}

.modal-footer-modern {
    background: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%) !important;
    border: none !important;
    padding: 1.5rem !important;
    border-top: 1px solid rgba(37, 99, 235, 0.1) !important;
    position: relative !important;
}

.modal-footer-modern::before {
    content: '' !important;
    position: absolute !important;
    top: 0 !important;
    left: 0 !important;
    right: 0 !important;
    height: 1px !important;
    background: linear-gradient(90deg, transparent, var(--primary-600), transparent) !important;
}

/* Responsive Design */
@media (max-width: 768px) {
    .status-filter-card {
        margin-bottom: 1rem !important;
    }
    
    .table-modern thead th,
    .table-modern tbody td {
        padding: 0.75rem 0.5rem !important;
        font-size: 0.875rem !important;
    }
    
    .status-count {
        font-size: 1.5rem !important;
    }
    
    .status-icon {
        width: 48px !important;
        height: 48px !important;
        font-size: 1.25rem !important;
    }
}
</style>

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
                    <span style="background: linear-gradient(135deg, #fbbf24, #f59e0b); background-clip: text; -webkit-background-clip: text; -webkit-text-fill-color: transparent;">Réservations</span>
                </h1>
                
                <!-- Subtitle -->
                <div class="mb-4" style="max-width: 700px; margin: 0 auto;">
                    <p class="lead mb-2" style="color: rgba(255, 255, 255, 0.95); font-size: 1.375rem; font-weight: 400; line-height: 1.6; letter-spacing: -0.01em;">
                        Suivez et gérez toutes vos réservations
                    </p>
                    <p class="mb-0" style="color: rgba(255, 255, 255, 0.8); font-size: 1.1rem; font-weight: 300; line-height: 1.7;">
                        Acceptez les demandes • Suivez les locations • Gérez les retours
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
    <!-- Status Filters -->
    <div class="row g-4 mb-5">
        <div class="col-lg-3 col-md-6">
            <div class="status-filter-card active" data-status="all" onclick="filterReservations('all')">
                <div class="card-body d-flex align-items-center p-4">
                    <div class="status-icon bg-primary text-white me-3">
                        <i class="fas fa-list"></i>
                    </div>
                    <div>
                        <div class="status-count text-primary" id="countAll">0</div>
                        <div class="status-label text-muted">Toutes</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="status-filter-card" data-status="active" onclick="filterReservations('active')">
                <div class="card-body d-flex align-items-center p-4">
                    <div class="status-icon bg-success text-white me-3">
                        <i class="fas fa-check-circle"></i>
                    </div>
                    <div>
                        <div class="status-count text-success" id="countActive">0</div>
                        <div class="status-label text-muted">Actives</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="status-filter-card" data-status="pending" onclick="filterReservations('pending')">
                <div class="card-body d-flex align-items-center p-4">
                    <div class="status-icon bg-warning text-white me-3">
                        <i class="fas fa-clock"></i>
                    </div>
                    <div>
                        <div class="status-count text-warning" id="countPending">0</div>
                        <div class="status-label text-muted">En attente</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="status-filter-card" data-status="completed" onclick="filterReservations('completed')">
                <div class="card-body d-flex align-items-center p-4">
                    <div class="status-icon bg-secondary text-white me-3">
                        <i class="fas fa-archive"></i>
                    </div>
                    <div>
                        <div class="status-count text-secondary" id="countCompleted">0</div>
                        <div class="status-label text-muted">Terminées</div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Search Section -->
    <div class="search-section">
        <div class="row align-items-center">
            <div class="col-lg-8">
                <div class="search-input-group">
                    <i class="fas fa-search search-icon"></i>
                    <input type="text" class="form-control" placeholder="Rechercher par client, matériel ou date..." id="searchInput">
                </div>
            </div>
            <div class="col-lg-4 text-lg-end mt-3 mt-lg-0">
                <div class="d-flex align-items-center justify-content-lg-end gap-3">
                    <div class="text-muted">
                        <i class="fas fa-calendar-alt me-2"></i>
                        <span id="totalReservations">0</span> réservations
                    </div>
                    <button class="action-btn action-btn-outline" onclick="exportReservations()">
                        <i class="fas fa-download me-2"></i>Exporter
                    </button>
                </div>
            </div>
        </div>
    </div>

    <!-- Reservations Table -->
    <div class="reservations-table-container" style="background: #ffffff !important; background-color: #ffffff !important;">
        <div class="table-responsive" style="background: #ffffff !important; background-color: #ffffff !important;">
            <table class="table table-modern" style="background: #ffffff !important; background-color: #ffffff !important;">
                <thead>
                    <tr>
                        <th><i class="fas fa-hashtag me-2"></i>ID</th>
                        <th><i class="fas fa-user me-2"></i>Client</th>
                        <th><i class="fas fa-box me-2"></i>Matériel</th>
                        <th><i class="fas fa-calendar-alt me-2"></i>Début</th>
                        <th><i class="fas fa-calendar-check me-2"></i>Fin</th>
                        <th style="width: 120px;"><i class="fas fa-clock me-2"></i>Durée</th>
                        <th><i class="fas fa-dollar-sign me-2"></i>Total</th>
                        <th style="width: 180px;"><i class="fas fa-info-circle me-2"></i>Statut</th>
                        <th><i class="fas fa-cogs me-2"></i>Actions</th>
                    </tr>
                </thead>
                <tbody id="reservationsTable">
                    <tr>
                        <td colspan="9" class="text-center py-5">
                            <div class="spinner-border text-primary" role="status">
                                <span class="visually-hidden">Chargement...</span>
                            </div>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>

<!-- Reservation Detail Modal -->
<div class="modal fade" id="detailModal" tabindex="-1">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content modal-content-modern">
            <div class="modal-header modal-header-modern">
                <h5 class="modal-title modal-title-modern">
                    <i class="fas fa-info-circle me-2"></i>Détails de la réservation
                </h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body modal-body-modern" id="detailModalBody">
                <!-- Details will be loaded here -->
            </div>
            <div class="modal-footer modal-footer-modern">
                <button type="button" class="action-btn action-btn-outline" data-bs-dismiss="modal">
                    <i class="fas fa-times me-2"></i>Fermer
                </button>
            </div>
        </div>
    </div>
</div>

<!-- Accept Reservation Modal -->
<div class="modal fade" id="acceptModal" tabindex="-1">
    <div class="modal-dialog modal-md modal-dialog-centered">
        <div class="modal-content modal-content-modern">
            <div class="modal-header modal-header-modern" style="background: linear-gradient(135deg, var(--primary-600), var(--primary-700)) !important;">
                <h5 class="modal-title modal-title-modern">
                    <i class="fas fa-check-circle me-2"></i>Accepter la réservation
                </h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body modal-body-modern">
                <div class="text-center mb-3">
                    <div class="mb-2">
                        <div class="d-inline-flex align-items-center justify-content-center" style="width: 60px; height: 60px; background: linear-gradient(135deg, #10b981, #059669); border-radius: 50%; box-shadow: 0 6px 20px rgba(16, 185, 129, 0.3);">
                            <i class="fas fa-check" style="font-size: 1.5rem; color: white;"></i>
                        </div>
                    </div>
                    <h5 class="mb-2" style="color: var(--gray-800); font-weight: 600; font-size: 1.1rem;">Confirmer l'acceptation</h5>
                    <p class="text-muted mb-3" style="font-size: 0.9rem; line-height: 1.5;">Êtes-vous sûr de vouloir accepter cette réservation ?</p>
                </div>
                <div class="card border-0" style="background: linear-gradient(135deg, var(--gray-50), var(--gray-100)); border-radius: 0.75rem; box-shadow: 0 3px 15px rgba(0, 0, 0, 0.08);">
                    <div class="card-body p-3">
                        <div class="row">
                            <div class="col-6">
                                <h6 class="text-primary mb-2" style="font-weight: 600; font-size: 0.9rem;"><i class="fas fa-user me-1"></i>Client</h6>
                                <p class="mb-1 fw-semibold" id="acceptClientName" style="color: var(--gray-800); font-size: 0.85rem;">-</p>
                                <p class="text-muted small mb-0" id="acceptClientContact" style="font-size: 0.75rem;">-</p>
                            </div>
                            <div class="col-6">
                                <h6 class="text-primary mb-2" style="font-weight: 600; font-size: 0.9rem;"><i class="fas fa-box me-1"></i>Matériel</h6>
                                <p class="mb-1 fw-semibold" id="acceptEquipment" style="color: var(--gray-800); font-size: 0.85rem;">-</p>
                                <p class="text-muted small mb-0" id="acceptDuration" style="font-size: 0.75rem;">-</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer modal-footer-modern">
                <button type="button" class="action-btn action-btn-outline" data-bs-dismiss="modal">
                    <i class="fas fa-times me-2"></i>Annuler
                </button>
                <button type="button" class="action-btn action-btn-primary" onclick="confirmAcceptReservation()" style="background: linear-gradient(135deg, #10b981, #059669) !important; border-color: #10b981 !important;">
                    <i class="fas fa-check me-2"></i>Accepter
                </button>
            </div>
        </div>
    </div>
</div>

<!-- Decline Reservation Modal -->
<div class="modal fade" id="declineModal" tabindex="-1">
    <div class="modal-dialog modal-md modal-dialog-centered">
        <div class="modal-content modal-content-modern">
            <div class="modal-header modal-header-modern" style="background: linear-gradient(135deg, var(--primary-600), var(--primary-700)) !important;">
                <h5 class="modal-title modal-title-modern">
                    <i class="fas fa-times-circle me-2"></i>Refuser la réservation
                </h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body modal-body-modern">
                <div class="text-center mb-3">
                    <div class="mb-2">
                        <div class="d-inline-flex align-items-center justify-content-center" style="width: 60px; height: 60px; background: linear-gradient(135deg, #ef4444, #dc2626); border-radius: 50%; box-shadow: 0 6px 20px rgba(239, 68, 68, 0.3);">
                            <i class="fas fa-times" style="font-size: 1.5rem; color: white;"></i>
                        </div>
                    </div>
                    <h5 class="mb-2" style="color: var(--gray-800); font-weight: 600; font-size: 1.1rem;">Confirmer le refus</h5>
                    <p class="text-muted mb-3" style="font-size: 0.9rem; line-height: 1.5;">Êtes-vous sûr de vouloir refuser cette réservation ?</p>
                </div>
                <div class="card border-0" style="background: linear-gradient(135deg, var(--gray-50), var(--gray-100)); border-radius: 0.75rem; box-shadow: 0 3px 15px rgba(0, 0, 0, 0.08);">
                    <div class="card-body p-3">
                        <div class="row">
                            <div class="col-6">
                                <h6 class="text-primary mb-2" style="font-weight: 600; font-size: 0.9rem;"><i class="fas fa-user me-1"></i>Client</h6>
                                <p class="mb-1 fw-semibold" id="declineClientName" style="color: var(--gray-800); font-size: 0.85rem;">-</p>
                                <p class="text-muted small mb-0" id="declineClientContact" style="font-size: 0.75rem;">-</p>
                            </div>
                            <div class="col-6">
                                <h6 class="text-primary mb-2" style="font-weight: 600; font-size: 0.9rem;"><i class="fas fa-box me-1"></i>Matériel</h6>
                                <p class="mb-1 fw-semibold" id="declineEquipment" style="color: var(--gray-800); font-size: 0.85rem;">-</p>
                                <p class="text-muted small mb-0" id="declineDuration" style="font-size: 0.75rem;">-</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="alert alert-warning mt-3" style="border-radius: 0.5rem; border: none; background: linear-gradient(135deg, #fef3c7, #fde68a); padding: 0.75rem;">
                    <i class="fas fa-exclamation-triangle me-2" style="color: #d97706; font-size: 0.8rem;"></i>
                    <span style="color: #92400e; font-size: 0.8rem;"><strong>Attention:</strong> Cette action est irréversible.</span>
                </div>
            </div>
            <div class="modal-footer modal-footer-modern">
                <button type="button" class="action-btn action-btn-outline" data-bs-dismiss="modal">
                    <i class="fas fa-times me-2"></i>Annuler
                </button>
                <button type="button" class="action-btn action-btn-primary" onclick="confirmDeclineReservation()" style="background: linear-gradient(135deg, #ef4444, #dc2626) !important; border-color: #ef4444 !important;">
                    <i class="fas fa-times-circle me-2"></i>Refuser
                </button>
            </div>
        </div>
    </div>
</div>


<script>
let currentFilter = 'all';
let detailModal, acceptModal, declineModal;
let currentReservationId = null;

document.addEventListener('DOMContentLoaded', function() {
    detailModal = new bootstrap.Modal(document.getElementById('detailModal'));
    acceptModal = new bootstrap.Modal(document.getElementById('acceptModal'));
    declineModal = new bootstrap.Modal(document.getElementById('declineModal'));
    loadReservations();
    
    document.getElementById('searchInput').addEventListener('input', loadReservations);
});

function loadReservations() {
    // Mock data - replace with actual API call
    const reservations = [
        {
            id: 'RES-001',
            client: { name: 'Ahmed Ben Ali', phone: '+212 6 12 34 56 78', email: 'ahmed@email.com' },
            equipment: 'Canon EOS R5',
            startDate: '2024-01-15',
            endDate: '2024-01-20',
            days: 5,
            pricePerDay: 240,
            totalPrice: 1200,
            status: 'active'
        },
        {
            id: 'RES-002',
            client: { name: 'Sara Bennani', phone: '+212 6 87 65 43 21', email: 'sara@email.com' },
            equipment: 'MacBook Pro 16"',
            startDate: '2024-01-18',
            endDate: '2024-01-22',
            days: 4,
            pricePerDay: 150,
            totalPrice: 600,
            status: 'pending'
        },
        {
            id: 'RES-003',
            client: { name: 'Omar Khalil', phone: '+212 6 11 22 33 44', email: 'omar@email.com' },
            equipment: 'Sony A7 III',
            startDate: '2024-01-10',
            endDate: '2024-01-15',
            days: 5,
            pricePerDay: 175,
            totalPrice: 875,
            status: 'completed'
        }
    ];
    
    updateCounts(reservations);
    displayReservations(filterReservationsByStatus(reservations, currentFilter));
}

function updateCounts(reservations) {
    document.getElementById('countAll').textContent = reservations.length;
    document.getElementById('countActive').textContent = reservations.filter(r => r.status === 'active').length;
    document.getElementById('countPending').textContent = reservations.filter(r => r.status === 'pending').length;
    document.getElementById('countCompleted').textContent = reservations.filter(r => r.status === 'completed').length;
}

function filterReservationsByStatus(reservations, status) {
    if (status === 'all') return reservations;
    return reservations.filter(r => r.status === status);
}

function displayReservations(reservations) {
    const tableBody = document.getElementById('reservationsTable');
    const totalReservations = document.getElementById('totalReservations');
    
    if (reservations.length === 0) {
        tableBody.innerHTML = '<tr>' +
            '<td colspan="9" class="empty-state">' +
                '<i class="fas fa-inbox"></i>' +
                '<h4><i class="fas fa-search me-2"></i>Aucune réservation trouvée</h4>' +
                '<p>Commencez par accepter des demandes de réservation</p>' +
            '</td>' +
        '</tr>';
        totalReservations.textContent = '0';
        return;
    }
    
    tableBody.innerHTML = reservations.map(res => {
        const statusConfig = {
            active: { class: 'status-active', text: 'Actif', icon: 'fas fa-check-circle' },
            pending: { class: 'status-pending', text: 'En attente', icon: 'fas fa-clock' },
            completed: { class: 'status-completed', text: 'Terminé', icon: 'fas fa-archive' },
            cancelled: { class: 'status-cancelled', text: 'Annulé', icon: 'fas fa-times-circle' }
        };
        const status = statusConfig[res.status] || statusConfig.pending;
        
        return '<tr>' +
                '<td class="fw-bold text-primary">' + res.id + '</td>' +
                '<td>' +
                    '<div class="fw-semibold text-gray-900">' + res.client.name + '</div>' +
                    '<small class="text-muted d-block">' + res.client.phone + '</small>' +
                    '<small class="text-muted">' + res.client.email + '</small>' +
                '</td>' +
                '<td>' +
                    '<div class="fw-medium">' + res.equipment + '</div>' +
                    '<small class="text-muted">' + res.pricePerDay + ' MAD/jour</small>' +
                '</td>' +
                '<td>' +
                    '<div class="fw-medium">' + new Date(res.startDate).toLocaleDateString('fr-FR') + '</div>' +
                    '<small class="text-muted">' + new Date(res.startDate).toLocaleTimeString('fr-FR', {hour: '2-digit', minute: '2-digit'}) + '</small>' +
                '</td>' +
                '<td>' +
                    '<div class="fw-medium">' + new Date(res.endDate).toLocaleDateString('fr-FR') + '</div>' +
                    '<small class="text-muted">' + new Date(res.endDate).toLocaleTimeString('fr-FR', {hour: '2-digit', minute: '2-digit'}) + '</small>' +
                '</td>' +
                '<td>' +
                    '<div class="text-dark fs-6">' + res.days + ' jours</div>' +
                '</td>' +
                '<td>' +
                    '<div class="fw-bold text-success fs-6">' + res.totalPrice + ' MAD</div>' +
                '</td>' +
                '<td>' +
                    '<span class="status-badge ' + status.class + '">' +
                        '<i class="' + status.icon + ' me-1"></i>' + status.text +
                    '</span>' +
                '</td>' +
                '<td>' +
                    '<div class="d-flex gap-2">' +
                        '<button class="action-btn action-btn-primary" onclick="showAcceptModal(\'' + res.id + '\')" title="Accepter">' +
                            '<i class="fas fa-check"></i>' +
                        '</button>' +
                        '<button class="action-btn action-btn-outline" onclick="showDeclineModal(\'' + res.id + '\')" title="Refuser">' +
                            '<i class="fas fa-times"></i>' +
                        '</button>' +
                    '</div>' +
                '</td>' +
            '</tr>';
    }).join('');
    
    totalReservations.textContent = reservations.length;
}

function filterReservations(status) {
    currentFilter = status;
    document.querySelectorAll('.status-filter-card').forEach(card => {
        card.classList.remove('active');
    });
    document.querySelector(`[data-status="${status}"]`).classList.add('active');
    loadReservations();
}

function viewReservationDetails(id) {
    // Load reservation details - replace with actual API call
    const detailBody = document.getElementById('detailModalBody');
    detailBody.innerHTML = '<div class="row">' +
            '<div class="col-md-6 mb-4">' +
                '<div class="card border-0 shadow-sm h-100">' +
                    '<div class="card-header bg-primary text-white">' +
                        '<h6 class="mb-0"><i class="fas fa-user me-2"></i>Informations Client</h6>' +
                    '</div>' +
                    '<div class="card-body">' +
                        '<p class="mb-2"><strong>Nom:</strong> Ahmed Ben Ali</p>' +
                        '<p class="mb-2"><strong>Email:</strong> ahmed@email.com</p>' +
                        '<p class="mb-0"><strong>Téléphone:</strong> +212 6 12 34 56 78</p>' +
                    '</div>' +
                '</div>' +
            '</div>' +
            '<div class="col-md-6 mb-4">' +
                '<div class="card border-0 shadow-sm h-100">' +
                    '<div class="card-header bg-success text-white">' +
                        '<h6 class="mb-0"><i class="fas fa-info-circle me-2"></i>Informations Réservation</h6>' +
                    '</div>' +
                    '<div class="card-body">' +
                        '<p class="mb-2"><strong>ID:</strong> ' + id + '</p>' +
                        '<p class="mb-2"><strong>Matériel:</strong> Canon EOS R5</p>' +
                        '<p class="mb-0"><strong>Prix total:</strong> 1,200 MAD</p>' +
                    '</div>' +
                '</div>' +
            '</div>' +
        '</div>';
    detailModal.show();
}

function showAcceptModal(id) {
    currentReservationId = id;
    const reservation = getReservationById(id);
    if (reservation) {
        document.getElementById('acceptClientName').textContent = reservation.client.name;
        document.getElementById('acceptClientContact').textContent = reservation.client.phone + ' • ' + reservation.client.email;
        document.getElementById('acceptEquipment').textContent = reservation.equipment;
        document.getElementById('acceptDuration').textContent = reservation.days + ' jours • ' + reservation.pricePerDay + ' MAD/jour';
        acceptModal.show();
    }
}

function showDeclineModal(id) {
    currentReservationId = id;
    const reservation = getReservationById(id);
    if (reservation) {
        document.getElementById('declineClientName').textContent = reservation.client.name;
        document.getElementById('declineClientContact').textContent = reservation.client.phone + ' • ' + reservation.client.email;
        document.getElementById('declineEquipment').textContent = reservation.equipment;
        document.getElementById('declineDuration').textContent = reservation.days + ' jours • ' + reservation.pricePerDay + ' MAD/jour';
        declineModal.show();
    }
}

function confirmAcceptReservation() {
    if (currentReservationId) {
        // Accept reservation - replace with actual API call
        console.log('Accepting reservation:', currentReservationId);
        acceptModal.hide();
        loadReservations();
        notificationSystem.success('Réservation acceptée avec succès !');
    }
}

function confirmDeclineReservation() {
    if (currentReservationId) {
        // Decline reservation - replace with actual API call
        console.log('Declining reservation:', currentReservationId);
        declineModal.hide();
        loadReservations();
        notificationSystem.success('Réservation refusée avec succès !');
    }
}

function getReservationById(id) {
    // Mock data - replace with actual API call
    const reservations = [
        {
            id: 'RES-001',
            client: { name: 'Ahmed Ben Ali', phone: '+212 6 12 34 56 78', email: 'ahmed@email.com' },
            equipment: 'Canon EOS R5',
            startDate: '2024-01-15',
            endDate: '2024-01-18',
            days: 3,
            pricePerDay: '400 MAD',
            totalPrice: '1,200 MAD',
            status: 'pending'
        },
        {
            id: 'RES-002',
            client: { name: 'Fatima Alami', phone: '+212 6 98 76 54 32', email: 'fatima@email.com' },
            equipment: 'MacBook Pro M3',
            startDate: '2024-01-20',
            endDate: '2024-01-25',
            days: 5,
            pricePerDay: '200 MAD',
            totalPrice: '1,000 MAD',
            status: 'active'
        }
    ];
    return reservations.find(r => r.id === id);
}

// Notification system is now handled by the centralized notification-system.js

function exportReservations() {
    // Export reservations - replace with actual API call
    console.log('Exporting reservations...');
    alert('Fonctionnalité d\'export en cours de développement');
}
</script>

<%@ include file="../../layouts/footer.jsp" %>


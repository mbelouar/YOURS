<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setAttribute("pageTitle", "Réservations - YOURS");
%>

<%@ include file="../../layouts/header.jsp" %>
<%@ include file="../../layouts/navbar.jsp" %>

<!-- Page Header -->
<section class="py-4" style="background: linear-gradient(135deg, #059669 0%, #047857 50%, #065f46 100%); margin-top: -80px; padding-top: calc(80px + 3rem) !important; padding-bottom: 3rem !important;">
    <div class="container">
        <h1 class="display-6 fw-bold mb-2" style="color: white;">
            <i class="fas fa-calendar-check me-3"></i>Gestion des Réservations
        </h1>
        <p class="mb-0" style="color: rgba(255, 255, 255, 0.9);">
            Suivez et gérez toutes vos réservations
        </p>
    </div>
</section>

<!-- Reservations Content -->
<div class="container py-5">
    
    <!-- Status Filters -->
    <div class="row g-3 mb-4">
        <div class="col-lg-3 col-md-6">
            <div class="card border-0 shadow-sm h-100 filter-card active" data-status="all" onclick="filterReservations('all')">
                <div class="card-body d-flex align-items-center">
                    <div class="icon-box bg-primary text-white me-3">
                        <i class="fas fa-list"></i>
                    </div>
                    <div>
                        <h3 class="h4 mb-0 fw-bold" id="countAll">0</h3>
                        <small class="text-muted fw-medium">Toutes</small>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="card border-0 shadow-sm h-100 filter-card" data-status="active" onclick="filterReservations('active')">
                <div class="card-body d-flex align-items-center">
                    <div class="icon-box bg-success text-white me-3">
                        <i class="fas fa-check-circle"></i>
                    </div>
                    <div>
                        <h3 class="h4 mb-0 fw-bold" id="countActive">0</h3>
                        <small class="text-muted fw-medium">Actives</small>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="card border-0 shadow-sm h-100 filter-card" data-status="pending" onclick="filterReservations('pending')">
                <div class="card-body d-flex align-items-center">
                    <div class="icon-box bg-warning text-white me-3">
                        <i class="fas fa-clock"></i>
                    </div>
                    <div>
                        <h3 class="h4 mb-0 fw-bold" id="countPending">0</h3>
                        <small class="text-muted fw-medium">En attente</small>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-3 col-md-6">
            <div class="card border-0 shadow-sm h-100 filter-card" data-status="completed" onclick="filterReservations('completed')">
                <div class="card-body d-flex align-items-center">
                    <div class="icon-box bg-secondary text-white me-3">
                        <i class="fas fa-archive"></i>
                    </div>
                    <div>
                        <h3 class="h4 mb-0 fw-bold" id="countCompleted">0</h3>
                        <small class="text-muted fw-medium">Terminées</small>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Search Bar -->
    <div class="card border-0 shadow-sm mb-4">
        <div class="card-body">
            <div class="input-group input-group-lg">
                <span class="input-group-text bg-white border-end-0">
                    <i class="fas fa-search text-muted"></i>
                </span>
                <input type="text" class="form-control border-start-0" placeholder="Rechercher par client, matériel ou date..." id="searchInput">
            </div>
        </div>
    </div>

    <!-- Reservations Table -->
    <div class="card border-0 shadow-sm">
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover mb-0">
                    <thead class="bg-light">
                        <tr>
                            <th class="border-0 fw-semibold">ID</th>
                            <th class="border-0 fw-semibold">Client</th>
                            <th class="border-0 fw-semibold">Matériel</th>
                            <th class="border-0 fw-semibold">Date début</th>
                            <th class="border-0 fw-semibold">Date fin</th>
                            <th class="border-0 fw-semibold">Durée</th>
                            <th class="border-0 fw-semibold">Prix total</th>
                            <th class="border-0 fw-semibold">Statut</th>
                            <th class="border-0 fw-semibold">Actions</th>
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
</div>

<!-- Reservation Detail Modal -->
<div class="modal fade" id="detailModal" tabindex="-1">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content border-0 shadow-lg">
            <div class="modal-header bg-primary text-white border-0">
                <h5 class="modal-title fw-bold">
                    <i class="fas fa-info-circle me-2"></i>Détails de la réservation
                </h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body p-4" id="detailModalBody">
                <!-- Details will be loaded here -->
            </div>
            <div class="modal-footer border-0 bg-light">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fermer</button>
            </div>
        </div>
    </div>
</div>

<style>
.icon-box {
    width: 48px;
    height: 48px;
    border-radius: 0.75rem;
    display: flex;
    align-items: center;
    justify-content: center;
}

.filter-card {
    cursor: pointer;
    transition: all 0.3s ease;
}

.filter-card:hover {
    transform: translateY(-2px);
    box-shadow: 0 8px 25px -5px rgba(0, 0, 0, 0.15) !important;
}

.filter-card.active {
    border: 2px solid var(--primary-600) !important;
    background: rgba(37, 99, 235, 0.05);
}
</style>

<script>
let currentFilter = 'all';
let detailModal;

document.addEventListener('DOMContentLoaded', function() {
    detailModal = new bootstrap.Modal(document.getElementById('detailModal'));
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
    
    if (reservations.length === 0) {
        tableBody.innerHTML = '<tr>' +
            '<td colspan="9" class="text-center py-5 text-muted">' +
                '<i class="fas fa-inbox fa-3x mb-3 d-block" style="opacity: 0.3;"></i>' +
                'Aucune réservation trouvée' +
            '</td>' +
        '</tr>';
        return;
    }
    
    tableBody.innerHTML = reservations.map(res => {
        const statusConfig = {
            active: { class: 'bg-success', text: 'Actif' },
            pending: { class: 'bg-warning', text: 'En attente' },
            completed: { class: 'bg-secondary', text: 'Terminé' },
            cancelled: { class: 'bg-danger', text: 'Annulé' }
        };
        const status = statusConfig[res.status] || statusConfig.pending;
        
        return '<tr>' +
                '<td class="fw-bold">' + res.id + '</td>' +
                '<td>' +
                    '<div class="fw-medium">' + res.client.name + '</div>' +
                    '<small class="text-muted">' + res.client.phone + '</small>' +
                '</td>' +
                '<td>' + res.equipment + '</td>' +
                '<td>' + new Date(res.startDate).toLocaleDateString('fr-FR') + '</td>' +
                '<td>' + new Date(res.endDate).toLocaleDateString('fr-FR') + '</td>' +
                '<td><span class="badge bg-info">' + res.days + ' jours</span></td>' +
                '<td class="fw-bold text-success">' + res.totalPrice + ' MAD</td>' +
                '<td><span class="badge ' + status.class + '">' + status.text + '</span></td>' +
                '<td>' +
                    '<button class="btn btn-sm btn-outline-primary" onclick="viewReservationDetails(\'' + res.id + '\')">' +
                        '<i class="fas fa-eye"></i>' +
                    '</button>' +
                '</td>' +
            '</tr>';
    }).join('');
}

function filterReservations(status) {
    currentFilter = status;
    document.querySelectorAll('.filter-card').forEach(card => {
        card.classList.remove('active');
    });
    document.querySelector(`[data-status="${status}"]`).classList.add('active');
    loadReservations();
}

function viewReservationDetails(id) {
    // Load reservation details - replace with actual API call
    const detailBody = document.getElementById('detailModalBody');
    detailBody.innerHTML = '<div class="row">' +
            '<div class="col-md-6 mb-3">' +
                '<h6 class="text-muted mb-2">Informations Client</h6>' +
                '<p class="mb-1"><strong>Nom:</strong> Ahmed Ben Ali</p>' +
                '<p class="mb-1"><strong>Email:</strong> ahmed@email.com</p>' +
                '<p class="mb-1"><strong>Téléphone:</strong> +212 6 12 34 56 78</p>' +
            '</div>' +
            '<div class="col-md-6 mb-3">' +
                '<h6 class="text-muted mb-2">Informations Réservation</h6>' +
                '<p class="mb-1"><strong>ID:</strong> ' + id + '</p>' +
                '<p class="mb-1"><strong>Matériel:</strong> Canon EOS R5</p>' +
                '<p class="mb-1"><strong>Prix total:</strong> 1,200 MAD</p>' +
            '</div>' +
        '</div>';
    detailModal.show();
}
</script>

<%@ include file="../../layouts/footer.jsp" %>


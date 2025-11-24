<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setAttribute("pageTitle", "Mes Factures - YOURS");
%>

<%@ include file="../../layouts/header.jsp" %>
<%@ include file="../../layouts/navbar.jsp" %>

<div class="container py-5" style="margin-top: 80px;">
    <!-- Breadcrumb -->
    <nav aria-label="breadcrumb" class="mb-4">
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
                <a href="${pageContext.request.contextPath}/pages/client/dashboard.jsp">
                    <i class="bi bi-house me-1"></i>Tableau de bord
                </a>
            </li>
            <li class="breadcrumb-item active">Mes Factures</li>
        </ol>
    </nav>

    <div class="row">
        <!-- Sidebar Navigation -->
        <div class="col-lg-3 mb-4">
            <div class="sticky-sidebar">
                <!-- Invoice Navigation -->
                <div class="card border-0 shadow-lg favorites-nav-card enhanced-nav">
                    <div class="card-header bg-gradient-primary text-white border-0 py-4">
                        <h5 class="fw-bold mb-0 d-flex align-items-center">
                            <i class="bi bi-receipt-cutoff me-3" style="font-size: 1.2rem;"></i>Factures
                        </h5>
                        <small class="text-white-50 mt-1">Gestion des factures</small>
                    </div>
                    <div class="list-group list-group-flush favorites-nav-list">
                        <a href="#all-invoices" class="list-group-item list-group-item-action favorites-nav-item active" data-section="all-invoices">
                            <div class="d-flex align-items-center">
                                <div class="nav-icon-wrapper me-3">
                                    <i class="bi bi-receipt"></i>
                                </div>
                                <div class="nav-content">
                                    <div class="nav-title">Toutes les factures</div>
                                    <small class="nav-subtitle">Historique complet</small>
                                </div>
                                <i class="bi bi-chevron-right ms-auto nav-arrow"></i>
                            </div>
                        </a>
                        <a href="#paid-invoices" class="list-group-item list-group-item-action favorites-nav-item" data-section="paid-invoices">
                            <div class="d-flex align-items-center">
                                <div class="nav-icon-wrapper me-3">
                                    <i class="bi bi-check-circle"></i>
                                </div>
                                <div class="nav-content">
                                    <div class="nav-title">Factures payées</div>
                                    <small class="nav-subtitle">Paiements confirmés</small>
                                </div>
                                <i class="bi bi-chevron-right ms-auto nav-arrow"></i>
                            </div>
                        </a>
                        <a href="#pending-invoices" class="list-group-item list-group-item-action favorites-nav-item" data-section="pending-invoices">
                            <div class="d-flex align-items-center">
                                <div class="nav-icon-wrapper me-3">
                                    <i class="bi bi-clock-history"></i>
                                </div>
                                <div class="nav-content">
                                    <div class="nav-title">En attente</div>
                                    <small class="nav-subtitle">À payer</small>
                                </div>
                                <i class="bi bi-chevron-right ms-auto nav-arrow"></i>
                            </div>
                        </a>
                    </div>
                </div>

                <!-- Quick Stats Card -->
                <div class="card border-0 shadow-lg mt-4">
                    <div class="card-body p-4">
                        <h6 class="fw-bold mb-3 text-primary">
                            <i class="bi bi-bar-chart me-2"></i>Statistiques 2025
                        </h6>
                        <div class="stat-item mb-3">
                            <div class="d-flex justify-content-between align-items-center">
                                <span class="text-muted">Total payé</span>
                                <span class="badge bg-success" id="totalPaid">0 MAD</span>
                            </div>
                        </div>
                        <div class="stat-item mb-3">
                            <div class="d-flex justify-content-between align-items-center">
                                <span class="text-muted">Nombre de factures</span>
                                <span class="badge bg-primary" id="invoiceCount">0</span>
                            </div>
                        </div>
                        <div class="stat-item">
                            <div class="d-flex justify-content-between align-items-center">
                                <span class="text-muted">Dernière facture</span>
                                <span class="badge bg-info" id="lastInvoice">-</span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Year Filter Card -->
                <div class="card border-0 shadow-lg mt-4">
                    <div class="card-body p-4">
                        <h6 class="fw-bold mb-3 text-primary">
                            <i class="bi bi-calendar me-2"></i>Filtrer par année
                        </h6>
                        <select class="form-select" id="filterYear">
                            <option value="2025" selected>2025</option>
                            <option value="2024">2024</option>
                            <option value="2023">2023</option>
                            <option value="all">Toutes les années</option>
                        </select>
                    </div>
                </div>
            </div>
        </div>

        <!-- Main Content -->
        <div class="col-lg-9">
            <!-- All Invoices Section -->
            <div class="invoice-section" id="all-invoices">
                <div class="card border-0 shadow-lg mb-4 favorites-card">
                    <div class="card-header bg-gradient-light border-0 py-3">
                        <div class="d-flex justify-content-between align-items-center">
                            <h5 class="fw-bold mb-0 d-flex align-items-center">
                                <i class="bi bi-receipt me-3 text-primary" style="font-size: 1.3rem;"></i>Toutes les factures
                                <span class="badge bg-primary ms-3" id="allInvoiceCount">0 factures</span>
                            </h5>
                            <div class="d-flex gap-2">
                                <button class="btn btn-outline-primary btn-sm" onclick="exportInvoices()">
                                    <i class="bi bi-download me-1"></i>Exporter
                                </button>
                            </div>
                        </div>
                    </div>
                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table table-hover mb-0">
                                <thead class="bg-light">
                                    <tr>
                                        <th class="border-0 py-3 px-4">N° Facture</th>
                                        <th class="border-0 py-3">Date</th>
                                        <th class="border-0 py-3">Réservation</th>
                                        <th class="border-0 py-3">Montant</th>
                                        <th class="border-0 py-3">Statut</th>
                                        <th class="border-0 py-3 text-end pe-4">Actions</th>
                                    </tr>
                                </thead>
                                <tbody id="allInvoicesTable">
                                    <!-- Invoices will be loaded here -->
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Paid Invoices Section -->
            <div class="invoice-section" id="paid-invoices" style="display: none;">
                <div class="card border-0 shadow-lg mb-4 favorites-card">
                    <div class="card-header bg-gradient-light border-0 py-3">
                        <div class="d-flex justify-content-between align-items-center">
                            <h5 class="fw-bold mb-0 d-flex align-items-center">
                                <i class="bi bi-check-circle me-3 text-success" style="font-size: 1.3rem;"></i>Factures payées
                                <span class="badge bg-success ms-3" id="paidInvoiceCount">0 factures</span>
                            </h5>
                        </div>
                    </div>
                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table table-hover mb-0">
                                <thead class="bg-light">
                                    <tr>
                                        <th class="border-0 py-3 px-4">N° Facture</th>
                                        <th class="border-0 py-3">Date</th>
                                        <th class="border-0 py-3">Réservation</th>
                                        <th class="border-0 py-3">Montant</th>
                                        <th class="border-0 py-3 text-end pe-4">Actions</th>
                                    </tr>
                                </thead>
                                <tbody id="paidInvoicesTable">
                                    <!-- Paid invoices will be loaded here -->
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Pending Invoices Section -->
            <div class="invoice-section" id="pending-invoices" style="display: none;">
                <div class="card border-0 shadow-lg mb-4 favorites-card">
                    <div class="card-header bg-gradient-light border-0 py-3">
                        <div class="d-flex justify-content-between align-items-center">
                            <h5 class="fw-bold mb-0 d-flex align-items-center">
                                <i class="bi bi-clock-history me-3 text-warning" style="font-size: 1.3rem;"></i>Factures en attente
                                <span class="badge bg-warning ms-3" id="pendingInvoiceCount">0 factures</span>
                            </h5>
                        </div>
                    </div>
                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table table-hover mb-0">
                                <thead class="bg-light">
                                    <tr>
                                        <th class="border-0 py-3 px-4">N° Facture</th>
                                        <th class="border-0 py-3">Date</th>
                                        <th class="border-0 py-3">Réservation</th>
                                        <th class="border-0 py-3">Montant</th>
                                        <th class="border-0 py-3 text-end pe-4">Actions</th>
                                    </tr>
                                </thead>
                                <tbody id="pendingInvoicesTable">
                                    <!-- Pending invoices will be loaded here -->
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Empty State -->
            <div id="emptyState" class="text-center py-5" style="display: none;">
                <div class="empty-state-icon mb-4">
                    <i class="bi bi-receipt text-muted" style="font-size: 5rem; opacity: 0.2;"></i>
                </div>
                <h4 class="text-muted fw-bold">Aucune facture</h4>
                <p class="text-muted mb-4">Vos factures apparaîtront ici après vos réservations</p>
                <a href="${pageContext.request.contextPath}/pages/equipment/list-simple.jsp" class="btn btn-primary">
                    <i class="bi bi-search me-2"></i>Parcourir le matériel
                </a>
            </div>
        </div>
    </div>
</div>

<style>
/* Invoice Styles - Matching Favorites Design */
.sticky-sidebar {
    position: sticky;
    top: 100px;
}

.favorites-nav-card {
    border-radius: 1rem;
    overflow: hidden;
    background-color: white !important;
}

.favorites-nav-card .card-header {
    background: linear-gradient(135deg, #2563eb 0%, #1d4ed8 100%) !important;
}

.favorites-nav-card .card-body {
    background-color: white !important;
}

.bg-gradient-light {
    background: linear-gradient(135deg, #f8fafc 0%, #f1f5f9 100%);
}

.favorites-nav-list .list-group-item {
    border: none !important;
    border-left: none !important;
    padding: 1rem 1.5rem !important;
    transition: all 0.3s ease;
    background-color: white !important;
    position: relative;
}

.favorites-nav-list .list-group-item:hover {
    background-color: #f8fafc !important;
    transform: translateX(5px);
}

.favorites-nav-list .list-group-item:hover::before {
    content: '';
    position: absolute;
    left: 0;
    top: 0;
    bottom: 0;
    width: 3px;
    background-color: #2563eb;
}

.favorites-nav-list .list-group-item.active {
    background: linear-gradient(135deg, #eff6ff 0%, #dbeafe 100%) !important;
}

.favorites-nav-list .list-group-item.active::before {
    content: '';
    position: absolute;
    left: 0;
    top: 0;
    bottom: 0;
    width: 3px;
    background-color: #2563eb;
}

.nav-icon-wrapper {
    width: 40px;
    height: 40px;
    border-radius: 0.5rem;
    background: linear-gradient(135deg, #eff6ff, #dbeafe);
    display: flex;
    align-items: center;
    justify-content: center;
    font-size: 1.2rem;
    color: #2563eb;
}

.favorites-nav-list .list-group-item.active .nav-icon-wrapper {
    background: linear-gradient(135deg, #2563eb, #1d4ed8);
    color: white;
}

.nav-content .nav-title {
    font-weight: 600;
    color: #1e293b;
    font-size: 0.95rem;
}

.nav-content .nav-subtitle {
    color: #64748b;
    font-size: 0.8rem;
}

.nav-arrow {
    color: #cbd5e1;
    transition: all 0.3s ease;
}

.favorites-nav-list .list-group-item:hover .nav-arrow,
.favorites-nav-list .list-group-item.active .nav-arrow {
    color: #2563eb;
    transform: translateX(5px);
}

.stat-item {
    padding: 0.75rem;
    border-radius: 0.5rem;
    background: #f8fafc;
    transition: all 0.3s ease;
}

.stat-item:hover {
    background: #f1f5f9;
    transform: translateY(-2px);
}

.favorites-card {
    border-radius: 1rem;
    overflow: hidden;
    background-color: white !important;
}

.favorites-card .card-header {
    background: linear-gradient(135deg, #f8fafc 0%, #f1f5f9 100%) !important;
}

.favorites-card .card-body {
    background-color: white !important;
}

.table thead th {
    background-color: #f8fafc !important;
    color: #64748b;
    font-weight: 600;
    font-size: 0.875rem;
    text-transform: uppercase;
    letter-spacing: 0.5px;
}

.table-hover tbody tr {
    transition: all 0.3s ease;
    background-color: white;
}

.table-hover tbody tr:hover {
    background-color: #f8fafc;
    transform: scale(1.01);
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.05);
}

.table tbody td {
    vertical-align: middle;
    padding: 1rem;
    color: #1e293b;
}

.invoice-section {
    animation: fadeIn 0.3s ease-in-out;
}

.invoice-section .card {
    background-color: white !important;
}

.invoice-section .card-body {
    background-color: white !important;
}

.bg-light {
    background-color: #f8fafc !important;
}

@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(10px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.btn-group-sm .btn {
    padding: 0.375rem 0.75rem;
    border-radius: 0.375rem;
    transition: all 0.3s ease;
}

.btn-outline-primary {
    border-color: #2563eb;
    color: #2563eb;
}

.btn-outline-primary:hover {
    background-color: #2563eb;
    border-color: #2563eb;
    color: white;
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(37, 99, 235, 0.3);
}

.btn-outline-success {
    border-color: #10b981;
    color: #10b981;
}

.btn-outline-success:hover {
    background-color: #10b981;
    border-color: #10b981;
    color: white;
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(16, 185, 129, 0.3);
}

.btn-outline-secondary {
    border-color: #64748b;
    color: #64748b;
}

.btn-outline-secondary:hover {
    background-color: #64748b;
    border-color: #64748b;
    color: white;
    transform: translateY(-2px);
    box-shadow: 0 4px 12px rgba(100, 116, 139, 0.3);
}

.badge {
    padding: 0.5rem 0.75rem;
    font-weight: 600;
    border-radius: 0.5rem;
}

.empty-state-icon {
    width: 120px;
    height: 120px;
    margin: 0 auto;
    background: linear-gradient(135deg, #f8fafc, #f1f5f9);
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
}

.card {
    background-color: white !important;
}

.card-body {
    background-color: white !important;
}

.list-group {
    background-color: white !important;
}

.list-group-flush {
    background-color: white !important;
}

.list-group-item {
    background-color: white !important;
}

.table {
    background-color: white !important;
}

.table-responsive {
    background-color: white !important;
}

.table tbody,
.table tbody tr,
.table tbody td {
    background-color: white !important;
}

thead,
thead tr,
thead th {
    background-color: #f8fafc !important;
}

.breadcrumb {
    background-color: transparent;
}

.breadcrumb-item a {
    color: #2563eb;
    text-decoration: none;
    transition: all 0.3s ease;
}

.breadcrumb-item a:hover {
    color: #1d4ed8;
}

.breadcrumb-item.active {
    color: #64748b;
}

/* Override any Bootstrap dark mode or global dark styles */
body {
    background-color: #f8fafc !important;
}

.container {
    background-color: transparent !important;
}

.row {
    background-color: transparent !important;
}

.col-lg-9,
.col-lg-3 {
    background-color: transparent !important;
}

/* Ensure all invoice sections have proper backgrounds */
#all-invoices,
#paid-invoices,
#pending-invoices {
    background-color: transparent !important;
}

/* Force white backgrounds on all card elements */
#all-invoices .card,
#paid-invoices .card,
#pending-invoices .card,
.favorites-card,
.invoice-section .card {
    background-color: white !important;
}

#all-invoices .card-body,
#paid-invoices .card-body,
#pending-invoices .card-body,
.favorites-card .card-body {
    background-color: white !important;
}

/* Force white backgrounds on table elements */
#all-invoices .table-responsive,
#paid-invoices .table-responsive,
#pending-invoices .table-responsive {
    background-color: white !important;
}

#all-invoices .table,
#paid-invoices .table,
#pending-invoices .table {
    background-color: white !important;
}

#all-invoices tbody,
#paid-invoices tbody,
#pending-invoices tbody {
    background-color: white !important;
}

#all-invoices tbody tr,
#paid-invoices tbody tr,
#pending-invoices tbody tr {
    background-color: white !important;
}

/* Sidebar cards white backgrounds */
.sticky-sidebar .card {
    background-color: white !important;
}

.sticky-sidebar .card-body {
    background-color: white !important;
}

@media (max-width: 991px) {
    .sticky-sidebar {
        position: relative;
        top: 0;
    }
}
</style>

<script>
// Global variables
let allInvoices = [];
let currentSection = 'all-invoices';

document.addEventListener('DOMContentLoaded', function() {
    // Load invoices
    loadInvoices();
    
    // Navigation handling
    const navItems = document.querySelectorAll('.favorites-nav-item');
    navItems.forEach(item => {
        item.addEventListener('click', function(e) {
            e.preventDefault();
            
            // Update active state
            navItems.forEach(nav => nav.classList.remove('active'));
            this.classList.add('active');
            
            // Show section
            const sectionId = this.getAttribute('data-section');
            showSection(sectionId);
        });
    });
    
    // Year filter
    document.getElementById('filterYear').addEventListener('change', function() {
        loadInvoices();
    });
});

function loadInvoices() {
    // Afficher un indicateur de chargement
    const loadingHtml = '<tr><td colspan="6" class="text-center py-5">' +
        '<div class="spinner-border text-primary" role="status">' +
        '<span class="visually-hidden">Chargement...</span>' +
        '</div>' +
        '<p class="mt-3">Chargement des factures...</p>' +
        '</td></tr>';
    
    // Mettre à jour tous les tableaux avec l'indicateur de chargement
    document.getElementById('allInvoicesTable').innerHTML = loadingHtml;
    document.getElementById('paidInvoicesTable').innerHTML = loadingHtml;
    document.getElementById('pendingInvoicesTable').innerHTML = loadingHtml;
    
    // Récupérer l'année sélectionnée
    const year = document.getElementById('filterYear').value;
    
    // Construire l'URL avec le paramètre d'année si nécessaire
    let url = '${pageContext.request.contextPath}/api/factures';
    if (year && year !== 'all') {
        url += '?annee=' + year;
    }
    
    // Effectuer la requête AJAX pour récupérer les factures
    fetch(url, {
        method: 'GET',
        headers: {
            'Accept': 'application/json',
            'Content-Type': 'application/json'
        },
        credentials: 'same-origin'
    })
    .then(response => {
        if (!response.ok) {
            throw new Error('Erreur lors du chargement des factures');
        }
        return response.json();
    })
    .then(data => {
        // Transformer les données reçues pour correspondre au format attendu
        allInvoices = data.map(facture => ({
            id: 'FAC-' + facture.idFacture,
            date: facture.dateEmission,
            reservation: '#R' + facture.idReservation + ' - ' + facture.nomMateriel,
            amount: facture.montant,
            status: facture.statut.toLowerCase(),
            reservationId: facture.idReservation,
            dateDebut: facture.dateDebut,
            dateFin: facture.dateFin
        }));
        
        // Mettre à jour les statistiques
        updateStats();
        
        // Afficher la section courante
        showSection(currentSection);
    })
    .catch(error => {
        console.error('Erreur:', error);
        // Afficher un message d'erreur
        const errorHtml = '<tr><td colspan="6" class="text-center py-5 text-danger">' +
            '<i class="bi bi-exclamation-triangle me-2"></i>' +
            'Erreur lors du chargement des factures. Veuillez réessayer.' +
            '</td></tr>';
        
        document.getElementById('allInvoicesTable').innerHTML = errorHtml;
        document.getElementById('paidInvoicesTable').innerHTML = errorHtml;
        document.getElementById('pendingInvoicesTable').innerHTML = errorHtml;
        
        // Afficher une notification d'erreur
        YOURS.showToast('Erreur lors du chargement des factures', 'error');
    });
}

function updateStats() {
    // Calculer le total payé
    const totalPaid = allInvoices
        .filter(inv => inv.status === 'payée')
        .reduce((sum, inv) => sum + inv.amount, 0);
    
    // Mettre à jour l'interface utilisateur
    document.getElementById('totalPaid').textContent = YOURS.formatCurrency(totalPaid);
    document.getElementById('invoiceCount').textContent = allInvoices.length;
    
    // Mettre à jour la date de la dernière facture
    if (allInvoices.length > 0) {
        // Trier les factures par date d'émission (du plus récent au plus ancien)
        const sortedInvoices = [...allInvoices].sort((a, b) => 
            new Date(b.date) - new Date(a.date)
        );
        
        const lastDate = new Date(sortedInvoices[0].date);
        const options = { year: 'numeric', month: 'short', day: 'numeric' };
        document.getElementById('lastInvoice').textContent = lastDate.toLocaleDateString('fr-FR', options);
    } else {
        document.getElementById('lastInvoice').textContent = '-';
    }
}

function showSection(sectionId) {
    currentSection = sectionId;
    
    // Hide all sections
    document.querySelectorAll('.invoice-section').forEach(section => {
        section.style.display = 'none';
    });
    
    // Show selected section
    const section = document.getElementById(sectionId);
    if (section) {
        section.style.display = 'block';
    }
    
    // Load appropriate invoices
    let filteredInvoices = [];
    let tableId = '';
    let countId = '';
    
    switch(sectionId) {
        case 'all-invoices':
            filteredInvoices = allInvoices;
            tableId = 'allInvoicesTable';
            countId = 'allInvoiceCount';
            break;
        case 'paid-invoices':
            filteredInvoices = allInvoices.filter(inv => inv.status === 'paid');
            tableId = 'paidInvoicesTable';
            countId = 'paidInvoiceCount';
            break;
        case 'pending-invoices':
            filteredInvoices = allInvoices.filter(inv => inv.status === 'pending');
            tableId = 'pendingInvoicesTable';
            countId = 'pendingInvoiceCount';
            break;
    }
    
    // Update count badge
    document.getElementById(countId).textContent = `${filteredInvoices.length} facture${filteredInvoices.length > 1 ? 's' : ''}`;
    
    // Populate table
    displayInvoices(filteredInvoices, tableId, sectionId);
}

function displayInvoices(invoices, tableId, sectionId) {
    const table = document.getElementById(tableId);
    
    if (invoices.length === 0) {
        table.innerHTML = '<tr><td colspan="6" class="text-center py-5">' +
            '<i class="bi bi-receipt text-muted" style="font-size: 3rem; opacity: 0.2;"></i>' +
            '<p class="text-muted mt-3">Aucune facture trouvée</p>' +
            '</td></tr>';
        return;
    }
    
    const includeStatus = sectionId === 'all-invoices';
    
    table.innerHTML = invoices.map(function(invoice) {
        // Formater la date de la facture
        const invoiceDate = new Date(invoice.date);
        const formattedDate = invoiceDate.toLocaleDateString('fr-FR', {
            year: 'numeric',
            month: 'short',
            day: 'numeric'
        });
        
        // Formater la période de location si disponible
        let periodInfo = '';
        if (invoice.dateDebut && invoice.dateFin) {
            const startDate = new Date(invoice.dateDebut).toLocaleDateString('fr-FR', { day: '2-digit', month: 'short' });
            const endDate = new Date(invoice.dateFin).toLocaleDateString('fr-FR', { day: '2-digit', month: 'short', year: 'numeric' });
            periodInfo = `<div class="small text-muted">${startDate} - ${endDate}</div>`;
        }
        
        // Colonne de statut (uniquement pour la vue "Toutes les factures")
        var statusColumn = '';
        if (includeStatus) {
            statusColumn = '<td>' +
                '<span class="badge ' + getStatusClass(invoice.status) + '">' + getStatusText(invoice.status) + '</span>' +
                '</td>';
        }
        
        // Construire la ligne du tableau
        return '<tr>' +
            '<td class="fw-semibold px-4">' +
                '<i class="bi bi-file-earmark-text me-2 text-primary"></i>' + invoice.id +
            '</td>' +
            '<td>' +
                '<div class="d-flex flex-column">' +
                    '<span class="text-dark fw-medium">' + formattedDate + '</span>' +
                    periodInfo +
                '</div>' +
            '</td>' +
            '<td>' +
                '<div class="d-flex flex-column">' +
                    '<span class="text-dark fw-medium">' + invoice.reservation + '</span>' +
                    '<small class="text-muted">Réservation #' + invoice.reservationId + '</small>' +
                '</div>' +
            '</td>' +
            '<td class="fw-bold" style="color: #10b981;">' + YOURS.formatCurrency(invoice.amount) + '</td>' +
            statusColumn +
            '<td class="text-end pe-4">' +
                '<div class="btn-group btn-group-sm">' +
                    '<button class="btn btn-outline-primary" onclick="viewInvoice(' + invoice.id.split('-')[1] + ')" title="Voir">' +
                        '<i class="bi bi-eye"></i>' +
                    '</button>' +
                    '<button class="btn btn-outline-success" onclick="downloadInvoice(' + invoice.id.split('-')[1] + ')" title="Télécharger">' +
                        '<i class="bi bi-download"></i>' +
                    '</button>' +
                    '<button class="btn btn-outline-secondary" onclick="printInvoice(' + invoice.id.split('-')[1] + ')" title="Imprimer">' +
                        '<i class="bi bi-printer"></i>' +
                    '</button>' +
                '</div>' +
            '</td>' +
        '</tr>';
    }).join('');
}

function getStatusClass(status) {
    const classes = {
        'payée': 'bg-success',
        'payee': 'bg-success',
        'en attente': 'bg-warning',
        'pending': 'bg-warning',
        'annulée': 'bg-danger',
        'cancelled': 'bg-danger',
        'refusée': 'bg-danger',
        'refusee': 'bg-danger'
    };
    return classes[status.toLowerCase()] || 'bg-secondary';
}

function getStatusText(status) {
    const texts = {
        'payée': 'Payée',
        'payee': 'Payée',
        'en attente': 'En attente',
        'pending': 'En attente',
        'annulée': 'Annulée',
        'cancelled': 'Annulée',
        'refusée': 'Refusée',
        'refusee': 'Refusée'
    };
    return texts[status.toLowerCase()] || status;
}

function viewInvoice(id) {
    // Afficher une notification
    YOURS.showToast('Ouverture de la facture FAC-' + id, 'info');
    
    // Rediriger vers la page de détail de la facture
    window.location.href = `${pageContext.request.contextPath}/pages/client/invoice-detail.jsp?id=${id}`;
}

function downloadInvoice(id) {
    // Afficher une notification
    YOURS.showToast('Téléchargement de la facture FAC-' + id + '...', 'info');
    
    // Créer un formulaire pour le téléchargement
    const form = document.createElement('form');
    form.method = 'GET';
    form.action = `${pageContext.request.contextPath}/api/factures/telecharger`;
    form.style.display = 'none';
    
    // Ajouter l'ID de la facture comme paramètre
    const input = document.createElement('input');
    input.type = 'hidden';
    input.name = 'id';
    input.value = id;
    form.appendChild(input);
    
    // Ajouter le formulaire à la page et le soumettre
    document.body.appendChild(form);
    form.submit();
    document.body.removeChild(form);
}

function printInvoice(id) {
    // Afficher une notification
    YOURS.showToast('Préparation de l\'impression de la facture FAC-' + id + '...', 'info');
    
    // Ouvrir une nouvelle fenêtre avec la facture au format imprimable
    const printWindow = window.open(
        `${pageContext.request.contextPath}/pages/client/print-invoice.jsp?id=${id}`, 
        '_blank',
        'width=800,height=900,top=50,left=50,toolbar=0,location=0,menubar=0'
    );
    
    // Délai pour s'assurer que la page est chargée avant d'imprimer
    if (printWindow) {
        printWindow.onload = function() {
            setTimeout(function() {
                printWindow.print();
            }, 500);
        };
    }
}

function exportInvoices() {
    YOURS.showToast('Export des factures en cours...', 'info');
    // Implement export logic (CSV, PDF, etc.)
}
</script>

<%@ include file="../../layouts/footer.jsp" %>

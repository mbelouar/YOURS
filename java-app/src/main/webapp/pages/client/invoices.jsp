<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setAttribute("pageTitle", "Mes Factures - YOURS");
%>

<%@ include file="../../layouts/header.jsp" %>
<%@ include file="../../layouts/navbar.jsp" %>

<div class="container py-4" style="margin-top: 80px;">
    <!-- Breadcrumb -->
    <nav aria-label="breadcrumb" class="mb-4">
        <ol class="breadcrumb breadcrumb-custom">
            <li class="breadcrumb-item">
                <a href="${pageContext.request.contextPath}/pages/client/dashboard.jsp">
                    <i class="bi bi-house me-1"></i>Tableau de bord
                </a>
            </li>
            <li class="breadcrumb-item active">Factures</li>
        </ol>
    </nav>

    <!-- Header -->
    <div class="d-flex justify-content-between align-items-center mb-4">
        <div>
            <h1 class="fw-bold mb-2">
                <i class="bi bi-receipt text-success me-2"></i>Mes Factures
            </h1>
            <p class="text-muted mb-0">Consultez et téléchargez vos factures</p>
        </div>
        <div class="d-flex gap-2">
            <select class="form-select" id="filterYear">
                <option selected>2025</option>
                <option>2024</option>
                <option>2023</option>
            </select>
        </div>
    </div>

    <!-- Summary Cards -->
    <div class="row g-4 mb-4">
        <div class="col-md-4">
            <div class="card border-0 shadow-sm">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <small class="text-muted d-block mb-1">Total payé (2025)</small>
                            <h3 class="fw-bold mb-0 text-success" id="totalPaid">0 MAD</h3>
                        </div>
                        <div class="rounded-circle bg-success bg-opacity-10 p-3">
                            <i class="bi bi-cash-coin text-success fs-4"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card border-0 shadow-sm">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <small class="text-muted d-block mb-1">Nombre de factures</small>
                            <h3 class="fw-bold mb-0 text-primary" id="invoiceCount">0</h3>
                        </div>
                        <div class="rounded-circle bg-primary bg-opacity-10 p-3">
                            <i class="bi bi-receipt-cutoff text-primary fs-4"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card border-0 shadow-sm">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <small class="text-muted d-block mb-1">Dernière facture</small>
                            <h3 class="fw-bold mb-0" id="lastInvoice">-</h3>
                        </div>
                        <div class="rounded-circle bg-info bg-opacity-10 p-3">
                            <i class="bi bi-calendar-event text-info fs-4"></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Invoices Table -->
    <div class="card border-0 shadow-sm">
        <div class="card-header bg-white border-0 py-3">
            <h5 class="fw-bold mb-0">
                <i class="bi bi-list-ul me-2"></i>Toutes les factures
            </h5>
        </div>
        <div class="card-body p-0">
            <div class="table-responsive">
                <table class="table table-hover mb-0">
                    <thead class="bg-light">
                        <tr>
                            <th class="border-0 py-3">N° Facture</th>
                            <th class="border-0 py-3">Date</th>
                            <th class="border-0 py-3">Réservation</th>
                            <th class="border-0 py-3">Montant</th>
                            <th class="border-0 py-3">Statut</th>
                            <th class="border-0 py-3 text-end">Actions</th>
                        </tr>
                    </thead>
                    <tbody id="invoicesTable">
                        <!-- Invoices will be loaded here -->
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Empty State -->
    <div id="emptyState" class="text-center py-5" style="display: none;">
        <i class="bi bi-receipt text-muted" style="font-size: 5rem; opacity: 0.2;"></i>
        <h4 class="text-muted mt-4 mb-2">Aucune facture</h4>
        <p class="text-muted mb-4">Vos factures apparaîtront ici après vos réservations</p>
    </div>
</div>

<script>
document.addEventListener('DOMContentLoaded', function() {
    loadInvoices();
    
    // Year filter
    document.getElementById('filterYear').addEventListener('change', function() {
        loadInvoices();
    });
});

function loadInvoices() {
    // Simulate loading invoices
    const invoices = [
        {
            id: 'FAC-2025-001',
            date: '2025-10-15',
            reservation: '#R001 - Canon EOS R5',
            amount: 1200,
            status: 'paid',
            reservationId: 1
        },
        {
            id: 'FAC-2025-002',
            date: '2025-10-10',
            reservation: '#R002 - MacBook Pro 16"',
            amount: 2250,
            status: 'paid',
            reservationId: 2
        },
        {
            id: 'FAC-2025-003',
            date: '2025-09-20',
            reservation: '#R003 - Sony A7 III',
            amount: 900,
            status: 'paid',
            reservationId: 3
        }
    ];
    
    const table = document.getElementById('invoicesTable');
    const emptyState = document.getElementById('emptyState');
    
    if (invoices.length === 0) {
        table.closest('.card').style.display = 'none';
        emptyState.style.display = 'block';
        return;
    }
    
    // Update summary
    const totalPaid = invoices.reduce((sum, inv) => sum + inv.amount, 0);
    document.getElementById('totalPaid').textContent = YOURS.formatCurrency(totalPaid);
    document.getElementById('invoiceCount').textContent = invoices.length;
    document.getElementById('lastInvoice').textContent = YOURS.formatDate(invoices[0].date, { month: 'short', day: 'numeric' });
    
    // Populate table
    table.innerHTML = invoices.map(invoice => `
        <tr>
            <td class="fw-semibold">${invoice.id}</td>
            <td>${YOURS.formatDate(invoice.date)}</td>
            <td>${invoice.reservation}</td>
            <td class="fw-bold text-success">${YOURS.formatCurrency(invoice.amount)}</td>
            <td>
                <span class="badge ${getStatusClass(invoice.status)}">${getStatusText(invoice.status)}</span>
            </td>
            <td class="text-end">
                <div class="btn-group btn-group-sm">
                    <button class="btn btn-outline-primary" onclick="viewInvoice('${invoice.id}')">
                        <i class="bi bi-eye"></i>
                    </button>
                    <button class="btn btn-outline-success" onclick="downloadInvoice('${invoice.id}')">
                        <i class="bi bi-download"></i>
                    </button>
                    <button class="btn btn-outline-secondary" onclick="printInvoice('${invoice.id}')">
                        <i class="bi bi-printer"></i>
                    </button>
                </div>
            </td>
        </tr>
    `).join('');
}

function getStatusClass(status) {
    const classes = {
        'paid': 'bg-success',
        'pending': 'bg-warning',
        'cancelled': 'bg-danger'
    };
    return classes[status] || 'bg-secondary';
}

function getStatusText(status) {
    const texts = {
        'paid': 'Payée',
        'pending': 'En attente',
        'cancelled': 'Annulée'
    };
    return texts[status] || status;
}

function viewInvoice(id) {
    YOURS.showToast('Ouverture de la facture ' + id, 'info');
}

function downloadInvoice(id) {
    YOURS.showToast('Téléchargement de la facture ' + id, 'success');
}

function printInvoice(id) {
    YOURS.showToast('Impression de la facture ' + id, 'info');
}
</script>

<%@ include file="../../layouts/footer.jsp" %>


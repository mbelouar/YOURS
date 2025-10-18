<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setAttribute("pageTitle", "Mon Matériel - YOURS");
%>

<%@ include file="../../layouts/header.jsp" %>
<%@ include file="../../layouts/navbar.jsp" %>

<!-- Page Header -->
<section class="py-4" style="background: linear-gradient(135deg, #059669 0%, #047857 50%, #065f46 100%); margin-top: -80px; padding-top: calc(80px + 3rem) !important; padding-bottom: 3rem !important;">
    <div class="container">
        <div class="d-flex justify-content-between align-items-center">
            <div>
                <h1 class="display-6 fw-bold mb-2" style="color: white;">
                    <i class="fas fa-boxes me-3"></i>Mon Matériel
                </h1>
                <p class="mb-0" style="color: rgba(255, 255, 255, 0.9);">
                    Gérez vos équipements et leur disponibilité
                </p>
            </div>
            <button class="btn btn-light btn-lg" onclick="showAddEquipmentModal()">
                <i class="fas fa-plus-circle me-2"></i>Ajouter du matériel
            </button>
        </div>
    </div>
</section>

<!-- Equipment Content -->
<div class="container py-5">
    
    <!-- Search and Filter Bar -->
    <div class="row mb-4">
        <div class="col-lg-8">
            <div class="input-group input-group-lg">
                <span class="input-group-text bg-white border-end-0">
                    <i class="fas fa-search text-muted"></i>
                </span>
                <input type="text" class="form-control border-start-0" placeholder="Rechercher un équipement..." id="searchInput">
            </div>
        </div>
        <div class="col-lg-4">
            <select class="form-select form-select-lg" id="statusFilter">
                <option value="all">Tous les statuts</option>
                <option value="available">Disponible</option>
                <option value="rented">Loué</option>
                <option value="maintenance">En maintenance</option>
            </select>
        </div>
    </div>

    <!-- Equipment Grid -->
    <div class="row g-4" id="equipmentGrid">
        <!-- Equipment cards will be loaded here -->
    </div>

    <!-- Empty State -->
    <div class="text-center py-5 d-none" id="emptyState">
        <i class="fas fa-box-open fa-4x text-muted mb-3" style="opacity: 0.3;"></i>
        <h4 class="text-muted mb-3">Aucun matériel trouvé</h4>
        <p class="text-muted mb-4">Commencez par ajouter votre premier équipement</p>
        <button class="btn btn-primary btn-lg" onclick="showAddEquipmentModal()">
            <i class="fas fa-plus-circle me-2"></i>Ajouter du matériel
        </button>
    </div>
</div>

<!-- Add/Edit Equipment Modal -->
<div class="modal fade" id="equipmentModal" tabindex="-1">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content border-0 shadow-lg">
            <div class="modal-header bg-primary text-white border-0">
                <h5 class="modal-title fw-bold">
                    <i class="fas fa-box me-2"></i><span id="modalTitle">Ajouter du matériel</span>
                </h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body p-4">
                <form id="equipmentForm">
                    <input type="hidden" id="equipmentId">
                    
                    <div class="row">
                        <div class="col-md-8 mb-3">
                            <label class="form-label fw-semibold">Nom du matériel *</label>
                            <input type="text" class="form-control form-control-lg" id="equipmentName" required>
                        </div>
                        <div class="col-md-4 mb-3">
                            <label class="form-label fw-semibold">Prix/jour (MAD) *</label>
                            <input type="number" class="form-control form-control-lg" id="equipmentPrice" required>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label class="form-label fw-semibold">Catégorie *</label>
                            <select class="form-select form-select-lg" id="equipmentCategory" required>
                                <option value="">Sélectionner une catégorie</option>
                                <option value="1">Photographie</option>
                                <option value="2">Vidéo</option>
                                <option value="3">Audio</option>
                                <option value="4">Informatique</option>
                                <option value="5">Gaming</option>
                                <option value="6">Éclairage</option>
                            </select>
                        </div>
                        <div class="col-md-6 mb-3">
                            <label class="form-label fw-semibold">Disponibilité *</label>
                            <select class="form-select form-select-lg" id="equipmentStatus" required>
                                <option value="true">Disponible</option>
                                <option value="false">Non disponible</option>
                            </select>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-semibold">Description</label>
                        <textarea class="form-control" id="equipmentDescription" rows="3" placeholder="Décrivez votre matériel..."></textarea>
                    </div>

                    <div class="mb-3">
                        <label class="form-label fw-semibold">Photos du matériel</label>
                        <input type="file" class="form-control" id="equipmentPhotos" multiple accept="image/*">
                        <small class="text-muted">Vous pouvez sélectionner plusieurs images</small>
                    </div>
                </form>
            </div>
            <div class="modal-footer border-0 bg-light">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
                <button type="button" class="btn btn-primary" onclick="saveEquipment()">
                    <i class="fas fa-save me-2"></i>Enregistrer
                </button>
            </div>
        </div>
    </div>
</div>

<script>
let equipmentModal;

document.addEventListener('DOMContentLoaded', function() {
    equipmentModal = new bootstrap.Modal(document.getElementById('equipmentModal'));
    loadEquipment();
    
    // Search functionality
    document.getElementById('searchInput').addEventListener('input', filterEquipment);
    document.getElementById('statusFilter').addEventListener('change', filterEquipment);
});

function loadEquipment() {
    // Mock data - replace with actual API call
    const equipment = [
        {
            id: 1,
            name: 'Canon EOS R5',
            price: 240,
            category: 'Photographie',
            status: 'available',
            image: 'https://images.unsplash.com/photo-1502920917128-1aa500764cbd?w=400',
            bookings: 12,
            revenue: 2880
        },
        {
            id: 2,
            name: 'MacBook Pro 16"',
            price: 150,
            category: 'Informatique',
            status: 'rented',
            image: 'https://images.unsplash.com/photo-1517336714731-489689fd1ca8?w=400',
            bookings: 8,
            revenue: 1200
        },
        {
            id: 3,
            name: 'Sony A7 III',
            price: 175,
            category: 'Photographie',
            status: 'available',
            image: 'https://images.unsplash.com/photo-1606980624725-9502fde6e4e3?w=400',
            bookings: 15,
            revenue: 2625
        }
    ];
    
    displayEquipment(equipment);
}

function displayEquipment(equipment) {
    const grid = document.getElementById('equipmentGrid');
    const emptyState = document.getElementById('emptyState');
    
    if (equipment.length === 0) {
        grid.classList.add('d-none');
        emptyState.classList.remove('d-none');
        return;
    }
    
    grid.classList.remove('d-none');
    emptyState.classList.add('d-none');
    
    grid.innerHTML = equipment.map(item => {
        let statusClass, statusText;
        if (item.status === 'available') {
            statusClass = 'bg-success';
            statusText = 'Disponible';
        } else if (item.status === 'rented') {
            statusClass = 'bg-warning';
            statusText = 'Loué';
        } else {
            statusClass = 'bg-secondary';
            statusText = 'Maintenance';
        }
        
        return '<div class="col-lg-4 col-md-6">' +
            '<div class="card border-0 shadow-sm h-100">' +
                '<div class="position-relative">' +
                    '<img src="' + item.image + '" class="card-img-top" alt="' + item.name + '" style="height: 200px; object-fit: cover;">' +
                    '<span class="position-absolute top-0 end-0 m-2 badge ' + statusClass + '">' +
                        statusText +
                    '</span>' +
                '</div>' +
                '<div class="card-body">' +
                    '<h5 class="card-title fw-bold mb-2">' + item.name + '</h5>' +
                    '<p class="text-muted small mb-2">' +
                        '<i class="fas fa-tag me-1"></i>' + item.category +
                    '</p>' +
                    '<div class="d-flex justify-content-between align-items-center mb-3">' +
                        '<span class="h5 mb-0 text-primary fw-bold">' + item.price + ' MAD/jour</span>' +
                    '</div>' +
                    '<div class="d-flex justify-content-between text-muted small mb-3">' +
                        '<span><i class="fas fa-calendar-check me-1"></i>' + item.bookings + ' locations</span>' +
                        '<span><i class="fas fa-dollar-sign me-1"></i>' + item.revenue + ' MAD</span>' +
                    '</div>' +
                    '<div class="d-flex gap-2">' +
                        '<button class="btn btn-sm btn-outline-primary flex-fill" onclick="editEquipment(' + item.id + ')">' +
                            '<i class="fas fa-edit me-1"></i>Modifier' +
                        '</button>' +
                        '<button class="btn btn-sm btn-outline-danger" onclick="deleteEquipment(' + item.id + ')">' +
                            '<i class="fas fa-trash"></i>' +
                        '</button>' +
                    '</div>' +
                '</div>' +
            '</div>' +
        '</div>';
    }).join('');
}

function showAddEquipmentModal() {
    document.getElementById('modalTitle').textContent = 'Ajouter du matériel';
    document.getElementById('equipmentForm').reset();
    document.getElementById('equipmentId').value = '';
    equipmentModal.show();
}

function editEquipment(id) {
    document.getElementById('modalTitle').textContent = 'Modifier le matériel';
    // Load equipment data - replace with actual API call
    document.getElementById('equipmentId').value = id;
    equipmentModal.show();
}

function saveEquipment() {
    const form = document.getElementById('equipmentForm');
    if (form.checkValidity()) {
        // Save equipment - replace with actual API call
        console.log('Saving equipment...');
        equipmentModal.hide();
        loadEquipment();
    } else {
        form.reportValidity();
    }
}

function deleteEquipment(id) {
    if (confirm('Êtes-vous sûr de vouloir supprimer cet équipement ?')) {
        // Delete equipment - replace with actual API call
        console.log('Deleting equipment:', id);
        loadEquipment();
    }
}

function filterEquipment() {
    // Implement filtering logic
    loadEquipment();
}
</script>

<%@ include file="../../layouts/footer.jsp" %>


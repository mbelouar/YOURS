<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String equipmentId = request.getParameter("equipment");
    String startDate = request.getParameter("start");
    String endDate = request.getParameter("end");
    request.setAttribute("pageTitle", "Réservation - YOURS");
%>

<%@ include file="../../layouts/header.jsp" %>
<%@ include file="../../layouts/navbar.jsp" %>

<!-- Breadcrumb -->
<div class="container py-3">
    <nav aria-label="breadcrumb">
        <ol class="breadcrumb breadcrumb-custom">
            <li class="breadcrumb-item">
                <a href="${pageContext.request.contextPath}/" class="text-decoration-none">
                    <i class="bi bi-house me-1"></i>Accueil
                </a>
            </li>
            <li class="breadcrumb-item">
                <a href="${pageContext.request.contextPath}/pages/equipment/list.jsp" class="text-decoration-none">
                    Matériel
                </a>
            </li>
            <li class="breadcrumb-item active">Réservation</li>
        </ol>
    </nav>
</div>

<div class="container py-4">
    <!-- Loading State -->
    <div id="loadingState" class="text-center py-5">
        <div class="spinner-border text-primary" role="status">
            <span class="visually-hidden">Chargement...</span>
        </div>
        <p class="text-muted mt-2">Chargement du formulaire de réservation...</p>
    </div>

    <!-- Booking Form -->
    <div id="bookingForm" class="d-none">
        <div class="row">
            <!-- Booking Steps -->
            <div class="col-lg-8">
                <!-- Progress Steps -->
                <div class="card mb-4">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="step-item active" data-step="1">
                                <div class="step-circle">1</div>
                                <div class="step-label">Dates & Durée</div>
                            </div>
                            <div class="step-line"></div>
                            <div class="step-item" data-step="2">
                                <div class="step-circle">2</div>
                                <div class="step-label">Informations</div>
                            </div>
                            <div class="step-line"></div>
                            <div class="step-item" data-step="3">
                                <div class="step-circle">3</div>
                                <div class="step-label">Paiement</div>
                            </div>
                            <div class="step-line"></div>
                            <div class="step-item" data-step="4">
                                <div class="step-circle">4</div>
                                <div class="step-label">Confirmation</div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Step 1: Dates & Duration -->
                <div class="step-content" id="step1">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="fw-bold mb-0">
                                <i class="bi bi-calendar me-2"></i>Sélectionnez vos dates
                            </h5>
                        </div>
                        <div class="card-body">
                            <form id="datesForm" class="needs-validation" novalidate>
                                <div class="row">
                                    <div class="col-md-6">
                                        <label for="bookingStartDate" class="form-label">Date de début *</label>
                                        <input type="date" class="form-control form-control-lg start-date" 
                                               id="bookingStartDate" required>
                                        <div class="invalid-feedback">La date de début est requise.</div>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="bookingEndDate" class="form-label">Date de fin *</label>
                                        <input type="date" class="form-control form-control-lg end-date" 
                                               id="bookingEndDate" required>
                                        <div class="invalid-feedback">La date de fin est requise.</div>
                                    </div>
                                </div>
                                
                                <div class="row mt-4">
                                    <div class="col-md-6">
                                        <label for="pickupTime" class="form-label">Heure de récupération</label>
                                        <select class="form-select" id="pickupTime">
                                            <option value="09:00">09:00</option>
                                            <option value="10:00">10:00</option>
                                            <option value="11:00">11:00</option>
                                            <option value="14:00">14:00</option>
                                            <option value="15:00">15:00</option>
                                            <option value="16:00">16:00</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="returnTime" class="form-label">Heure de retour</label>
                                        <select class="form-select" id="returnTime">
                                            <option value="09:00">09:00</option>
                                            <option value="10:00">10:00</option>
                                            <option value="11:00">11:00</option>
                                            <option value="14:00">14:00</option>
                                            <option value="15:00">15:00</option>
                                            <option value="16:00">16:00</option>
                                            <option value="17:00">17:00</option>
                                            <option value="18:00">18:00</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="mt-4">
                                    <label for="deliveryOption" class="form-label">Option de livraison</label>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="deliveryOption" 
                                                       id="pickup" value="pickup" checked>
                                                <label class="form-check-label" for="pickup">
                                                    <strong>Récupération sur place</strong><br>
                                                    <small class="text-muted">Gratuit - Chez le partenaire</small>
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="deliveryOption" 
                                                       id="delivery" value="delivery">
                                                <label class="form-check-label" for="delivery">
                                                    <strong>Livraison à domicile</strong><br>
                                                    <small class="text-muted">+50 MAD - Dans Casablanca</small>
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="mt-4 text-end">
                                    <button type="submit" class="btn btn-primary btn-lg">
                                        Continuer <i class="bi bi-arrow-right ms-2"></i>
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <!-- Step 2: Information -->
                <div class="step-content d-none" id="step2">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="fw-bold mb-0">
                                <i class="bi bi-info-circle me-2"></i>Informations complémentaires
                            </h5>
                        </div>
                        <div class="card-body">
                            <form id="infoForm" class="needs-validation" novalidate>
                                <div class="mb-4">
                                    <label for="projectDescription" class="form-label">Description du projet</label>
                                    <textarea class="form-control" id="projectDescription" rows="3" 
                                              placeholder="Décrivez brièvement votre projet (optionnel)"></textarea>
                                </div>

                                <div class="mb-4">
                                    <label for="specialRequests" class="form-label">Demandes spéciales</label>
                                    <textarea class="form-control" id="specialRequests" rows="2" 
                                              placeholder="Accessoires supplémentaires, instructions particulières..."></textarea>
                                </div>

                                <div class="mb-4">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="insuranceOption">
                                        <label class="form-check-label" for="insuranceOption">
                                            <strong>Assurance premium (+15% du prix total)</strong><br>
                                            <small class="text-muted">
                                                Couverture complète contre les dommages, vol et perte
                                            </small>
                                        </label>
                                    </div>
                                </div>

                                <div class="mb-4">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="acceptTerms" required>
                                        <label class="form-check-label" for="acceptTerms">
                                            J'accepte les 
                                            <a href="#" class="text-decoration-none">conditions de location</a> *
                                        </label>
                                        <div class="invalid-feedback">
                                            Vous devez accepter les conditions de location.
                                        </div>
                                    </div>
                                </div>

                                <div class="d-flex justify-content-between">
                                    <button type="button" class="btn btn-outline-secondary btn-lg" onclick="previousStep()">
                                        <i class="bi bi-arrow-left me-2"></i>Retour
                                    </button>
                                    <button type="submit" class="btn btn-primary btn-lg">
                                        Continuer <i class="bi bi-arrow-right ms-2"></i>
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <!-- Step 3: Payment -->
                <div class="step-content d-none" id="step3">
                    <div class="card">
                        <div class="card-header">
                            <h5 class="fw-bold mb-0">
                                <i class="bi bi-credit-card me-2"></i>Paiement
                            </h5>
                        </div>
                        <div class="card-body">
                            <form id="paymentForm" class="needs-validation" novalidate>
                                <div class="mb-4">
                                    <label class="form-label">Mode de paiement</label>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="paymentMethod" 
                                                       id="creditCard" value="card" checked>
                                                <label class="form-check-label" for="creditCard">
                                                    <i class="bi bi-credit-card me-2"></i>Carte bancaire
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="paymentMethod" 
                                                       id="paypal" value="paypal">
                                                <label class="form-check-label" for="paypal">
                                                    <i class="bi bi-paypal me-2"></i>PayPal
                                                </label>
                                            </div>
                                        </div>
                                        <div class="col-md-4">
                                            <div class="form-check">
                                                <input class="form-check-input" type="radio" name="paymentMethod" 
                                                       id="bankTransfer" value="transfer">
                                                <label class="form-check-label" for="bankTransfer">
                                                    <i class="bi bi-bank me-2"></i>Virement
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Credit Card Form -->
                                <div id="cardForm">
                                    <div class="row">
                                        <div class="col-md-8">
                                            <label for="cardNumber" class="form-label">Numéro de carte *</label>
                                            <input type="text" class="form-control" id="cardNumber" 
                                                   placeholder="1234 5678 9012 3456" maxlength="19" required>
                                            <div class="invalid-feedback">Numéro de carte requis.</div>
                                        </div>
                                        <div class="col-md-4">
                                            <label for="cardCvv" class="form-label">CVV *</label>
                                            <input type="text" class="form-control" id="cardCvv" 
                                                   placeholder="123" maxlength="4" required>
                                            <div class="invalid-feedback">CVV requis.</div>
                                        </div>
                                    </div>
                                    <div class="row mt-3">
                                        <div class="col-md-6">
                                            <label for="cardExpiry" class="form-label">Date d'expiration *</label>
                                            <input type="text" class="form-control" id="cardExpiry" 
                                                   placeholder="MM/AA" maxlength="5" required>
                                            <div class="invalid-feedback">Date d'expiration requise.</div>
                                        </div>
                                        <div class="col-md-6">
                                            <label for="cardName" class="form-label">Nom sur la carte *</label>
                                            <input type="text" class="form-control" id="cardName" 
                                                   placeholder="Nom complet" required>
                                            <div class="invalid-feedback">Nom sur la carte requis.</div>
                                        </div>
                                    </div>
                                </div>

                                <div class="mt-4">
                                    <div class="alert alert-info">
                                        <i class="bi bi-shield-check me-2"></i>
                                        <strong>Paiement sécurisé</strong><br>
                                        Vos informations de paiement sont protégées par un cryptage SSL.
                                    </div>
                                </div>

                                <div class="d-flex justify-content-between">
                                    <button type="button" class="btn btn-outline-secondary btn-lg" onclick="previousStep()">
                                        <i class="bi bi-arrow-left me-2"></i>Retour
                                    </button>
                                    <button type="submit" class="btn btn-success btn-lg">
                                        <i class="bi bi-lock me-2"></i>Payer maintenant
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>

                <!-- Step 4: Confirmation -->
                <div class="step-content d-none" id="step4">
                    <div class="card">
                        <div class="card-body text-center py-5">
                            <div class="mb-4">
                                <i class="bi bi-check-circle text-success" style="font-size: 4rem;"></i>
                            </div>
                            <h2 class="fw-bold text-success mb-3">Réservation confirmée !</h2>
                            <p class="lead mb-4">
                                Votre réservation a été enregistrée avec succès.<br>
                                Numéro de réservation: <strong id="confirmationNumber">#0000</strong>
                            </p>
                            
                            <div class="row justify-content-center">
                                <div class="col-md-8">
                                    <div class="alert alert-info">
                                        <h6><i class="bi bi-info-circle me-2"></i>Prochaines étapes</h6>
                                        <ul class="list-unstyled mb-0 text-start">
                                            <li class="mb-2">
                                                <i class="bi bi-envelope me-2"></i>
                                                Vous recevrez un email de confirmation
                                            </li>
                                            <li class="mb-2">
                                                <i class="bi bi-telephone me-2"></i>
                                                Le partenaire vous contactera sous 24h
                                            </li>
                                            <li class="mb-0">
                                                <i class="bi bi-calendar me-2"></i>
                                                Récupérez votre matériel à la date prévue
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                            <div class="d-flex justify-content-center gap-3 mt-4">
                                <a href="${pageContext.request.contextPath}/pages/client/reservations.jsp" 
                                   class="btn btn-primary">
                                    <i class="bi bi-calendar-check me-2"></i>Mes réservations
                                </a>
                                <a href="${pageContext.request.contextPath}/pages/equipment/list.jsp" 
                                   class="btn btn-outline-primary">
                                    <i class="bi bi-search me-2"></i>Continuer à parcourir
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Booking Summary Sidebar -->
            <div class="col-lg-4">
                <div class="booking-summary-sidebar">
                    <!-- Equipment Summary -->
                    <div class="card mb-4">
                        <div class="card-header">
                            <h6 class="fw-bold mb-0">
                                <i class="bi bi-camera me-2"></i>Équipement sélectionné
                            </h6>
                        </div>
                        <div class="card-body" id="equipmentSummary">
                            <!-- Equipment details will be loaded here -->
                        </div>
                    </div>

                    <!-- Price Summary -->
                    <div class="card sticky-top" style="top: 100px;">
                        <div class="card-header">
                            <h6 class="fw-bold mb-0">
                                <i class="bi bi-calculator me-2"></i>Résumé des prix
                            </h6>
                        </div>
                        <div class="card-body">
                            <div id="priceSummary">
                                <!-- Price breakdown will be loaded here -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Booking Form JavaScript -->
<script>
let currentStep = 1;
let selectedEquipment = null;
let bookingData = {
    equipment: null,
    startDate: null,
    endDate: null,
    pickupTime: '09:00',
    returnTime: '18:00',
    deliveryOption: 'pickup',
    projectDescription: '',
    specialRequests: '',
    insurance: false,
    paymentMethod: 'card',
    totalPrice: 0
};

document.addEventListener('DOMContentLoaded', function() {
    // Check authentication
    checkAuthentication();
    
    // Get URL parameters
    const urlParams = new URLSearchParams(window.location.search);
    const equipmentId = urlParams.get('equipment') || '<%= equipmentId %>';
    const startDate = urlParams.get('start') || '<%= startDate %>';
    const endDate = urlParams.get('end') || '<%= endDate %>';
    
    if (equipmentId) {
        loadEquipment(parseInt(equipmentId), startDate, endDate);
    } else {
        showError('Aucun équipement sélectionné');
    }
    
    // Setup form listeners
    setupFormListeners();
});

// Check authentication
function checkAuthentication() {
    const user = YOURS.storage.get('user') || JSON.parse(sessionStorage.getItem('yours_user') || 'null');
    
    if (!user || user.type !== 'client') {
        YOURS.showToast('Veuillez vous connecter pour effectuer une réservation', 'warning');
        setTimeout(() => {
            window.location.href = '${pageContext.request.contextPath}/pages/auth/login.jsp';
        }, 2000);
        return false;
    }
    return true;
}

// Load equipment
function loadEquipment(equipmentId, startDate, endDate) {
    setTimeout(() => {
        selectedEquipment = MockDataUtils.getEquipmentById(equipmentId);
        
        if (selectedEquipment) {
            bookingData.equipment = selectedEquipment;
            
            // Pre-fill dates if provided
            if (startDate && startDate !== 'null') {
                document.getElementById('bookingStartDate').value = startDate;
                bookingData.startDate = startDate;
            }
            if (endDate && endDate !== 'null') {
                document.getElementById('bookingEndDate').value = endDate;
                bookingData.endDate = endDate;
            }
            
            displayEquipmentSummary();
            updatePriceSummary();
            
            // Show booking form
            document.getElementById('loadingState').style.display = 'none';
            document.getElementById('bookingForm').classList.remove('d-none');
        } else {
            showError('Équipement non trouvé');
        }
    }, 1000);
}

// Display equipment summary
function displayEquipmentSummary() {
    const container = document.getElementById('equipmentSummary');
    
    container.innerHTML = `
        <div class="d-flex">
            <img src="${selectedEquipment.images[0]}" alt="${selectedEquipment.nom}" 
                 class="rounded me-3" style="width: 80px; height: 80px; object-fit: cover;"
                 onerror="this.src='assets/images/placeholder-equipment.jpg'">
            <div class="flex-grow-1">
                <h6 class="mb-1">${selectedEquipment.nom}</h6>
                <p class="text-muted small mb-2">${selectedEquipment.categorie}</p>
                <div class="fw-bold text-primary">${YOURS.formatCurrency(selectedEquipment.prix)}/jour</div>
            </div>
        </div>
        <hr>
        <div class="small">
            <strong>Partenaire:</strong> ${selectedEquipment.partner.nom}<br>
            <strong>Note:</strong> ${selectedEquipment.partner.rating}/5 ⭐
        </div>
    `;
}

// Update price summary
function updatePriceSummary() {
    const container = document.getElementById('priceSummary');
    
    if (!bookingData.startDate || !bookingData.endDate) {
        container.innerHTML = `
            <div class="text-center text-muted">
                <i class="bi bi-calendar me-2"></i>
                Sélectionnez vos dates
            </div>
        `;
        return;
    }
    
    const days = YOURS.calculateDays(bookingData.startDate, bookingData.endDate);
    const dailyPrice = selectedEquipment.prix;
    const subtotal = dailyPrice * days;
    const deliveryFee = bookingData.deliveryOption === 'delivery' ? 50 : 0;
    const insuranceFee = bookingData.insurance ? Math.round(subtotal * 0.15) : 0;
    const total = subtotal + deliveryFee + insuranceFee;
    
    bookingData.totalPrice = total;
    
    container.innerHTML = `
        <div class="d-flex justify-content-between mb-2">
            <span>Prix par jour:</span>
            <span>${YOURS.formatCurrency(dailyPrice)}</span>
        </div>
        <div class="d-flex justify-content-between mb-2">
            <span>Durée:</span>
            <span>${days} jour${days > 1 ? 's' : ''}</span>
        </div>
        <div class="d-flex justify-content-between mb-2">
            <span>Sous-total:</span>
            <span>${YOURS.formatCurrency(subtotal)}</span>
        </div>
        ${deliveryFee > 0 ? `
            <div class="d-flex justify-content-between mb-2">
                <span>Livraison:</span>
                <span>${YOURS.formatCurrency(deliveryFee)}</span>
            </div>
        ` : ''}
        ${insuranceFee > 0 ? `
            <div class="d-flex justify-content-between mb-2">
                <span>Assurance:</span>
                <span>${YOURS.formatCurrency(insuranceFee)}</span>
            </div>
        ` : ''}
        <hr>
        <div class="d-flex justify-content-between fw-bold fs-5">
            <span>Total:</span>
            <span class="text-primary">${YOURS.formatCurrency(total)}</span>
        </div>
        <small class="text-muted mt-2 d-block">
            <i class="bi bi-info-circle me-1"></i>
            TVA incluse
        </small>
    `;
}

// Setup form listeners
function setupFormListeners() {
    // Step 1: Dates form
    document.getElementById('datesForm').addEventListener('submit', function(e) {
        e.preventDefault();
        if (this.checkValidity()) {
            // Update booking data
            bookingData.startDate = document.getElementById('bookingStartDate').value;
            bookingData.endDate = document.getElementById('bookingEndDate').value;
            bookingData.pickupTime = document.getElementById('pickupTime').value;
            bookingData.returnTime = document.getElementById('returnTime').value;
            bookingData.deliveryOption = document.querySelector('input[name="deliveryOption"]:checked').value;
            
            updatePriceSummary();
            nextStep();
        }
        this.classList.add('was-validated');
    });
    
    // Step 2: Info form
    document.getElementById('infoForm').addEventListener('submit', function(e) {
        e.preventDefault();
        if (this.checkValidity()) {
            // Update booking data
            bookingData.projectDescription = document.getElementById('projectDescription').value;
            bookingData.specialRequests = document.getElementById('specialRequests').value;
            bookingData.insurance = document.getElementById('insuranceOption').checked;
            
            updatePriceSummary();
            nextStep();
        }
        this.classList.add('was-validated');
    });
    
    // Step 3: Payment form
    document.getElementById('paymentForm').addEventListener('submit', function(e) {
        e.preventDefault();
        if (this.checkValidity()) {
            processPayment();
        }
        this.classList.add('was-validated');
    });
    
    // Date change listeners
    document.getElementById('bookingStartDate').addEventListener('change', function() {
        const endDateInput = document.getElementById('bookingEndDate');
        endDateInput.min = this.value;
        if (endDateInput.value && endDateInput.value < this.value) {
            endDateInput.value = '';
        }
        bookingData.startDate = this.value;
        updatePriceSummary();
    });
    
    document.getElementById('bookingEndDate').addEventListener('change', function() {
        bookingData.endDate = this.value;
        updatePriceSummary();
    });
    
    // Delivery option change
    document.querySelectorAll('input[name="deliveryOption"]').forEach(radio => {
        radio.addEventListener('change', function() {
            bookingData.deliveryOption = this.value;
            updatePriceSummary();
        });
    });
    
    // Insurance option change
    document.getElementById('insuranceOption').addEventListener('change', function() {
        bookingData.insurance = this.checked;
        updatePriceSummary();
    });
    
    // Payment method change
    document.querySelectorAll('input[name="paymentMethod"]').forEach(radio => {
        radio.addEventListener('change', function() {
            bookingData.paymentMethod = this.value;
            togglePaymentForm(this.value);
        });
    });
    
    // Card number formatting
    document.getElementById('cardNumber').addEventListener('input', function() {
        this.value = this.value.replace(/\D/g, '').replace(/(\d{4})(?=\d)/g, '$1 ');
    });
    
    // Card expiry formatting
    document.getElementById('cardExpiry').addEventListener('input', function() {
        this.value = this.value.replace(/\D/g, '').replace(/(\d{2})(?=\d)/, '$1/');
    });
    
    // Set minimum date to today
    const today = new Date().toISOString().split('T')[0];
    document.getElementById('bookingStartDate').min = today;
}

// Next step
function nextStep() {
    if (currentStep < 4) {
        // Hide current step
        document.getElementById(`step${currentStep}`).classList.add('d-none');
        document.querySelector(`[data-step="${currentStep}"]`).classList.remove('active');
        
        // Show next step
        currentStep++;
        document.getElementById(`step${currentStep}`).classList.remove('d-none');
        document.querySelector(`[data-step="${currentStep}"]`).classList.add('active');
        
        // Scroll to top
        window.scrollTo({ top: 0, behavior: 'smooth' });
    }
}

// Previous step
function previousStep() {
    if (currentStep > 1) {
        // Hide current step
        document.getElementById(`step${currentStep}`).classList.add('d-none');
        document.querySelector(`[data-step="${currentStep}"]`).classList.remove('active');
        
        // Show previous step
        currentStep--;
        document.getElementById(`step${currentStep}`).classList.remove('d-none');
        document.querySelector(`[data-step="${currentStep}"]`).classList.add('active');
        
        // Scroll to top
        window.scrollTo({ top: 0, behavior: 'smooth' });
    }
}

// Toggle payment form
function togglePaymentForm(method) {
    const cardForm = document.getElementById('cardForm');
    
    if (method === 'card') {
        cardForm.style.display = 'block';
        // Make card fields required
        cardForm.querySelectorAll('input').forEach(input => input.required = true);
    } else {
        cardForm.style.display = 'none';
        // Remove required from card fields
        cardForm.querySelectorAll('input').forEach(input => input.required = false);
    }
}

// Process payment
function processPayment() {
    const submitBtn = document.querySelector('#paymentForm button[type="submit"]');
    const originalText = submitBtn.innerHTML;
    
    // Show loading state
    submitBtn.disabled = true;
    submitBtn.innerHTML = '<span class="spinner-border spinner-border-sm me-2"></span>Traitement...';
    
    // Simulate payment processing
    setTimeout(() => {
        // Generate confirmation number
        const confirmationNumber = Math.floor(Math.random() * 9000) + 1000;
        document.getElementById('confirmationNumber').textContent = `#${confirmationNumber}`;
        
        // Show success message
        YOURS.showToast('Paiement effectué avec succès !', 'success');
        
        // Go to confirmation step
        nextStep();
        
        // Reset button
        submitBtn.disabled = false;
        submitBtn.innerHTML = originalText;
        
        // Save booking to mock data (in real app, this would be sent to server)
        saveBooking(confirmationNumber);
        
    }, 3000); // Simulate processing time
}

// Save booking
function saveBooking(confirmationNumber) {
    const user = YOURS.storage.get('user') || JSON.parse(sessionStorage.getItem('yours_user') || 'null');
    
    const newBooking = {
        idReservation: confirmationNumber,
        dateDebut: bookingData.startDate,
        dateFin: bookingData.endDate,
        reserve: true,
        status: 'upcoming',
        idClient: user.idClient || 1,
        idMateriel: selectedEquipment.idMateriel,
        materiel: selectedEquipment,
        client: user,
        totalPrice: bookingData.totalPrice,
        createdAt: new Date().toISOString(),
        notes: bookingData.projectDescription,
        deliveryOption: bookingData.deliveryOption,
        insurance: bookingData.insurance,
        pickupTime: bookingData.pickupTime,
        returnTime: bookingData.returnTime
    };
    
    // In a real app, this would be sent to the server
    console.log('Booking saved:', newBooking);
}

// Show error
function showError(message) {
    document.getElementById('loadingState').innerHTML = `
        <div class="empty-state">
            <div class="empty-icon">
                <i class="bi bi-exclamation-triangle"></i>
            </div>
            <h3 class="empty-title">Erreur</h3>
            <p class="empty-description">${message}</p>
            <a href="${pageContext.request.contextPath}/pages/equipment/list.jsp" class="btn btn-primary">
                <i class="bi bi-arrow-left me-2"></i>Retour au catalogue
            </a>
        </div>
    `;
}
</script>

<style>
.step-item {
    display: flex;
    flex-direction: column;
    align-items: center;
    position: relative;
}

.step-circle {
    width: 40px;
    height: 40px;
    border-radius: 50%;
    background: #e9ecef;
    color: #6c757d;
    display: flex;
    align-items: center;
    justify-content: center;
    font-weight: bold;
    margin-bottom: 0.5rem;
    transition: all 0.3s ease;
}

.step-item.active .step-circle {
    background: var(--primary-color);
    color: white;
}

.step-label {
    font-size: 0.875rem;
    font-weight: 500;
    color: #6c757d;
    text-align: center;
}

.step-item.active .step-label {
    color: var(--primary-color);
}

.step-line {
    flex: 1;
    height: 2px;
    background: #e9ecef;
    margin: 0 1rem;
    align-self: flex-start;
    margin-top: 20px;
}

.booking-summary-sidebar .card {
    border: none;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

@media (max-width: 768px) {
    .step-item {
        flex-direction: row;
        text-align: left;
    }
    
    .step-circle {
        margin-bottom: 0;
        margin-right: 0.5rem;
        width: 30px;
        height: 30px;
        font-size: 0.875rem;
    }
    
    .step-line {
        display: none;
    }
    
    .step-label {
        font-size: 0.75rem;
    }
}
</style>

<%@ include file="../../layouts/footer.jsp" %>

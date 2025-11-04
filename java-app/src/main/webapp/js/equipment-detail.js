/**
 * Gère le chargement et l'affichage des détails d'un équipement
 */

let currentEquipment = null;
let currentImageIndex = 0;

/**
 * Charge les détails d'un équipement depuis le serveur
 * @param {number} equipmentId - L'ID de l'équipement à charger
 */
function loadEquipmentDetail(equipmentId) {
    // Afficher l'état de chargement
    document.getElementById('loadingState').classList.remove('d-none');
    document.getElementById('equipmentDetail').classList.add('d-none');
    document.getElementById('notFoundState').classList.add('d-none');

    // Construire l'URL de l'API
    const apiUrl = `${window.location.origin}${window.location.pathname.replace('/pages/equipment/detail.jsp', '')}/api/materiel/${equipmentId}`;
    
    // Effectuer la requête AJAX
    fetch(apiUrl)
        .then(response => {
            if (!response.ok) {
                throw new Error('Matériel non trouvé');
            }
            return response.json();
        })
        .then(data => {
            currentEquipment = data;
            displayEquipmentDetail();
            document.getElementById('loadingState').classList.add('d-none');
            document.getElementById('equipmentDetail').classList.remove('d-none');
        })
        .catch(error => {
            console.error('Erreur lors du chargement des détails:', error);
            showNotFound();
        });
}

/**
 * Affiche les détails de l'équipement dans la page
 */
function displayEquipmentDetail() {
    if (!currentEquipment) return;

    // Mettre à jour les informations de base
    document.title = `${currentEquipment.nom} - YOURS`;
    document.getElementById('equipmentName').textContent = currentEquipment.nom;
    document.getElementById('equipmentDescription').textContent = currentEquipment.description || 'Aucune description disponible';
    
    // Mettre à jour le prix
    const priceElement = document.getElementById('equipmentPrice');
    if (priceElement) {
        priceElement.textContent = `${currentEquipment.prix || 'N/A'} MAD`;
    }

    // Mettre à jour la catégorie
    const categoryElement = document.getElementById('categoryText');
    if (categoryElement && currentEquipment.categorie) {
        categoryElement.textContent = currentEquipment.categorie.nom || 'Non catégorisé';
    }

    // Mettre à jour les images
    updateEquipmentImages();

    // Mettre à jour les autres détails
    updateEquipmentDetails();
}

/**
 * Met à jour les images de l'équipement
 */
function updateEquipmentImages() {
    const mainImage = document.getElementById('mainImage');
    const thumbnailGallery = document.getElementById('thumbnailGallery');
    
    if (!mainImage || !thumbnailGallery) return;

    // Réinitialiser la galerie
    thumbnailGallery.innerHTML = '';

    // Vérifier s'il y a des images
    if (!currentEquipment.images || currentEquipment.images.length === 0) {
        // Afficher une image par défaut si aucune image n'est disponible
        mainImage.src = `${window.location.origin}${window.location.pathname.replace('/pages/equipment/detail.jsp', '')}/assets/img/equipment/default.jpg`;
        mainImage.alt = currentEquipment.nom;
        return;
    }

    // Mettre à jour l'image principale
    mainImage.src = currentEquipment.images[0];
    mainImage.alt = currentEquipment.nom;

    // Ajouter les miniatures
    currentEquipment.images.forEach((image, index) => {
        const thumbnail = document.createElement('div');
        thumbnail.className = 'thumbnail-item';
        thumbnail.style.cssText = 'width: 60px; height: 60px; border-radius: 0.5rem; overflow: hidden; cursor: pointer; border: 2px solid transparent; transition: all 0.2s ease;';
        thumbnail.innerHTML = `<img src="${image}" alt="${currentEquipment.nom} - Vue ${index + 1}" class="img-fluid" style="width: 100%; height: 100%; object-fit: cover;">`;
        
        thumbnail.addEventListener('click', () => {
            mainImage.src = image;
            mainImage.alt = `${currentEquipment.nom} - Vue ${index + 1}`;
            
            // Mettre à jour la classe active
            document.querySelectorAll('.thumbnail-item').forEach(item => {
                item.style.borderColor = 'transparent';
            });
            thumbnail.style.borderColor = '#1e40af';
        });

        thumbnailGallery.appendChild(thumbnail);
    });
}

/**
 * Met à jour les détails supplémentaires de l'équipement
 */
function updateEquipmentDetails() {
    // Mettre à jour les spécifications
    const specificationsList = document.getElementById('specificationsList');
    if (specificationsList) {
        specificationsList.innerHTML = ''; // Vider la liste
        
        // Ajouter chaque spécification à la liste
        if (currentEquipment.specifications) {
            Object.entries(currentEquipment.specifications).forEach(([key, value]) => {
                if (value) { // Ne pas afficher les valeurs vides
                    const listItem = document.createElement('li');
                    listItem.className = 'list-group-item d-flex justify-content-between align-items-center';
                    listItem.innerHTML = `
                        <span>${key}</span>
                        <span class="badge bg-primary rounded-pill">${value}</span>
                    `;
                    specificationsList.appendChild(listItem);
                }
            });
        }
    }
}

/**
 * Affiche le message "Non trouvé"
 */
function showNotFound() {
    document.getElementById('loadingState').classList.add('d-none');
    document.getElementById('equipmentDetail').classList.add('d-none');
    document.getElementById('notFoundState').classList.remove('d-none');
}

// Initialisation au chargement de la page
document.addEventListener('DOMContentLoaded', function() {
    const urlParams = new URLSearchParams(window.location.search);
    const equipmentId = urlParams.get('id');
    
    // Vérifier si l'ID est valide
    if (!equipmentId || equipmentId.trim() === '') {
        console.error('Aucun ID d\'équipement spécifié');
        showNotFound();
        return;
    }
    
    if (equipmentId) {
        loadEquipmentDetail(parseInt(equipmentId));
    } else {
        showNotFound();
    }
    
    // Initialiser les écouteurs d'événements pour le formulaire de réservation
    initBookingForm();
});

/**
 * Initialise le formulaire de réservation
 */
function initBookingForm() {
    const bookingForm = document.getElementById('quickBookingForm');
    if (bookingForm) {
        bookingForm.addEventListener('submit', function(e) {
            e.preventDefault();
            handleBooking();
        });
    }
    
    // Mettre à jour le total lorsque les dates changent
    const startDateInput = document.getElementById('startDate');
    const endDateInput = document.getElementById('endDate');
    
    if (startDateInput && endDateInput) {
        startDateInput.addEventListener('change', updateBookingTotal);
        endDateInput.addEventListener('change', updateBookingTotal);
    }
}

/**
 * Met à jour le total de la réservation en fonction des dates sélectionnées
 */
function updateBookingTotal() {
    const startDate = new Date(document.getElementById('startDate').value);
    const endDate = new Date(document.getElementById('endDate').value);
    const totalElement = document.getElementById('totalPrice');
    
    if (!startDate || !endDate || !currentEquipment || !totalElement) return;
    
    // Calculer le nombre de jours
    const diffTime = Math.abs(endDate - startDate);
    const diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24)) + 1; // +1 pour inclure le dernier jour
    
    // Calculer le total
    const total = diffDays * currentEquipment.prix;
    
    // Mettre à jour l'affichage
    totalElement.textContent = `${total.toFixed(2)} MAD`;
    
    // Mettre à jour la durée
    const durationElement = document.getElementById('rentalDuration');
    if (durationElement) {
        durationElement.textContent = `${diffDays} jour${diffDays > 1 ? 's' : ''}`;
    }
    
    // Mettre à jour le prix journalier
    const dailyPriceElement = document.getElementById('dailyPrice');
    if (dailyPriceElement) {
        dailyPriceElement.textContent = `${currentEquipment.prix} MAD`;
    }
}

/**
 * Gère la soumission du formulaire de réservation
 */
function handleBooking() {
    if (!currentEquipment) {
        notificationSystem.error('Aucun équipement sélectionné');
        return;
    }
    
    const startDate = document.getElementById('startDate').value;
    const endDate = document.getElementById('endDate').value;
    
    if (!startDate || !endDate) {
        notificationSystem.error('Veuillez sélectionner des dates de début et de fin.');
        return;
    }
    
    // Afficher un indicateur de chargement
    const submitBtn = document.querySelector('#quickBookingForm button[type="submit"]');
    const originalBtnText = submitBtn.innerHTML;
    submitBtn.disabled = true;
    submitBtn.innerHTML = '<span class="spinner-border spinner-border-sm" role="status" aria-hidden="true"></span> Traitement...';

    // Préparer les données de la réservation
    const reservationData = {
        idMateriel: currentEquipment.idMateriel,
        dateDebut: startDate,
        dateFin: endDate,
        statut: 'EN_ATTENTE',
        montantTotal: document.getElementById('totalPrice').textContent.replace(/[^0-9.,]/g, '') // Nettoyer le montant
    };
    
    console.log('Envoi de la réservation :', reservationData);
    
    // Convertir l'objet en URLSearchParams pour le format x-www-form-urlencoded
    const formData = new URLSearchParams();
    for (const key in reservationData) {
        formData.append(key, reservationData[key]);
    }
    
    // Envoyer la réservation au serveur
    fetch('/java-app/reservation/new', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: formData
    })
    .then(response => {
        if (!response.ok) {
            return response.text().then(text => {
                throw new Error(text || 'Erreur lors de la réservation');
            });
        }
        return response.json();
    })
    .then(data => {
        notificationSystem.success('Réservation effectuée avec succès !');
        // Rediriger vers la page de confirmation après un court délai
        setTimeout(() => {
            window.location.href = `/java-app/pages/client/reservations`;
        }, 1500);
    })
    .catch(error => {
        console.error('Erreur lors de la réservation:', error);
        // Essayer d'extraire le message d'erreur si c'est du JSON
        try {
            const errorJson = JSON.parse(error.message);
            notificationSystem.error(errorJson.message || 'Une erreur est survenue');
        } catch (e) {
            // Si ce n'est pas du JSON, afficher le message d'erreur brut
            notificationSystem.error(error.message || 'Une erreur est survenue lors de la réservation');
        }
        submitBtn.disabled = false;
        submitBtn.innerHTML = originalBtnText;
    });
}

// Exporter les fonctions pour les rendre accessibles globalement
window.loadEquipmentDetail = loadEquipmentDetail;
window.showNotFound = showNotFound;

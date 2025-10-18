// YOURS - Main JavaScript File

// Global application object
const YOURS = {
    // Configuration
    config: {
        apiBaseUrl: '/api',
        itemsPerPage: 12,
        debounceDelay: 300,
        animationDuration: 300
    },
    
    // Current user session
    user: null,
    
    // Application state
    state: {
        currentPage: 1,
        searchQuery: '',
        selectedCategory: null,
        priceRange: { min: 0, max: 1000 },
        sortBy: 'popularity'
    },
    
    // Initialize application
    init: function() {
        this.setupEventListeners();
        this.loadUserSession();
        this.initializeComponents();
        console.log('YOURS Application initialized');
    },
    
    // Setup global event listeners
    setupEventListeners: function() {
        // Mobile menu toggle
        const navbarToggler = document.querySelector('.navbar-toggler');
        if (navbarToggler) {
            navbarToggler.addEventListener('click', this.toggleMobileMenu);
        }
        
        // Search functionality
        const searchInputs = document.querySelectorAll('.search-input');
        searchInputs.forEach(input => {
            input.addEventListener('input', this.debounce(this.handleSearch.bind(this), this.config.debounceDelay));
        });
        
        // Smooth scrolling for navigation links
        this.setupSmoothScrolling();
        
        // Section scroll spy
        this.setupScrollSpy();
        
        // Back to top button
        this.setupBackToTop();
        
        // Form validation
        this.setupFormValidation();
        
        // Image lazy loading
        this.setupLazyLoading();
    },
    
    // Toggle mobile menu
    toggleMobileMenu: function() {
        const navbarCollapse = document.querySelector('.navbar-collapse');
        if (navbarCollapse) {
            navbarCollapse.classList.toggle('show');
        }
    },
    
    // Handle search input
    handleSearch: function(event) {
        const query = event.target.value.trim();
        this.state.searchQuery = query;
        
        if (typeof this.filterEquipment === 'function') {
            this.filterEquipment();
        }
        
        // Update URL without page reload
        const url = new URL(window.location);
        if (query) {
            url.searchParams.set('search', query);
        } else {
            url.searchParams.delete('search');
        }
        window.history.replaceState({}, '', url);
    },
    
    // Setup smooth scrolling for navigation
    setupSmoothScrolling: function() {
        const smoothScrollLinks = document.querySelectorAll('.smooth-scroll');
        const navbarHeight = document.querySelector('.navbar')?.offsetHeight || 80;
        
        smoothScrollLinks.forEach(link => {
            link.addEventListener('click', function(e) {
                const targetId = this.getAttribute('href');
                
                // Only handle hash links on same page
                if (targetId && targetId.startsWith('#')) {
                    const targetElement = document.querySelector(targetId);
                    
                    if (targetElement) {
                        e.preventDefault();
                        
                        // Calculate position with navbar offset
                        const targetPosition = targetElement.offsetTop - navbarHeight;
                        
                        // Smooth scroll to target
                        window.scrollTo({
                            top: targetPosition,
                            behavior: 'smooth'
                        });
                        
                        // Close mobile menu if open
                        const navbarCollapse = document.querySelector('.navbar-collapse');
                        if (navbarCollapse && navbarCollapse.classList.contains('show')) {
                            const bsCollapse = bootstrap.Collapse.getInstance(navbarCollapse);
                            if (bsCollapse) {
                                bsCollapse.hide();
                            }
                        }
                        
                        // Update URL hash without jumping
                        if (history.pushState) {
                            history.pushState(null, null, targetId);
                        }
                    }
                }
            });
        });
    },
    
    // Setup scroll spy for active section highlighting
    setupScrollSpy: function() {
        const sections = document.querySelectorAll('section[id]');
        const navLinks = document.querySelectorAll('.smooth-scroll');
        const navbarHeight = document.querySelector('.navbar')?.offsetHeight || 80;
        
        if (sections.length === 0 || navLinks.length === 0) return;
        
        const observerOptions = {
            root: null,
            rootMargin: `-${navbarHeight + 50}px 0px -50% 0px`,
            threshold: 0
        };
        
        const observerCallback = (entries) => {
            entries.forEach(entry => {
                if (entry.isIntersecting) {
                    const sectionId = entry.target.getAttribute('id');
                    
                    // Remove active class from all links
                    navLinks.forEach(link => {
                        link.classList.remove('active');
                    });
                    
                    // Add active class to current section link
                    const activeLink = document.querySelector(`.smooth-scroll[href="#${sectionId}"]`);
                    if (activeLink) {
                        activeLink.classList.add('active');
                    }
                }
            });
        };
        
        const observer = new IntersectionObserver(observerCallback, observerOptions);
        
        sections.forEach(section => {
            observer.observe(section);
        });
    },
    
    // Setup back to top button
    setupBackToTop: function() {
        // Create back to top button
        const backToTopBtn = document.createElement('button');
        backToTopBtn.innerHTML = '<i class="fas fa-chevron-up"></i>';
        backToTopBtn.className = 'back-to-top-btn';
        backToTopBtn.setAttribute('aria-label', 'Retour en haut');
        backToTopBtn.setAttribute('title', 'Retour en haut');
        document.body.appendChild(backToTopBtn);
        
        // Show/hide based on scroll position with smooth animation
        window.addEventListener('scroll', () => {
            if (window.pageYOffset > 400) {
                backToTopBtn.classList.add('show');
            } else {
                backToTopBtn.classList.remove('show');
            }
        });
        
        // Scroll to top on click
        backToTopBtn.addEventListener('click', () => {
            window.scrollTo({
                top: 0,
                behavior: 'smooth'
            });
        });
    },
    
    // Setup form validation
    setupFormValidation: function() {
        const forms = document.querySelectorAll('.needs-validation');
        forms.forEach(form => {
            form.addEventListener('submit', (event) => {
                if (!form.checkValidity()) {
                    event.preventDefault();
                    event.stopPropagation();
                }
                form.classList.add('was-validated');
            });
        });
    },
    
    // Setup lazy loading for images
    setupLazyLoading: function() {
        const images = document.querySelectorAll('img[data-src]');
        
        if ('IntersectionObserver' in window) {
            const imageObserver = new IntersectionObserver((entries, observer) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        const img = entry.target;
                        img.src = img.dataset.src;
                        img.classList.remove('lazy');
                        imageObserver.unobserve(img);
                    }
                });
            });
            
            images.forEach(img => imageObserver.observe(img));
        } else {
            // Fallback for older browsers
            images.forEach(img => {
                img.src = img.dataset.src;
                img.classList.remove('lazy');
            });
        }
    },
    
    // Initialize components
    initializeComponents: function() {
        // Initialize tooltips
        const tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'));
        tooltipTriggerList.map(function (tooltipTriggerEl) {
            return new bootstrap.Tooltip(tooltipTriggerEl);
        });
        
        // Initialize popovers
        const popoverTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="popover"]'));
        popoverTriggerList.map(function (popoverTriggerEl) {
            return new bootstrap.Popover(popoverTriggerEl);
        });
        
        // Initialize date pickers if available
        this.initializeDatePickers();
        
        // Initialize price range sliders
        this.initializePriceRangeSliders();
    },
    
    // Initialize date pickers
    initializeDatePickers: function() {
        const dateInputs = document.querySelectorAll('input[type="date"]');
        dateInputs.forEach(input => {
            // Set minimum date to today
            const today = new Date().toISOString().split('T')[0];
            if (input.classList.contains('start-date')) {
                input.min = today;
            }
            
            // Update end date minimum when start date changes
            if (input.classList.contains('start-date')) {
                input.addEventListener('change', (e) => {
                    const endDateInput = document.querySelector('.end-date');
                    if (endDateInput) {
                        endDateInput.min = e.target.value;
                        if (endDateInput.value && endDateInput.value < e.target.value) {
                            endDateInput.value = '';
                        }
                    }
                });
            }
        });
    },
    
    // Initialize price range sliders
    initializePriceRangeSliders: function() {
        const priceSliders = document.querySelectorAll('.price-range-slider input[type="range"]');
        priceSliders.forEach(slider => {
            slider.addEventListener('input', (e) => {
                const value = e.target.value;
                const isMin = e.target.classList.contains('min-price');
                
                if (isMin) {
                    this.state.priceRange.min = parseInt(value);
                } else {
                    this.state.priceRange.max = parseInt(value);
                }
                
                // Update display
                const display = e.target.parentElement.querySelector('.price-display');
                if (display) {
                    const minSpan = display.querySelector('.min-price-display');
                    const maxSpan = display.querySelector('.max-price-display');
                    if (minSpan) minSpan.textContent = this.state.priceRange.min + ' MAD';
                    if (maxSpan) maxSpan.textContent = this.state.priceRange.max + ' MAD';
                }
                
                // Trigger filter update
                if (typeof this.filterEquipment === 'function') {
                    this.debounce(this.filterEquipment.bind(this), 300)();
                }
            });
        });
    },
    
    // Load user session
    loadUserSession: function() {
        // Check for user session in localStorage or sessionStorage
        const userData = localStorage.getItem('yours_user');
        if (userData) {
            try {
                this.user = JSON.parse(userData);
                this.updateUIForLoggedInUser();
            } catch (e) {
                console.error('Error parsing user data:', e);
                localStorage.removeItem('yours_user');
            }
        }
    },
    
    // Update UI for logged in user
    updateUIForLoggedInUser: function() {
        const userMenus = document.querySelectorAll('.user-menu');
        const guestMenus = document.querySelectorAll('.guest-menu');
        
        userMenus.forEach(menu => menu.style.display = 'block');
        guestMenus.forEach(menu => menu.style.display = 'none');
        
        // Update user name displays
        const userNameElements = document.querySelectorAll('.user-name');
        userNameElements.forEach(element => {
            element.textContent = `${this.user.prenom} ${this.user.nom}`;
        });
    },
    
    // Utility functions
    debounce: function(func, wait) {
        let timeout;
        return function executedFunction(...args) {
            const later = () => {
                clearTimeout(timeout);
                func(...args);
            };
            clearTimeout(timeout);
            timeout = setTimeout(later, wait);
        };
    },
    
    // Show loading spinner
    showLoading: function(element = null) {
        if (element) {
            const spinner = document.createElement('div');
            spinner.className = 'loading-spinner';
            spinner.innerHTML = '<div class="spinner-border text-primary" role="status"><span class="visually-hidden">Chargement...</span></div>';
            element.appendChild(spinner);
        } else {
            // Show global loading overlay
            const overlay = document.createElement('div');
            overlay.className = 'loading-overlay';
            overlay.innerHTML = `
                <div class="text-center">
                    <div class="spinner-border text-primary mb-3" role="status" style="width: 3rem; height: 3rem;">
                        <span class="visually-hidden">Chargement...</span>
                    </div>
                    <p class="text-muted">Chargement en cours...</p>
                </div>
            `;
            document.body.appendChild(overlay);
        }
    },
    
    // Hide loading spinner
    hideLoading: function(element = null) {
        if (element) {
            const spinner = element.querySelector('.loading-spinner');
            if (spinner) spinner.remove();
        } else {
            const overlay = document.querySelector('.loading-overlay');
            if (overlay) overlay.remove();
        }
    },
    
    // Show toast notification
    showToast: function(message, type = 'info', duration = 5000) {
        // Use the centralized notification system
        if (window.notificationSystem) {
            switch(type) {
                case 'success':
                    notificationSystem.success(message, duration);
                    break;
                case 'danger':
                case 'error':
                    notificationSystem.error(message, duration);
                    break;
                case 'warning':
                    notificationSystem.warning(message, duration);
                    break;
                case 'info':
                default:
                    notificationSystem.info(message, duration);
                    break;
            }
        } else {
            // Fallback to old system if notification system not loaded
            console.warn('Notification system not loaded, using fallback');
            this.showToastFallback(message, type, duration);
        }
    },
    
    // Fallback toast method (old implementation)
    showToastFallback: function(message, type = 'info', duration = 5000) {
        const toastContainer = document.querySelector('.toast-container') || this.createToastContainer();
        
        const toastId = 'toast-' + Date.now();
        const toast = document.createElement('div');
        toast.className = `toast align-items-center text-white bg-${type} border-0`;
        toast.id = toastId;
        toast.setAttribute('role', 'alert');
        toast.innerHTML = `
            <div class="d-flex">
                <div class="toast-body">
                    ${message}
                </div>
                <button type="button" class="btn-close btn-close-white me-2 m-auto" data-bs-dismiss="toast"></button>
            </div>
        `;
        
        toastContainer.appendChild(toast);
        
        const bsToast = new bootstrap.Toast(toast, { delay: duration });
        bsToast.show();
        
        // Remove toast element after it's hidden
        toast.addEventListener('hidden.bs.toast', () => {
            toast.remove();
        });
    },
    
    // Create toast container if it doesn't exist
    createToastContainer: function() {
        const container = document.createElement('div');
        container.className = 'toast-container position-fixed top-0 end-0 p-3';
        container.style.zIndex = '1055';
        document.body.appendChild(container);
        return container;
    },
    
    // Format currency
    formatCurrency: function(amount) {
        return new Intl.NumberFormat('fr-MA', {
            style: 'currency',
            currency: 'MAD'
        }).format(amount);
    },
    
    // Format date
    formatDate: function(dateString, options = {}) {
        const defaultOptions = {
            year: 'numeric',
            month: 'long',
            day: 'numeric'
        };
        return new Date(dateString).toLocaleDateString('fr-FR', { ...defaultOptions, ...options });
    },
    
    // Calculate days between dates
    calculateDays: function(startDate, endDate) {
        const start = new Date(startDate);
        const end = new Date(endDate);
        const diffTime = Math.abs(end - start);
        return Math.ceil(diffTime / (1000 * 60 * 60 * 24));
    },
    
    // Validate email
    validateEmail: function(email) {
        const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        return re.test(email);
    },
    
    // Validate phone number (Moroccan format)
    validatePhone: function(phone) {
        const re = /^(\+212|0)[5-7][0-9]{8}$/;
        return re.test(phone.replace(/\s/g, ''));
    },
    
    // Show confirmation dialog
    showConfirmDialog: function(title, message, onConfirm, onCancel = null) {
        const modal = document.createElement('div');
        modal.className = 'modal fade';
        modal.innerHTML = `
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">${title}</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                    </div>
                    <div class="modal-body">
                        <p>${message}</p>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annuler</button>
                        <button type="button" class="btn btn-primary confirm-btn">Confirmer</button>
                    </div>
                </div>
            </div>
        `;
        
        document.body.appendChild(modal);
        
        const bsModal = new bootstrap.Modal(modal);
        bsModal.show();
        
        // Handle confirm button
        modal.querySelector('.confirm-btn').addEventListener('click', () => {
            if (onConfirm) onConfirm();
            bsModal.hide();
        });
        
        // Handle cancel
        modal.addEventListener('hidden.bs.modal', () => {
            if (onCancel) onCancel();
            modal.remove();
        });
    },
    
    // Handle errors
    handleError: function(error, showToUser = true) {
        console.error('Application Error:', error);
        
        if (showToUser) {
            let message = 'Une erreur est survenue. Veuillez réessayer.';
            
            if (error.message) {
                message = error.message;
            } else if (typeof error === 'string') {
                message = error;
            }
            
            this.showToast(message, 'danger');
        }
    },
    
    // Local storage helpers
    storage: {
        set: function(key, value) {
            try {
                localStorage.setItem(`yours_${key}`, JSON.stringify(value));
            } catch (e) {
                console.error('Error saving to localStorage:', e);
            }
        },
        
        get: function(key) {
            try {
                const item = localStorage.getItem(`yours_${key}`);
                return item ? JSON.parse(item) : null;
            } catch (e) {
                console.error('Error reading from localStorage:', e);
                return null;
            }
        },
        
        remove: function(key) {
            localStorage.removeItem(`yours_${key}`);
        },
        
        clear: function() {
            Object.keys(localStorage).forEach(key => {
                if (key.startsWith('yours_')) {
                    localStorage.removeItem(key);
                }
            });
        }
    }
};

// Initialize application when DOM is loaded
document.addEventListener('DOMContentLoaded', function() {
    YOURS.init();
});

// Handle page visibility changes
document.addEventListener('visibilitychange', function() {
    if (document.hidden) {
        // Page is hidden
        console.log('Page hidden');
    } else {
        // Page is visible
        console.log('Page visible');
    }
});

// Handle online/offline status
window.addEventListener('online', function() {
    YOURS.showToast('Connexion rétablie', 'success');
});

window.addEventListener('offline', function() {
    YOURS.showToast('Connexion perdue', 'warning');
});

// Export YOURS object for use in other scripts
window.YOURS = YOURS;

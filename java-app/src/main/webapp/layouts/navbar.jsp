<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Check if user is logged in and on specific page types
    boolean isClientPage = request.getRequestURI().contains("/client/");
    boolean isPartnerPage = request.getRequestURI().contains("/partner/");
    boolean isEquipmentPage = request.getRequestURI().contains("/equipment/");
    boolean isLoggedIn = session.getAttribute("user") != null;
    boolean showClientNav = (isClientPage || isEquipmentPage) && isLoggedIn;
    boolean showPartnerNav = isPartnerPage && isLoggedIn;
%>

<style>
/* Clean, minimal hover effects */

/* Dropdown menu items */
#clientDropdownMenu .dropdown-item {
    padding: 0.75rem 1rem !important;
    margin: 0.1rem 0 !important;
    border-radius: 0.375rem !important;
    transition: all 0.2s ease !important;
    color: #6b7280 !important;
    font-weight: 500 !important;
    border: none !important;
}

#clientDropdownMenu .dropdown-item:hover {
    background-color: #374151 !important;
    color: white !important;
}

#clientDropdownMenu .dropdown-item.active {
    background-color: #dbeafe !important;
    color: #1e40af !important;
    font-weight: 600 !important;
}

#clientDropdownMenu .dropdown-item.active:hover {
    background-color: #1e40af !important;
    color: white !important;
}

#clientDropdownMenu .dropdown-item.text-danger {
    color: #dc2626 !important;
}

#clientDropdownMenu .dropdown-item.text-danger:hover {
    background-color: #dc2626 !important;
    color: white !important;
}

/* Main navigation items */
.navbar-client-dashboard .nav-link-client {
    padding: 0.5rem 0.75rem !important;
    margin: 0 0.125rem !important;
    border-radius: 0.75rem !important;
    transition: all 0.2s ease !important;
    color: #6b7280 !important;
    font-weight: 500 !important;
    border: none !important;
}

.navbar-client-dashboard .nav-link-client:hover {
    background-color: #374151 !important;
    color: white !important;
}

/* Profile dropdown button special styling */
.navbar-client-dashboard .nav-link-client[data-bs-toggle="dropdown"]:hover {
    background-color: #dbeafe !important;
    color: #1e40af !important;
}

.navbar-client-dashboard .nav-link-client.active {
    background-color: #dbeafe !important;
    color: #1e40af !important;
    font-weight: 600 !important;
}

.navbar-client-dashboard .nav-link-client.active:hover {
    background-color: #1e40af !important;
    color: white !important;
}

/* User avatar */
.navbar-client-dashboard .user-avatar {
    width: 32px;
    height: 32px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    background-color: #dbeafe;
    color: white;
    transition: all 0.2s ease;
}

.navbar-client-dashboard .nav-link-client:hover .user-avatar {
    background-color: #1e40af;
    color: white;
}

/* Dropdown menu */
#clientDropdownMenu {
    border: 1px solid #e5e7eb !important;
    box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1) !important;
    border-radius: 0.5rem !important;
    padding: 0.5rem !important;
    margin-top: 0.5rem !important;
    min-width: 200px !important;
}

#clientDropdownMenu .dropdown-header {
    padding: 0.75rem 1rem !important;
    background-color: #f9fafb !important;
    margin-bottom: 0.25rem !important;
    border-radius: 0.375rem !important;
}

#clientDropdownMenu .dropdown-divider {
    margin: 0.5rem 0 !important;
    border-color: #e5e7eb !important;
}

/* Partner Dashboard Navigation */
.navbar-partner-dashboard .nav-link-partner {
    padding: 0.5rem 0.75rem !important;
    margin: 0 0.125rem !important;
    border-radius: 0.75rem !important;
    transition: all 0.2s ease !important;
    color: #6b7280 !important;
    font-weight: 500 !important;
    text-decoration: none !important;
}

.navbar-partner-dashboard .nav-link-partner:hover {
    background-color: #374151 !important;
    color: white !important;
}

.navbar-partner-dashboard .nav-link-partner[data-bs-toggle="dropdown"]:hover {
    background-color: #374151 !important;
    color: white !important;
}

.navbar-partner-dashboard .nav-link-partner.active {
    background-color: #dcfce7 !important;
    color: #059669 !important;
    font-weight: 600 !important;
}

.navbar-partner-dashboard .nav-link-partner.active:hover {
    background-color: #059669 !important;
    color: white !important;
}

.navbar-partner-dashboard .user-avatar {
    width: 32px;
    height: 32px;
    border-radius: 50%;
    background: linear-gradient(135deg, #10b981, #059669);
    display: flex;
    align-items: center;
    justify-content: center;
    color: white;
    font-weight: 600;
    font-size: 0.875rem;
    margin-right: 0.5rem;
    transition: all 0.2s ease;
}

.navbar-partner-dashboard .nav-link-partner:hover .user-avatar {
    transform: scale(1.05);
    box-shadow: 0 2px 8px rgba(16, 185, 129, 0.3);
}

/* Partner Dropdown menu */
#partnerDropdownMenu {
    border: 1px solid #e5e7eb !important;
    box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1) !important;
    border-radius: 0.5rem !important;
    padding: 0.5rem !important;
    margin-top: 0.5rem !important;
    min-width: 200px !important;
}

#partnerDropdownMenu .dropdown-item {
    padding: 0.75rem 1rem !important;
    margin: 0.1rem 0 !important;
    border-radius: 0.375rem !important;
    transition: all 0.2s ease !important;
    color: #6b7280 !important;
    font-weight: 500 !important;
    border: none !important;
}

#partnerDropdownMenu .dropdown-item:hover {
    background-color: #374151 !important;
    color: white !important;
}

#partnerDropdownMenu .dropdown-item.active {
    background-color: #dcfce7 !important;
    color: #059669 !important;
    font-weight: 600 !important;
}

#partnerDropdownMenu .dropdown-item.active:hover {
    background-color: #059669 !important;
    color: white !important;
}

#partnerDropdownMenu .dropdown-item.text-danger {
    color: #dc2626 !important;
}

#partnerDropdownMenu .dropdown-item.text-danger:hover {
    background-color: #dc2626 !important;
    color: white !important;
}

/* Public navigation items styling */
.navbar-modern .nav-link-modern {
    padding: 0.5rem 0.75rem !important;
    margin: 0 0.125rem !important;
    border-radius: 0.75rem !important;
    transition: all 0.2s ease !important;
    color: #6b7280 !important;
    font-weight: 500 !important;
    border: none !important;
}

.navbar-modern .nav-link-modern:hover {
    background-color: #374151 !important;
    color: white !important;
}

.navbar-modern .nav-link-modern.active {
    background-color: #dbeafe !important;
    color: #1e40af !important;
    font-weight: 600 !important;
}

.navbar-modern .nav-link-modern.active:hover {
    background-color: #1e40af !important;
    color: white !important;
}

/* Enhanced Authentication Buttons */
.btn-auth-login {
    background: transparent !important;
    color: var(--primary-600) !important;
    border: 2px solid var(--primary-600) !important;
    border-radius: 0.75rem !important;
    padding: 0.75rem 1.5rem !important;
    font-weight: 600 !important;
    font-size: 0.9375rem !important;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1) !important;
    text-decoration: none !important;
    display: inline-flex !important;
    align-items: center !important;
    justify-content: center !important;
    letter-spacing: 0.01em !important;
    position: relative !important;
    overflow: hidden !important;
    min-width: 120px !important;
    height: 40px !important;
    box-shadow: 0 2px 4px rgba(37, 99, 235, 0.1) !important;
}

.btn-auth-login::before {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: linear-gradient(90deg, transparent, rgba(37, 99, 235, 0.1), transparent);
    transition: left 0.6s ease;
}

.btn-auth-login:hover {
    background: var(--primary-600) !important;
    color: white !important;
    border-color: var(--primary-600) !important;
    transform: translateY(-2px) scale(1.02) !important;
    box-shadow: 0 8px 20px -5px rgba(37, 99, 235, 0.3), 0 4px 8px -2px rgba(37, 99, 235, 0.2) !important;
    text-decoration: none !important;
}

.btn-auth-login:hover::before {
    left: 100%;
}

.btn-auth-login:active {
    transform: translateY(-1px) scale(1.01) !important;
    box-shadow: 0 4px 12px -2px rgba(37, 99, 235, 0.3) !important;
}

.btn-auth-login i {
    transition: transform 0.3s ease;
}

.btn-auth-login:hover i {
    transform: translateX(2px);
}

.btn-auth-signup {
    background: linear-gradient(135deg, var(--primary-600), var(--primary-700)) !important;
    border: none !important;
    color: white !important;
    font-weight: 700 !important;
    padding: 0.75rem 1.5rem !important;
    border-radius: 0.75rem !important;
    transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1) !important;
    position: relative !important;
    overflow: hidden !important;
    box-shadow: 0 4px 12px -2px rgba(37, 99, 235, 0.3) !important;
    letter-spacing: 0.01em !important;
    text-decoration: none !important;
    display: inline-flex !important;
    align-items: center !important;
    justify-content: center !important;
    min-width: 130px !important;
    height: 40px !important;
}

.btn-auth-signup::before {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.25), transparent);
    transition: left 0.6s ease;
}

.btn-auth-signup:hover {
    background: linear-gradient(135deg, var(--primary-700), var(--primary-800)) !important;
    transform: translateY(-3px) scale(1.02) !important;
    box-shadow: 0 12px 25px -5px rgba(37, 99, 235, 0.4), 0 6px 12px -2px rgba(37, 99, 235, 0.3) !important;
    color: white !important;
    text-decoration: none !important;
}

.btn-auth-signup:hover::before {
    left: 100%;
}

.btn-auth-signup:active {
    transform: translateY(-1px) scale(1.01) !important;
    box-shadow: 0 6px 16px -2px rgba(37, 99, 235, 0.4) !important;
}

.btn-auth-signup i {
    transition: transform 0.3s ease;
}

.btn-auth-signup:hover i {
    transform: translateX(2px) scale(1.1);
}

/* Focus states for accessibility */
.btn-auth-login:focus,
.btn-auth-signup:focus {
    outline: 2px solid var(--primary-500) !important;
    outline-offset: 2px !important;
}

/* Mobile responsive adjustments */
@media (max-width: 768px) {
    .btn-auth-login,
    .btn-auth-signup {
        padding: 0.625rem 1.25rem !important;
        font-size: 0.875rem !important;
        min-width: 100px !important;
        height: 38px !important;
    }
    
    .navbar-nav .nav-item.ms-3 {
        margin-left: 0.75rem !important;
    }
}

@media (max-width: 576px) {
    .btn-auth-login,
    .btn-auth-signup {
        padding: 0.5rem 1rem !important;
        font-size: 0.8125rem !important;
        min-width: 90px !important;
        height: 36px !important;
    }
    
    .navbar-nav .nav-item.ms-3 {
        margin-left: 0.5rem !important;
    }
    
    .btn-auth-login i,
    .btn-auth-signup i {
        margin-right: 0.375rem !important;
    }
}
</style>

<script>
// Check for client-side user session
function checkClientSession() {
    try {
        const user = localStorage.getItem('yours_user') || sessionStorage.getItem('yours_user');
        if (user) {
            // Parse user data
            const userData = JSON.parse(user);
            
            // Check if user is a client and on relevant pages (client pages or equipment pages)
            const isClientUser = userData.type === 'client';
            const isPartnerUser = userData.type === 'partner';
            const isClientPage = window.location.pathname.includes('/client/');
            const isPartnerPage = window.location.pathname.includes('/partner/');
            const isEquipmentPage = window.location.pathname.includes('/equipment/');
            
            if (isClientUser && (isClientPage || isEquipmentPage)) {
                // Force show client navigation
                const clientNav = document.querySelector('.navbar-client-dashboard');
                const partnerNav = document.querySelector('.navbar-partner-dashboard');
                const publicNav = document.querySelector('.navbar-modern');
                if (clientNav && publicNav) {
                    publicNav.style.display = 'none';
                    if (partnerNav) partnerNav.style.display = 'none';
                    clientNav.style.display = 'block';
                    
                    // Update user info in navbar
                    const userName = document.getElementById('clientUserName');
                    const userFullName = document.getElementById('clientUserFullName');
                    const userEmail = document.getElementById('clientUserEmail');
                    
                    if (userName) userName.textContent = userData.prenom || 'Client';
                    if (userFullName) userFullName.textContent = `${userData.prenom || ''} ${userData.nom || ''}`.trim() || 'Client';
                    if (userEmail) userEmail.textContent = userData.email || 'client@email.com';
                }
            } else if (isPartnerUser && isPartnerPage) {
                // Force show partner navigation
                const clientNav = document.querySelector('.navbar-client-dashboard');
                const partnerNav = document.querySelector('.navbar-partner-dashboard');
                const publicNav = document.querySelector('.navbar-modern');
                if (partnerNav && publicNav) {
                    publicNav.style.display = 'none';
                    if (clientNav) clientNav.style.display = 'none';
                    partnerNav.style.display = 'block';
                    
                    // Update user info in navbar
                    const userName = document.getElementById('partnerUserName');
                    const dropdownName = document.getElementById('partnerDropdownName');
                    
                    if (userName) userName.textContent = userData.prenom || 'Partenaire';
                    if (dropdownName) dropdownName.textContent = `${userData.prenom || ''} ${userData.nom || ''}`.trim() || 'Partenaire';
                }
            }
        }
    } catch (error) {
        console.error('Error checking client session:', error);
    }
}

// Function to highlight active dropdown menu item
function highlightActiveDropdownItem() {
    const currentPath = window.location.pathname;
    const dropdownItems = document.querySelectorAll('#clientDropdownMenu .dropdown-item');
    
    // Clear all active states first
    dropdownItems.forEach(item => {
        item.classList.remove('active');
    });
    
    // Check each dropdown item
    dropdownItems.forEach(item => {
        const href = item.getAttribute('href');
        if (href) {
            // Extract the page name from href
            const pageName = href.split('/').pop().replace('.jsp', '');
            
            // Check if current path contains this page
            if (currentPath.includes(pageName)) {
                item.classList.add('active');
            }
        }
    });
}

// Function to highlight active main navigation item
function highlightActiveMainNavItem() {
    const currentPath = window.location.pathname;
    const mainNavItems = document.querySelectorAll('.navbar-client-dashboard .nav-link-client');
    
    // Clear all active states first
    mainNavItems.forEach(item => {
        item.classList.remove('active');
    });
    
    // Check each main navigation item
    mainNavItems.forEach(item => {
        const href = item.getAttribute('href');
        if (href) {
            // Extract the page name from href
            const pageName = href.split('/').pop().replace('.jsp', '');
            
            // Check if current path contains this page
            if (currentPath.includes(pageName)) {
                item.classList.add('active');
            }
        }
    });
}

// Function to highlight active partner navigation item
function highlightActivePartnerNavItem() {
    const currentPath = window.location.pathname;
    const partnerNavItems = document.querySelectorAll('.navbar-partner-dashboard .nav-link-partner');
    
    // Clear all active states first
    partnerNavItems.forEach(item => {
        item.classList.remove('active');
    });
    
    // Check each partner navigation item
    partnerNavItems.forEach(item => {
        const href = item.getAttribute('href');
        if (href) {
            // Extract the page name from href
            const pageName = href.split('/').pop().replace('.jsp', '');
            
            // Check if current path contains this page
            if (currentPath.includes(pageName)) {
                item.classList.add('active');
            }
        }
    });
}

// Function to highlight active public navigation item
function highlightActivePublicNavItem() {
    const currentPath = window.location.pathname;
    const publicNavItems = document.querySelectorAll('.navbar-modern .nav-link-modern');
    
    // Clear all active states first
    publicNavItems.forEach(item => {
        item.classList.remove('active');
    });
    
    // Check each public navigation item
    publicNavItems.forEach(item => {
        const href = item.getAttribute('href');
        const dataSection = item.getAttribute('data-section');
        
        if (href && href.startsWith('#')) {
            // For hash links, check if we're on the homepage and the section matches
            if (currentPath === '/' || currentPath.includes('index.jsp')) {
                // Check if this is the current section based on scroll position or URL hash
                const currentHash = window.location.hash;
                if (currentHash === href || (href === '#accueil' && !currentHash)) {
                    item.classList.add('active');
                }
            }
        } else if (dataSection) {
            // For section-based navigation, check if current path matches
            if (currentPath.includes(dataSection)) {
                item.classList.add('active');
            }
        }
    });
}

// Run on page load
document.addEventListener('DOMContentLoaded', function() {
    checkClientSession();
    
    // Initialize Bootstrap dropdowns
    try {
        const dropdownElementList = [].slice.call(document.querySelectorAll('[data-bs-toggle="dropdown"]'));
        dropdownElementList.map(function (dropdownToggleEl) {
            return new bootstrap.Dropdown(dropdownToggleEl);
        });
    } catch (error) {
        console.error('Error initializing dropdowns:', error);
    }
    
    // Highlight active dropdown menu item based on current page
    highlightActiveDropdownItem();
    
    // Highlight active main navigation item based on current page
    highlightActiveMainNavItem();
    
    // Highlight active partner navigation item based on current page
    highlightActivePartnerNavItem();
    
    // Highlight active public navigation item based on current page
    highlightActivePublicNavItem();
    
    // Add fallback dropdown functionality for profile
    const profileDropdown = document.getElementById('clientProfileDropdown');
    const dropdownMenu = document.getElementById('clientDropdownMenu');
    
    if (profileDropdown && dropdownMenu) {
        profileDropdown.addEventListener('click', function(e) {
            e.preventDefault();
            console.log('Profile dropdown clicked');
            
            // Toggle dropdown visibility
            if (dropdownMenu.style.display === 'block') {
                dropdownMenu.style.display = 'none';
            } else {
                dropdownMenu.style.display = 'block';
                dropdownMenu.style.position = 'absolute';
                dropdownMenu.style.top = '100%';
                dropdownMenu.style.right = '0';
                dropdownMenu.style.zIndex = '1000';
            }
        });
        
        // Close dropdown when clicking outside
        document.addEventListener('click', function(e) {
            if (!profileDropdown.contains(e.target) && !dropdownMenu.contains(e.target)) {
                dropdownMenu.style.display = 'none';
            }
        });
    }
    
    // Add fallback dropdown functionality for notifications
    const notificationDropdown = document.getElementById('notificationDropdown');
    const notificationMenu = document.getElementById('notificationDropdownMenu');
    
    if (notificationDropdown && notificationMenu) {
        notificationDropdown.addEventListener('click', function(e) {
            e.preventDefault();
            console.log('Notification dropdown clicked');
            
            // Toggle dropdown visibility
            if (notificationMenu.style.display === 'block') {
                notificationMenu.style.display = 'none';
            } else {
                notificationMenu.style.display = 'block';
                notificationMenu.style.position = 'absolute';
                notificationMenu.style.top = '100%';
                notificationMenu.style.right = '0';
                notificationMenu.style.zIndex = '1000';
            }
        });
        
        // Close dropdown when clicking outside
        document.addEventListener('click', function(e) {
            if (!notificationDropdown.contains(e.target) && !notificationMenu.contains(e.target)) {
                notificationMenu.style.display = 'none';
            }
        });
    }
});
</script>

<!-- Client Dashboard Navigation -->
<nav class="navbar navbar-expand-lg navbar-client-dashboard fixed-top" style="display: <%= showClientNav ? "block" : "none" %>;">
        <div class="container-fluid px-4">
            <!-- Brand -->
            <a class="navbar-brand fw-bold d-flex align-items-center" href="${pageContext.request.contextPath}/pages/client/dashboard.jsp">
                <i class="fas fa-camera-retro me-2 text-primary" style="font-size: 1.5rem;"></i>
                <span style="background: linear-gradient(135deg, var(--primary-600), var(--primary-800)); background-clip: text; -webkit-background-clip: text; -webkit-text-fill-color: transparent; font-weight: 800;">YOURS</span>
            </a>

            <!-- Mobile toggle -->
            <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#navbarClientNav">
                <i class="fas fa-bars text-primary"></i>
            </button>

            <!-- Navigation items -->
            <div class="collapse navbar-collapse" id="navbarClientNav">
                <!-- Left Navigation -->
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link nav-link-client d-flex align-items-center" href="${pageContext.request.contextPath}/pages/client/dashboard.jsp">
                            <i class="bi bi-speedometer2 me-2"></i>Tableau de bord
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link nav-link-client d-flex align-items-center" href="${pageContext.request.contextPath}/pages/equipment/list-simple.jsp">
                            <i class="bi bi-grid me-2"></i>Matériel
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link nav-link-client d-flex align-items-center" href="${pageContext.request.contextPath}/pages/client/reservations.jsp">
                            <i class="bi bi-calendar-check me-2"></i>Réservations
                        </a>
                    </li>
                </ul>

                <!-- Right Navigation -->
                <ul class="navbar-nav ms-auto align-items-center">

                    <!-- Profile Dropdown -->
                    <li class="nav-item dropdown">
                        <a class="nav-link nav-link-client d-flex align-items-center" href="#" role="button" data-bs-toggle="dropdown" id="clientProfileDropdown">
                            <div class="user-avatar me-2">
                                <i class="bi bi-person-circle"></i>
                            </div>
                            <div class="user-info d-none d-lg-block">
                                <div class="user-name" id="clientUserName">Client</div>
                                <small class="user-role">Client</small>
                            </div>
                            <i class="bi bi-chevron-down ms-2"></i>
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end client-dropdown shadow-lg border-0" id="clientDropdownMenu">
                            <li class="dropdown-header">
                                <div class="d-flex align-items-center">
                                    <div class="user-avatar-large me-3">
                                        <i class="bi bi-person-circle"></i>
                                    </div>
                                    <div>
                                        <h6 class="mb-0" id="clientUserFullName">Client Name</h6>
                                        <small class="text-muted" id="clientUserEmail">client@email.com</small>
                                    </div>
                                </div>
                            </li>
                            <li><hr class="dropdown-divider"></li>
                            <li>
                                <a class="dropdown-item rounded" href="${pageContext.request.contextPath}/pages/client/profile.jsp">
                                    <i class="bi bi-person me-2 text-primary"></i>Mon Profil
                                </a>
                            </li>
                            <li>
                                <a class="dropdown-item rounded" href="${pageContext.request.contextPath}/pages/client/settings.jsp">
                                    <i class="bi bi-gear me-2 text-primary"></i>Paramètres
                                </a>
                            </li>
                            <li>
                                <a class="dropdown-item rounded" href="${pageContext.request.contextPath}/pages/client/favorites.jsp">
                                    <i class="bi bi-heart me-2 text-danger"></i>Favoris
                                </a>
                            </li>
                            <li>
                                <a class="dropdown-item rounded" href="${pageContext.request.contextPath}/pages/client/invoices.jsp">
                                    <i class="bi bi-receipt me-2 text-success"></i>Factures
                                </a>
                            </li>
                            <li><hr class="dropdown-divider"></li>
                            <li>
                                <a class="dropdown-item rounded text-danger" href="${pageContext.request.contextPath}/pages/auth/logout.jsp">
                                    <i class="bi bi-box-arrow-right me-2"></i>Déconnexion
                                </a>
                            </li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

<!-- Partner Navigation -->
<nav class="navbar navbar-expand-lg navbar-partner-dashboard fixed-top" style="display: <%= showPartnerNav ? "block" : "none" %>;">
    <div class="container-fluid px-4">
        <!-- Brand -->
        <a class="navbar-brand fw-bold d-flex align-items-center" href="${pageContext.request.contextPath}/pages/partner/dashboard.jsp">
            <i class="fas fa-handshake me-2" style="font-size: 1.5rem; color: #10b981;"></i>
            <span style="background: linear-gradient(135deg, #10b981, #059669); background-clip: text; -webkit-background-clip: text; -webkit-text-fill-color: transparent; font-weight: 800;">YOURS</span>
        </a>

        <!-- Mobile toggle -->
        <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#navbarPartnerNav">
            <i class="fas fa-bars" style="color: #10b981;"></i>
        </button>

        <!-- Navigation items -->
        <div class="collapse navbar-collapse" id="navbarPartnerNav">
            <!-- Left Navigation -->
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link nav-link-partner d-flex align-items-center" href="${pageContext.request.contextPath}/pages/partner/dashboard.jsp">
                        <i class="fas fa-tachometer-alt me-2"></i>Tableau de bord
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-link-partner d-flex align-items-center" href="${pageContext.request.contextPath}/pages/partner/equipment.jsp">
                        <i class="fas fa-boxes me-2"></i>Mon Matériel
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-link-partner d-flex align-items-center" href="${pageContext.request.contextPath}/pages/partner/reservations.jsp">
                        <i class="fas fa-calendar-check me-2"></i>Réservations
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-link-partner d-flex align-items-center" href="${pageContext.request.contextPath}/pages/partner/earnings.jsp">
                        <i class="fas fa-wallet me-2"></i>Mes Gains
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-link-partner d-flex align-items-center" href="${pageContext.request.contextPath}/pages/partner/analytics.jsp">
                        <i class="fas fa-chart-bar me-2"></i>Analytiques
                    </a>
                </li>
            </ul>

            <!-- Right Navigation -->
            <ul class="navbar-nav ms-auto align-items-center">
                <!-- Profile Dropdown -->
                <li class="nav-item dropdown">
                    <a class="nav-link nav-link-partner d-flex align-items-center" href="#" role="button" data-bs-toggle="dropdown" id="partnerProfileDropdown">
                        <div class="user-avatar me-2">
                            <i class="fas fa-user"></i>
                        </div>
                        <div class="user-info d-none d-lg-block">
                            <div class="user-name" id="partnerUserName">Partenaire</div>
                            <small class="user-role">Partenaire</small>
                        </div>
                        <i class="fas fa-chevron-down ms-2"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-menu-end shadow-lg border-0" id="partnerDropdownMenu">
                        <li class="dropdown-header">
                            <div class="d-flex align-items-center">
                                <div class="user-avatar me-2">
                                    <i class="fas fa-user"></i>
                                </div>
                                <div>
                                    <div class="fw-semibold" id="partnerDropdownName">Partenaire</div>
                                    <small class="text-muted">partenaire@demo.com</small>
                                </div>
                            </div>
                        </li>
                        <li><hr class="dropdown-divider"></li>
                        <li>
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/pages/partner/profile.jsp">
                                <i class="fas fa-user-circle me-2"></i>Mon Profil
                            </a>
                        </li>
                        <li>
                            <a class="dropdown-item" href="${pageContext.request.contextPath}/pages/partner/settings.jsp">
                                <i class="fas fa-cog me-2"></i>Paramètres
                            </a>
                        </li>
                        <li><hr class="dropdown-divider"></li>
                        <li>
                            <a class="dropdown-item text-danger" href="${pageContext.request.contextPath}/pages/auth/logout.jsp">
                                <i class="fas fa-sign-out-alt me-2"></i>Se déconnecter
                            </a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </div>
</nav>

<!-- Public Navigation -->
<nav class="navbar navbar-expand-lg navbar-modern fixed-top" style="display: <%= (showClientNav || showPartnerNav) ? "none" : "block" %>;">
    <div class="container">
        <!-- Brand -->
        <a class="navbar-brand fw-bold d-flex align-items-center" href="${pageContext.request.contextPath}/">
            <i class="fas fa-camera-retro me-2 text-primary" style="font-size: 1.5rem;"></i>
            <span style="background: linear-gradient(135deg, var(--primary-600), var(--primary-800)); background-clip: text; -webkit-background-clip: text; -webkit-text-fill-color: transparent; font-weight: 800;">YOURS</span>
        </a>

        <!-- Mobile toggle -->
        <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <i class="fas fa-bars text-primary"></i>
        </button>

        <!-- Navigation items -->
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link nav-link-modern smooth-scroll" href="#accueil" data-section="accueil">
                        <i class="fas fa-home me-2"></i>Accueil
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-link-modern smooth-scroll" href="#materiel" data-section="materiel">
                        <i class="fas fa-th-large me-2"></i>Mat&eacute;riel
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-link-modern smooth-scroll" href="#categories" data-section="categories">
                        <i class="fas fa-tags me-2"></i>Cat&eacute;gories
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-link-modern smooth-scroll" href="#contact" data-section="contact">
                        <i class="fas fa-envelope me-2"></i>Contact
                    </a>
                </li>
            </ul>

            <!-- User menu -->
            <ul class="navbar-nav">
                <!-- If user is not logged in -->
                <% if (session.getAttribute("user") == null) { %>
                    <li class="nav-item">
                        <a class="btn btn-outline-primary btn-auth-login" href="${pageContext.request.contextPath}/pages/auth/login.jsp">
                            <i class="fas fa-sign-in-alt me-2"></i>Connexion
                        </a>
                    </li>
                    <li class="nav-item ms-3">
                        <a class="btn btn-gradient btn-auth-signup" href="${pageContext.request.contextPath}/pages/auth/register-client.jsp">
                            <i class="fas fa-user-plus me-2"></i>S'inscrire
                        </a>
                    </li>
                <% } else { %>
                    <!-- If user is logged in -->
                    <li class="nav-item dropdown">
                        <a class="nav-link nav-link-modern dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
                            <i class="fas fa-user-circle me-2"></i>
                            ${sessionScope.user.prenom} ${sessionScope.user.nom}
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end shadow-lg border-0" style="border-radius: 1rem; padding: 0.5rem;">
                            <li><a class="dropdown-item rounded" href="${pageContext.request.contextPath}/pages/client/dashboard.jsp">
                                <i class="fas fa-tachometer-alt me-2 text-primary"></i>Tableau de bord
                            </a></li>
                            <li><a class="dropdown-item rounded" href="${pageContext.request.contextPath}/pages/client/profile.jsp">
                                <i class="fas fa-user me-2 text-primary"></i>Mon profil
                            </a></li>
                            <li><a class="dropdown-item rounded" href="${pageContext.request.contextPath}/pages/client/reservations.jsp">
                                <i class="fas fa-calendar-check me-2 text-primary"></i>Mes réservations
                            </a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item rounded text-danger" href="${pageContext.request.contextPath}/pages/auth/logout.jsp">
                                <i class="fas fa-sign-out-alt me-2"></i>Déconnexion
                            </a></li>
                        </ul>
                    </li>
                <% } %>
            </ul>
        </div>
    </div>
</nav>

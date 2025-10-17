<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Check if user is logged in and on a client page or equipment page
    boolean isClientPage = request.getRequestURI().contains("/client/");
    boolean isEquipmentPage = request.getRequestURI().contains("/equipment/");
    boolean isLoggedIn = session.getAttribute("user") != null;
    boolean showClientNav = (isClientPage || isEquipmentPage) && isLoggedIn;
%>

<style>
/* Dropdown menu item base styling */
#clientDropdownMenu .dropdown-item {
    padding: 0.75rem 1rem !important;
    margin: 0.25rem 0.5rem !important;
    border-radius: 0.5rem !important;
    transition: all 0.3s ease !important;
    position: relative;
    border: none !important;
}

/* Active dropdown menu item styling */
#clientDropdownMenu .dropdown-item.active {
    background: linear-gradient(135deg, #eff6ff 0%, #dbeafe 100%) !important;
    color: #2563eb !important;
    font-weight: 600 !important;
    box-shadow: 0 2px 8px rgba(37, 99, 235, 0.15) !important;
}

#clientDropdownMenu .dropdown-item.active:hover {
    background: linear-gradient(135deg, #dbeafe 0%, #bfdbfe 100%) !important;
    color: #1d4ed8 !important;
    transform: translateX(3px) !important;
    box-shadow: 0 4px 12px rgba(37, 99, 235, 0.2) !important;
}

#clientDropdownMenu .dropdown-item.active::before {
    content: '';
    position: absolute;
    left: 0;
    top: 0;
    bottom: 0;
    width: 3px;
    background: linear-gradient(180deg, #2563eb 0%, #1d4ed8 100%);
    border-radius: 0 2px 2px 0;
}

/* Hover state for non-active items */
#clientDropdownMenu .dropdown-item:hover:not(.active) {
    background: linear-gradient(135deg, #f8fafc 0%, #f1f5f9 100%) !important;
    color: #1e293b !important;
    transform: translateX(3px) !important;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08) !important;
}

/* Icon styling */
#clientDropdownMenu .dropdown-item i {
    transition: all 0.3s ease !important;
}

#clientDropdownMenu .dropdown-item:hover i {
    transform: scale(1.1) !important;
}

/* Logout item special styling */
#clientDropdownMenu .dropdown-item.text-danger:hover {
    background: linear-gradient(135deg, #fef2f2 0%, #fee2e2 100%) !important;
    color: #dc2626 !important;
    transform: translateX(3px) !important;
    box-shadow: 0 2px 8px rgba(220, 38, 38, 0.15) !important;
}

/* Favorites item special styling */
#clientDropdownMenu .dropdown-item:hover .bi-heart {
    color: #ef4444 !important;
    transform: scale(1.1) !important;
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
            const isClientPage = window.location.pathname.includes('/client/');
            const isEquipmentPage = window.location.pathname.includes('/equipment/');
            
            if (isClientUser && (isClientPage || isEquipmentPage)) {
                // Force show client navigation
                const clientNav = document.querySelector('.navbar-client-dashboard');
                const publicNav = document.querySelector('.navbar-modern');
                if (clientNav && publicNav) {
                    publicNav.style.display = 'none';
                    clientNav.style.display = 'block';
                    
                    // Update user info in navbar
                    const userName = document.getElementById('clientUserName');
                    const userFullName = document.getElementById('clientUserFullName');
                    const userEmail = document.getElementById('clientUserEmail');
                    
                    if (userName) userName.textContent = userData.prenom || 'Client';
                    if (userFullName) userFullName.textContent = `${userData.prenom || ''} ${userData.nom || ''}`.trim() || 'Client';
                    if (userEmail) userEmail.textContent = userData.email || 'client@email.com';
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
                <span style="background: linear-gradient(135deg, var(--primary-600), var(--primary-800)); -webkit-background-clip: text; -webkit-text-fill-color: transparent; font-weight: 800;">YOURS</span>
                <span class="client-badge ms-2">Client</span>
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

<!-- Public Navigation -->
<nav class="navbar navbar-expand-lg navbar-modern fixed-top" style="display: <%= showClientNav ? "none" : "block" %>;">
    <div class="container">
        <!-- Brand -->
        <a class="navbar-brand fw-bold d-flex align-items-center" href="${pageContext.request.contextPath}/">
            <i class="fas fa-camera-retro me-2 text-primary" style="font-size: 1.5rem;"></i>
            <span style="background: linear-gradient(135deg, var(--primary-600), var(--primary-800)); -webkit-background-clip: text; -webkit-text-fill-color: transparent; font-weight: 800;">YOURS</span>
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
                        <a class="nav-link nav-link-modern" href="${pageContext.request.contextPath}/pages/auth/login.jsp">
                            <i class="fas fa-sign-in-alt me-2"></i>Connexion
                        </a>
                    </li>
                    <li class="nav-item ms-2">
                        <a class="btn btn-gradient" href="${pageContext.request.contextPath}/pages/auth/register-client.jsp">
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

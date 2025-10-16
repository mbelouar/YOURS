<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Check if user is logged in and on a client page
    boolean isClientPage = request.getRequestURI().contains("/client/");
    boolean isLoggedIn = session.getAttribute("user") != null;
    boolean showClientNav = isClientPage && isLoggedIn;
%>

<script>
// Check for client-side user session
function checkClientSession() {
    try {
        const user = localStorage.getItem('yours_user') || sessionStorage.getItem('yours_user');
        if (user && window.location.pathname.includes('/client/')) {
            // Parse user data
            const userData = JSON.parse(user);
            
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
    } catch (error) {
        console.error('Error checking client session:', error);
    }
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
<nav class="navbar navbar-expand-lg navbar-client-dashboard fixed-top" style="display: none;">
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
                        <a class="nav-link nav-link-client" href="${pageContext.request.contextPath}/pages/client/dashboard.jsp">
                            <i class="bi bi-speedometer2 me-2"></i>Tableau de bord
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link nav-link-client" href="${pageContext.request.contextPath}/pages/equipment/list.jsp">
                            <i class="bi bi-grid me-2"></i>Matériel
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link nav-link-client" href="${pageContext.request.contextPath}/pages/client/reservations.jsp">
                            <i class="bi bi-calendar-check me-2"></i>Réservations
                        </a>
                    </li>
                </ul>

                <!-- Right Navigation -->
                <ul class="navbar-nav ms-auto align-items-center">
                    <!-- Notifications -->
                    <li class="nav-item dropdown me-2">
                        <a class="nav-link nav-link-client position-relative" href="#" role="button" data-bs-toggle="dropdown" id="notificationDropdown">
                            <i class="bi bi-bell" style="font-size: 1.25rem;"></i>
                            <span class="notification-badge">3</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end notification-dropdown shadow-lg border-0" id="notificationDropdownMenu">
                            <div class="dropdown-header d-flex justify-content-between align-items-center">
                                <h6 class="mb-0">Notifications</h6>
                                <span class="badge bg-primary rounded-pill">3</span>
                            </div>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item notification-item" href="#">
                                <div class="d-flex">
                                    <div class="notification-icon bg-success">
                                        <i class="bi bi-check-circle"></i>
                                    </div>
                                    <div class="notification-content">
                                        <p class="mb-0">Réservation confirmée</p>
                                        <small class="text-muted">Il y a 2 heures</small>
                                    </div>
                                </div>
                            </a>
                            <a class="dropdown-item notification-item" href="#">
                                <div class="d-flex">
                                    <div class="notification-icon bg-info">
                                        <i class="bi bi-info-circle"></i>
                                    </div>
                                    <div class="notification-content">
                                        <p class="mb-0">Nouveau matériel disponible</p>
                                        <small class="text-muted">Il y a 5 heures</small>
                                    </div>
                                </div>
                            </a>
                            <a class="dropdown-item notification-item" href="#">
                                <div class="d-flex">
                                    <div class="notification-icon bg-warning">
                                        <i class="bi bi-exclamation-triangle"></i>
                                    </div>
                                    <div class="notification-content">
                                        <p class="mb-0">Rappel: Retour dans 2 jours</p>
                                        <small class="text-muted">Il y a 1 jour</small>
                                    </div>
                                </div>
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item text-center text-primary small" href="#">Voir toutes les notifications</a>
                        </div>
                    </li>

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
<nav class="navbar navbar-expand-lg navbar-modern fixed-top">
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

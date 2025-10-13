<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
                    <a class="nav-link nav-link-modern" href="${pageContext.request.contextPath}/">
                        <i class="fas fa-home me-2"></i>Accueil
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-link-modern" href="${pageContext.request.contextPath}/pages/equipment/list-simple.jsp">
                        <i class="fas fa-th-large me-2"></i>Mat&eacute;riel
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-link-modern" href="${pageContext.request.contextPath}/pages/categories.jsp">
                        <i class="fas fa-tags me-2"></i>Cat&eacute;gories
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link nav-link-modern" href="${pageContext.request.contextPath}/pages/about.jsp">
                        <i class="fas fa-info-circle me-2"></i>&Agrave; propos
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

<!-- Spacer for fixed navbar -->
<div style="height: 80px;"></div>

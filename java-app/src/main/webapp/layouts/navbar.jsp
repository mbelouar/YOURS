<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-primary fixed-top">
    <div class="container">
        <!-- Brand -->
        <a class="navbar-brand fw-bold" href="${pageContext.request.contextPath}/">
            <i class="bi bi-camera-video me-2"></i>
            YOURS
        </a>

        <!-- Mobile toggle -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Navigation items -->
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/">
                        <i class="bi bi-house me-1"></i>Accueil
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/pages/equipment/list-simple.jsp">
                        <i class="bi bi-grid me-1"></i>Matériel
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/pages/categories.jsp">
                        <i class="bi bi-tags me-1"></i>Catégories
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/pages/about.jsp">
                        <i class="bi bi-info-circle me-1"></i>À propos
                    </a>
                </li>
            </ul>

            <!-- User menu -->
            <ul class="navbar-nav">
                <!-- If user is not logged in -->
                <% if (session.getAttribute("user") == null) { %>
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/pages/auth/login.jsp">
                            <i class="bi bi-box-arrow-in-right me-1"></i>Connexion
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="btn btn-outline-light ms-2" href="${pageContext.request.contextPath}/pages/auth/register-client.jsp">
                            <i class="bi bi-person-plus me-1"></i>S'inscrire
                        </a>
                    </li>
                <% } else { %>
                    <!-- If user is logged in -->
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
                            <i class="bi bi-person-circle me-1"></i>
                            ${sessionScope.user.prenom} ${sessionScope.user.nom}
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/pages/client/dashboard.jsp">
                                <i class="bi bi-speedometer2 me-2"></i>Tableau de bord
                            </a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/pages/client/profile.jsp">
                                <i class="bi bi-person me-2"></i>Mon profil
                            </a></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/pages/client/reservations.jsp">
                                <i class="bi bi-calendar-check me-2"></i>Mes réservations
                            </a></li>
                            <li><hr class="dropdown-divider"></li>
                            <li><a class="dropdown-item" href="${pageContext.request.contextPath}/pages/auth/logout.jsp">
                                <i class="bi bi-box-arrow-right me-2"></i>Déconnexion
                            </a></li>
                        </ul>
                    </li>
                <% } %>
            </ul>
        </div>
    </div>
</nav>

<!-- Spacer for fixed navbar -->
<div style="height: 76px;"></div>

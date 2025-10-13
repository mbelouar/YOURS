<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<footer class="bg-dark text-light py-5 mt-5">
    <div class="container">
        <div class="row">
            <!-- Company Info -->
            <div class="col-lg-4 col-md-6 mb-4">
                <h5 class="fw-bold mb-3">
                    <i class="bi bi-camera-video me-2"></i>
                    YOURS
                </h5>
                <p class="text-muted">
                    Système intelligent de gestion de location de matériel professionnel. 
                    Caméras, outils, équipements - tout ce dont vous avez besoin pour vos projets.
                </p>
                <div class="d-flex gap-3">
                    <a href="#" class="text-light"><i class="bi bi-facebook fs-4"></i></a>
                    <a href="#" class="text-light"><i class="bi bi-twitter fs-4"></i></a>
                    <a href="#" class="text-light"><i class="bi bi-instagram fs-4"></i></a>
                    <a href="#" class="text-light"><i class="bi bi-linkedin fs-4"></i></a>
                </div>
            </div>

            <!-- Quick Links -->
            <div class="col-lg-2 col-md-6 mb-4">
                <h6 class="fw-bold mb-3">Liens rapides</h6>
                <ul class="list-unstyled">
                    <li class="mb-2"><a href="${pageContext.request.contextPath}/" class="text-muted text-decoration-none">Accueil</a></li>
                    <li class="mb-2"><a href="${pageContext.request.contextPath}/equipment" class="text-muted text-decoration-none">Matériel</a></li>
                    <li class="mb-2"><a href="${pageContext.request.contextPath}/categories" class="text-muted text-decoration-none">Catégories</a></li>
                    <li class="mb-2"><a href="${pageContext.request.contextPath}/about" class="text-muted text-decoration-none">À propos</a></li>
                    <li class="mb-2"><a href="${pageContext.request.contextPath}/contact" class="text-muted text-decoration-none">Contact</a></li>
                </ul>
            </div>

            <!-- Services -->
            <div class="col-lg-3 col-md-6 mb-4">
                <h6 class="fw-bold mb-3">Services</h6>
                <ul class="list-unstyled">
                    <li class="mb-2"><a href="#" class="text-muted text-decoration-none">Location de caméras</a></li>
                    <li class="mb-2"><a href="#" class="text-muted text-decoration-none">Équipement audio</a></li>
                    <li class="mb-2"><a href="#" class="text-muted text-decoration-none">Outils professionnels</a></li>
                    <li class="mb-2"><a href="#" class="text-muted text-decoration-none">Support technique</a></li>
                    <li class="mb-2"><a href="#" class="text-muted text-decoration-none">Livraison</a></li>
                </ul>
            </div>

            <!-- Contact Info -->
            <div class="col-lg-3 col-md-6 mb-4">
                <h6 class="fw-bold mb-3">Contact</h6>
                <div class="text-muted">
                    <p class="mb-2">
                        <i class="bi bi-geo-alt me-2"></i>
                        123 Rue de la Technologie<br>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Casablanca, Maroc
                    </p>
                    <p class="mb-2">
                        <i class="bi bi-telephone me-2"></i>
                        +212 5 22 XX XX XX
                    </p>
                    <p class="mb-2">
                        <i class="bi bi-envelope me-2"></i>
                        contact@yours.ma
                    </p>
                    <p class="mb-0">
                        <i class="bi bi-clock me-2"></i>
                        Lun-Ven: 8h-18h
                    </p>
                </div>
            </div>
        </div>

        <hr class="my-4">

        <!-- Copyright -->
        <div class="row align-items-center">
            <div class="col-md-6">
                <p class="text-muted mb-0">
                    &copy; 2024 YOURS. Tous droits réservés.
                </p>
            </div>
            <div class="col-md-6 text-md-end">
                <a href="#" class="text-muted text-decoration-none me-3">Conditions d'utilisation</a>
                <a href="#" class="text-muted text-decoration-none me-3">Politique de confidentialité</a>
                <a href="#" class="text-muted text-decoration-none">Mentions légales</a>
            </div>
        </div>
    </div>
</footer>

<!-- Bootstrap 5 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- Custom JavaScript -->
<script src="${pageContext.request.contextPath}/js/main.js"></script>
<script src="${pageContext.request.contextPath}/js/mock-data.js"></script>

</body>
</html>

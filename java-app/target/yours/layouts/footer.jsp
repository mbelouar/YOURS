<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<footer style="background: linear-gradient(180deg, #1e293b 0%, #0f172a 100%); color: #e2e8f0; padding: 4rem 0 2rem 0; border-top: 1px solid rgba(255, 255, 255, 0.1);">
    <div class="container">
        <div class="row">
            <!-- Company Info -->
            <div class="col-lg-4 col-md-6 mb-4">
                <h5 class="fw-bold mb-3" style="color: white; font-size: 1.25rem; display: flex; align-items: center;">
                    <i class="fas fa-camera-retro me-2" style="color: var(--primary-500); font-size: 1.5rem;"></i>
                    YOURS
                </h5>
                <p style="color: #94a3b8; line-height: 1.7; margin-bottom: 1.5rem;">
                    Système intelligent de gestion de location de matériel professionnel. 
                    Caméras, outils, équipements - tout ce dont vous avez besoin pour vos projets.
                </p>
                <div class="d-flex gap-3">
                    <a href="#" style="color: #94a3b8; transition: all 0.3s ease; font-size: 1.25rem;" 
                       onmouseover="this.style.color='var(--primary-500)'" 
                       onmouseout="this.style.color='#94a3b8'">
                        <i class="fab fa-facebook"></i>
                    </a>
                    <a href="#" style="color: #94a3b8; transition: all 0.3s ease; font-size: 1.25rem;" 
                       onmouseover="this.style.color='var(--primary-500)'" 
                       onmouseout="this.style.color='#94a3b8'">
                        <i class="fab fa-twitter"></i>
                    </a>
                    <a href="#" style="color: #94a3b8; transition: all 0.3s ease; font-size: 1.25rem;" 
                       onmouseover="this.style.color='var(--primary-500)'" 
                       onmouseout="this.style.color='#94a3b8'">
                        <i class="fab fa-instagram"></i>
                    </a>
                    <a href="#" style="color: #94a3b8; transition: all 0.3s ease; font-size: 1.25rem;" 
                       onmouseover="this.style.color='var(--primary-500)'" 
                       onmouseout="this.style.color='#94a3b8'">
                        <i class="fab fa-linkedin"></i>
                    </a>
                </div>
            </div>

            <!-- Quick Links -->
            <div class="col-lg-2 col-md-6 mb-4">
                <h6 class="fw-bold mb-3" style="color: white; font-size: 1rem;">Liens Rapides</h6>
                <ul class="list-unstyled">
                    <li class="mb-2">
                        <a href="${pageContext.request.contextPath}/" 
                           style="color: #94a3b8; text-decoration: none; transition: all 0.3s ease; display: inline-block;"
                           onmouseover="this.style.color='var(--primary-400)'; this.style.paddingLeft='5px'" 
                           onmouseout="this.style.color='#94a3b8'; this.style.paddingLeft='0'">
                            Accueil
                        </a>
                    </li>
                    <li class="mb-2">
                        <a href="${pageContext.request.contextPath}/pages/equipment/list-simple.jsp" 
                           style="color: #94a3b8; text-decoration: none; transition: all 0.3s ease; display: inline-block;"
                           onmouseover="this.style.color='var(--primary-400)'; this.style.paddingLeft='5px'" 
                           onmouseout="this.style.color='#94a3b8'; this.style.paddingLeft='0'">
                            Matériel
                        </a>
                    </li>
                    <li class="mb-2">
                        <a href="${pageContext.request.contextPath}/pages/categories.jsp" 
                           style="color: #94a3b8; text-decoration: none; transition: all 0.3s ease; display: inline-block;"
                           onmouseover="this.style.color='var(--primary-400)'; this.style.paddingLeft='5px'" 
                           onmouseout="this.style.color='#94a3b8'; this.style.paddingLeft='0'">
                            Catégories
                        </a>
                    </li>
                    <li class="mb-2">
                        <a href="${pageContext.request.contextPath}/pages/about.jsp" 
                           style="color: #94a3b8; text-decoration: none; transition: all 0.3s ease; display: inline-block;"
                           onmouseover="this.style.color='var(--primary-400)'; this.style.paddingLeft='5px'" 
                           onmouseout="this.style.color='#94a3b8'; this.style.paddingLeft='0'">
                            À propos
                        </a>
                    </li>
                </ul>
            </div>

            <!-- Services -->
            <div class="col-lg-3 col-md-6 mb-4">
                <h6 class="fw-bold mb-3" style="color: white; font-size: 1rem;">Nos Services</h6>
                <ul class="list-unstyled">
                    <li class="mb-2">
                        <a href="#" style="color: #94a3b8; text-decoration: none; transition: all 0.3s ease; display: inline-block;"
                           onmouseover="this.style.color='var(--primary-400)'; this.style.paddingLeft='5px'" 
                           onmouseout="this.style.color='#94a3b8'; this.style.paddingLeft='0'">
                            <i class="fas fa-camera me-2"></i>Location de caméras
                        </a>
                    </li>
                    <li class="mb-2">
                        <a href="#" style="color: #94a3b8; text-decoration: none; transition: all 0.3s ease; display: inline-block;"
                           onmouseover="this.style.color='var(--primary-400)'; this.style.paddingLeft='5px'" 
                           onmouseout="this.style.color='#94a3b8'; this.style.paddingLeft='0'">
                            <i class="fas fa-microphone me-2"></i>Équipement audio
                        </a>
                    </li>
                    <li class="mb-2">
                        <a href="#" style="color: #94a3b8; text-decoration: none; transition: all 0.3s ease; display: inline-block;"
                           onmouseover="this.style.color='var(--primary-400)'; this.style.paddingLeft='5px'" 
                           onmouseout="this.style.color='#94a3b8'; this.style.paddingLeft='0'">
                            <i class="fas fa-tools me-2"></i>Outils professionnels
                        </a>
                    </li>
                    <li class="mb-2">
                        <a href="#" style="color: #94a3b8; text-decoration: none; transition: all 0.3s ease; display: inline-block;"
                           onmouseover="this.style.color='var(--primary-400)'; this.style.paddingLeft='5px'" 
                           onmouseout="this.style.color='#94a3b8'; this.style.paddingLeft='0'">
                            <i class="fas fa-headset me-2"></i>Support technique
                        </a>
                    </li>
                </ul>
            </div>

            <!-- Contact Info -->
            <div class="col-lg-3 col-md-6 mb-4">
                <h6 class="fw-bold mb-3" style="color: white; font-size: 1rem;">Contactez-nous</h6>
                <div style="color: #94a3b8;">
                    <p class="mb-3" style="line-height: 1.7;">
                        <i class="fas fa-map-marker-alt me-2" style="color: var(--primary-500);"></i>
                        123 Rue de la Technologie<br>
                        <span style="margin-left: 1.5rem;">Casablanca, Maroc</span>
                    </p>
                    <p class="mb-3">
                        <i class="fas fa-phone me-2" style="color: var(--primary-500);"></i>
                        +212 5 22 XX XX XX
                    </p>
                    <p class="mb-3">
                        <i class="fas fa-envelope me-2" style="color: var(--primary-500);"></i>
                        contact@yours.ma
                    </p>
                    <p class="mb-0">
                        <i class="fas fa-clock me-2" style="color: var(--primary-500);"></i>
                        Lun-Ven: 8h-18h
                    </p>
                </div>
            </div>
        </div>

        <hr style="border-color: rgba(255, 255, 255, 0.1); margin: 3rem 0 2rem 0;">

        <!-- Copyright -->
        <div class="row align-items-center">
            <div class="col-md-6 mb-3 mb-md-0">
                <p class="mb-0" style="color: #94a3b8;">
                    <i class="fas fa-copyright me-1"></i> 2024 <strong style="color: white;">YOURS</strong>. Tous droits réservés.
                </p>
            </div>
            <div class="col-md-6 text-md-end">
                <a href="#" style="color: #94a3b8; text-decoration: none; margin-right: 1.5rem; transition: color 0.3s ease;"
                   onmouseover="this.style.color='var(--primary-400)'" 
                   onmouseout="this.style.color='#94a3b8'">
                    Conditions d'utilisation
                </a>
                <a href="#" style="color: #94a3b8; text-decoration: none; margin-right: 1.5rem; transition: color 0.3s ease;"
                   onmouseover="this.style.color='var(--primary-400)'" 
                   onmouseout="this.style.color='#94a3b8'">
                    Politique de confidentialité
                </a>
                <a href="#" style="color: #94a3b8; text-decoration: none; transition: color 0.3s ease;"
                   onmouseover="this.style.color='var(--primary-400)'" 
                   onmouseout="this.style.color='#94a3b8'">
                    Mentions légales
                </a>
            </div>
        </div>
    </div>
</footer>

<!-- Bootstrap 5 JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- Custom JavaScript -->
<script src="${pageContext.request.contextPath}/js/main.js"></script>
<!-- Commentez ou supprimez cette ligne -->
<!-- <script src="${pageContext.request.contextPath}/js/mock-data.js"></script> -->

<!-- Notification System -->
<script src="${pageContext.request.contextPath}/js/notification-system.js"></script>

</body>
</html>

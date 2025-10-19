<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setAttribute("pageTitle", "Paramètres - YOURS");
%>

<%@ include file="../../layouts/header.jsp" %>
<%@ include file="../../layouts/navbar.jsp" %>

<!-- Page Header -->
<section class="py-5" style="background: linear-gradient(135deg, #1e40af 0%, #1e3a8a 50%, #1e293b 100%); margin-top: -80px; padding-top: calc(80px + 6rem) !important; padding-bottom: 6rem !important; min-height: 500px; height: 500px; position: relative; overflow: hidden;">
    <div style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; background: radial-gradient(circle at 20% 50%, rgba(59, 130, 246, 0.15) 0%, transparent 50%); opacity: 1;"></div>
    <div class="container" style="position: relative; z-index: 2;">
        <div class="row">
            <div class="col-lg-10 mx-auto text-center">
                <!-- Badge -->
                <div class="d-inline-flex align-items-center mb-4" style="background: rgba(255, 255, 255, 0.15); backdrop-filter: blur(20px); border-radius: 50px; padding: 0.75rem 1.5rem; border: 1px solid rgba(255, 255, 255, 0.2); box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);">
                    <i class="fas fa-cog me-2" style="color: #fbbf24; font-size: 1rem;"></i>
                    <span style="color: white; font-weight: 600; font-size: 0.875rem; letter-spacing: 0.5px;">PARAMÈTRES</span>
                </div>
                
                <!-- Main Title -->
                <h1 class="display-2 fw-bold mb-4" style="color: white; text-shadow: 0 4px 20px rgba(0,0,0,0.3); letter-spacing: -0.03em; line-height: 1.1;">
                    <span style="background: linear-gradient(135deg, #fbbf24, #f59e0b); background-clip: text; -webkit-background-clip: text; -webkit-text-fill-color: transparent;">Paramètres</span>
                </h1>
                
                <!-- Subtitle -->
                <div class="mb-4" style="max-width: 700px; margin: 0 auto;">
                    <p class="lead mb-2" style="color: rgba(255, 255, 255, 0.95); font-size: 1.375rem; font-weight: 400; line-height: 1.6; letter-spacing: -0.01em;">
                        Configurez votre compte et vos préférences
                    </p>
                    <p class="mb-0" style="color: rgba(255, 255, 255, 0.8); font-size: 1.1rem; font-weight: 300; line-height: 1.7;">
                        Sécurité • Notifications • Préférences d'affichage
                    </p>
                </div>
                
                <!-- Decorative Elements -->
                <div class="d-flex justify-content-center align-items-center gap-3 mt-4">
                    <div style="width: 60px; height: 2px; background: linear-gradient(90deg, transparent, rgba(255,255,255,0.4), transparent); border-radius: 1px;"></div>
                    <div style="width: 8px; height: 8px; background: rgba(251, 191, 36, 0.8); border-radius: 50%; box-shadow: 0 0 20px rgba(251, 191, 36, 0.5);"></div>
                    <div style="width: 60px; height: 2px; background: linear-gradient(90deg, transparent, rgba(255,255,255,0.4), transparent); border-radius: 1px;"></div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Settings Content -->
<div class="container py-5">
    <div class="row g-4">
        <div class="col-lg-3">
            <div class="list-group">
                <a href="#account" class="list-group-item list-group-item-action active">
                    <i class="fas fa-user me-2"></i>Compte
                </a>
                <a href="#notifications" class="list-group-item list-group-item-action">
                    <i class="fas fa-bell me-2"></i>Notifications
                </a>
                <a href="#security" class="list-group-item list-group-item-action">
                    <i class="fas fa-shield-alt me-2"></i>Sécurité
                </a>
                <a href="#privacy" class="list-group-item list-group-item-action">
                    <i class="fas fa-lock me-2"></i>Confidentialité
                </a>
            </div>
        </div>

        <div class="col-lg-9">
            <!-- Account Settings -->
            <div class="card border-0 shadow-sm mb-4" id="account">
                <div class="card-header bg-white border-0 py-3">
                    <h5 class="mb-0 fw-bold">Paramètres du Compte</h5>
                </div>
                <div class="card-body p-4">
                    <div class="mb-4">
                        <div class="form-check form-switch">
                            <input class="form-check-input" type="checkbox" id="publicProfile" checked>
                            <label class="form-check-label" for="publicProfile">
                                <strong>Profil public</strong>
                                <p class="text-muted small mb-0">Permettre aux clients de voir votre profil</p>
                            </label>
                        </div>
                    </div>
                    <div class="mb-4">
                        <div class="form-check form-switch">
                            <input class="form-check-input" type="checkbox" id="autoAccept">
                            <label class="form-check-label" for="autoAccept">
                                <strong>Acceptation automatique</strong>
                                <p class="text-muted small mb-0">Accepter automatiquement les réservations</p>
                            </label>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Notification Settings -->
            <div class="card border-0 shadow-sm mb-4" id="notifications">
                <div class="card-header bg-white border-0 py-3">
                    <h5 class="mb-0 fw-bold">Notifications</h5>
                </div>
                <div class="card-body p-4">
                    <div class="mb-3">
                        <div class="form-check form-switch">
                            <input class="form-check-input" type="checkbox" id="emailNotif" checked>
                            <label class="form-check-label" for="emailNotif">Notifications par email</label>
                        </div>
                    </div>
                    <div class="mb-3">
                        <div class="form-check form-switch">
                            <input class="form-check-input" type="checkbox" id="smsNotif" checked>
                            <label class="form-check-label" for="smsNotif">Notifications par SMS</label>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Security Settings -->
            <div class="card border-0 shadow-sm" id="security">
                <div class="card-header bg-white border-0 py-3">
                    <h5 class="mb-0 fw-bold">Sécurité</h5>
                </div>
                <div class="card-body p-4">
                    <button class="btn btn-primary mb-3">
                        <i class="fas fa-key me-2"></i>Changer le mot de passe
                    </button>
                    <div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" id="twoFactor">
                        <label class="form-check-label" for="twoFactor">
                            <strong>Authentification à deux facteurs</strong>
                            <p class="text-muted small mb-0">Sécurisez votre compte avec 2FA</p>
                        </label>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="../../layouts/footer.jsp" %>


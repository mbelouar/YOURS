<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setAttribute("pageTitle", "Paramètres - YOURS");
%>

<%@ include file="../../layouts/header.jsp" %>
<%@ include file="../../layouts/navbar.jsp" %>

<!-- Page Header -->
<section class="py-4" style="background: linear-gradient(135deg, #059669 0%, #047857 50%, #065f46 100%); margin-top: -80px; padding-top: calc(80px + 3rem) !important; padding-bottom: 3rem !important;">
    <div class="container">
        <h1 class="display-6 fw-bold mb-2" style="color: white;">
            <i class="fas fa-cog me-3"></i>Paramètres
        </h1>
        <p class="mb-0" style="color: rgba(255, 255, 255, 0.9);">
            Configurez votre compte et vos préférences
        </p>
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


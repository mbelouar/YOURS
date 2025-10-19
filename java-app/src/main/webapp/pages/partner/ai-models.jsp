<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setAttribute("pageTitle", "Modèles IA - YOURS");
%>

<%@ include file="../../layouts/header.jsp" %>
<%@ include file="../../layouts/navbar.jsp" %>

<style>
/* AI Models Page Styling */
.ai-models-container {
    background: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%);
    min-height: 100vh;
}
</style>

<!-- Page Header -->
<section class="py-5" style="background: linear-gradient(135deg, #1e40af 0%, #1e3a8a 50%, #1e293b 100%); margin-top: -80px; padding-top: calc(80px + 6rem) !important; padding-bottom: 6rem !important; min-height: 500px; height: 500px; position: relative; overflow: hidden;">
    <div style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; background: radial-gradient(circle at 20% 50%, rgba(59, 130, 246, 0.15) 0%, transparent 50%); opacity: 1;"></div>
    <div class="container" style="position: relative; z-index: 2;">
        <div class="row">
            <div class="col-lg-10 mx-auto text-center">
                <!-- Badge -->
                <div class="d-inline-flex align-items-center mb-4" style="background: rgba(255, 255, 255, 0.15); backdrop-filter: blur(20px); border-radius: 50px; padding: 0.75rem 1.5rem; border: 1px solid rgba(255, 255, 255, 0.2); box-shadow: 0 8px 32px rgba(0, 0, 0, 0.1);">
                    <i class="fas fa-robot me-2" style="color: #fbbf24; font-size: 1rem;"></i>
                    <span style="color: white; font-weight: 600; font-size: 0.875rem; letter-spacing: 0.5px;">INTELLIGENCE ARTIFICIELLE</span>
                </div>
                
                <!-- Main Title -->
                <h1 class="display-2 fw-bold mb-4" style="color: white; text-shadow: 0 4px 20px rgba(0,0,0,0.3); letter-spacing: -0.03em; line-height: 1.1;">
                    Modèles <span style="background: linear-gradient(135deg, #fbbf24, #f59e0b); background-clip: text; -webkit-background-clip: text; -webkit-text-fill-color: transparent;">IA</span>
                </h1>
                
                <!-- Subtitle -->
                <div class="mb-4" style="max-width: 700px; margin: 0 auto;">
                    <p class="lead mb-2" style="color: rgba(255, 255, 255, 0.95); font-size: 1.375rem; font-weight: 400; line-height: 1.6; letter-spacing: -0.01em;">
                        Optimisez vos locations avec l'intelligence artificielle
                    </p>
                    <p class="mb-0" style="color: rgba(255, 255, 255, 0.8); font-size: 1.1rem; font-weight: 300; line-height: 1.7;">
                        Prédiction de demande • Optimisation des prix • Recommandations intelligentes
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

<div class="container py-4">
    <!-- Action Buttons -->
    <div class="row mb-4">
        <div class="col-12">
            <div class="d-flex justify-content-end gap-2">
                <button class="btn btn-outline-primary" onclick="refreshAIModels()">
                    <i class="fas fa-sync-alt me-2"></i>Actualiser
                </button>
                <button class="btn btn-primary" onclick="showAIConfigModal()">
                    <i class="fas fa-cog me-2"></i>Configuration
                </button>
            </div>
        </div>
    </div>

    <!-- AI Models Overview -->
    <div class="row g-4 mb-4">
        <!-- Demand Prediction Model -->
        <div class="col-lg-4">
            <div class="card border-0 shadow-sm h-100 demand-prediction-container">
                <div class="card-header demand-prediction-header border-0 py-4">
                    <div class="d-flex align-items-center">
                        <div class="ai-model-icon me-3">
                            <i class="fas fa-chart-line"></i>
                        </div>
                        <div>
                            <h5 class="mb-1 fw-bold text-white">Prédiction de Demande</h5>
                            <p class="mb-0 text-white-50 small">Analyse prédictive des réservations</p>
                        </div>
                    </div>
                </div>
                <div class="card-body p-4" style="background: linear-gradient(135deg, var(--gray-50) 0%, var(--white) 100%);">
                    <div class="mb-4">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <span class="text-muted">Précision du modèle</span>
                            <span class="fw-bold text-primary">87.3%</span>
                        </div>
                        <div class="progress mb-3" style="height: 8px;">
                            <div class="progress-bar bg-warning" style="width: 87.3%"></div>
                        </div>
                        <div class="row text-center">
                            <div class="col-4">
                                <div class="fw-bold text-warning">+12%</div>
                                <small class="text-muted">vs mois dernier</small>
                            </div>
                            <div class="col-4">
                                <div class="fw-bold text-warning">156</div>
                                <small class="text-muted">prédictions/jour</small>
                            </div>
                            <div class="col-4">
                                <div class="fw-bold text-warning">92%</div>
                                <small class="text-muted">taux de confiance</small>
                            </div>
                        </div>
                    </div>
                    <div class="d-flex gap-2">
                        <button class="btn btn-outline-primary btn-sm flex-fill" onclick="viewDemandPredictions()">
                            <i class="fas fa-eye me-1"></i>Voir prédictions
                        </button>
                        <button class="btn btn-primary btn-sm flex-fill" onclick="configureDemandModel()">
                            <i class="fas fa-cog me-1"></i>Configurer
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Price Optimization Model -->
        <div class="col-lg-4">
            <div class="card border-0 shadow-sm h-100 price-optimization-container">
                <div class="card-header price-optimization-header border-0 py-4">
                    <div class="d-flex align-items-center">
                        <div class="ai-model-icon me-3">
                            <i class="fas fa-dollar-sign"></i>
                        </div>
                        <div>
                            <h5 class="mb-1 fw-bold text-white">Optimisation des Prix</h5>
                            <p class="mb-0 text-white-50 small">Tarification dynamique intelligente</p>
                        </div>
                    </div>
                </div>
                <div class="card-body p-4" style="background: linear-gradient(135deg, var(--gray-50) 0%, var(--white) 100%);">
                    <div class="mb-4">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <span class="text-muted">Revenus optimisés</span>
                            <span class="fw-bold text-success">+23%</span>
                        </div>
                        <div class="progress mb-3" style="height: 8px;">
                            <div class="progress-bar bg-warning" style="width: 75%"></div>
                        </div>
                        <div class="row text-center">
                            <div class="col-4">
                                <div class="fw-bold text-warning">+23%</div>
                                <small class="text-muted">revenus</small>
                            </div>
                            <div class="col-4">
                                <div class="fw-bold text-warning">45</div>
                                <small class="text-muted">ajustements/jour</small>
                            </div>
                            <div class="col-4">
                                <div class="fw-bold text-warning">89%</div>
                                <small class="text-muted">efficacité</small>
                            </div>
                        </div>
                    </div>
                    <div class="d-flex gap-2">
                        <button class="btn btn-outline-success btn-sm flex-fill" onclick="viewPriceOptimization()">
                            <i class="fas fa-chart-bar me-1"></i>Voir analyse
                        </button>
                        <button class="btn btn-success btn-sm flex-fill" onclick="configurePriceModel()">
                            <i class="fas fa-cog me-1"></i>Configurer
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <!-- Smart Recommendations -->
        <div class="col-lg-4">
            <div class="card border-0 shadow-sm h-100 recommendations-container">
                <div class="card-header recommendations-header border-0 py-4">
                    <div class="d-flex align-items-center">
                        <div class="ai-model-icon me-3">
                            <i class="fas fa-lightbulb"></i>
                        </div>
                        <div>
                            <h5 class="mb-1 fw-bold text-white">Recommandations</h5>
                            <p class="mb-0 text-white-50 small">Suggestions intelligentes</p>
                        </div>
                    </div>
                </div>
                <div class="card-body p-4" style="background: linear-gradient(135deg, var(--gray-50) 0%, var(--white) 100%);">
                    <div class="mb-4">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <span class="text-muted">Taux d'adoption</span>
                            <span class="fw-bold" style="color: #8b5cf6;">76%</span>
                        </div>
                        <div class="progress mb-3" style="height: 8px;">
                            <div class="progress-bar bg-warning" style="width: 76%"></div>
                        </div>
                        <div class="row text-center">
                            <div class="col-4">
                                <div class="fw-bold text-warning">76%</div>
                                <small class="text-muted">adoption</small>
                            </div>
                            <div class="col-4">
                                <div class="fw-bold text-warning">28</div>
                                <small class="text-muted">suggestions/jour</small>
                            </div>
                            <div class="col-4">
                                <div class="fw-bold text-warning">94%</div>
                                <small class="text-muted">pertinence</small>
                            </div>
                        </div>
                    </div>
                    <div class="d-flex gap-2">
                        <button class="btn btn-sm flex-fill" style="background-color: transparent !important; border-color: #8b5cf6 !important; color: #8b5cf6 !important;" onclick="viewRecommendations()">
                            <i class="fas fa-list me-1"></i>Voir suggestions
                        </button>
                        <button class="btn btn-sm flex-fill" style="background-color: #8b5cf6; border-color: #8b5cf6; color: white;" onclick="configureRecommendationModel()">
                            <i class="fas fa-cog me-1"></i>Configurer
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- AI Analytics Dashboard -->
    <div class="row g-4">
        <!-- Performance Metrics -->
        <div class="col-lg-8">
            <div class="card border-0 shadow-sm performance-metrics-container">
                <div class="card-header performance-metrics-header border-0 py-4">
                    <h5 class="mb-1 fw-bold text-white">
                        <i class="fas fa-chart-line me-2" style="color: var(--accent-light);"></i>Performance des Modèles IA
                    </h5>
                    <p class="mb-0 text-white-50 small">Métriques de performance en temps réel</p>
                </div>
                <div class="card-body p-4" style="background: linear-gradient(135deg, var(--gray-50) 0%, var(--white) 100%);">
                    <div class="row g-4">
                        <div class="col-md-3">
                            <div class="text-center">
                                <div class="ai-metric-icon bg-primary-gradient mb-3">
                                    <i class="fas fa-brain text-white"></i>
                                </div>
                                <h4 class="fw-bold text-primary mb-1">94.2%</h4>
                                <p class="text-muted mb-0">Précision globale</p>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="text-center">
                                <div class="ai-metric-icon bg-success-gradient mb-3">
                                    <i class="fas fa-clock text-white"></i>
                                </div>
                                <h4 class="fw-bold text-success mb-1">0.3s</h4>
                                <p class="text-muted mb-0">Temps de réponse</p>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="text-center">
                                <div class="ai-metric-icon mb-3" style="background: linear-gradient(135deg, #8b5cf6, #7c3aed);">
                                    <i class="fas fa-sync-alt text-white"></i>
                                </div>
                                <h4 class="fw-bold mb-1" style="color: #8b5cf6;">24/7</h4>
                                <p class="text-muted mb-0">Disponibilité</p>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="text-center">
                                <div class="ai-metric-icon bg-warning-gradient mb-3">
                                    <i class="fas fa-arrow-up text-white"></i>
                                </div>
                                <h4 class="fw-bold text-warning mb-1">+18%</h4>
                                <p class="text-muted mb-0">Amélioration</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- AI Status -->
        <div class="col-lg-4">
            <div class="card border-0 shadow-sm ai-status-container">
                <div class="card-header ai-status-header border-0 py-4">
                    <h5 class="mb-1 fw-bold text-white">
                        <i class="fas fa-server me-2" style="color: var(--accent-light);"></i>Statut des Services IA
                    </h5>
                    <p class="mb-0 text-white-50 small">État des modèles en temps réel</p>
                </div>
                <div class="card-body p-4" style="background: linear-gradient(135deg, var(--gray-50) 0%, var(--white) 100%);">
                    <div class="d-flex align-items-center mb-3">
                        <div class="status-indicator bg-success me-3"></div>
                        <div>
                            <div class="fw-semibold text-gray-900">Prédiction de Demande</div>
                            <small class="text-gray-600">Opérationnel</small>
                        </div>
                    </div>
                    <div class="d-flex align-items-center mb-3">
                        <div class="status-indicator bg-success me-3"></div>
                        <div>
                            <div class="fw-semibold text-gray-900">Optimisation des Prix</div>
                            <small class="text-gray-600">Opérationnel</small>
                        </div>
                    </div>
                    <div class="d-flex align-items-center mb-3">
                        <div class="status-indicator bg-success me-3"></div>
                        <div>
                            <div class="fw-semibold text-gray-900">Recommandations</div>
                            <small class="text-gray-600">Opérationnel</small>
                        </div>
                    </div>
                    <div class="d-flex align-items-center">
                        <div class="status-indicator bg-warning me-3"></div>
                        <div>
                            <div class="fw-semibold text-gray-900">Analyse de Sentiment</div>
                            <small class="text-gray-600">En développement</small>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- AI Configuration Modal -->
<div class="modal fade" id="aiConfigModal" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">
                    <i class="fas fa-cog text-primary me-2"></i>Configuration des Modèles IA
                </h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <div class="row g-4">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="form-label fw-semibold">Fréquence de mise à jour</label>
                            <select class="form-select">
                                <option value="realtime">Temps réel</option>
                                <option value="hourly">Toutes les heures</option>
                                <option value="daily">Quotidienne</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="form-label fw-semibold">Niveau de confiance</label>
                            <select class="form-select">
                                <option value="high">Élevé (95%)</option>
                                <option value="medium">Moyen (85%)</option>
                                <option value="low">Faible (75%)</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-12">
                        <div class="form-group">
                            <label class="form-label fw-semibold">Notifications</label>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="emailNotifications" checked>
                                <label class="form-check-label" for="emailNotifications">
                                    Notifications par email
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="pushNotifications" checked>
                                <label class="form-check-label" for="pushNotifications">
                                    Notifications push
                                </label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">Annuler</button>
                <button type="button" class="btn btn-primary" onclick="saveAIConfig()">Sauvegarder</button>
            </div>
        </div>
    </div>
</div>

<script>
let aiConfigModal;

document.addEventListener('DOMContentLoaded', function() {
    aiConfigModal = new bootstrap.Modal(document.getElementById('aiConfigModal'));
});

function refreshAIModels() {
    console.log('Refreshing AI models...');
    notificationSystem.info('Actualisation des modèles IA en cours...', 2000);
}

function showAIConfigModal() {
    aiConfigModal.show();
}

function saveAIConfig() {
    console.log('Saving AI configuration...');
    aiConfigModal.hide();
    notificationSystem.success('Configuration des modèles IA sauvegardée !');
}

function viewDemandPredictions() {
    console.log('Viewing demand predictions...');
    notificationSystem.info('Ouverture des prédictions de demande...', 2000);
}

function configureDemandModel() {
    console.log('Configuring demand model...');
    notificationSystem.info('Configuration du modèle de prédiction...', 2000);
}

function viewPriceOptimization() {
    console.log('Viewing price optimization...');
    notificationSystem.info('Ouverture de l\'analyse de prix...', 2000);
}

function configurePriceModel() {
    console.log('Configuring price model...');
    notificationSystem.info('Configuration du modèle de prix...', 2000);
}

function viewRecommendations() {
    console.log('Viewing recommendations...');
    notificationSystem.info('Ouverture des recommandations...', 2000);
}

function configureRecommendationModel() {
    console.log('Configuring recommendation model...');
    notificationSystem.info('Configuration du modèle de recommandations...', 2000);
}
</script>

<style>
.ai-model-icon {
    width: 50px;
    height: 50px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    background: rgba(255, 255, 255, 0.2);
    font-size: 1.5rem;
}

.ai-metric-icon {
    width: 60px;
    height: 60px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    margin: 0 auto;
    font-size: 1.5rem;
}

.status-indicator {
    width: 12px;
    height: 12px;
    border-radius: 50%;
    flex-shrink: 0;
}

/* AI Status Content Visibility */
.ai-status-container .card-body {
    background: linear-gradient(135deg, #ffffff 0%, #f8fafc 100%) !important;
}

.ai-status-container .fw-semibold {
    color: #1f2937 !important;
    font-weight: 600 !important;
    font-size: 0.95rem !important;
}

.ai-status-container small {
    color: #6b7280 !important;
    font-size: 0.8rem !important;
}

.bg-gradient-primary {
    background: linear-gradient(135deg, var(--primary-600), var(--primary-700)) !important;
}

.bg-gradient-success {
    background: linear-gradient(135deg, var(--success-color), var(--success-dark)) !important;
}

.bg-gradient-info {
    background: linear-gradient(135deg, var(--info-color), #0891b2) !important;
}

.bg-primary-gradient {
    background: linear-gradient(135deg, var(--primary-600), var(--primary-700)) !important;
}

.bg-success-gradient {
    background: linear-gradient(135deg, var(--success-color), var(--success-dark)) !important;
}

.bg-info-gradient {
    background: linear-gradient(135deg, #8b5cf6, #7c3aed) !important;
}

.bg-warning-gradient {
    background: linear-gradient(135deg, var(--warning-color), #d97706) !important;
}

/* Force purple styling for recommendation buttons */
.recommendations-container .btn {
    border: 2px solid #8b5cf6 !important;
    color: #8b5cf6 !important;
    background-color: transparent !important;
}

.recommendations-container .btn:hover {
    background-color: #8b5cf6 !important;
    color: white !important;
    border-color: #8b5cf6 !important;
}

.recommendations-container .btn[style*="background-color: #8b5cf6"] {
    background-color: #8b5cf6 !important;
    color: white !important;
    border-color: #8b5cf6 !important;
}

/* AI Container Styles - Matching Dashboard */
.demand-prediction-container {
    background: linear-gradient(135deg, var(--primary-600), var(--primary-700));
    border-radius: 1rem;
    overflow: hidden;
}

.demand-prediction-header {
    background: linear-gradient(135deg, var(--primary-600), var(--primary-700));
    border: none;
}

.price-optimization-container {
    background: linear-gradient(135deg, var(--success-color), var(--success-dark));
    border-radius: 1rem;
    overflow: hidden;
}

.price-optimization-header {
    background: linear-gradient(135deg, var(--success-color), var(--success-dark));
    border: none;
}

.recommendations-container {
    background: linear-gradient(135deg, #8b5cf6, #7c3aed);
    border-radius: 1rem;
    overflow: hidden;
}

.recommendations-header {
    background: linear-gradient(135deg, #8b5cf6, #7c3aed);
    border: none;
}

.performance-metrics-container {
    background: linear-gradient(135deg, var(--primary-600), var(--primary-700));
    border-radius: 1rem;
    overflow: hidden;
}

.performance-metrics-header {
    background: linear-gradient(135deg, var(--primary-600), var(--primary-700));
    border: none;
}

.ai-status-container {
    background: linear-gradient(135deg, var(--primary-600), var(--primary-700));
    border-radius: 1rem;
    overflow: hidden;
}

.ai-status-header {
    background: linear-gradient(135deg, var(--primary-600), var(--primary-700));
    border: none;
}
</style>

<%@ include file="../../layouts/footer.jsp" %>

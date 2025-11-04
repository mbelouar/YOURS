<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html>
<head>
    <title>Erreur - YOURS</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="card border-danger">
                    <div class="card-header bg-danger text-white">
                        <h3 class="mb-0"><i class="fas fa-exclamation-triangle me-2"></i>Erreur</h3>
                    </div>
                    <div class="card-body">
                        <h4 class="text-danger mb-4">Une erreur est survenue</h4>
                        
                        <c:if test="${not empty error}">
                            <div class="alert alert-danger">
                                <h5>${error}</h5>
                                <c:if test="${not empty errorDetails}">
                                    <hr>
                                    <h6>Détails de l'erreur :</h6>
                                    <pre class="bg-light p-3 border rounded">${errorDetails}</pre>
                                </c:if>
                            </div>
                        </c:if>
                        
                        <c:if test="${empty error}">
                            <div class="alert alert-warning">
                                <p>Désolé, une erreur inattendue s'est produite. Veuillez réessayer ultérieurement.</p>
                                <c:if test="${not empty pageContext.errorData.throwable}">
                                    <hr>
                                    <h6>Détails techniques :</h6>
                                    <p>${pageContext.errorData.throwable}</p>
                                </c:if>
                            </div>
                        </c:if>
                        
                        <div class="mt-4">
                            <a href="${pageContext.request.contextPath}/" class="btn btn-primary me-2">
                                <i class="fas fa-home me-1"></i> Retour à l'accueil
                            </a>
                            <a href="javascript:history.back()" class="btn btn-outline-secondary">
                                <i class="fas fa-arrow-left me-1"></i> Page précédente
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

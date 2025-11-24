<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Détails - ${materiel.nom}</title>
</head>
<body>
    <div class="container">
        <h1>Détails du matériel</h1>
        
        <div class="materiel-details">
            <h2>${materiel.nom}</h2>
            <p><strong>Description:</strong> ${materiel.description}</p>
            <p><strong>Prix:</strong> ${materiel.prix} €/jour</p>
            <p><strong>Disponible:</strong> 
                <c:choose>
                    <c:when test="${materiel.disponible}">
                        <span class="badge badge-success">Oui</span>
                    </c:when>
                    <c:otherwise>
                        <span class="badge badge-danger">Non</span>
                    </c:otherwise>
                </c:choose>
            </p>
            
            <c:if test="${not empty materiel.primaryPhotoUrl}">
                <img src="${materiel.primaryPhotoUrl}" alt="${materiel.nom}" class="img-fluid">
            </c:if>
        </div>
        
        <a href="/equipements" class="btn btn-secondary">Retour à la liste</a>
    </div>
</body>
</html>
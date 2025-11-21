<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    request.setAttribute("pageTitle", "Test File Upload - YOURS");
%>

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Test File Upload</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card">
                    <div class="card-header">
                        <h4 class="mb-0">Test File Upload</h4>
                    </div>
                    <div class="card-body">
                        <form action="${pageContext.request.contextPath}/register" method="POST" enctype="multipart/form-data">
                            <input type="hidden" name="accountType" value="partner">
                            
                            <div class="mb-3">
                                <label for="partnerNom" class="form-label">Nom *</label>
                                <input type="text" class="form-control" id="partnerNom" name="partnerNom" required value="Test">
                            </div>
                            
                            <div class="mb-3">
                                <label for="partnerPrenom" class="form-label">Prénom *</label>
                                <input type="text" class="form-control" id="partnerPrenom" name="partnerPrenom" required value="User">
                            </div>
                            
                            <div class="mb-3">
                                <label for="partnerMail" class="form-label">Email *</label>
                                <input type="email" class="form-control" id="partnerMail" name="partnerMail" required value="testupload@example.com">
                            </div>
                            
                            <div class="mb-3">
                                <label for="partnerNumTelephone" class="form-label">Téléphone *</label>
                                <input type="tel" class="form-control" id="partnerNumTelephone" name="partnerNumTelephone" required value="0612345678">
                            </div>
                            
                            <div class="mb-3">
                                <label for="partnerBusinessName" class="form-label">Nom de l'entreprise *</label>
                                <input type="text" class="form-control" id="partnerBusinessName" name="partnerBusinessName" required value="Test Company">
                            </div>
                            
                            <div class="mb-3">
                                <label for="partnerBusinessType" class="form-label">Type d'activité *</label>
                                <select class="form-select" id="partnerBusinessType" name="partnerBusinessType" required>
                                    <option value="freelance">Freelance</option>
                                </select>
                            </div>
                            
                            <div class="mb-3">
                                <label for="adresse" class="form-label">Adresse *</label>
                                <textarea class="form-control" id="adresse" name="adresse" required>Test Address</textarea>
                            </div>
                            
                            <div class="mb-3">
                                <label for="partnerMotDepasse" class="form-label">Mot de passe *</label>
                                <input type="password" class="form-control" id="partnerMotDepasse" name="partnerMotDepasse" required value="password123">
                            </div>
                            
                            <div class="mb-3">
                                <label for="partnerConfirmPassword" class="form-label">Confirmer le mot de passe *</label>
                                <input type="password" class="form-control" id="partnerConfirmPassword" name="partnerConfirmPassword" required value="password123">
                            </div>
                            
                            <div class="mb-3">
                                <label for="cinRECTO" class="form-label">CIN Recto *</label>
                                <input type="file" class="form-control" id="cinRECTO" name="cinRECTO" accept="image/*" required>
                            </div>
                            
                            <div class="mb-3">
                                <label for="cinVERSO" class="form-label">CIN Verso *</label>
                                <input type="file" class="form-control" id="cinVERSO" name="cinVERSO" accept="image/*" required>
                            </div>
                            
                            <div class="mb-3">
                                <label for="photoPerso" class="form-label">Photo de profil</label>
                                <input type="file" class="form-control" id="photoPerso" name="photoPerso" accept="image/*">
                            </div>
                            
                            <div class="mb-3">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="acceptTerms" name="acceptTerms" required>
                                    <label class="form-check-label" for="acceptTerms">
                                        J'accepte les conditions d'utilisation
                                    </label>
                                </div>
                            </div>
                            
                            <button type="submit" class="btn btn-primary w-100">Tester l'upload</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>

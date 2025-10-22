<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.yours.dao.PartnerDAO" %>
<%@ page import="com.yours.model.Partenaire" %>
<%
    request.setAttribute("pageTitle", "Test Image Upload - YOURS");
    
    // Get partner data for testing
    PartnerDAO partnerDAO = new PartnerDAO();
    Partenaire testPartner = null;
    
    // Try to get the first partner from database for testing
    try {
        // This is a simple test - in production you'd get the logged-in partner
        testPartner = partnerDAO.getPartnerByEmail("test@example.com");
    } catch (Exception e) {
        // Ignore for testing
    }
%>

<%@ include file="../layouts/header.jsp" %>
<%@ include file="../layouts/navbar.jsp" %>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="card">
                <div class="card-header">
                    <h4 class="mb-0">Test Image Upload System</h4>
                </div>
                <div class="card-body">
                    <% if (testPartner != null) { %>
                        <h5>Partner Images Test</h5>
                        <p><strong>Partner:</strong> <%= testPartner.getPrenom() %> <%= testPartner.getNom() %></p>
                        <p><strong>Email:</strong> <%= testPartner.getMail() %></p>
                        
                        <div class="row">
                            <div class="col-md-4">
                                <h6>CIN Recto</h6>
                                <% if (testPartner.getCinRECTO() != null && !testPartner.getCinRECTO().isEmpty()) { %>
                                    <img src="${pageContext.request.contextPath}/images/<%= testPartner.getCinRECTO().substring(testPartner.getCinRECTO().lastIndexOf("/") + 1) %>" 
                                         class="img-fluid img-thumbnail" alt="CIN Recto" style="max-height: 200px;">
                                    <p class="small text-muted mt-1">Path: <%= testPartner.getCinRECTO() %></p>
                                <% } else { %>
                                    <p class="text-muted">No CIN Recto uploaded</p>
                                <% } %>
                            </div>
                            
                            <div class="col-md-4">
                                <h6>CIN Verso</h6>
                                <% if (testPartner.getCinVERSO() != null && !testPartner.getCinVERSO().isEmpty()) { %>
                                    <img src="${pageContext.request.contextPath}/images/<%= testPartner.getCinVERSO().substring(testPartner.getCinVERSO().lastIndexOf("/") + 1) %>" 
                                         class="img-fluid img-thumbnail" alt="CIN Verso" style="max-height: 200px;">
                                    <p class="small text-muted mt-1">Path: <%= testPartner.getCinVERSO() %></p>
                                <% } else { %>
                                    <p class="text-muted">No CIN Verso uploaded</p>
                                <% } %>
                            </div>
                            
                            <div class="col-md-4">
                                <h6>Profile Photo</h6>
                                <% if (testPartner.getPhotoPerso() != null && !testPartner.getPhotoPerso().isEmpty()) { %>
                                    <img src="${pageContext.request.contextPath}/images/<%= testPartner.getPhotoPerso().substring(testPartner.getPhotoPerso().lastIndexOf("/") + 1) %>" 
                                         class="img-fluid img-thumbnail" alt="Profile Photo" style="max-height: 200px;">
                                    <p class="small text-muted mt-1">Path: <%= testPartner.getPhotoPerso() %></p>
                                <% } else { %>
                                    <p class="text-muted">No profile photo uploaded</p>
                                <% } %>
                            </div>
                        </div>
                    <% } else { %>
                        <div class="alert alert-info">
                            <h5>No Test Partner Found</h5>
                            <p>To test the image upload system:</p>
                            <ol>
                                <li>Register a new partner account with images</li>
                                <li>Check the uploads directory for saved files</li>
                                <li>Verify images are accessible via the ImageServlet</li>
                            </ol>
                        </div>
                    <% } %>
                    
                    <hr>
                    
                    <h5>System Information</h5>
                    <div class="row">
                        <div class="col-md-6">
                            <h6>Upload Directory</h6>
                            <p class="small">
                                <strong>Webapp Path:</strong> <%= application.getRealPath("/uploads") %><br>
                                <strong>System Temp:</strong> <%= System.getProperty("java.io.tmpdir") %>yours_uploads
                            </p>
                        </div>
                        <div class="col-md-6">
                            <h6>Image Servlet</h6>
                            <p class="small">
                                <strong>URL Pattern:</strong> /images/*<br>
                                <strong>Test URL:</strong> <a href="${pageContext.request.contextPath}/images/test.jpg" target="_blank">${pageContext.request.contextPath}/images/test.jpg</a>
                            </p>
                        </div>
                    </div>
                    
                    <div class="mt-4">
                        <a href="${pageContext.request.contextPath}/pages/auth/register-client.jsp" class="btn btn-primary">
                            <i class="fas fa-user-plus me-2"></i>Test Partner Registration
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<%@ include file="../layouts/footer.jsp" %>

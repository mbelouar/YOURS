package com.yours.servlet;

import com.yours.dao.PartnerDAO;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.logging.Logger;

/**
 * Servlet for updating partner profile information
 * URL pattern configured in web.xml
 */
public class UpdatePartnerProfileServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(UpdatePartnerProfileServlet.class.getName());
    private PartnerDAO partnerDAO;

    @Override
    public void init() {
        partnerDAO = new PartnerDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");

        // Check authentication
        HttpSession session = request.getSession(false);
        if (session == null) {
            sendErrorResponse(response, HttpServletResponse.SC_UNAUTHORIZED, "Non authentifié");
            return;
        }

        Integer partnerId = (Integer) session.getAttribute("partnerId");
        String userType = (String) session.getAttribute("userType");

        if (partnerId == null || !"partner".equals(userType)) {
            sendErrorResponse(response, HttpServletResponse.SC_UNAUTHORIZED, "Accès non autorisé");
            return;
        }

        try {
            // Get form parameters
            String nom = request.getParameter("nom");
            String prenom = request.getParameter("prenom");
            String mail = request.getParameter("mail");
            String numTelephone = request.getParameter("numTelephone");

            logger.info("Updating profile for partner ID: " + partnerId);
            logger.info("Received data - nom: " + nom + ", prenom: " + prenom + ", mail: " + mail + ", numTelephone: " + numTelephone);

            // Validate required fields
            if (nom == null || nom.trim().isEmpty() ||
                prenom == null || prenom.trim().isEmpty() ||
                mail == null || mail.trim().isEmpty()) {
                logger.warning("Validation failed: missing required fields");
                sendErrorResponse(response, HttpServletResponse.SC_BAD_REQUEST, "Tous les champs obligatoires doivent être remplis");
                return;
            }

            // Validate email format
            if (!mail.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
                sendErrorResponse(response, HttpServletResponse.SC_BAD_REQUEST, "Format d'email invalide");
                return;
            }

            // Check if email is already used by another partner
            com.yours.model.Partenaire existingPartner = partnerDAO.getPartnerByEmail(mail.trim().toLowerCase());
            if (existingPartner != null && existingPartner.getIdPartenaire() != partnerId) {
                sendErrorResponse(response, HttpServletResponse.SC_BAD_REQUEST, "Cet email est déjà utilisé par un autre partenaire");
                return;
            }

            // Update partner in database
            boolean success = partnerDAO.updatePartner(
                partnerId,
                nom.trim(),
                prenom.trim(),
                mail.trim().toLowerCase(),
                numTelephone != null ? numTelephone.trim() : ""
            );

            if (success) {
                // Update session attributes
                session.setAttribute("partnerEmail", mail.trim().toLowerCase());
                session.setAttribute("partnerName", prenom.trim() + " " + nom.trim());

                // Update partner object in session if it exists
                com.yours.model.Partenaire partner = (com.yours.model.Partenaire) session.getAttribute("partner");
                if (partner != null) {
                    partner.setNom(nom.trim());
                    partner.setPrenom(prenom.trim());
                    partner.setMail(mail.trim().toLowerCase());
                    partner.setNumTelephone(numTelephone != null ? numTelephone.trim() : "");
                }

                JsonObject jsonResponse = new JsonObject();
                jsonResponse.addProperty("success", true);
                jsonResponse.addProperty("message", "Profil mis à jour avec succès");
                response.getWriter().write(new Gson().toJson(jsonResponse));
                logger.info("Profile updated for partner ID: " + partnerId);
            } else {
                sendErrorResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erreur lors de la mise à jour du profil");
            }

        } catch (Exception e) {
            logger.severe("Error updating partner profile: " + e.getMessage());
            e.printStackTrace();
            sendErrorResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erreur lors de la mise à jour du profil: " + e.getMessage());
        }
    }

    private void sendErrorResponse(HttpServletResponse response, int statusCode, String message) throws IOException {
        response.setStatus(statusCode);
        JsonObject errorResponse = new JsonObject();
        errorResponse.addProperty("success", false);
        errorResponse.addProperty("error", message);
        response.getWriter().write(new Gson().toJson(errorResponse));
    }
}



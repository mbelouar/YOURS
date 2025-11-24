package com.yours.servlet;

import com.yours.dao.PartnerDAO;
import com.yours.model.Partenaire;
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
 * Servlet for retrieving partner profile data
 */
@WebServlet("/api/partner/profile")
public class PartnerProfileApiServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(PartnerProfileApiServlet.class.getName());
    private PartnerDAO partnerDAO;

    @Override
    public void init() {
        partnerDAO = new PartnerDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

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
            // Get partner data from database
            Partenaire partner = partnerDAO.getPartnerById(partnerId);
            
            if (partner == null) {
                sendErrorResponse(response, HttpServletResponse.SC_NOT_FOUND, "Partenaire non trouvé");
                return;
            }

            // Create JSON response (exclude password)
            JsonObject jsonResponse = new JsonObject();
            jsonResponse.addProperty("success", true);
            
            JsonObject partnerData = new JsonObject();
            partnerData.addProperty("idPartenaire", partner.getIdPartenaire());
            partnerData.addProperty("nom", partner.getNom());
            partnerData.addProperty("prenom", partner.getPrenom());
            partnerData.addProperty("mail", partner.getMail());
            partnerData.addProperty("numTelephone", partner.getNumTelephone() != null ? partner.getNumTelephone() : "");
            partnerData.addProperty("nomEntreprise", partner.getNomEntreprise() != null ? partner.getNomEntreprise() : "");
            partnerData.addProperty("typeActivite", partner.getTypeActivite() != null ? partner.getTypeActivite() : "");
            partnerData.addProperty("adresse", partner.getAdresse() != null ? partner.getAdresse() : "");
            
            jsonResponse.add("partner", partnerData);

            response.getWriter().write(new Gson().toJson(jsonResponse));
            logger.info("Profile data retrieved for partner ID: " + partnerId);

        } catch (Exception e) {
            logger.severe("Error retrieving partner profile: " + e.getMessage());
            sendErrorResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erreur lors de la récupération du profil");
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




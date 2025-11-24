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
 * Servlet for changing partner password
 * URL pattern configured in web.xml
 */
public class ChangePasswordServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(ChangePasswordServlet.class.getName());
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
            String currentPassword = request.getParameter("currentPassword");
            String newPassword = request.getParameter("newPassword");

            // Validate required fields
            if (currentPassword == null || currentPassword.trim().isEmpty() ||
                newPassword == null || newPassword.trim().isEmpty()) {
                sendErrorResponse(response, HttpServletResponse.SC_BAD_REQUEST, "Tous les champs doivent être remplis");
                return;
            }

            // Validate new password length
            if (newPassword.length() < 6) {
                sendErrorResponse(response, HttpServletResponse.SC_BAD_REQUEST, "Le mot de passe doit contenir au moins 6 caractères");
                return;
            }

            // Verify current password
            if (!partnerDAO.verifyPassword(partnerId, currentPassword)) {
                sendErrorResponse(response, HttpServletResponse.SC_BAD_REQUEST, "Mot de passe actuel incorrect");
                return;
            }

            // Update password in database
            boolean success = partnerDAO.updatePartnerPassword(partnerId, newPassword);

            if (success) {
                JsonObject jsonResponse = new JsonObject();
                jsonResponse.addProperty("success", true);
                jsonResponse.addProperty("message", "Mot de passe changé avec succès");
                response.getWriter().write(new Gson().toJson(jsonResponse));
                logger.info("Password changed for partner ID: " + partnerId);
            } else {
                sendErrorResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erreur lors du changement de mot de passe");
            }

        } catch (Exception e) {
            logger.severe("Error changing partner password: " + e.getMessage());
            e.printStackTrace();
            sendErrorResponse(response, HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Erreur lors du changement de mot de passe");
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


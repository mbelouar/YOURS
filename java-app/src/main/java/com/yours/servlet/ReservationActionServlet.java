package com.yours.servlet;

import com.yours.dao.ReservationDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.logging.Logger;

@WebServlet("/partner/reservation-action")
public class ReservationActionServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(ReservationActionServlet.class.getName());
    private ReservationDAO reservationDAO;
    
    @Override
    public void init() throws ServletException {
        super.init();
        reservationDAO = new ReservationDAO();
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=UTF-8");
        
        logger.info("=== ReservationActionServlet: doPost appelé ===");
        
        try {
            // Vérifier que l'utilisateur est connecté en tant que partenaire
            HttpSession session = request.getSession(false);
            
            if (session == null) {
                logger.warning("Session est null - utilisateur non connecté");
                response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                response.getWriter().write("{\"success\": false, \"error\": \"Vous devez être connecté en tant que partenaire.\"}");
                return;
            }
            
            Object partnerIdObj = session.getAttribute("partnerId");
            if (partnerIdObj == null) {
                logger.warning("partnerId est null dans la session");
                response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                response.getWriter().write("{\"success\": false, \"error\": \"Vous devez être connecté en tant que partenaire.\"}");
                return;
            }
            
            int partnerId = (Integer) partnerIdObj;
            logger.info("Partenaire ID: " + partnerId);
            
            // Récupérer l'action (accept ou reject)
            String action = request.getParameter("action");
            if (action == null || (!action.equals("accept") && !action.equals("reject"))) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().write("{\"success\": false, \"error\": \"Action invalide. Utilisez 'accept' ou 'reject'\"}");
                return;
            }
            
            // Récupérer l'ID de la réservation
            String reservationIdStr = request.getParameter("idReservation");
            if (reservationIdStr == null || reservationIdStr.trim().isEmpty()) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().write("{\"success\": false, \"error\": \"ID de la réservation requis\"}");
                return;
            }
            
            int reservationId;
            try {
                reservationId = Integer.parseInt(reservationIdStr.trim());
            } catch (NumberFormatException e) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().write("{\"success\": false, \"error\": \"Format d'ID invalide\"}");
                return;
            }
            
            boolean success = false;
            String message = "";
            
            if ("accept".equals(action)) {
                // Accepter la réservation
                success = reservationDAO.acceptReservation(reservationId, partnerId);
                message = success ? "Réservation acceptée avec succès" : "Erreur lors de l'acceptation de la réservation";
            } else if ("reject".equals(action)) {
                // Refuser la réservation
                success = reservationDAO.rejectReservation(reservationId, partnerId);
                message = success ? "Réservation refusée avec succès" : "Erreur lors du refus de la réservation";
            }
            
            if (success) {
                logger.info("Réservation " + action + " avec succès - ID: " + reservationId);
                response.setStatus(HttpServletResponse.SC_OK);
                response.getWriter().write("{\"success\": true, \"message\": \"" + message + "\"}");
            } else {
                logger.warning("Échec de l'action " + action + " sur la réservation ID: " + reservationId);
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.getWriter().write("{\"success\": false, \"error\": \"" + message + "\"}");
            }
            
        } catch (Exception e) {
            logger.severe("Erreur dans ReservationActionServlet: " + e.getMessage());
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            String errorMessage = e.getMessage() != null ? e.getMessage().replace("\"", "\\\"") : "Erreur inconnue";
            response.getWriter().write("{\"success\": false, \"error\": \"Erreur serveur: " + errorMessage + "\"}");
        }
    }
}



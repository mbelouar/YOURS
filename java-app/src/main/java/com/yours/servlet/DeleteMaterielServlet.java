package com.yours.servlet;

import com.yours.dao.MaterielDAO;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.logging.Logger;

@WebServlet(name = "DeleteMaterielServlet", urlPatterns = {"/partner/delete-materiel"})
public class DeleteMaterielServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(DeleteMaterielServlet.class.getName());
    private MaterielDAO materielDAO;
    
    @Override
    public void init() throws ServletException {
        super.init();
        materielDAO = new MaterielDAO();
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=UTF-8");
        
        logger.info("=== DeleteMaterielServlet: doPost appelé ===");
        
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
            
            // Récupérer l'ID du matériel à supprimer
            String materielIdStr = request.getParameter("idMateriel");
            logger.info("ID du matériel reçu: " + materielIdStr);
            
            if (materielIdStr == null || materielIdStr.trim().isEmpty()) {
                logger.warning("ID du matériel est null ou vide");
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().write("{\"success\": false, \"error\": \"ID du matériel requis\"}");
                return;
            }
            
            int materielId;
            try {
                materielId = Integer.parseInt(materielIdStr.trim());
                logger.info("ID du matériel parsé: " + materielId);
            } catch (NumberFormatException e) {
                logger.severe("Erreur de parsing de l'ID: " + materielIdStr);
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().write("{\"success\": false, \"error\": \"Format d'ID invalide: " + materielIdStr + "\"}");
                return;
            }
            
            // Vérifier que le matériel appartient au partenaire
            com.yours.model.Materiel existingMateriel = materielDAO.getMaterielById(materielId);
            if (existingMateriel == null || existingMateriel.getIdPartenaire() != partnerId) {
                response.setStatus(HttpServletResponse.SC_FORBIDDEN);
                response.getWriter().write("{\"success\": false, \"error\": \"Matériel non trouvé ou vous n'avez pas la permission de le supprimer\"}");
                return;
            }
            
            // Supprimer le matériel (les photos seront supprimées automatiquement via CASCADE)
            if (!materielDAO.deleteMateriel(materielId, partnerId)) {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.getWriter().write("{\"success\": false, \"error\": \"Erreur lors de la suppression du matériel\"}");
                return;
            }
            
            logger.info("Matériel supprimé avec succès - ID: " + materielId);
            
            // Réponse de succès
            response.setStatus(HttpServletResponse.SC_OK);
            response.getWriter().write("{\"success\": true, \"message\": \"Matériel supprimé avec succès\"}");
            
        } catch (NumberFormatException e) {
            logger.severe("Erreur de format de nombre: " + e.getMessage());
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("{\"success\": false, \"error\": \"Format d'ID invalide: " + e.getMessage() + "\"}");
        } catch (Exception e) {
            logger.severe("Erreur dans DeleteMaterielServlet: " + e.getMessage());
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            String errorMessage = e.getMessage() != null ? e.getMessage().replace("\"", "\\\"") : "Erreur inconnue";
            response.getWriter().write("{\"success\": false, \"error\": \"Erreur serveur: " + errorMessage + "\"}");
        }
    }
}


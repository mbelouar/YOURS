package com.yours.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.yours.dao.MaterielDAO;
import com.yours.model.Materiel;

import java.io.IOException;

@WebServlet("/materiel/details")
public class MaterielDetailsServlet extends HttpServlet {
    
    private MaterielDAO materielDAO;
    
    @Override
    public void init() throws ServletException {
        materielDAO = new MaterielDAO();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String idParam = request.getParameter("id");
        
        if (idParam == null || idParam.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID du matériel requis");
            return;
        }
        
        try {
            int materielId = Integer.parseInt(idParam);
            
            // Ajouter des logs pour déboguer
            System.out.println("=== MaterielDetailsServlet: Recherche matériel ID = " + materielId + " ===");
            
            Materiel materiel = materielDAO.getMaterielById(materielId);
            
            if (materiel == null) {
                System.out.println("Matériel non trouvé pour ID: " + materielId);
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Matériel non trouvé");
                return;
            }
            
            System.out.println("Matériel trouvé: " + materiel.getNom());
            
            // Rediriger vers la page detail.jsp avec l'ID en paramètre
            response.sendRedirect(request.getContextPath() + "/pages/equipment/detail.jsp?id=" + materielId);
                   
        } catch (NumberFormatException e) {
            System.err.println("ID invalide: " + idParam);
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID du matériel invalide");
        } catch (Exception e) {
            System.err.println("Erreur détaillée dans MaterielDetailsServlet:");
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, 
                             "Erreur lors de la récupération du matériel: " + e.getMessage());
        }
    }
}
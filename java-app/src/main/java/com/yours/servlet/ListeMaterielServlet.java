package com.yours.servlet;

import com.yours.dao.MaterielDAO;
import com.yours.model.Materiel;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.ServletException;
import java.io.IOException;
import java.util.List;


@WebServlet(name = "ListeMaterielServlet", urlPatterns = {"/equipements"})
public class ListeMaterielServlet extends HttpServlet {
    
    private final MaterielDAO materielDAO = new MaterielDAO();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        System.out.println("=== ListeMaterielServlet: doGet appelé ===");
        
        try {
            // Récupérer la liste des équipements depuis la base de données
            List<Materiel> materiels = materielDAO.getAllMateriels();
            
            System.out.println("Nombre d'équipements récupérés : " + materiels.size());
            
            // Debug : afficher les équipements
            for (Materiel m : materiels) {
                System.out.println("- " + m.getNom() + " : " + m.getPrix() + " MAD");
            }
            
            // Ajouter la liste à la requête
            request.setAttribute("equipments", materiels);
            
            // Rediriger vers la bonne JSP
            request.getRequestDispatcher("/pages/equipment/list-simple.jsp")
                   .forward(request, response);
                   
        } catch (Exception e) {
            System.err.println("Erreur dans ListeMaterielServlet : " + e.getMessage());
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, 
                             "Erreur lors du chargement des équipements");
        }
    }
}
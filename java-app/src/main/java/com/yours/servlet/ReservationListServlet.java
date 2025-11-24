package com.yours.servlet;

import com.yours.dao.ReservationDAO;
import com.yours.model.Reservation;
import com.yours.model.Client;

import jakarta.servlet.http.*;
import jakarta.servlet.ServletException;
import java.io.IOException;
import java.util.List;
import java.util.ArrayList;

public class ReservationListServlet extends HttpServlet {
    private ReservationDAO reservationDAO = new ReservationDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        System.out.println("=== ReservationListServlet: doGet appelé ===");
        
        try {
            // Récupérer les réservations du client connecté
            HttpSession session = request.getSession(false);
            List<Reservation> liste;
            
            if (session != null && session.getAttribute("client") != null) {
                Client client = (Client) session.getAttribute("client");
                System.out.println("Récupération des réservations pour le client - ID: " + 
                                 client.getIdClient() + ", Nom: " + client.getNom());
                
                // Récupérer uniquement les réservations de ce client
                liste = reservationDAO.findAll(client.getIdClient());
                System.out.println("Nombre de réservations trouvées pour le client: " + liste.size());
            } else {
                // Si aucun client connecté, on peut retourner une liste vide ou toutes les réservations
                // Pour des raisons de sécurité, nous retournons une liste vide
                System.out.println("Aucun client connecté - Retour d'une liste vide");
                liste = new ArrayList<>();
                
                // Rediriger vers la page de connexion si nécessaire
                // response.sendRedirect(request.getContextPath() + "/login");
                // return;
            }
            
            // Calculer les compteurs de statuts
            int enCoursCount = 0;
            int aVenirCount = 0;
            int termineesCount = 0;
            
            for (Reservation res : liste) {
                if ("EN_COURS".equals(res.getStatut())) {
                    enCoursCount++;
                } else if ("A_VENIR".equals(res.getStatut())) {
                    aVenirCount++;
                } else if ("TERMINEE".equals(res.getStatut())) {
                    termineesCount++;
                }
                
                // Log de débogage
                System.out.println(String.format(
                    "Réservation ID: %d, Statut: %s, Début: %s, Fin: %s", 
                    res.getIdReservation(), 
                    res.getStatut(),
                    res.getDateDebut(),
                    res.getDateFin()
                ));
            }
            
            // Stocker les attributs dans la requête
            request.setAttribute("reservations", liste);
            request.setAttribute("totalReservations", liste.size());
            request.setAttribute("enCoursCount", enCoursCount);
            request.setAttribute("aVenirCount", aVenirCount);
            request.setAttribute("termineesCount", termineesCount);
            
            System.out.println("=== Statistiques des réservations ===");
            System.out.println("Total: " + liste.size());
            System.out.println("En cours: " + enCoursCount);
            System.out.println("À venir: " + aVenirCount);
            System.out.println("Terminées: " + termineesCount);
            
            // Transférer la requête vers la page JSP
            request.getRequestDispatcher("/pages/client/reservations.jsp").forward(request, response);
                   
        } catch (Exception e) {
            System.err.println("Erreur dans ReservationListServlet : " + e.getMessage());
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}
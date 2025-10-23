package com.yours.servlet;

import com.yours.dao.ReservationDAO;
import com.yours.model.Reservation;
import com.yours.model.Client;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import jakarta.servlet.ServletException;
import java.io.IOException;
import java.util.List;
import java.util.ArrayList;

@WebServlet("/reservations")
public class ReservationListServlet extends HttpServlet {
    private ReservationDAO reservationDAO = new ReservationDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        System.out.println("=== ReservationListServlet: doGet appelé ===");
        
        try {
            // Récupérer toutes les réservations
            List<Reservation> liste = reservationDAO.findAll();
            
            System.out.println("Nombre de réservations récupérées : " + liste.size());
            
            // Si vous voulez filtrer par client connecté, décommentez :
            /*
            HttpSession session = request.getSession(false);
            if (session != null && session.getAttribute("client") != null) {
                Client client = (Client) session.getAttribute("client");
                List<Reservation> clientReservations = new ArrayList<>();
                for (Reservation res : liste) {
                    if (res.getClient() != null && 
                        res.getClient().getIdClient() == client.getIdClient()) {
                        clientReservations.add(res);
                    }
                }
                liste = clientReservations;
            }
            */
            
            request.setAttribute("reservations", liste);
            
            // CORRECTION : Utiliser le bon chemin de la JSP
            request.getRequestDispatcher("/WEB-INF/views/client/reservations.jsp")
                   .forward(request, response);
                   
        } catch (Exception e) {
            System.err.println("Erreur dans ReservationListServlet : " + e.getMessage());
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}
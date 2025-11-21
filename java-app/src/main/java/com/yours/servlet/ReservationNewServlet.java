package com.yours.servlet;

import com.yours.dao.ReservationDAO;
import com.yours.dao.MaterielDAO;
import com.yours.dao.FactureDAO; // Importer FactureDAO
import com.yours.model.Client;
import com.yours.model.Materiel;
import com.yours.model.Reservation;
import com.yours.model.Facture; // Importer Facture
import jakarta.servlet.*;
import jakarta.servlet.http.*;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.BufferedReader;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Date;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

public class ReservationNewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private ReservationDAO reservationDAO;
    private MaterielDAO materielDAO;
    private FactureDAO factureDAO; // Ajouter factureDAO

    public void init() {
        reservationDAO = new ReservationDAO();
        materielDAO = new MaterielDAO();
        factureDAO = new FactureDAO(); // Initialiser factureDAO
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("client") == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            response.getWriter().write("{\"success\": false, \"message\": \"Veuillez vous connecter pour effectuer une réservation\"}");
            return;
        }
        
        Client client = (Client) session.getAttribute("client");
        
        try {
            // Read JSON from request body
            StringBuilder sb = new StringBuilder();
            BufferedReader reader = request.getReader();
            String line;
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }
            String jsonBody = sb.toString();
            
            // Parse JSON
            ObjectMapper mapper = new ObjectMapper();
            Map<String, String> params = mapper.readValue(jsonBody, new TypeReference<Map<String, String>>() {});

            int idMateriel = Integer.parseInt(params.get("idMateriel"));
            Date dateDebut = Date.valueOf(params.get("dateDebut"));
            Date dateFin = Date.valueOf(params.get("dateFin"));
            double montantTotal = Double.parseDouble(params.get("montantTotal"));

            if (idMateriel == 0 || dateDebut == null || dateFin == null) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().write("{\"success\": false, \"message\": \"Données de réservation incomplètes\"}");
                return;
            }
            
            Materiel materiel = materielDAO.getMaterielById(idMateriel);
            
            if (materiel == null) {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                response.getWriter().write("{\"success\": false, \"message\": \"Matériel non trouvé\"}");
                return;
            }
            
            if (dateDebut.after(dateFin)) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().write("{\"success\": false, \"message\": \"La date de fin doit être postérieure à la date de début\"}");
                return;
            }
            
            Reservation reservation = new Reservation();
            reservation.setIdClient(client.getIdClient());
            reservation.setIdMateriel(idMateriel);
            reservation.setDateDebut(dateDebut);
            reservation.setDateFin(dateFin);
            reservation.setStatut("EN_ATTENTE");
            
            String montantTotalParam = request.getParameter("montantTotal");
            if (montantTotalParam != null && !montantTotalParam.trim().isEmpty()) {
                try {
                    montantTotal = Double.parseDouble(montantTotalParam);
                } catch (NumberFormatException e) {
                    montantTotal = materiel.getPrix();
                }
            } else {
                long diffInMillies = Math.abs(dateFin.getTime() - dateDebut.getTime());
                long diffInDays = TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS);
                montantTotal = materiel.getPrix() * (diffInDays + 1);
            }
            reservation.setMontantTotal(montantTotal);
            
            reservation.setReserve(true);
            if (reservationDAO.save(reservation)) {
                Facture facture = new Facture();
                facture.setIdReservation(reservation.getIdReservation());
                facture.setMontant((float) montantTotal); // La variable est maintenant accessible
                facture.setDateEmission(new java.sql.Date(new java.util.Date().getTime()));
                facture.setStatut("en_attente");
                
                factureDAO.creerFacture(facture);
                
                // Send success JSON response
                response.setStatus(HttpServletResponse.SC_OK);
                String redirectUrl = request.getContextPath() + "/reservations";
                response.getWriter().write("{\"success\": true, \"redirectUrl\": \"" + redirectUrl + "\"}");
            } else {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.getWriter().write("{\"success\": false, \"message\": \"Erreur lors de la création de la réservation\"}");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"success\": false, \"message\": \"Une erreur inattendue est survenue.\"}");
        }
    }
}
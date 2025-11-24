package com.yours.servlet;

import com.yours.dao.ReservationDAO;
import com.yours.model.Reservation;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ArrayNode;
import com.fasterxml.jackson.databind.node.ObjectNode;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

@WebServlet("/api/reservations/partner")
public class ReservationApiServlet extends HttpServlet {
    private ReservationDAO reservationDAO;
    private ObjectMapper objectMapper;
    private SimpleDateFormat dateFormat;

    @Override
    public void init() throws ServletException {
        reservationDAO = new ReservationDAO();
        objectMapper = new ObjectMapper();
        dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        try {
            // Vérifier que l'utilisateur est connecté en tant que partenaire
            HttpSession session = request.getSession(false);
            if (session == null) {
                response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                ObjectNode error = objectMapper.createObjectNode();
                error.put("error", "Non authentifié");
                response.getWriter().write(objectMapper.writeValueAsString(error));
                return;
            }
            
            Object partnerIdObj = session.getAttribute("partnerId");
            if (partnerIdObj == null) {
                response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                ObjectNode error = objectMapper.createObjectNode();
                error.put("error", "Vous devez être connecté en tant que partenaire");
                response.getWriter().write(objectMapper.writeValueAsString(error));
                return;
            }
            
            int partnerId = (Integer) partnerIdObj;
            
            // Récupérer les réservations du partenaire
            List<Reservation> reservations = reservationDAO.findByPartnerId(partnerId);
            
            // Convertir en JSON
            ArrayNode jsonArray = objectMapper.createArrayNode();
            for (Reservation reservation : reservations) {
                ObjectNode json = convertReservationToJson(reservation);
                jsonArray.add(json);
            }
            
            response.getWriter().write(objectMapper.writeValueAsString(jsonArray));
            
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            ObjectNode error = objectMapper.createObjectNode();
            error.put("error", "Erreur serveur: " + e.getMessage());
            response.getWriter().write(objectMapper.writeValueAsString(error));
            e.printStackTrace();
        }
    }
    
    private ObjectNode convertReservationToJson(Reservation reservation) {
        ObjectNode json = objectMapper.createObjectNode();
        
        json.put("id", reservation.getIdReservation());
        json.put("idReservation", reservation.getIdReservation());
        
        // Dates
        if (reservation.getDateDebut() != null) {
            json.put("dateDebut", dateFormat.format(reservation.getDateDebut()));
            json.put("startDate", dateFormat.format(reservation.getDateDebut()));
        }
        if (reservation.getDateFin() != null) {
            json.put("dateFin", dateFormat.format(reservation.getDateFin()));
            json.put("endDate", dateFormat.format(reservation.getDateFin()));
        }
        
        // Calculer le nombre de jours
        if (reservation.getDateDebut() != null && reservation.getDateFin() != null) {
            long diff = reservation.getDateFin().getTime() - reservation.getDateDebut().getTime();
            long days = diff / (1000 * 60 * 60 * 24);
            json.put("days", days);
        }
        
        // Statut de réservation (acceptée ou non)
        json.put("reserve", reservation.isReserve());
        
        // Statut calculé (A_VENIR, EN_COURS, TERMINEE)
        json.put("statut", reservation.getStatut() != null ? reservation.getStatut() : "UNKNOWN");
        
        // Montant total
        json.put("montantTotal", reservation.getMontantTotal());
        
        // Client
        if (reservation.getClient() != null) {
            ObjectNode client = objectMapper.createObjectNode();
            client.put("id", reservation.getClient().getIdClient());
            client.put("name", reservation.getClient().getNom() + " " + 
                      (reservation.getClient().getPrenom() != null ? reservation.getClient().getPrenom() : ""));
            client.put("nom", reservation.getClient().getNom());
            client.put("prenom", reservation.getClient().getPrenom() != null ? reservation.getClient().getPrenom() : "");
            client.put("phone", reservation.getClient().getNumTelephone() != null ? reservation.getClient().getNumTelephone() : "");
            client.put("email", reservation.getClient().getMail() != null ? reservation.getClient().getMail() : "");
            json.set("client", client);
        }
        
        // Matériel
        if (reservation.getMateriel() != null) {
            ObjectNode equipment = objectMapper.createObjectNode();
            equipment.put("id", reservation.getMateriel().getIdMateriel());
            equipment.put("name", reservation.getMateriel().getNom());
            equipment.put("prix", reservation.getMateriel().getPrix());
            json.set("equipment", equipment);
            json.put("equipmentName", reservation.getMateriel().getNom());
            json.put("pricePerDay", reservation.getMateriel().getPrix());
        }
        
        // Statut pour l'affichage (pending, active, completed)
        String displayStatus;
        if (reservation.isReserve()) {
            if ("TERMINEE".equals(reservation.getStatut())) {
                displayStatus = "completed";
            } else if ("EN_COURS".equals(reservation.getStatut())) {
                displayStatus = "active";
            } else {
                displayStatus = "active";
            }
        } else {
            displayStatus = "pending";
        }
        json.put("status", displayStatus);
        
        return json;
    }
}



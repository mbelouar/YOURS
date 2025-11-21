package com.yours.servlet;

import com.yours.dao.ReservationDAO;
import com.yours.dao.MaterielDAO;
import com.yours.dao.FactureDAO;
import com.yours.model.Client;
import com.yours.model.Materiel;
import com.yours.model.Reservation;
import com.yours.model.Facture;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Date;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.concurrent.TimeUnit;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

public class ReservationListServlet extends HttpServlet {
    private ReservationDAO reservationDAO;
    private MaterielDAO materielDAO;
    private FactureDAO factureDAO;

    @Override
    public void init() {
        reservationDAO = new ReservationDAO();
        materielDAO = new MaterielDAO();
        factureDAO = new FactureDAO();
    }

    // GET - Lister les réservations
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        System.out.println("=== ReservationListServlet: doGet appelé ===");
        
        try {
            HttpSession session = request.getSession(false);
            List<Reservation> liste;
            
            if (session != null && session.getAttribute("client") != null) {
                Client client = (Client) session.getAttribute("client");
                System.out.println("Récupération des réservations pour le client - ID: " + 
                                 client.getIdClient() + ", Nom: " + client.getNom());
                
                liste = reservationDAO.findAll(client.getIdClient());
                System.out.println("Nombre de réservations trouvées: " + liste.size());
            } else {
                System.out.println("Aucun client connecté - Retour d'une liste vide");
                liste = new ArrayList<>();
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
            }
            
            // Stocker les attributs
            request.setAttribute("reservations", liste);
            request.setAttribute("totalReservations", liste.size());
            request.setAttribute("enCoursCount", enCoursCount);
            request.setAttribute("aVenirCount", aVenirCount);
            request.setAttribute("termineesCount", termineesCount);
            
            // Transférer vers la JSP
            request.getRequestDispatcher("/pages/client/reservations.jsp").forward(request, response);
                   
        } catch (Exception e) {
            System.err.println("Erreur dans doGet : " + e.getMessage());
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    // POST - Créer une réservation
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        System.out.println("=== ReservationListServlet: doPost appelé ===");
        
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
            // Lire le JSON
            StringBuilder sb = new StringBuilder();
            BufferedReader reader = request.getReader();
            String line;
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }
            String jsonBody = sb.toString();
            System.out.println("JSON reçu: " + jsonBody);
            
            // Parser le JSON
            ObjectMapper mapper = new ObjectMapper();
            Map<String, String> params = mapper.readValue(jsonBody, new TypeReference<Map<String, String>>() {});

            int idMateriel = Integer.parseInt(params.get("idMateriel"));
            Date dateDebut = Date.valueOf(params.get("dateDebut"));
            Date dateFin = Date.valueOf(params.get("dateFin"));
            double montantTotal = Double.parseDouble(params.get("montantTotal"));

            System.out.println("Données parsées - Matériel: " + idMateriel + ", Début: " + dateDebut + ", Fin: " + dateFin);

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
            
            // Créer la réservation
            Reservation reservation = new Reservation();
            reservation.setIdClient(client.getIdClient());
            reservation.setIdMateriel(idMateriel);
            reservation.setDateDebut(dateDebut);
            reservation.setDateFin(dateFin);
            reservation.setStatut("EN_ATTENTE");
            
            // Calculer le montant si nécessaire
            if (montantTotal == 0) {
                long diffInMillies = Math.abs(dateFin.getTime() - dateDebut.getTime());
                long diffInDays = TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS);
                montantTotal = materiel.getPrix() * (diffInDays + 1);
            }
            reservation.setMontantTotal(montantTotal);
            reservation.setReserve(true);
            
            // Sauvegarder
            if (reservationDAO.save(reservation)) {
                System.out.println("Réservation créée avec succès - ID: " + reservation.getIdReservation());
                
                // Créer la facture
                Facture facture = new Facture();
                facture.setIdReservation(reservation.getIdReservation());
                facture.setMontant((float) montantTotal);
                facture.setDateEmission(new java.sql.Date(new java.util.Date().getTime()));
                facture.setStatut("en_attente");
                
                factureDAO.creerFacture(facture);
                
                // Retourner succès avec redirection vers /reservations
                response.setStatus(HttpServletResponse.SC_OK);
                response.getWriter().write("{\"success\": true, \"redirectUrl\": \"/reservations\"}");
            } else {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.getWriter().write("{\"success\": false, \"message\": \"Erreur lors de la création de la réservation\"}");
            }
            
        } catch (Exception e) {
            System.err.println("Erreur dans doPost: " + e.getMessage());
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"success\": false, \"message\": \"Une erreur inattendue est survenue: " + e.getMessage() + "\"}");
        }
    }
}
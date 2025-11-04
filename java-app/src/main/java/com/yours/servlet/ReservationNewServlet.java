package com.yours.servlet;

import com.yours.dao.ReservationDAO;
import com.yours.dao.MaterielDAO;
import com.yours.model.Reservation;
import com.yours.model.Client;
import com.yours.model.Materiel;

import jakarta.servlet.ServletException;
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
    private ReservationDAO reservationDAO;
    private MaterielDAO materielDAO;
    
    @Override
    public void init() throws ServletException {
        reservationDAO = new ReservationDAO();
        materielDAO = new MaterielDAO();
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String idMaterielParam = request.getParameter("idMateriel");
        
        if (idMaterielParam == null || idMaterielParam.trim().isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID du matériel requis");
            return;
        }
        
        try {
            int idMateriel = Integer.parseInt(idMaterielParam);
            
            System.out.println("Tentative de récupération du matériel avec l'ID: " + idMateriel);
            
            // Récupérer les détails du matériel
            Materiel materiel = materielDAO.getMaterielById(idMateriel);
            
            System.out.println("Matériel récupéré: " + (materiel != null ? materiel.getNom() : "null"));
            
            if (materiel == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Matériel non trouvé");
                return;
            }
            
            // Vérifier si l'utilisateur est connecté
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("client") == null) {
                // Rediriger vers la page de connexion
                response.sendRedirect(request.getContextPath() + "/login?redirect=" + 
                    request.getRequestURI() + "?" + request.getQueryString());
                return;
            }
            
            request.setAttribute("materiel", materiel);
            request.getRequestDispatcher("/pages/reservation/new.jsp")
                   .forward(request, response);
                   
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "ID du matériel invalide");
        } catch (Exception e) {
            String errorMsg = "Erreur lors du chargement du formulaire de réservation";
            System.err.println(errorMsg + ": " + e.getMessage());
            e.printStackTrace();
            
            // Stocker les informations d'erreur pour la vue
            request.setAttribute("error", errorMsg);
            request.setAttribute("errorDetails", e.toString() + "\n" + 
                java.util.stream.Stream.of(e.getStackTrace())
                    .limit(10)
                    .map(StackTraceElement::toString)
                    .collect(java.util.stream.Collectors.joining("\n"))
            );
            
            // Essayer d'afficher la page d'erreur
            try {
                request.getRequestDispatcher("/error").forward(request, response);
            } catch (Exception ex) {
                // Si l'affichage de la page d'erreur échoue, renvoyer une erreur HTTP
                response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, errorMsg);
            }
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Définir le type de contenu de la réponse
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        // Vérifier la session utilisateur
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("client") == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            response.getWriter().write("{\"success\": false, \"message\": \"Veuillez vous connecter pour effectuer une réservation\"}");
            return;
        }
        
        
        
        Client client = (Client) session.getAttribute("client");
        
        try {
            // Récupérer les données du formulaire
            int idMateriel = Integer.parseInt(request.getParameter("idMateriel"));
            Date dateDebut = Date.valueOf(request.getParameter("dateDebut"));
            Date dateFin = Date.valueOf(request.getParameter("dateFin"));
            
            if (idMateriel == 0 || dateDebut == null || dateFin == null) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().write("{\"success\": false, \"message\": \"Données de réservation incomplètes\"}");
                return;
            }
            
            // Récupérer le matériel
            Materiel materiel = materielDAO.getMaterielById(idMateriel);
            
            if (materiel == null) {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                response.getWriter().write("{\"success\": false, \"message\": \"Matériel non trouvé\"}");
                return;
            }
            
            // Vérifier la disponibilité du matériel
            
            if (dateDebut.after(dateFin)) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().write("{\"success\": false, \"message\": \"La date de fin doit être postérieure à la date de début\"}");
                return;
            }
            
            // Vérifier si le matériel est disponible pour la période demandée
            // Note: Implémentez cette méthode dans ReservationDAO si nécessaire
            // Pour l'instant, nous supposons que le matériel est disponible
            // if (reservationDAO.estMaterielReserve(idMateriel, dateDebut, dateFin)) {
            //     response.setStatus(HttpServletResponse.SC_CONFLICT);
            //     response.getWriter().write("{\"success\": false, \"message\": \"Le matériel n'est pas disponible pour la période demandée\"}");
            //     return;
            // }
            
            // Créer la réservation
            Reservation reservation = new Reservation();
            reservation.setIdClient(client.getIdClient());
            reservation.setIdMateriel(idMateriel);
            reservation.setDateDebut(dateDebut);
            reservation.setDateFin(dateFin);
            reservation.setStatut("EN_ATTENTE");
            
            // Définir le montant total s'il est fourni, sinon utiliser le prix du matériel
            String montantTotalParam = request.getParameter("montantTotal");
            if (montantTotalParam != null && !montantTotalParam.trim().isEmpty()) {
                try {
                    double montantTotal = Double.parseDouble(montantTotalParam);
                    reservation.setMontantTotal(montantTotal);
                } catch (NumberFormatException e) {
                    // En cas d'erreur de format, utiliser le prix du matériel
                    reservation.setMontantTotal(materiel.getPrix());
                }
            } else {
                // Calculer le montant total en fonction de la durée
                long diffInMillies = Math.abs(dateFin.getTime() - dateDebut.getTime());
                long diffInDays = TimeUnit.DAYS.convert(diffInMillies, TimeUnit.MILLISECONDS);
                double montantTotal = materiel.getPrix() * (diffInDays + 1);
                reservation.setMontantTotal(montantTotal);
            }
            
            // Sauvegarder la réservation
            try {
                // Utiliser la méthode save existante de ReservationDAO
                reservation.setReserve(true); // Marquer comme réservé
                boolean success = reservationDAO.save(reservation);
                
               if (success) {
    response.sendRedirect(request.getContextPath() + "/reservations");
    return;

 } else {
                    response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                    response.getWriter().write("{\"success\": false, \"message\": \"Erreur lors de la création de la réservation\"}");
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.getWriter().write(String.format(
                    "{\"success\": false, \"message\": \"%s\"}", 
                    e.getMessage().replace("\"", "\\\"")
                ));
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"success\": false, \"message\": \"" + e.getMessage() + "\"}");
        }
    }
}
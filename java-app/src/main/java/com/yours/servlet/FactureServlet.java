package com.yours.servlet;

import com.google.gson.Gson;
import com.yours.model.Facture;
import com.yours.service.FactureService;
import com.yours.util.DatabaseConnection;

import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.yours.model.Client;


@WebServlet("/api/factures")
public class FactureServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private final Gson gson = new Gson();
    private final FactureService factureService = new FactureService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        try {
            // Récupérer l'ID du client connecté depuis la session
            HttpSession session = request.getSession(false);
            if (session == null || session.getAttribute("client") == null) {
    response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
    response.getWriter().write("{\"error\":\"Non autorisé\"}");
    return;
}

Client client = (Client) session.getAttribute("client");
int clientId = client.getIdClient();

            
            // Récupérer le filtre d'année s'il est présent
            String annee = request.getParameter("annee");
            
            // Récupérer les factures du client
            List<Facture> factures = factureService.getFacturesByClientId(clientId, annee);
            
            // Convertir en JSON et envoyer la réponse
            String jsonResponse = gson.toJson(factures);
            response.getWriter().write(jsonResponse);
            
        } catch (SQLException e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\":\"Erreur lors de la récupération des factures\"}");
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\":\"Une erreur est survenue\"}");
        }
    }
}

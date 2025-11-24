package com.yours.service;

import com.yours.model.Facture;
import com.yours.util.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class FactureService {
    
    public List<Facture> getFacturesByClientId(int clientId, String annee) throws SQLException {
        List<Facture> factures = new ArrayList<>();
        String sql = "SELECT f.*, r.dateDebut, r.dateFin, m.nom as nomMateriel, m.prix " +
                    "FROM facture f " +
                    "JOIN reservation r ON f.idReservation = r.idReservation " +
                    "JOIN materiel m ON r.idMateriel = m.idMateriel " +
                    "WHERE r.idClient = ?";
        
        // Ajouter le filtre d'année si spécifié
        if (annee != null && !annee.isEmpty() && !annee.equals("all")) {
            sql += " AND YEAR(f.dateEmission) = ?";
        }
        
        sql += " ORDER BY f.dateEmission DESC";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            
            stmt.setInt(1, clientId);
            
            if (annee != null && !annee.isEmpty() && !annee.equals("all")) {
                stmt.setString(2, annee);
            }
            
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Facture facture = new Facture();
                    facture.setIdFacture(rs.getInt("idFacture"));
                    facture.setMontant(rs.getFloat("montant"));
                    facture.setDateEmission(rs.getDate("dateEmission"));
                    facture.setIdReservation(rs.getInt("idReservation"));
                    
                    // Ajouter des informations supplémentaires pour l'affichage
                    facture.setNomMateriel(rs.getString("nomMateriel"));
                    facture.setDateDebut(rs.getDate("dateDebut"));
                    facture.setDateFin(rs.getDate("dateFin"));
                    facture.setPrixJournalier(rs.getFloat("prix"));
                    
                    // Calculer le statut de la facture (exemple simplifié)
                    facture.setStatut("payée"); // À remplacer par la logique réelle
                    
                    factures.add(facture);
                }
            }
        }
        
        return factures;
    }
}

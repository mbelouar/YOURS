package com.yours.dao;

import com.yours.model.Reservation;
import com.yours.model.Client;
import com.yours.model.Materiel;
import com.yours.util.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReservationDAO {
    /**
     * Récupère la liste des réservations
     * @param idClient ID du client pour filtrer les réservations (optionnel)
     * @return Liste des réservations
     */
    public List<Reservation> findAll(Integer idClient) {
        List<Reservation> liste = new ArrayList<>();
        StringBuilder sql = new StringBuilder(
            "SELECT r.*, c.nom AS nomClient, m.nom AS nomMateriel, m.prix, " +
            "CASE " +
            "  WHEN r.dateDebut > CURRENT_DATE THEN 'A_VENIR' " +
            "  WHEN r.dateFin < CURRENT_DATE THEN 'TERMINEE' " +
            "  ELSE 'EN_COURS' " +
            "END AS statut, " +
            "DATEDIFF(r.dateFin, r.dateDebut) * m.prix AS montantTotal " +
            "FROM reservation r " +
            "LEFT JOIN client c ON r.idClient = c.idClient " +
            "LEFT JOIN materiel m ON r.idMateriel = m.idMateriel"
        );
        
        // Ajout du filtre par client si spécifié
        if (idClient != null) {
            sql.append(" WHERE r.idClient = ?");
        }

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql.toString())) {
            
            // Définition du paramètre idClient si spécifié
            if (idClient != null) {
                stmt.setInt(1, idClient);
            }
            
            System.out.println("Exécution de la requête: " + sql);
            if (idClient != null) {
                System.out.println("Avec paramètre idClient: " + idClient);
            }
            
            try (ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Reservation r = new Reservation();
                r.setIdReservation(rs.getInt("idReservation"));
                r.setDateDebut(rs.getDate("dateDebut"));
                r.setDateFin(rs.getDate("dateFin"));
                r.setReserve(rs.getBoolean("reserve"));
                r.setIdClient(rs.getInt("idClient"));
                r.setIdMateriel(rs.getInt("idMateriel"));
                
                // Définir le statut calculé
                r.setStatut(rs.getString("statut"));
                
                // Définir le montant total calculé
                r.setMontantTotal(rs.getDouble("montantTotal"));

                // Créer et définir le client
                Client c = new Client();
                c.setIdClient(rs.getInt("idClient"));
                c.setNom(rs.getString("nomClient"));
                r.setClient(c);

                // Créer et définir le matériel
                Materiel m = new Materiel();
                m.setIdMateriel(rs.getInt("idMateriel"));
                m.setNom(rs.getString("nomMateriel"));
                m.setPrix(rs.getFloat("prix"));
                r.setMateriel(m);

                liste.add(r);
                System.out.println("Réservation chargée - ID: " + r.getIdReservation() + 
                               ", Client: " + (r.getClient() != null ? r.getClient().getNom() : "null") +
                               ", Matériel: " + (r.getMateriel() != null ? r.getMateriel().getNom() : "null"));
            }
            }
        } catch (SQLException e) {
            System.err.println("Erreur lors de la récupération des réservations: " + e.getMessage());
            e.printStackTrace();
        }
        return liste;
    }
    
    public boolean save(Reservation reservation) {
        String sql = "INSERT INTO reservation (dateDebut, dateFin, reserve, idClient, idMateriel) VALUES (?, ?, ?, ?, ?)";
        
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            
            stmt.setDate(1, reservation.getDateDebut());
            stmt.setDate(2, reservation.getDateFin());
            stmt.setBoolean(3, reservation.isReserve());
            stmt.setInt(4, reservation.getIdClient());
            stmt.setInt(5, reservation.getIdMateriel());
            
            int rowsAffected = stmt.executeUpdate();
            
            if (rowsAffected > 0) {
                try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        reservation.setIdReservation(generatedKeys.getInt(1));
                    }
                }
                return true;
            }
            
        } catch (SQLException e) {
            System.err.println("Erreur lors de la sauvegarde de la réservation : " + e.getMessage());
            e.printStackTrace();
        }
        
        return false;
    }
}

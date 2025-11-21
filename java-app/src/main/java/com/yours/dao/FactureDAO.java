package com.yours.dao;

import com.yours.model.Facture;
import com.yours.util.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;

public class FactureDAO {

    public boolean creerFacture(Facture facture) {
        String sql = "INSERT INTO facture (idReservation, montant, dateEmission, statut) VALUES (?, ?, ?, ?)";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            stmt.setInt(1, facture.getIdReservation());
            stmt.setFloat(2, facture.getMontant());
            stmt.setDate(3, new java.sql.Date(facture.getDateEmission().getTime()));
            stmt.setString(4, facture.getStatut()); // Ajout du statut

            int rowsAffected = stmt.executeUpdate();

            if (rowsAffected > 0) {
                try (ResultSet generatedKeys = stmt.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        facture.setIdFacture(generatedKeys.getInt(1));
                    }
                }
                return true;
            }

        } catch (SQLException e) {
            System.err.println("Erreur lors de la création de la facture : " + e.getMessage());
            e.printStackTrace();
        }

        return false;
    }
}
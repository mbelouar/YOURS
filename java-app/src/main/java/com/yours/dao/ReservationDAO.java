package com.yours.dao;

import com.yours.model.Reservation;
import com.yours.model.Client;
import com.yours.model.Materiel;
import com.yours.util.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReservationDAO {
    public List<Reservation> findAll() {
        List<Reservation> liste = new ArrayList<>();
        String sql = "SELECT r.*, c.nom AS nomClient, m.nom AS nomMateriel, m.prix " +
                     "FROM reservation r " +
                     "LEFT JOIN client c ON r.idClient = c.idClient " +
                     "LEFT JOIN materiel m ON r.idMateriel = m.idMateriel";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Reservation r = new Reservation();
                r.setIdReservation(rs.getInt("idReservation"));
                r.setDateDebut(rs.getDate("dateDebut"));
                r.setDateFin(rs.getDate("dateFin"));
                r.setReserve(rs.getBoolean("reserve"));

                Client c = new Client();
                c.setNom(rs.getString("nomClient"));
                r.setClient(c);

                Materiel m = new Materiel();
                m.setNom(rs.getString("nomMateriel"));
                m.setPrix(rs.getFloat("prix"));
                r.setMateriel(m);

                liste.add(r);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return liste;
    }
}

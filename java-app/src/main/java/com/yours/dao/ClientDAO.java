package com.yours.dao;

import com.yours.model.Client;
import com.yours.util.DatabaseConnection;
import com.yours.util.PasswordUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 * Simplified Data Access Object for Client entity
 * Handles database operations for clients with only registration fields
 */
public class ClientDAO {
    private static final Logger logger = Logger.getLogger(ClientDAO.class.getName());

    /**
     * Creates a new client in the database with only registration fields.
     *
     * @param client The client object to create.
     * @return The created client with its generated ID, or null if creation failed.
     */
    public Client createClient(Client client) {
        String SQL = "INSERT INTO client (nom, prenom, mail, numTelephone, motDepasse) VALUES (?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(SQL, Statement.RETURN_GENERATED_KEYS)) {

            pstmt.setString(1, client.getNom());
            pstmt.setString(2, client.getPrenom());
            pstmt.setString(3, client.getMail());
            pstmt.setString(4, client.getNumTelephone());
            // Hash password with salt
            String[] passwordData = PasswordUtil.hashPasswordWithSalt(client.getMotDepasse());
            String hashedPassword = passwordData[0] + ":" + passwordData[1]; // Store hash:salt
            pstmt.setString(5, hashedPassword);

            int affectedRows = pstmt.executeUpdate();

            if (affectedRows > 0) {
                try (ResultSet rs = pstmt.getGeneratedKeys()) {
                    if (rs.next()) {
                        client.setIdClient(rs.getInt(1));
                        logger.log(Level.INFO, "Client created successfully with ID: {0}", client.getIdClient());
                        return client;
                    }
                }
            }
        } catch (SQLException ex) {
            logger.log(Level.SEVERE, "Error creating client: " + ex.getMessage(), ex);
        } finally {
            // Connection is closed automatically by try-with-resources
        }
        return null;
    }

    /**
     * Retrieves a client by their email address.
     *
     * @param email The email of the client to retrieve.
     * @return The client object if found, otherwise null.
     */
    public Client getClientByEmail(String email) {
        String SQL = "SELECT idClient, nom, prenom, mail, numTelephone, motDepasse FROM client WHERE mail = ?";
        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(SQL)) {

            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                Client client = new Client();
                client.setIdClient(rs.getInt("idClient"));
                client.setNom(rs.getString("nom"));
                client.setPrenom(rs.getString("prenom"));
                client.setMail(rs.getString("mail"));
                client.setNumTelephone(rs.getString("numTelephone"));
                client.setMotDepasse(rs.getString("motDepasse")); // Hashed password from DB

                return client;
            }
        } catch (SQLException ex) {
            logger.log(Level.SEVERE, "Error retrieving client by email: " + ex.getMessage(), ex);
        } finally {
            // Connection is closed automatically by try-with-resources
        }
        return null;
    }

    /**
     * Checks if a client with the given email already exists.
     *
     * @param email The email to check.
     * @return true if a client with the email exists, false otherwise.
     */
    public boolean isEmailRegistered(String email) {
        String SQL = "SELECT COUNT(*) FROM client WHERE mail = ?";
        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(SQL)) {

            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException ex) {
            logger.log(Level.SEVERE, "Error checking email registration: " + ex.getMessage(), ex);
        }
        return false;
    }

    /**
     * Authenticate client with email and password.
     *
     * @param email    Client email
     * @param password Client password
     * @return Client object if authentication successful, null otherwise
     */
    public Client authenticate(String email, String password) {
        Client client = getClientByEmail(email);

        if (client != null) {
            // Parse stored password (format: hash:salt)
            String[] storedPasswordData = client.getMotDepasse().split(":");
            if (storedPasswordData.length == 2) {
                String storedHash = storedPasswordData[0];
                String storedSalt = storedPasswordData[1];

                if (PasswordUtil.verifyPassword(password, storedHash, storedSalt)) {
                    logger.log(Level.INFO, "Client authenticated successfully: {0}", email);
                    return client;
                }
            }
        }

        logger.log(Level.WARNING, "Authentication failed for email: {0}", email);
        return null;
    }
}
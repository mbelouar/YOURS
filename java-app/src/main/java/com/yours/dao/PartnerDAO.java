package com.yours.dao;

import com.yours.model.Partenaire;
import com.yours.util.DatabaseConnection;
import com.yours.util.PasswordUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

public class PartnerDAO {
    private static final Logger logger = Logger.getLogger(PartnerDAO.class.getName());

    // SQL queries
    private static final String INSERT_PARTNER = "INSERT INTO partenaire (nom, prenom, mail, adresse, numTelephone, cinRECTO, cinVERSO, motDepasse, photoPerso, nomEntreprise, typeActivite, numeroSiret) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String SELECT_PARTNER_BY_EMAIL = "SELECT idPartenaire, nom, prenom, mail, adresse, numTelephone, cinRECTO, cinVERSO, motDepasse, photoPerso, nomEntreprise, typeActivite, numeroSiret FROM partenaire WHERE mail = ?";
    private static final String CHECK_EMAIL_REGISTERED = "SELECT COUNT(*) FROM partenaire WHERE mail = ?";

    /**
     * Creates a new partner in the database.
     *
     * @param partner The partner object to create.
     * @return The created partner with its generated ID, or null if creation
     *         failed.
     */
    public Partenaire createPartner(Partenaire partner) {
        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(INSERT_PARTNER, Statement.RETURN_GENERATED_KEYS)) {

            pstmt.setString(1, partner.getNom());
            pstmt.setString(2, partner.getPrenom());
            pstmt.setString(3, partner.getMail());
            pstmt.setString(4, partner.getAdresse());
            pstmt.setString(5, partner.getNumTelephone());
            pstmt.setString(6, partner.getCinRECTO());
            pstmt.setString(7, partner.getCinVERSO());

            // Hash password with salt and store as "hash:salt"
            String[] passwordData = PasswordUtil.hashPasswordWithSalt(partner.getMotDepasse());
            String hashedPassword = passwordData[0] + ":" + passwordData[1]; // Store hash:salt
            pstmt.setString(8, hashedPassword);

            pstmt.setString(9, partner.getPhotoPerso());
            pstmt.setString(10, partner.getNomEntreprise());
            pstmt.setString(11, partner.getTypeActivite());
            pstmt.setString(12, partner.getNumeroSiret());

            int affectedRows = pstmt.executeUpdate();

            if (affectedRows > 0) {
                try (ResultSet rs = pstmt.getGeneratedKeys()) {
                    if (rs.next()) {
                        partner.setIdPartenaire(rs.getInt(1));
                        logger.log(Level.INFO, "Partner created successfully with ID: {0}", partner.getIdPartenaire());
                        return partner;
                    }
                }
            }
        } catch (SQLException ex) {
            logger.log(Level.SEVERE, "Error creating partner: " + ex.getMessage(), ex);
        }
        return null;
    }

    /**
     * Retrieves a partner by their email address.
     *
     * @param email The email of the partner to retrieve.
     * @return The partner object if found, otherwise null.
     */
    public Partenaire getPartnerByEmail(String email) {
        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(SELECT_PARTNER_BY_EMAIL)) {

            pstmt.setString(1, email);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                Partenaire partner = new Partenaire();
                partner.setIdPartenaire(rs.getInt("idPartenaire"));
                partner.setNom(rs.getString("nom"));
                partner.setPrenom(rs.getString("prenom"));
                partner.setMail(rs.getString("mail"));
                partner.setAdresse(rs.getString("adresse"));
                partner.setNumTelephone(rs.getString("numTelephone"));
                partner.setCinRECTO(rs.getString("cinRECTO"));
                partner.setCinVERSO(rs.getString("cinVERSO"));
                partner.setMotDepasse(rs.getString("motDepasse")); // Hashed password from DB (hash:salt)
                partner.setPhotoPerso(rs.getString("photoPerso"));
                partner.setNomEntreprise(rs.getString("nomEntreprise"));
                partner.setTypeActivite(rs.getString("typeActivite"));
                partner.setNumeroSiret(rs.getString("numeroSiret"));
                return partner;
            }
        } catch (SQLException ex) {
            logger.log(Level.SEVERE, "Error retrieving partner by email: " + ex.getMessage(), ex);
        }
        return null;
    }

    /**
     * Checks if a partner with the given email already exists.
     *
     * @param email The email to check.
     * @return true if a partner with the email exists, false otherwise.
     */
    public boolean isEmailRegistered(String email) {
        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(CHECK_EMAIL_REGISTERED)) {

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
     * Authenticate partner with email and password.
     *
     * @param email    Partner email
     * @param password Partner password
     * @return Partner object if authentication successful, null otherwise
     */
    public Partenaire authenticate(String email, String password) {
        Partenaire partner = getPartnerByEmail(email);

        if (partner != null) {
            // Parse stored password (format: hash:salt)
            String[] storedPasswordData = partner.getMotDepasse().split(":");
            if (storedPasswordData.length == 2) {
                String storedHash = storedPasswordData[0];
                String storedSalt = storedPasswordData[1];

                if (PasswordUtil.verifyPassword(password, storedHash, storedSalt)) {
                    logger.log(Level.INFO, "Partner authenticated successfully: {0}", email);
                    return partner;
                }
            }
        }

        logger.log(Level.WARNING, "Authentication failed for email: {0}", email);
        return null;
    }
}

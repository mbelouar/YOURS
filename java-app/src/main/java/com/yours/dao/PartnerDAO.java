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
    private static final String INSERT_PARTNER = "INSERT INTO partenaire (nom, prenom, mail, numTelephone, motDepasse, nomEntreprise, typeActivite, adresse, cinRECTO, cinVERSO, photoPerso) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    private static final String SELECT_PARTNER_BY_EMAIL = "SELECT idPartenaire, nom, prenom, mail, numTelephone, motDepasse, nomEntreprise, typeActivite, adresse, cinRECTO, cinVERSO, photoPerso FROM partenaire WHERE mail = ?";
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
            pstmt.setString(4, partner.getNumTelephone());

            // Hash password with salt and store as "hash:salt"
            String[] passwordData = PasswordUtil.hashPasswordWithSalt(partner.getMotDepasse());
            String hashedPassword = passwordData[0] + ":" + passwordData[1]; // Store hash:salt
            pstmt.setString(5, hashedPassword);

            pstmt.setString(6, partner.getNomEntreprise());
            pstmt.setString(7, partner.getTypeActivite());
            pstmt.setString(8, partner.getAdresse());
            pstmt.setString(9, partner.getCinRECTO());
            pstmt.setString(10, partner.getCinVERSO());
            pstmt.setString(11, partner.getPhotoPerso());

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
                partner.setNumTelephone(rs.getString("numTelephone"));
                partner.setMotDepasse(rs.getString("motDepasse")); // Hashed password from DB (hash:salt)
                partner.setNomEntreprise(rs.getString("nomEntreprise"));
                partner.setTypeActivite(rs.getString("typeActivite"));
                partner.setAdresse(rs.getString("adresse"));
                partner.setCinRECTO(rs.getString("cinRECTO"));
                partner.setCinVERSO(rs.getString("cinVERSO"));
                partner.setPhotoPerso(rs.getString("photoPerso"));
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
     * Supports both new format (hash:salt) and legacy plain text passwords.
     * Automatically migrates legacy passwords to new format on successful login.
     *
     * @param email    Partner email
     * @param password Partner password
     * @return Partner object if authentication successful, null otherwise
     */
    public Partenaire authenticate(String email, String password) {
        Partenaire partner = getPartnerByEmail(email);

        if (partner != null && partner.getMotDepasse() != null) {
            String storedPassword = partner.getMotDepasse();
            
            // Try new format first (hash:salt)
            String[] storedPasswordData = storedPassword.split(":");
            if (storedPasswordData.length == 2) {
                // New format: hash:salt
                String storedHash = storedPasswordData[0];
                String storedSalt = storedPasswordData[1];

                if (PasswordUtil.verifyPassword(password, storedHash, storedSalt)) {
                    logger.log(Level.INFO, "Partner authenticated successfully: {0}", email);
                    return partner;
                }
            } else {
                // Legacy format: plain text password
                // Check if password matches directly
                if (storedPassword.equals(password)) {
                    logger.log(Level.INFO, "Partner authenticated with legacy password: {0}. Migrating to new format...", email);
                    
                    // Migrate password to new format
                    if (updatePartnerPassword(partner.getIdPartenaire(), password)) {
                        logger.log(Level.INFO, "Password migrated successfully for partner: {0}", email);
                    } else {
                        logger.log(Level.WARNING, "Failed to migrate password for partner: {0}", email);
                    }
                    
                    return partner;
                }
            }
        }

        logger.log(Level.WARNING, "Authentication failed for email: {0}", email);
        return null;
    }

    /**
     * Retrieves a partner by their ID.
     *
     * @param partnerId The ID of the partner to retrieve.
     * @return The partner object if found, otherwise null.
     */
    public Partenaire getPartnerById(int partnerId) {
        String query = "SELECT idPartenaire, nom, prenom, mail, numTelephone, motDepasse, nomEntreprise, typeActivite, adresse, cinRECTO, cinVERSO, photoPerso FROM partenaire WHERE idPartenaire = ?";

        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setInt(1, partnerId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                Partenaire partner = new Partenaire();
                partner.setIdPartenaire(rs.getInt("idPartenaire"));
                partner.setNom(rs.getString("nom"));
                partner.setPrenom(rs.getString("prenom"));
                partner.setMail(rs.getString("mail"));
                partner.setNumTelephone(rs.getString("numTelephone"));
                partner.setMotDepasse(rs.getString("motDepasse")); // Hashed password from DB (hash:salt)
                partner.setNomEntreprise(rs.getString("nomEntreprise"));
                partner.setTypeActivite(rs.getString("typeActivite"));
                partner.setAdresse(rs.getString("adresse"));
                partner.setCinRECTO(rs.getString("cinRECTO"));
                partner.setCinVERSO(rs.getString("cinVERSO"));
                partner.setPhotoPerso(rs.getString("photoPerso"));
                return partner;
            }
        } catch (SQLException ex) {
            logger.log(Level.SEVERE, "Error retrieving partner by ID: " + ex.getMessage(), ex);
        }
        return null;
    }

    /**
     * Updates partner image paths in the database.
     *
     * @param partnerId      The ID of the partner to update.
     * @param cinRectoPath   Path to CIN recto image.
     * @param cinVersoPath   Path to CIN verso image.
     * @param photoPersoPath Path to profile photo.
     * @return true if update successful, false otherwise.
     */
    public boolean updatePartnerImages(int partnerId, String cinRectoPath, String cinVersoPath, String photoPersoPath) {
        String query = "UPDATE partenaire SET cinRECTO = ?, cinVERSO = ?, photoPerso = ? WHERE idPartenaire = ?";

        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setString(1, cinRectoPath);
            pstmt.setString(2, cinVersoPath);
            pstmt.setString(3, photoPersoPath);
            pstmt.setInt(4, partnerId);

            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException ex) {
            logger.log(Level.SEVERE, "Error updating partner images: " + ex.getMessage(), ex);
        }
        return false;
    }

    /**
     * Updates partner personal information (nom, prenom, mail, numTelephone).
     *
     * @param partnerId The ID of the partner to update.
     * @param nom The new last name.
     * @param prenom The new first name.
     * @param mail The new email.
     * @param numTelephone The new phone number.
     * @return true if update successful, false otherwise.
     */
    public boolean updatePartner(int partnerId, String nom, String prenom, String mail, String numTelephone) {
        String query = "UPDATE partenaire SET nom = ?, prenom = ?, mail = ?, numTelephone = ? WHERE idPartenaire = ?";

        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(query)) {

            pstmt.setString(1, nom);
            pstmt.setString(2, prenom);
            pstmt.setString(3, mail);
            // Handle null or empty telephone
            if (numTelephone == null || numTelephone.trim().isEmpty()) {
                pstmt.setNull(4, java.sql.Types.VARCHAR);
            } else {
                pstmt.setString(4, numTelephone);
            }
            pstmt.setInt(5, partnerId);

            int affectedRows = pstmt.executeUpdate();
            logger.log(Level.INFO, "Updated partner ID {0}: {1} rows affected", new Object[]{partnerId, affectedRows});
            return affectedRows > 0;
        } catch (SQLException ex) {
            logger.log(Level.SEVERE, "Error updating partner ID " + partnerId + ": " + ex.getMessage(), ex);
            ex.printStackTrace();
        }
        return false;
    }

    /**
     * Updates partner password.
     *
     * @param partnerId The ID of the partner to update.
     * @param newPassword The new password (will be hashed).
     * @return true if update successful, false otherwise.
     */
    public boolean updatePartnerPassword(int partnerId, String newPassword) {
        String query = "UPDATE partenaire SET motDepasse = ? WHERE idPartenaire = ?";

        try (Connection conn = DatabaseConnection.getConnection();
                PreparedStatement pstmt = conn.prepareStatement(query)) {

            // Hash password with salt and store as "hash:salt"
            String[] passwordData = PasswordUtil.hashPasswordWithSalt(newPassword);
            String hashedPassword = passwordData[0] + ":" + passwordData[1];
            pstmt.setString(1, hashedPassword);
            pstmt.setInt(2, partnerId);

            int affectedRows = pstmt.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException ex) {
            logger.log(Level.SEVERE, "Error updating partner password: " + ex.getMessage(), ex);
        }
        return false;
    }

    /**
     * Verifies if the provided password matches the partner's current password.
     * Supports both new format (hash:salt) and legacy plain text passwords.
     *
     * @param partnerId The ID of the partner.
     * @param password The password to verify.
     * @return true if password matches, false otherwise.
     */
    public boolean verifyPassword(int partnerId, String password) {
        Partenaire partner = getPartnerById(partnerId);
        if (partner == null || partner.getMotDepasse() == null) {
            return false;
        }

        String storedPassword = partner.getMotDepasse();
        
        // Try new format first (hash:salt)
        String[] storedPasswordData = storedPassword.split(":");
        if (storedPasswordData.length == 2) {
            // New format: hash:salt
            String storedHash = storedPasswordData[0];
            String storedSalt = storedPasswordData[1];
            return PasswordUtil.verifyPassword(password, storedHash, storedSalt);
        } else {
            // Legacy format: plain text password
            return storedPassword.equals(password);
        }
    }
}

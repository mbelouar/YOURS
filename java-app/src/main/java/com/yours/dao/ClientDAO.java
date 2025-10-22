package com.yours.dao;

import com.yours.model.Client;
import com.yours.util.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

/**
 * Data Access Object for Client entity
 * Handles all database operations related to clients
 */
public class ClientDAO {
    private static final Logger logger = Logger.getLogger(ClientDAO.class.getName());

    // SQL queries
    private static final String INSERT_CLIENT = "INSERT INTO client (nom, prenom, mail, adresse, numTelephone, cinRECTO, cinVERSO, motDepasse, dateNaissance, photoPerso) "
            +
            "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

    private static final String SELECT_CLIENT_BY_ID = "SELECT * FROM client WHERE idClient = ?";

    private static final String SELECT_CLIENT_BY_EMAIL = "SELECT * FROM client WHERE mail = ?";

    private static final String SELECT_ALL_CLIENTS = "SELECT * FROM client ORDER BY nom, prenom";

    private static final String UPDATE_CLIENT = "UPDATE client SET nom = ?, prenom = ?, mail = ?, adresse = ?, numTelephone = ?, "
            +
            "cinRECTO = ?, cinVERSO = ?, motDepasse = ?, dateNaissance = ?, photoPerso = ? " +
            "WHERE idClient = ?";

    private static final String DELETE_CLIENT = "DELETE FROM client WHERE idClient = ?";

    private static final String CHECK_EMAIL_EXISTS = "SELECT COUNT(*) FROM client WHERE mail = ?";

    /**
     * Create a new client in the database
     * 
     * @param client Client object to insert
     * @return true if successful, false otherwise
     */
    public boolean createClient(Client client) {
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            connection = DatabaseConnection.getConnection();
            statement = connection.prepareStatement(INSERT_CLIENT, Statement.RETURN_GENERATED_KEYS);

            // Set parameters
            statement.setString(1, client.getNom());
            statement.setString(2, client.getPrenom());
            statement.setString(3, client.getMail());
            statement.setString(4, client.getAdresse());
            statement.setString(5, client.getNumTelephone());
            statement.setString(6, client.getCinRECTO());
            statement.setString(7, client.getCinVERSO());
            statement.setString(8, client.getMotDepasse());
            statement.setDate(9, client.getDateNaissance());
            statement.setString(10, client.getPhotoPerso());

            int rowsAffected = statement.executeUpdate();

            if (rowsAffected > 0) {
                // Get the generated ID
                ResultSet generatedKeys = statement.getGeneratedKeys();
                if (generatedKeys.next()) {
                    client.setIdClient(generatedKeys.getInt(1));
                    logger.info("Client created successfully with ID: " + client.getIdClient());
                }
                return true;
            }

        } catch (SQLException e) {
            logger.severe("Error creating client: " + e.getMessage());
        } finally {
            closeResources(connection, statement, null);
        }

        return false;
    }

    /**
     * Find client by ID
     * 
     * @param idClient Client ID
     * @return Client object or null if not found
     */
    public Client findById(int idClient) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseConnection.getConnection();
            statement = connection.prepareStatement(SELECT_CLIENT_BY_ID);
            statement.setInt(1, idClient);

            resultSet = statement.executeQuery();

            if (resultSet.next()) {
                return mapResultSetToClient(resultSet);
            }

        } catch (SQLException e) {
            logger.severe("Error finding client by ID: " + e.getMessage());
        } finally {
            closeResources(connection, statement, resultSet);
        }

        return null;
    }

    /**
     * Find client by email
     * 
     * @param email Client email
     * @return Client object or null if not found
     */
    public Client findByEmail(String email) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseConnection.getConnection();
            statement = connection.prepareStatement(SELECT_CLIENT_BY_EMAIL);
            statement.setString(1, email);

            resultSet = statement.executeQuery();

            if (resultSet.next()) {
                return mapResultSetToClient(resultSet);
            }

        } catch (SQLException e) {
            logger.severe("Error finding client by email: " + e.getMessage());
        } finally {
            closeResources(connection, statement, resultSet);
        }

        return null;
    }

    /**
     * Get all clients
     * 
     * @return List of all clients
     */
    public List<Client> findAll() {
        List<Client> clients = new ArrayList<>();
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseConnection.getConnection();
            statement = connection.prepareStatement(SELECT_ALL_CLIENTS);

            resultSet = statement.executeQuery();

            while (resultSet.next()) {
                clients.add(mapResultSetToClient(resultSet));
            }

        } catch (SQLException e) {
            logger.severe("Error finding all clients: " + e.getMessage());
        } finally {
            closeResources(connection, statement, resultSet);
        }

        return clients;
    }

    /**
     * Update client information
     * 
     * @param client Client object with updated information
     * @return true if successful, false otherwise
     */
    public boolean updateClient(Client client) {
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            connection = DatabaseConnection.getConnection();
            statement = connection.prepareStatement(UPDATE_CLIENT);

            // Set parameters
            statement.setString(1, client.getNom());
            statement.setString(2, client.getPrenom());
            statement.setString(3, client.getMail());
            statement.setString(4, client.getAdresse());
            statement.setString(5, client.getNumTelephone());
            statement.setString(6, client.getCinRECTO());
            statement.setString(7, client.getCinVERSO());
            statement.setString(8, client.getMotDepasse());
            statement.setDate(9, client.getDateNaissance());
            statement.setString(10, client.getPhotoPerso());
            statement.setInt(11, client.getIdClient());

            int rowsAffected = statement.executeUpdate();

            if (rowsAffected > 0) {
                logger.info("Client updated successfully with ID: " + client.getIdClient());
                return true;
            }

        } catch (SQLException e) {
            logger.severe("Error updating client: " + e.getMessage());
        } finally {
            closeResources(connection, statement, null);
        }

        return false;
    }

    /**
     * Delete client by ID
     * 
     * @param idClient Client ID to delete
     * @return true if successful, false otherwise
     */
    public boolean deleteClient(int idClient) {
        Connection connection = null;
        PreparedStatement statement = null;

        try {
            connection = DatabaseConnection.getConnection();
            statement = connection.prepareStatement(DELETE_CLIENT);
            statement.setInt(1, idClient);

            int rowsAffected = statement.executeUpdate();

            if (rowsAffected > 0) {
                logger.info("Client deleted successfully with ID: " + idClient);
                return true;
            }

        } catch (SQLException e) {
            logger.severe("Error deleting client: " + e.getMessage());
        } finally {
            closeResources(connection, statement, null);
        }

        return false;
    }

    /**
     * Check if email already exists
     * 
     * @param email Email to check
     * @return true if email exists, false otherwise
     */
    public boolean emailExists(String email) {
        Connection connection = null;
        PreparedStatement statement = null;
        ResultSet resultSet = null;

        try {
            connection = DatabaseConnection.getConnection();
            statement = connection.prepareStatement(CHECK_EMAIL_EXISTS);
            statement.setString(1, email);

            resultSet = statement.executeQuery();

            if (resultSet.next()) {
                return resultSet.getInt(1) > 0;
            }

        } catch (SQLException e) {
            logger.severe("Error checking email existence: " + e.getMessage());
        } finally {
            closeResources(connection, statement, resultSet);
        }

        return false;
    }

    /**
     * Authenticate client with email and password
     * 
     * @param email    Client email
     * @param password Client password
     * @return Client object if authentication successful, null otherwise
     */
    public Client authenticate(String email, String password) {
        Client client = findByEmail(email);

        if (client != null && client.getMotDepasse().equals(password)) {
            logger.info("Client authenticated successfully: " + email);
            return client;
        }

        logger.warning("Authentication failed for email: " + email);
        return null;
    }

    /**
     * Map ResultSet to Client object
     * 
     * @param resultSet ResultSet from database query
     * @return Client object
     * @throws SQLException if mapping fails
     */
    private Client mapResultSetToClient(ResultSet resultSet) throws SQLException {
        Client client = new Client();
        client.setIdClient(resultSet.getInt("idClient"));
        client.setNom(resultSet.getString("nom"));
        client.setPrenom(resultSet.getString("prenom"));
        client.setMail(resultSet.getString("mail"));
        client.setAdresse(resultSet.getString("adresse"));
        client.setNumTelephone(resultSet.getString("numTelephone"));
        client.setCinRECTO(resultSet.getString("cinRECTO"));
        client.setCinVERSO(resultSet.getString("cinVERSO"));
        client.setMotDepasse(resultSet.getString("motDepasse"));
        client.setDateNaissance(resultSet.getDate("dateNaissance"));
        client.setPhotoPerso(resultSet.getString("photoPerso"));

        return client;
    }

    /**
     * Close database resources
     * 
     * @param connection Database connection
     * @param statement  PreparedStatement
     * @param resultSet  ResultSet
     */
    private void closeResources(Connection connection, PreparedStatement statement, ResultSet resultSet) {
        if (resultSet != null) {
            try {
                resultSet.close();
            } catch (SQLException e) {
                logger.warning("Error closing ResultSet: " + e.getMessage());
            }
        }

        if (statement != null) {
            try {
                statement.close();
            } catch (SQLException e) {
                logger.warning("Error closing PreparedStatement: " + e.getMessage());
            }
        }

        DatabaseConnection.closeConnection(connection);
    }
}

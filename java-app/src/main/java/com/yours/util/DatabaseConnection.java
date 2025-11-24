package com.yours.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Logger;

/**
 * Database connection utility class
 * Handles MySQL database connections with proper configuration
 */
public class DatabaseConnection {
    private static final Logger logger = Logger.getLogger(DatabaseConnection.class.getName());

    // Database configuration - these will be read from environment variables
    private static final String DB_URL = System.getenv("MYSQL_HOST") != null
            ? "jdbc:mysql://" + System.getenv("MYSQL_HOST") + ":3306/" + System.getenv("MYSQL_DATABASE") +
                    "?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC"
            : "jdbc:mysql://localhost:3306/yours?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC";

    private static final String DB_USER = System.getenv("MYSQL_USER") != null ? System.getenv("MYSQL_USER")
            : "yours_user";

    private static final String DB_PASSWORD = System.getenv("MYSQL_PASSWORD") != null ? System.getenv("MYSQL_PASSWORD")
            : "your_secure_password_here";

    private static final String DB_DRIVER = "com.mysql.cj.jdbc.Driver";

    static {
        try {
            Class.forName(DB_DRIVER);
            logger.info("MySQL JDBC Driver loaded successfully");
        } catch (ClassNotFoundException e) {
            logger.severe("Failed to load MySQL JDBC Driver: " + e.getMessage());
            throw new RuntimeException("Database driver not found", e);
        }
    }

    /**
     * Get a database connection
     * 
     * @return Connection object
     * @throws SQLException if connection fails
     */
    public static Connection getConnection() throws SQLException {
        try {
            Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
            logger.info("Database connection established successfully");
            return connection;
        } catch (SQLException e) {
            logger.severe("Failed to establish database connection: " + e.getMessage());
            throw e;
        }
    }

    /**
     * Close a database connection
     * 
     * @param connection Connection to close
     */
    public static void closeConnection(Connection connection) {
        if (connection != null) {
            try {
                connection.close();
                logger.info("Database connection closed successfully");
            } catch (SQLException e) {
                logger.warning("Error closing database connection: " + e.getMessage());
            }
        }
    }

    /**
     * Test database connectivity
     * 
     * @return true if connection successful, false otherwise
     */
    public static boolean testConnection() {
        try (Connection connection = getConnection()) {
            return connection != null && !connection.isClosed();
        } catch (SQLException e) {
            logger.severe("Database connection test failed: " + e.getMessage());
            return false;
        }
    }
}

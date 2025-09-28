package com.yours.config;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 * Database configuration and connection management
 */
public class DatabaseConfig {
    private static final String DB_URL = System.getenv("MYSQL_HOST") != null ? 
        "jdbc:mysql://" + System.getenv("MYSQL_HOST") + ":3306/" + System.getenv("MYSQL_DATABASE") :
        "jdbc:mysql://localhost:3306/yours_db";
    
    private static final String DB_USER = System.getenv("MYSQL_USER") != null ? 
        System.getenv("MYSQL_USER") : "yours_user";
    
    private static final String DB_PASSWORD = System.getenv("MYSQL_PASSWORD") != null ? 
        System.getenv("MYSQL_PASSWORD") : "password";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("MySQL JDBC Driver not found", e);
        }
    }

    /**
     * Get database connection
     * @return Connection object
     * @throws SQLException if connection fails
     */
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
    }

    /**
     * Get database URL
     * @return database URL string
     */
    public static String getDbUrl() {
        return DB_URL;
    }
}

package com.yours.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Base64;
import java.util.logging.Logger;

/**
 * Password utility class for secure password handling
 * Provides methods for hashing, salting, and verifying passwords
 */
public class PasswordUtil {
    private static final Logger logger = Logger.getLogger(PasswordUtil.class.getName());

    // Algorithm for password hashing
    private static final String HASH_ALGORITHM = "SHA-256";

    // Salt length in bytes
    private static final int SALT_LENGTH = 16;

    /**
     * Generate a random salt
     * 
     * @return Base64 encoded salt
     */
    public static String generateSalt() {
        SecureRandom random = new SecureRandom();
        byte[] salt = new byte[SALT_LENGTH];
        random.nextBytes(salt);
        return Base64.getEncoder().encodeToString(salt);
    }

    /**
     * Hash a password with salt
     * 
     * @param password Plain text password
     * @param salt     Base64 encoded salt
     * @return Base64 encoded hashed password
     */
    public static String hashPassword(String password, String salt) {
        try {
            MessageDigest digest = MessageDigest.getInstance(HASH_ALGORITHM);

            // Decode salt and add to password
            byte[] saltBytes = Base64.getDecoder().decode(salt);
            digest.update(saltBytes);

            // Hash the password
            byte[] hashedPassword = digest.digest(password.getBytes());

            return Base64.getEncoder().encodeToString(hashedPassword);

        } catch (NoSuchAlgorithmException e) {
            logger.severe("Hash algorithm not found: " + e.getMessage());
            throw new RuntimeException("Password hashing failed", e);
        }
    }

    /**
     * Hash a password with a new random salt
     * 
     * @param password Plain text password
     * @return Array containing [hashedPassword, salt]
     */
    public static String[] hashPasswordWithSalt(String password) {
        String salt = generateSalt();
        String hashedPassword = hashPassword(password, salt);
        return new String[] { hashedPassword, salt };
    }

    /**
     * Verify a password against its hash and salt
     * 
     * @param password       Plain text password to verify
     * @param hashedPassword Base64 encoded hashed password
     * @param salt           Base64 encoded salt
     * @return true if password matches, false otherwise
     */
    public static boolean verifyPassword(String password, String hashedPassword, String salt) {
        String computedHash = hashPassword(password, salt);
        return computedHash.equals(hashedPassword);
    }

    /**
     * Simple password strength validation
     * 
     * @param password Password to validate
     * @return true if password meets minimum requirements
     */
    public static boolean isValidPassword(String password) {
        if (password == null || password.length() < 8) {
            return false;
        }

        // Check for at least one lowercase letter
        boolean hasLower = password.matches(".*[a-z].*");

        // Check for at least one uppercase letter
        boolean hasUpper = password.matches(".*[A-Z].*");

        // Check for at least one digit
        boolean hasDigit = password.matches(".*[0-9].*");

        // Check for at least one special character
        boolean hasSpecial = password.matches(".*[!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>\\/?].*");

        // Password must have at least 3 of the 4 criteria
        int criteriaMet = 0;
        if (hasLower)
            criteriaMet++;
        if (hasUpper)
            criteriaMet++;
        if (hasDigit)
            criteriaMet++;
        if (hasSpecial)
            criteriaMet++;

        return criteriaMet >= 3;
    }

    /**
     * Get password strength level
     * 
     * @param password Password to analyze
     * @return Password strength level (WEAK, MEDIUM, STRONG)
     */
    public static PasswordStrength getPasswordStrength(String password) {
        if (password == null || password.length() < 8) {
            return PasswordStrength.WEAK;
        }

        int score = 0;

        // Length bonus
        if (password.length() >= 12)
            score += 2;
        else if (password.length() >= 8)
            score += 1;

        // Character variety
        if (password.matches(".*[a-z].*"))
            score += 1;
        if (password.matches(".*[A-Z].*"))
            score += 1;
        if (password.matches(".*[0-9].*"))
            score += 1;
        if (password.matches(".*[!@#$%^&*()_+\\-=\\[\\]{};':\"\\\\|,.<>\\/?].*"))
            score += 1;

        // Determine strength
        if (score >= 6)
            return PasswordStrength.STRONG;
        else if (score >= 4)
            return PasswordStrength.MEDIUM;
        else
            return PasswordStrength.WEAK;
    }

    /**
     * Password strength enumeration
     */
    public enum PasswordStrength {
        WEAK, MEDIUM, STRONG
    }
}

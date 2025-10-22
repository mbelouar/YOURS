package com.yours.servlet;

import com.yours.dao.ClientDAO;
import com.yours.model.Client;
import com.yours.util.PasswordUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.logging.Logger;

/**
 * Servlet for handling client login
 * Processes login form submissions and authenticates users
 */
public class LoginServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(LoginServlet.class.getName());

    private ClientDAO clientDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        clientDAO = new ClientDAO();
        logger.info("LoginServlet initialized");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirect GET requests to login page
        response.sendRedirect(request.getContextPath() + "/pages/auth/login.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Set character encoding for proper handling of French characters
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        try {
            // Get form parameters
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String rememberMe = request.getParameter("rememberMe");

            // Validate required fields
            if (!validateLoginData(request, response, email, password)) {
                return;
            }

            // Find client by email
            Client client = clientDAO.findByEmail(email.trim().toLowerCase());

            if (client == null) {
                logger.warning("Login attempt with non-existent email: " + email);
                request.setAttribute("error", "Email ou mot de passe incorrect.");
                request.getRequestDispatcher("/pages/auth/login.jsp").forward(request, response);
                return;
            }

            // Verify password
            String[] passwordParts = client.getMotDepasse().split(":");
            if (passwordParts.length != 2) {
                logger.severe("Invalid password format for client ID: " + client.getIdClient());
                request.setAttribute("error",
                        "Erreur de configuration du compte. Veuillez contacter l'administrateur.");
                request.getRequestDispatcher("/pages/auth/login.jsp").forward(request, response);
                return;
            }

            String storedHash = passwordParts[0];
            String storedSalt = passwordParts[1];

            boolean passwordValid = PasswordUtil.verifyPassword(password, storedHash, storedSalt);

            if (!passwordValid) {
                logger.warning("Invalid password attempt for email: " + email);
                request.setAttribute("error", "Email ou mot de passe incorrect.");
                request.getRequestDispatcher("/pages/auth/login.jsp").forward(request, response);
                return;
            }

            // Login successful
            logger.info("Client logged in successfully: " + email + " (ID: " + client.getIdClient() + ")");

            // Create session
            HttpSession session = request.getSession(true);
            session.setAttribute("client", client);
            session.setAttribute("clientId", client.getIdClient());
            session.setAttribute("clientEmail", client.getMail());
            session.setAttribute("clientName", client.getPrenom() + " " + client.getNom());
            session.setAttribute("isLoggedIn", true);

            // Set session timeout based on remember me
            if (rememberMe != null && rememberMe.equals("on")) {
                session.setMaxInactiveInterval(30 * 24 * 60 * 60); // 30 days
                logger.info("Remember me enabled for client: " + email);
            } else {
                session.setMaxInactiveInterval(30 * 60); // 30 minutes
            }

            // Get redirect URL
            String redirectUrl = request.getParameter("redirect");
            if (redirectUrl != null && !redirectUrl.trim().isEmpty()) {
                // Validate redirect URL to prevent open redirect attacks
                if (isValidRedirectUrl(redirectUrl)) {
                    response.sendRedirect(request.getContextPath() + redirectUrl);
                    return;
                }
            }

            // Default redirect to client dashboard
            response.sendRedirect(request.getContextPath() + "/pages/client/dashboard.jsp");

        } catch (Exception e) {
            logger.severe("Unexpected error during login: " + e.getMessage());
            request.setAttribute("error", "Une erreur inattendue est survenue. Veuillez réessayer.");
            request.getRequestDispatcher("/pages/auth/login.jsp").forward(request, response);
        }
    }

    /**
     * Validate login form data
     * 
     * @param request  HttpServletRequest
     * @param response HttpServletResponse
     * @param email    Email
     * @param password Password
     * @return true if valid, false otherwise
     */
    private boolean validateLoginData(HttpServletRequest request, HttpServletResponse response,
            String email, String password) throws ServletException, IOException {

        // Check required fields
        if (email == null || email.trim().isEmpty()) {
            request.setAttribute("error", "L'adresse email est requise.");
            request.getRequestDispatcher("/pages/auth/login.jsp").forward(request, response);
            return false;
        }

        if (password == null || password.trim().isEmpty()) {
            request.setAttribute("error", "Le mot de passe est requis.");
            request.getRequestDispatcher("/pages/auth/login.jsp").forward(request, response);
            return false;
        }

        // Validate email format
        if (!isValidEmail(email)) {
            request.setAttribute("error", "Format d'email invalide.");
            request.getRequestDispatcher("/pages/auth/login.jsp").forward(request, response);
            return false;
        }

        return true;
    }

    /**
     * Simple email validation
     * 
     * @param email Email to validate
     * @return true if valid email format
     */
    private boolean isValidEmail(String email) {
        if (email == null || email.trim().isEmpty()) {
            return false;
        }

        String emailRegex = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}$";
        return email.matches(emailRegex);
    }

    /**
     * Validate redirect URL to prevent open redirect attacks
     * 
     * @param redirectUrl URL to validate
     * @return true if valid redirect URL
     */
    private boolean isValidRedirectUrl(String redirectUrl) {
        if (redirectUrl == null || redirectUrl.trim().isEmpty()) {
            return false;
        }

        // Only allow relative URLs that start with /
        return redirectUrl.startsWith("/") && !redirectUrl.startsWith("//");
    }
}

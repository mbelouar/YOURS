package com.yours.servlet;

import com.yours.dao.ClientDAO;
import com.yours.dao.PartnerDAO;
import com.yours.model.Client;
import com.yours.model.Partenaire;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.logging.Logger;

/**
 * Servlet for handling client and partner login
 * Processes login form submissions and authenticates users
 */
public class LoginServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(LoginServlet.class.getName());

    private ClientDAO clientDAO;
    private PartnerDAO partnerDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        clientDAO = new ClientDAO();
        partnerDAO = new PartnerDAO();
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

            // Try to authenticate as client first
            Client client = clientDAO.authenticate(email.trim().toLowerCase(), password);

            if (client != null) {
                // Client login successful
                logger.info("Client logged in successfully: " + email + " (ID: " + client.getIdClient() + ")");

                // Create session
                HttpSession session = request.getSession(true);

                // Debug: Log what we're storing in session
                logger.info("Storing client in session - Prenom: '" + client.getPrenom() + "', Nom: '" + client.getNom()
                        + "', Mail: '" + client.getMail() + "'");

                session.setAttribute("client", client);
                session.setAttribute("clientId", client.getIdClient());
                session.setAttribute("clientEmail", client.getMail());
                session.setAttribute("clientName", client.getPrenom() + " " + client.getNom());
                session.setAttribute("userType", "client");
                session.setAttribute("isLoggedIn", true);

                // Additional debug logging
                logger.info("Session ID: " + session.getId());
                logger.info("Session attributes set:");
                logger.info("  client: " + (client != null ? "Client object" : "null"));
                logger.info("  clientId: " + client.getIdClient());
                logger.info("  clientEmail: " + client.getMail());
                logger.info("  clientName: " + (client.getPrenom() + " " + client.getNom()));
                logger.info("  userType: client");
                logger.info("  isLoggedIn: true");

                // Set session timeout to 30 minutes
                session.setMaxInactiveInterval(30 * 60);

                // Debug: Verify session attributes were set
                logger.info("Session attributes set - clientName: '" + session.getAttribute("clientName")
                        + "', clientEmail: '" + session.getAttribute("clientEmail") + "'");

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
                return;
            }

            // Try to authenticate as partner
            Partenaire partner = partnerDAO.authenticate(email.trim().toLowerCase(), password);

            if (partner != null) {
                // Partner login successful
                logger.info("Partner logged in successfully: " + email + " (ID: " + partner.getIdPartenaire() + ")");

                // Create session
                HttpSession session = request.getSession(true);
                session.setAttribute("partner", partner);
                session.setAttribute("partnerId", partner.getIdPartenaire());
                session.setAttribute("partnerEmail", partner.getMail());
                session.setAttribute("partnerName", partner.getPrenom() + " " + partner.getNom());
                session.setAttribute("userType", "partner");
                session.setAttribute("isLoggedIn", true);

                // Set session timeout based on remember me
                if (rememberMe != null && rememberMe.equals("on")) {
                    session.setMaxInactiveInterval(30 * 24 * 60 * 60); // 30 days
                    logger.info("Remember me enabled for partner: " + email);
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

                // Default redirect to partner dashboard
                response.sendRedirect(request.getContextPath() + "/pages/partner/dashboard.jsp");
                return;
            }

            // Neither client nor partner authentication succeeded
            logger.warning("Login attempt with invalid credentials: " + email);
            request.setAttribute("error", "Email ou mot de passe incorrect.");
            request.getRequestDispatcher("/pages/auth/login.jsp").forward(request, response);

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

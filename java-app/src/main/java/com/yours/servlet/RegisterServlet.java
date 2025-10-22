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
import java.sql.Date;
import java.util.logging.Logger;

/**
 * Servlet for handling client registration
 * Processes registration form submissions and creates new client accounts
 */
public class RegisterServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(RegisterServlet.class.getName());

    private ClientDAO clientDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        clientDAO = new ClientDAO();
        logger.info("RegisterServlet initialized");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Redirect GET requests to registration page
        response.sendRedirect(request.getContextPath() + "/pages/auth/register-client.jsp");
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
            String accountType = request.getParameter("accountType");

            String nom = request.getParameter("nom");
            String prenom = request.getParameter("prenom");
            String mail = request.getParameter("mail");
            String adresse = request.getParameter("adresse");
            String numTelephone = request.getParameter("numTelephone");
            String motDepasse = request.getParameter("motDepasse");
            if (motDepasse == null) {
                motDepasse = request.getParameter("motDepasseClient"); // Fallback for client password field
            }
            String confirmPassword = request.getParameter("confirmPassword");
            if (confirmPassword == null) {
                confirmPassword = request.getParameter("confirmPasswordClient"); // Fallback for client confirm password
                                                                                 // field
            }
            String dateNaissanceStr = request.getParameter("dateNaissance");
            String cinRECTO = request.getParameter("cinRECTO");
            String cinVERSO = request.getParameter("cinVERSO");
            String photoPerso = request.getParameter("photoPerso");
            String acceptTerms = request.getParameter("acceptTerms");

            // Validate required fields
            if (!validateRegistrationData(request, response, accountType, nom, prenom, mail,
                    motDepasse, confirmPassword, acceptTerms)) {
                return;
            }

            // Check if email already exists
            if (clientDAO.emailExists(mail)) {
                logger.warning("Registration attempt with existing email: " + mail);
                request.setAttribute("error", "Cette adresse email est déjà utilisée.");
                request.setAttribute("formData", request.getParameterMap());
                request.getRequestDispatcher("/pages/auth/register-client.jsp").forward(request, response);
                return;
            }

            // Validate password strength
            if (!PasswordUtil.isValidPassword(motDepasse)) {
                logger.warning("Weak password attempt for email: " + mail);
                request.setAttribute("error",
                        "Le mot de passe doit contenir au moins 8 caractères avec une combinaison de lettres, chiffres et caractères spéciaux.");
                request.setAttribute("formData", request.getParameterMap());
                request.getRequestDispatcher("/pages/auth/register-client.jsp").forward(request, response);
                return;
            }

            // Create new client
            Client client = new Client();
            client.setNom(nom.trim());
            client.setPrenom(prenom.trim());
            client.setMail(mail.trim().toLowerCase());
            client.setAdresse(adresse != null ? adresse.trim() : null);
            client.setNumTelephone(numTelephone != null ? numTelephone.trim() : null);
            client.setCinRECTO(cinRECTO != null ? cinRECTO.trim() : null);
            client.setCinVERSO(cinVERSO != null ? cinVERSO.trim() : null);
            client.setPhotoPerso(photoPerso != null ? photoPerso.trim() : null);

            // Parse date of birth if provided
            if (dateNaissanceStr != null && !dateNaissanceStr.trim().isEmpty()) {
                try {
                    client.setDateNaissance(Date.valueOf(dateNaissanceStr));
                } catch (IllegalArgumentException e) {
                    logger.warning("Invalid date format for email: " + mail);
                    request.setAttribute("error", "Format de date invalide.");
                    request.setAttribute("formData", request.getParameterMap());
                    request.getRequestDispatcher("/pages/auth/register-client.jsp").forward(request, response);
                    return;
                }
            }

            // Hash password with salt
            String[] passwordData = PasswordUtil.hashPasswordWithSalt(motDepasse);
            client.setMotDepasse(passwordData[0] + ":" + passwordData[1]); // Store hash:salt

            // Save client to database
            boolean success = clientDAO.createClient(client);

            if (success) {
                logger.info("Client registered successfully: " + mail + " (ID: " + client.getIdClient() + ")");

                // Redirect to login page with success parameter
                response.sendRedirect(request.getContextPath() + "/pages/auth/login.jsp?success=registered");

            } else {
                logger.severe("Failed to create client account for email: " + mail);
                request.setAttribute("error",
                        "Une erreur est survenue lors de la création du compte. Veuillez réessayer.");
                request.setAttribute("formData", request.getParameterMap());
                request.getRequestDispatcher("/pages/auth/register-client.jsp").forward(request, response);
            }

        } catch (Exception e) {
            logger.severe("Unexpected error during registration: " + e.getMessage());
            request.setAttribute("error", "Une erreur inattendue est survenue. Veuillez réessayer.");
            request.getRequestDispatcher("/pages/auth/register-client.jsp").forward(request, response);
        }
    }

    /**
     * Validate registration form data
     * 
     * @param request         HttpServletRequest
     * @param response        HttpServletResponse
     * @param accountType     Account type
     * @param nom             Last name
     * @param prenom          First name
     * @param mail            Email
     * @param motDepasse      Password
     * @param confirmPassword Password confirmation
     * @param acceptTerms     Terms acceptance
     * @return true if valid, false otherwise
     */
    private boolean validateRegistrationData(HttpServletRequest request, HttpServletResponse response,
            String accountType, String nom, String prenom, String mail, String motDepasse,
            String confirmPassword, String acceptTerms) throws ServletException, IOException {

        // Check required fields
        if (accountType == null || accountType.trim().isEmpty()) {
            request.setAttribute("error", "Type de compte requis.");
            request.getRequestDispatcher("/pages/auth/register-client.jsp").forward(request, response);
            return false;
        }

        if (nom == null || nom.trim().isEmpty()) {
            request.setAttribute("error", "Le nom est requis.");
            request.getRequestDispatcher("/pages/auth/register-client.jsp").forward(request, response);
            return false;
        }

        if (prenom == null || prenom.trim().isEmpty()) {
            request.setAttribute("error", "Le prénom est requis.");
            request.getRequestDispatcher("/pages/auth/register-client.jsp").forward(request, response);
            return false;
        }

        if (mail == null || mail.trim().isEmpty()) {
            request.setAttribute("error", "L'adresse email est requise.");
            request.getRequestDispatcher("/pages/auth/register-client.jsp").forward(request, response);
            return false;
        }

        if (motDepasse == null || motDepasse.trim().isEmpty()) {
            request.setAttribute("error", "Le mot de passe est requis.");
            request.getRequestDispatcher("/pages/auth/register-client.jsp").forward(request, response);
            return false;
        }

        if (confirmPassword == null || confirmPassword.trim().isEmpty()) {
            request.setAttribute("error", "La confirmation du mot de passe est requise.");
            request.getRequestDispatcher("/pages/auth/register-client.jsp").forward(request, response);
            return false;
        }

        if (acceptTerms == null || !acceptTerms.equals("on")) {
            request.setAttribute("error", "Vous devez accepter les conditions d'utilisation.");
            request.getRequestDispatcher("/pages/auth/register-client.jsp").forward(request, response);
            return false;
        }

        // Validate email format
        if (!isValidEmail(mail)) {
            request.setAttribute("error", "Format d'email invalide.");
            request.getRequestDispatcher("/pages/auth/register-client.jsp").forward(request, response);
            return false;
        }

        // Validate password confirmation
        if (!motDepasse.equals(confirmPassword)) {
            request.setAttribute("error", "Les mots de passe ne correspondent pas.");
            request.getRequestDispatcher("/pages/auth/register-client.jsp").forward(request, response);
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
}

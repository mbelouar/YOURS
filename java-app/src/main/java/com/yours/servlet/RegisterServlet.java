package com.yours.servlet;

import com.yours.dao.ClientDAO;
import com.yours.dao.PartnerDAO;
import com.yours.model.Client;
import com.yours.model.Partenaire;
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
    private PartnerDAO partnerDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        clientDAO = new ClientDAO();
        partnerDAO = new PartnerDAO();
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
            String numTelephone = request.getParameter("numTelephone");

            // Check if this is partner registration and get partner personal info fields
            if ("partner".equals(accountType)) {
                String partnerNom = request.getParameter("partnerNom");
                String partnerPrenom = request.getParameter("partnerPrenom");
                String partnerMail = request.getParameter("partnerMail");
                String partnerNumTelephone = request.getParameter("partnerNumTelephone");

                if (partnerNom != null)
                    nom = partnerNom;
                if (partnerPrenom != null)
                    prenom = partnerPrenom;
                if (partnerMail != null)
                    mail = partnerMail;
                if (partnerNumTelephone != null)
                    numTelephone = partnerNumTelephone;
            }
            String motDepasse = request.getParameter("motDepasseClient"); // Default to client password
            String confirmPassword = request.getParameter("confirmPasswordClient"); // Default to client confirm
                                                                                    // password

            // Check if this is partner registration and get partner password fields
            if ("partner".equals(accountType)) {
                String partnerMotDepasse = request.getParameter("partnerMotDepasse");
                String partnerConfirmPassword = request.getParameter("partnerConfirmPassword");
                if (partnerMotDepasse != null) {
                    motDepasse = partnerMotDepasse;
                }
                if (partnerConfirmPassword != null) {
                    confirmPassword = partnerConfirmPassword;
                }
            }
            String acceptTerms = request.getParameter("acceptTerms");

            // Validate required fields
            if (!validateRegistrationData(request, response, accountType, nom, prenom, mail,
                    motDepasse, confirmPassword, acceptTerms)) {
                return;
            }

            // Check if email already exists (check both client and partner tables)
            boolean emailExists = clientDAO.isEmailRegistered(mail) || partnerDAO.isEmailRegistered(mail);
            if (emailExists) {
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

            if ("partner".equals(accountType)) {
                // Handle partner registration
                handlePartnerRegistration(request, response, nom, prenom, mail, numTelephone, motDepasse);
            } else {
                // Handle client registration
                handleClientRegistration(request, response, nom, prenom, mail, numTelephone, motDepasse);
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

    /**
     * Handle client registration
     */
    private void handleClientRegistration(HttpServletRequest request, HttpServletResponse response,
            String nom, String prenom, String mail, String numTelephone, String motDepasse)
            throws ServletException, IOException {

        // Create new client with only registration fields
        Client client = new Client();
        client.setNom(nom.trim());
        client.setPrenom(prenom.trim());
        client.setMail(mail.trim().toLowerCase());
        client.setNumTelephone(numTelephone != null ? numTelephone.trim() : null);
        client.setMotDepasse(motDepasse); // Password will be hashed in DAO

        // Save client to database
        Client createdClient = clientDAO.createClient(client);

        if (createdClient != null) {
            logger.info("Client registered successfully: " + mail + " (ID: " + createdClient.getIdClient() + ")");
            // Redirect to login page with success parameter
            response.sendRedirect(request.getContextPath() + "/pages/auth/login.jsp?success=registered");
        } else {
            logger.severe("Failed to create client account for email: " + mail);
            request.setAttribute("error", "Une erreur est survenue lors de la création du compte. Veuillez réessayer.");
            request.setAttribute("formData", request.getParameterMap());
            request.getRequestDispatcher("/pages/auth/register-client.jsp").forward(request, response);
        }
    }

    /**
     * Handle partner registration
     */
    private void handlePartnerRegistration(HttpServletRequest request, HttpServletResponse response,
            String nom, String prenom, String mail, String numTelephone, String motDepasse)
            throws ServletException, IOException {

        // Get partner-specific parameters
        String businessName = request.getParameter("partnerBusinessName");
        String businessType = request.getParameter("partnerBusinessType");
        String numeroSiret = request.getParameter("numeroSiret");
        String adresse = request.getParameter("adresse");

        // Validate partner-specific required fields
        if (businessName == null || businessName.trim().isEmpty()) {
            request.setAttribute("error", "Le nom de l'entreprise est requis.");
            request.setAttribute("formData", request.getParameterMap());
            request.getRequestDispatcher("/pages/auth/register-client.jsp").forward(request, response);
            return;
        }

        if (businessType == null || businessType.trim().isEmpty()) {
            request.setAttribute("error", "Le type d'activité est requis.");
            request.setAttribute("formData", request.getParameterMap());
            request.getRequestDispatcher("/pages/auth/register-client.jsp").forward(request, response);
            return;
        }

        // Create new partner
        Partenaire partner = new Partenaire();
        partner.setNom(nom.trim());
        partner.setPrenom(prenom.trim());
        partner.setMail(mail.trim().toLowerCase());
        partner.setNumTelephone(numTelephone != null ? numTelephone.trim() : null);
        partner.setMotDepasse(motDepasse); // Password will be hashed in DAO
        partner.setNomEntreprise(businessName.trim());
        partner.setTypeActivite(businessType.trim());
        partner.setNumeroSiret(numeroSiret != null ? numeroSiret.trim() : null);
        partner.setAdresse(adresse != null ? adresse.trim() : null);

        // Note: File uploads (CIN, photo) would need to be handled separately
        // For now, we'll store null values for these fields
        partner.setCinRECTO(null);
        partner.setCinVERSO(null);
        partner.setPhotoPerso(null);

        // Save partner to database
        Partenaire createdPartner = partnerDAO.createPartner(partner);

        if (createdPartner != null) {
            logger.info("Partner registered successfully: " + mail + " (ID: " + createdPartner.getIdPartenaire() + ")");
            // Redirect to login page with success parameter
            response.sendRedirect(request.getContextPath() + "/pages/auth/login.jsp?success=registered");
        } else {
            logger.severe("Failed to create partner account for email: " + mail);
            request.setAttribute("error", "Une erreur est survenue lors de la création du compte. Veuillez réessayer.");
            request.setAttribute("formData", request.getParameterMap());
            request.getRequestDispatcher("/pages/auth/register-client.jsp").forward(request, response);
        }
    }
}

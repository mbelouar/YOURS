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
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
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

        logger.info("=== REGISTRATION REQUEST START ===");
        logger.info("Content-Type: " + request.getContentType());
        logger.info("Method: " + request.getMethod());
        logger.info("Request URI: " + request.getRequestURI());

        try {
            // Get form parameters - handle both regular and multipart requests
            String accountType = getParameterValue(request, "accountType");

            String nom = getParameterValue(request, "nom");
            String prenom = getParameterValue(request, "prenom");
            String mail = getParameterValue(request, "mail");
            String numTelephone = getParameterValue(request, "numTelephone");

            // Debug: Log received parameters
            logger.info("Received parameters - AccountType: '" + accountType + "', Nom: '" + nom + "', Prenom: '"
                    + prenom + "', Mail: '" + mail + "'");

            // Check if this is partner registration and get partner personal info fields
            if ("partner".equals(accountType)) {
                String partnerNom = getParameterValue(request, "partnerNom");
                String partnerPrenom = getParameterValue(request, "partnerPrenom");
                String partnerMail = getParameterValue(request, "partnerMail");
                String partnerNumTelephone = getParameterValue(request, "partnerNumTelephone");

                if (partnerNom != null && !partnerNom.trim().isEmpty())
                    nom = partnerNom;
                if (partnerPrenom != null && !partnerPrenom.trim().isEmpty())
                    prenom = partnerPrenom;
                if (partnerMail != null && !partnerMail.trim().isEmpty())
                    mail = partnerMail;
                if (partnerNumTelephone != null && !partnerNumTelephone.trim().isEmpty())
                    numTelephone = partnerNumTelephone;
            }
            String motDepasse = getParameterValue(request, "motDepasseClient"); // Default to client password
            String confirmPassword = getParameterValue(request, "confirmPassword"); // Default to client confirm
                                                                                    // password

            // Check if this is partner registration and get partner password fields
            if ("partner".equals(accountType)) {
                String partnerMotDepasse = getParameterValue(request, "partnerMotDepasse");
                String partnerConfirmPassword = getParameterValue(request, "partnerConfirmPassword");
                if (partnerMotDepasse != null && !partnerMotDepasse.trim().isEmpty()) {
                    motDepasse = partnerMotDepasse;
                }
                if (partnerConfirmPassword != null && !partnerConfirmPassword.trim().isEmpty()) {
                    confirmPassword = partnerConfirmPassword;
                }
            }
            String acceptTerms = getParameterValue(request, "acceptTerms");

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
     * Helper method to get parameter value from both regular and multipart requests
     */
    private String getParameterValue(HttpServletRequest request, String parameterName) {
        logger.info("Getting parameter: " + parameterName);

        // First try regular parameter
        String value = request.getParameter(parameterName);
        logger.info("Regular parameter " + parameterName + " = " + value);

        // If not found and this is a multipart request, try to get from parts
        if (value == null && request.getContentType() != null &&
                request.getContentType().toLowerCase().contains("multipart/form-data")) {
            logger.info("Trying to get " + parameterName + " from multipart");
            try {
                Part part = request.getPart(parameterName);
                logger.info("Part " + parameterName + " found: " + (part != null));
                if (part != null) {
                    // Check if this is a file part or a form field
                    String contentType = part.getContentType();
                    logger.info("Part " + parameterName + " content type: " + contentType);
                    if (contentType == null || contentType.isEmpty()) {
                        // This is a form field, read the value
                        try (java.io.InputStream inputStream = part.getInputStream()) {
                            byte[] buffer = new byte[1024];
                            int bytesRead = inputStream.read(buffer);
                            if (bytesRead > 0) {
                                value = new String(buffer, 0, bytesRead, "UTF-8").trim();
                                logger.info("Read " + parameterName + " from multipart: " + value);
                            }
                        }
                    } else {
                        // This is a file part, return null for now
                        logger.info("Part " + parameterName + " is a file part, returning null");
                        return null;
                    }
                }
            } catch (Exception e) {
                logger.warning("Error getting part " + parameterName + ": " + e.getMessage());
                e.printStackTrace();
            }
        }

        logger.info("Final value for " + parameterName + " = " + value);
        return value;
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

        // Debug: Log client data before saving
        logger.info("Creating client with data - Prenom: '" + client.getPrenom() + "', Nom: '" + client.getNom()
                + "', Mail: '" + client.getMail() + "'");

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
     * Handles file upload and returns the file path
     */
    private String handleFileUpload(Part filePart, String fieldName, HttpServletRequest request) throws IOException {
        logger.info("handleFileUpload called for field: " + fieldName);

        if (filePart == null || filePart.getSize() == 0) {
            logger.info("File part is null or empty for field: " + fieldName);
            return null;
        }

        logger.info("File part exists for field: " + fieldName + ", size: " + filePart.getSize());

        // Validate file type
        String contentType = filePart.getContentType();
        if (contentType == null || !contentType.startsWith("image/")) {
            logger.warning("Invalid file type for field " + fieldName + ": " + contentType);
            throw new IOException("Seuls les fichiers image sont autorisés pour " + fieldName);
        }

        // Validate file size (max 5MB)
        long maxSize = 5 * 1024 * 1024; // 5MB
        if (filePart.getSize() > maxSize) {
            logger.warning("File too large for field " + fieldName + ": " + filePart.getSize() + " bytes");
            throw new IOException("Le fichier " + fieldName + " est trop volumineux (max 5MB)");
        }

        // Get upload directory - use a more reliable path
        String uploadDir;
        try {
            // Try to get the real path first
            uploadDir = request.getServletContext().getRealPath("/uploads");
            if (uploadDir == null) {
                // Fallback to a system temp directory with uploads subfolder
                uploadDir = System.getProperty("java.io.tmpdir") + File.separator + "yours_uploads";
            }
        } catch (Exception e) {
            // Fallback to system temp directory
            uploadDir = System.getProperty("java.io.tmpdir") + File.separator + "yours_uploads";
        }

        logger.info("Upload directory path: " + uploadDir);

        File uploadDirFile = new File(uploadDir);
        if (!uploadDirFile.exists()) {
            boolean created = uploadDirFile.mkdirs();
            if (!created) {
                logger.severe("Failed to create upload directory: " + uploadDir);
                throw new IOException("Impossible de créer le répertoire d'upload");
            }
            logger.info("Created upload directory: " + uploadDir);
        }

        // Generate unique filename with proper extension
        String originalFileName = filePart.getSubmittedFileName();
        String fileExtension = "";
        if (originalFileName != null && originalFileName.contains(".")) {
            fileExtension = originalFileName.substring(originalFileName.lastIndexOf("."));
        }

        String fileName = fieldName + "_" + System.currentTimeMillis() + "_" +
                System.nanoTime() + fileExtension;
        String filePath = uploadDir + File.separator + fileName;

        logger.info("Generated filename: " + fileName + ", full path: " + filePath);

        // Save file with proper error handling
        try (InputStream fileContent = filePart.getInputStream()) {
            Files.copy(fileContent, Paths.get(filePath), StandardCopyOption.REPLACE_EXISTING);

            // Verify file was actually saved
            File savedFile = new File(filePath);
            if (!savedFile.exists() || savedFile.length() == 0) {
                logger.severe("File was not saved properly: " + filePath);
                throw new IOException("Échec de l'enregistrement du fichier " + fieldName);
            }

            logger.info("File saved successfully: " + filePath + " (size: " + savedFile.length() + " bytes)");
        } catch (IOException e) {
            logger.severe("Error saving file " + fieldName + ": " + e.getMessage());
            throw new IOException("Erreur lors de l'enregistrement du fichier " + fieldName + ": " + e.getMessage());
        }

        // Return relative path for database storage
        String relativePath = "uploads/" + fileName;
        logger.info("Returning relative path: " + relativePath);
        return relativePath;
    }

    /**
     * Clean up uploaded file if it exists
     */
    private void cleanupUploadedFile(String filePath, HttpServletRequest request) {
        if (filePath == null || filePath.trim().isEmpty()) {
            return;
        }

        try {
            // Convert relative path to absolute path
            String uploadDir;
            try {
                uploadDir = request.getServletContext().getRealPath("/uploads");
                if (uploadDir == null) {
                    uploadDir = System.getProperty("java.io.tmpdir") + File.separator + "yours_uploads";
                }
            } catch (Exception e) {
                uploadDir = System.getProperty("java.io.tmpdir") + File.separator + "yours_uploads";
            }

            // Extract filename from relative path
            String fileName = filePath.substring(filePath.lastIndexOf("/") + 1);
            String fullPath = uploadDir + File.separator + fileName;

            File file = new File(fullPath);
            if (file.exists()) {
                boolean deleted = file.delete();
                if (deleted) {
                    logger.info("Cleaned up uploaded file: " + fullPath);
                } else {
                    logger.warning("Failed to delete uploaded file: " + fullPath);
                }
            }
        } catch (Exception e) {
            logger.warning("Error cleaning up uploaded file " + filePath + ": " + e.getMessage());
        }
    }

    /**
     * Handle partner registration
     */
    private void handlePartnerRegistration(HttpServletRequest request, HttpServletResponse response,
            String nom, String prenom, String mail, String numTelephone, String motDepasse)
            throws ServletException, IOException {

        // Get partner-specific parameters
        String businessName = getParameterValue(request, "partnerBusinessName");
        String businessType = getParameterValue(request, "partnerBusinessType");
        String adresse = getParameterValue(request, "adresse");

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

        if (adresse == null || adresse.trim().isEmpty()) {
            request.setAttribute("error", "L'adresse de l'entreprise est requise.");
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
        partner.setAdresse(adresse.trim());

        // Handle file uploads with proper error handling and cleanup
        String cinRectoPath = null;
        String cinVersoPath = null;
        String photoPersoPath = null;

        try {
            logger.info("Starting file upload handling...");

            // Debug: Log all parts
            logger.info("=== DEBUG: All request parts ===");
            try {
                for (Part part : request.getParts()) {
                    logger.info("Part name: " + part.getName() + ", size: " + part.getSize() + ", content type: "
                            + part.getContentType());
                }
            } catch (Exception e) {
                logger.warning("Error listing parts: " + e.getMessage());
            }
            logger.info("=== END DEBUG ===");

            Part cinRectoPart = request.getPart("cinRECTO");
            Part cinVersoPart = request.getPart("cinVERSO");
            Part photoPersoPart = request.getPart("photoPerso");

            logger.info("File parts retrieved - CIN Recto: " + (cinRectoPart != null ? "exists" : "null") +
                    ", CIN Verso: " + (cinVersoPart != null ? "exists" : "null") +
                    ", Photo: " + (photoPersoPart != null ? "exists" : "null"));

            // Upload CIN Recto (required for partners)
            if (cinRectoPart != null && cinRectoPart.getSize() > 0) {
                cinRectoPath = handleFileUpload(cinRectoPart, "cinRECTO", request);
                logger.info("CIN Recto uploaded successfully: " + cinRectoPath);
            } else {
                logger.warning("CIN Recto is required but not provided");
                request.setAttribute("error", "La pièce d'identité (recto) est requise pour les partenaires.");
                request.setAttribute("formData", request.getParameterMap());
                request.getRequestDispatcher("/pages/auth/register-client.jsp").forward(request, response);
                return;
            }

            // Upload CIN Verso (required for partners)
            if (cinVersoPart != null && cinVersoPart.getSize() > 0) {
                cinVersoPath = handleFileUpload(cinVersoPart, "cinVERSO", request);
                logger.info("CIN Verso uploaded successfully: " + cinVersoPath);
            } else {
                logger.warning("CIN Verso is required but not provided");
                // Clean up uploaded files if one fails
                cleanupUploadedFile(cinRectoPath, request);
                request.setAttribute("error", "La pièce d'identité (verso) est requise pour les partenaires.");
                request.setAttribute("formData", request.getParameterMap());
                request.getRequestDispatcher("/pages/auth/register-client.jsp").forward(request, response);
                return;
            }

            // Upload Profile Photo (optional)
            if (photoPersoPart != null && photoPersoPart.getSize() > 0) {
                photoPersoPath = handleFileUpload(photoPersoPart, "photoPerso", request);
                logger.info("Profile photo uploaded successfully: " + photoPersoPath);
            }

            partner.setCinRECTO(cinRectoPath);
            partner.setCinVERSO(cinVersoPath);
            partner.setPhotoPerso(photoPersoPath);

            logger.info("All file uploads completed successfully");
        } catch (IOException e) {
            logger.severe("Error handling file uploads: " + e.getMessage());
            // Clean up any uploaded files
            cleanupUploadedFile(cinRectoPath, request);
            cleanupUploadedFile(cinVersoPath, request);
            cleanupUploadedFile(photoPersoPath, request);

            request.setAttribute("error", "Erreur lors de l'upload des fichiers: " + e.getMessage());
            request.setAttribute("formData", request.getParameterMap());
            request.getRequestDispatcher("/pages/auth/register-client.jsp").forward(request, response);
            return;
        } catch (Exception e) {
            logger.severe("Unexpected error handling file uploads: " + e.getMessage());
            e.printStackTrace();
            // Clean up any uploaded files
            cleanupUploadedFile(cinRectoPath, request);
            cleanupUploadedFile(cinVersoPath, request);
            cleanupUploadedFile(photoPersoPath, request);

            request.setAttribute("error", "Une erreur inattendue est survenue lors de l'upload des fichiers.");
            request.setAttribute("formData", request.getParameterMap());
            request.getRequestDispatcher("/pages/auth/register-client.jsp").forward(request, response);
            return;
        }

        // Save partner to database
        Partenaire createdPartner = partnerDAO.createPartner(partner);

        if (createdPartner != null) {
            logger.info("Partner registered successfully: " + mail + " (ID: " + createdPartner.getIdPartenaire() + ")");

            // DEBUG: Verify what was actually saved to database
            logger.info("=== DATABASE VERIFICATION DEBUG ===");
            logger.info("Partner ID: " + createdPartner.getIdPartenaire());
            logger.info("CIN Recto saved: " + createdPartner.getCinRECTO());
            logger.info("CIN Verso saved: " + createdPartner.getCinVERSO());
            logger.info("Photo saved: " + createdPartner.getPhotoPerso());

            // Additional verification by querying the database directly
            try {
                Partenaire verifyPartner = partnerDAO.getPartnerByEmail(mail);
                if (verifyPartner != null) {
                    logger.info("=== DATABASE QUERY VERIFICATION ===");
                    logger.info("Verified CIN Recto: " + verifyPartner.getCinRECTO());
                    logger.info("Verified CIN Verso: " + verifyPartner.getCinVERSO());
                    logger.info("Verified Photo: " + verifyPartner.getPhotoPerso());
                } else {
                    logger.warning("Could not verify partner data - partner not found in database");
                }
            } catch (Exception e) {
                logger.severe("Error verifying partner data: " + e.getMessage());
            }

            // Redirect to login page with success parameter
            response.sendRedirect(request.getContextPath() + "/pages/auth/login.jsp?success=registered");
        } else {
            logger.severe("Failed to create partner account for email: " + mail);
            // Clean up uploaded files since database save failed
            cleanupUploadedFile(cinRectoPath, request);
            cleanupUploadedFile(cinVersoPath, request);
            cleanupUploadedFile(photoPersoPath, request);

            request.setAttribute("error", "Une erreur est survenue lors de la création du compte. Veuillez réessayer.");
            request.setAttribute("formData", request.getParameterMap());
            request.getRequestDispatcher("/pages/auth/register-client.jsp").forward(request, response);
        }
    }
}

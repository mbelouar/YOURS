package com.yours.servlet;

import com.yours.dao.MaterielDAO;
import com.yours.model.Materiel;
import com.yours.model.Photo;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.Date;
import java.util.logging.Logger;

@WebServlet(name = "AddMaterielServlet", urlPatterns = {"/partner/add-materiel"})
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,  // 1 MB
    maxFileSize = 10 * 1024 * 1024,   // 10 MB
    maxRequestSize = 50 * 1024 * 1024  // 50 MB
)
public class AddMaterielServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(AddMaterielServlet.class.getName());
    private MaterielDAO materielDAO;
    
    // Dossier pour stocker les images uploadées
    private static final String UPLOAD_DIR = "uploads" + File.separator + "equipment";
    
    @Override
    public void init() throws ServletException {
        super.init();
        materielDAO = new MaterielDAO();
        
        // Créer le dossier d'upload s'il n'existe pas
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
            logger.info("Dossier d'upload créé: " + uploadPath);
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json; charset=UTF-8");
        
        logger.info("=== AddMaterielServlet: doPost appelé ===");
        
        try {
            // Vérifier que l'utilisateur est connecté en tant que partenaire
            HttpSession session = request.getSession(false);
            
            // Debug: logger les informations de session
            if (session == null) {
                logger.warning("Session est null - utilisateur non connecté");
                response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                response.getWriter().write("{\"success\": false, \"error\": \"Vous devez être connecté en tant que partenaire. Session null.\"}");
                return;
            }
            
            logger.info("Session trouvée - ID: " + session.getId());
            logger.info("Session attributes: partnerId=" + session.getAttribute("partnerId") + 
                       ", userType=" + session.getAttribute("userType") + 
                       ", isLoggedIn=" + session.getAttribute("isLoggedIn"));
            
            Object partnerIdObj = session.getAttribute("partnerId");
            if (partnerIdObj == null) {
                logger.warning("partnerId est null dans la session. userType=" + session.getAttribute("userType"));
                logger.warning("Tous les attributs de session: " + java.util.Collections.list(session.getAttributeNames()));
                response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                response.getWriter().write("{\"success\": false, \"error\": \"Vous devez être connecté en tant que partenaire. Veuillez vous reconnecter.\", \"redirect\": \"/pages/auth/login.jsp\"}");
                return;
            }
            
            int partnerId = (Integer) partnerIdObj;
            logger.info("Partenaire ID: " + partnerId);
            
            // Récupérer les données du formulaire
            String nom = request.getParameter("nom");
            String prixStr = request.getParameter("prix");
            String categorieNom = request.getParameter("categorie");
            String disponibiliteStr = request.getParameter("disponibilite");
            String description = request.getParameter("description");
            
            // Debug: logger tous les paramètres reçus
            logger.info("Paramètres reçus - nom: " + nom + ", prix: " + prixStr + ", categorie: " + categorieNom + ", disponibilite: " + disponibiliteStr);
            
            // Validation des champs obligatoires
            if (nom == null || nom.trim().isEmpty()) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().write("{\"success\": false, \"error\": \"Le nom du matériel est requis\"}");
                return;
            }
            
            if (prixStr == null || prixStr.trim().isEmpty()) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().write("{\"success\": false, \"error\": \"Le prix est requis\"}");
                return;
            }
            
            if (categorieNom == null || categorieNom.trim().isEmpty()) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().write("{\"success\": false, \"error\": \"La catégorie est requise\"}");
                return;
            }
            
            // Convertir les valeurs
            float prix = Float.parseFloat(prixStr);
            // Le statut peut être "available", "unavailable", "maintenance" ou "1"/"0"
            // Disponible = true seulement si c'est "available" ou "1"
            boolean disponibilite = "available".equals(disponibiliteStr) || "1".equals(disponibiliteStr);
            
            logger.info("Statut reçu: " + disponibiliteStr + " -> disponibilite: " + disponibilite);
            
            // Obtenir ou créer la catégorie
            logger.info("Tentative de récupération/création de la catégorie: " + categorieNom);
            int categorieId = materielDAO.getOrCreateCategorie(categorieNom);
            if (categorieId == -1) {
                logger.severe("Erreur: Impossible de créer/récupérer la catégorie: " + categorieNom);
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.getWriter().write("{\"success\": false, \"error\": \"Erreur lors de la création/récupération de la catégorie: " + categorieNom + "\"}");
                return;
            }
            logger.info("Catégorie trouvée/créée avec l'ID: " + categorieId);
            
            // Créer l'objet Materiel
            Materiel materiel = new Materiel();
            materiel.setNom(nom.trim());
            materiel.setPrix(prix);
            materiel.setDisponibilite(disponibilite);
            materiel.setDescription(description != null ? description.trim() : null);
            materiel.setIdPartenaire(partnerId);
            materiel.setIdCategorie(categorieId);
            
            // Insérer le matériel dans la base de données
            logger.info("Tentative de création du matériel - nom: " + materiel.getNom() + ", prix: " + materiel.getPrix() + ", disponibilite: " + materiel.isDisponibilite() + ", idPartenaire: " + materiel.getIdPartenaire() + ", idCategorie: " + materiel.getIdCategorie());
            int materielId = materielDAO.createMateriel(materiel);
            
            if (materielId == -1) {
                logger.severe("ERREUR: Échec de la création du matériel dans la base de données");
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.getWriter().write("{\"success\": false, \"error\": \"Erreur lors de la création du matériel dans la base de données\"}");
                return;
            }
            
            logger.info("Matériel créé avec succès - ID: " + materielId);
            
            // Gérer l'upload des images
            String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
            int imageCount = 0;
            
            // Gérer l'upload des images
            // Récupérer toutes les parties de type "file"
            for (Part part : request.getParts()) {
                if (part.getName().equals("photos") && part.getSize() > 0) {
                    String fileName = getFileName(part);
                    if (fileName != null && !fileName.isEmpty()) {
                        // Vérifier que c'est bien une image
                        String contentType = part.getContentType();
                        if (contentType != null && contentType.startsWith("image/")) {
                            // Générer un nom de fichier unique
                            String uniqueFileName = System.currentTimeMillis() + "_" + materielId + "_" + imageCount + "_" + fileName;
                            String filePath = uploadPath + File.separator + uniqueFileName;
                            
                            // Sauvegarder le fichier
                            try (InputStream input = part.getInputStream()) {
                                Files.copy(input, Paths.get(filePath), StandardCopyOption.REPLACE_EXISTING);
                                logger.info("Image sauvegardée: " + filePath);
                                
                                // Créer l'entrée dans la table photo
                                Photo photo = new Photo();
                                photo.setDatePrise(new Date());
                                photo.setType("avantLocation"); // Par défaut, les photos d'ajout sont "avantLocation"
                                // Utiliser le chemin relatif pour l'URL
                                photo.setUrlPhoto(UPLOAD_DIR.replace(File.separator, "/") + "/" + uniqueFileName);
                                photo.setIdMateriel(materielId);
                                
                                if (materielDAO.createPhoto(photo)) {
                                    imageCount++;
                                    logger.info("Photo enregistrée dans la base de données: " + photo.getUrlPhoto());
                                }
                            } catch (IOException e) {
                                logger.warning("Erreur lors de l'upload de l'image: " + e.getMessage());
                            }
                        } else {
                            logger.warning("Fichier ignoré (pas une image): " + fileName);
                        }
                    }
                }
            }
            
            // Réponse de succès
            response.setStatus(HttpServletResponse.SC_OK);
            response.getWriter().write(String.format(
                "{\"success\": true, \"message\": \"Matériel ajouté avec succès\", \"materielId\": %d, \"imagesUploaded\": %d}",
                materielId, imageCount
            ));
            
        } catch (NumberFormatException e) {
            logger.severe("Erreur de format de nombre: " + e.getMessage());
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("{\"success\": false, \"error\": \"Format de prix invalide: " + e.getMessage() + "\"}");
        } catch (Exception e) {
            logger.severe("Erreur dans AddMaterielServlet: " + e.getMessage());
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            String errorMessage = e.getMessage() != null ? e.getMessage().replace("\"", "\\\"") : "Erreur inconnue";
            response.getWriter().write("{\"success\": false, \"error\": \"Erreur serveur: " + errorMessage + "\"}");
        }
    }
    
    // Méthode utilitaire pour extraire le nom du fichier depuis la partie
    private String getFileName(Part part) {
        String contentDisposition = part.getHeader("content-disposition");
        String[] tokens = contentDisposition.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf("=") + 2, token.length() - 1);
            }
        }
        return null;
    }
}


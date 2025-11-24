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

@WebServlet(name = "UpdateMaterielServlet", urlPatterns = {"/partner/update-materiel"})
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024,  // 1 MB
    maxFileSize = 10 * 1024 * 1024,   // 10 MB
    maxRequestSize = 50 * 1024 * 1024  // 50 MB
)
public class UpdateMaterielServlet extends HttpServlet {
    private static final Logger logger = Logger.getLogger(UpdateMaterielServlet.class.getName());
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
        
        logger.info("=== UpdateMaterielServlet: doPost appelé ===");
        
        try {
            // Vérifier que l'utilisateur est connecté en tant que partenaire
            HttpSession session = request.getSession(false);
            
            if (session == null) {
                logger.warning("Session est null - utilisateur non connecté");
                response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                response.getWriter().write("{\"success\": false, \"error\": \"Vous devez être connecté en tant que partenaire.\"}");
                return;
            }
            
            Object partnerIdObj = session.getAttribute("partnerId");
            if (partnerIdObj == null) {
                logger.warning("partnerId est null dans la session");
                response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
                response.getWriter().write("{\"success\": false, \"error\": \"Vous devez être connecté en tant que partenaire.\"}");
                return;
            }
            
            int partnerId = (Integer) partnerIdObj;
            logger.info("Partenaire ID: " + partnerId);
            
            // Récupérer l'ID du matériel à modifier
            String materielIdStr = request.getParameter("idMateriel");
            if (materielIdStr == null || materielIdStr.trim().isEmpty()) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                response.getWriter().write("{\"success\": false, \"error\": \"ID du matériel requis\"}");
                return;
            }
            
            int materielId = Integer.parseInt(materielIdStr);
            
            // Vérifier que le matériel appartient au partenaire
            Materiel existingMateriel = materielDAO.getMaterielById(materielId);
            if (existingMateriel == null || existingMateriel.getIdPartenaire() != partnerId) {
                response.setStatus(HttpServletResponse.SC_FORBIDDEN);
                response.getWriter().write("{\"success\": false, \"error\": \"Matériel non trouvé ou vous n'avez pas la permission de le modifier\"}");
                return;
            }
            
            // Récupérer les données du formulaire
            String nom = request.getParameter("nom");
            String prixStr = request.getParameter("prix");
            String categorieNom = request.getParameter("categorie");
            String disponibiliteStr = request.getParameter("disponibilite");
            String description = request.getParameter("description");
            
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
            boolean disponibilite = "available".equals(disponibiliteStr) || "1".equals(disponibiliteStr);
            
            // Obtenir ou créer la catégorie
            int categorieId = materielDAO.getOrCreateCategorie(categorieNom);
            if (categorieId == -1) {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.getWriter().write("{\"success\": false, \"error\": \"Erreur lors de la création/récupération de la catégorie\"}");
                return;
            }
            
            // Mettre à jour l'objet Materiel
            existingMateriel.setNom(nom.trim());
            existingMateriel.setPrix(prix);
            existingMateriel.setDisponibilite(disponibilite);
            existingMateriel.setDescription(description != null ? description.trim() : null);
            existingMateriel.setIdCategorie(categorieId);
            
            // Mettre à jour dans la base de données
            if (!materielDAO.updateMateriel(existingMateriel)) {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                response.getWriter().write("{\"success\": false, \"error\": \"Erreur lors de la mise à jour du matériel\"}");
                return;
            }
            
            logger.info("Matériel mis à jour avec succès - ID: " + materielId);
            
            // Gérer l'upload des nouvelles images
            String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIR;
            int imageCount = 0;
            
            // Gérer l'upload des nouvelles images
            for (Part part : request.getParts()) {
                if (part.getName().equals("photos") && part.getSize() > 0) {
                    String fileName = getFileName(part);
                    if (fileName != null && !fileName.isEmpty()) {
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
                                photo.setType("avantLocation");
                                photo.setUrlPhoto(UPLOAD_DIR.replace(File.separator, "/") + "/" + uniqueFileName);
                                photo.setIdMateriel(materielId);
                                
                                if (materielDAO.createPhoto(photo)) {
                                    imageCount++;
                                    logger.info("Photo enregistrée dans la base de données: " + photo.getUrlPhoto());
                                }
                            } catch (IOException e) {
                                logger.warning("Erreur lors de l'upload de l'image: " + e.getMessage());
                            }
                        }
                    }
                }
            }
            
            // Gérer la suppression des photos (si des IDs de photos à supprimer sont fournis)
            String photosToDelete = request.getParameter("photosToDelete");
            if (photosToDelete != null && !photosToDelete.trim().isEmpty()) {
                String[] photoIds = photosToDelete.split(",");
                for (String photoIdStr : photoIds) {
                    try {
                        int photoId = Integer.parseInt(photoIdStr.trim());
                        materielDAO.deletePhoto(photoId);
                        logger.info("Photo supprimée - ID: " + photoId);
                    } catch (NumberFormatException e) {
                        logger.warning("ID de photo invalide: " + photoIdStr);
                    }
                }
            }
            
            // Réponse de succès
            response.setStatus(HttpServletResponse.SC_OK);
            response.getWriter().write(String.format(
                "{\"success\": true, \"message\": \"Matériel mis à jour avec succès\", \"materielId\": %d, \"imagesUploaded\": %d}",
                materielId, imageCount
            ));
            
        } catch (NumberFormatException e) {
            logger.severe("Erreur de format de nombre: " + e.getMessage());
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("{\"success\": false, \"error\": \"Format invalide: " + e.getMessage() + "\"}");
        } catch (Exception e) {
            logger.severe("Erreur dans UpdateMaterielServlet: " + e.getMessage());
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


package com.yours.servlet;

import com.yours.dao.MaterielDAO;
import com.yours.model.Materiel;
import com.yours.model.Photo;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.fasterxml.jackson.databind.node.ArrayNode;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/api/materiel/*")
public class MaterielApiServlet extends HttpServlet {
    private MaterielDAO materielDAO;
    private ObjectMapper objectMapper;

    @Override
    public void init() throws ServletException {
        materielDAO = new MaterielDAO();
        objectMapper = new ObjectMapper();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.setHeader("Access-Control-Allow-Origin", "*");
        
        String pathInfo = request.getPathInfo();
        
        try {
            if (pathInfo != null && pathInfo.length() > 1) {
                // Get specific material by ID: /api/materiel/1
                String idStr = pathInfo.substring(1);
                int id = Integer.parseInt(idStr);
                
                Materiel materiel = materielDAO.getMaterielById(id);
                
                if (materiel != null) {
                    ObjectNode jsonResponse = convertMaterielToJson(materiel);
                    response.getWriter().write(objectMapper.writeValueAsString(jsonResponse));
                } else {
                    response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                    ObjectNode error = objectMapper.createObjectNode();
                    error.put("error", "Matériel non trouvé");
                    response.getWriter().write(objectMapper.writeValueAsString(error));
                }
            } else {
                // Get all materials: /api/materiel
                List<Materiel> materiels = materielDAO.getAllMateriels();
                ArrayNode jsonArray = objectMapper.createArrayNode();
                
                for (Materiel materiel : materiels) {
                    jsonArray.add(convertMaterielToJson(materiel));
                }
                
                response.getWriter().write(objectMapper.writeValueAsString(jsonArray));
            }
        } catch (NumberFormatException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            ObjectNode error = objectMapper.createObjectNode();
            error.put("error", "ID invalide");
            response.getWriter().write(objectMapper.writeValueAsString(error));
        } catch (Exception e) {
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            ObjectNode error = objectMapper.createObjectNode();
            error.put("error", "Erreur serveur: " + e.getMessage());
            response.getWriter().write(objectMapper.writeValueAsString(error));
        }
    }
    
    private ObjectNode convertMaterielToJson(Materiel materiel) {
        ObjectNode json = objectMapper.createObjectNode();
        
        json.put("idMateriel", materiel.getIdMateriel());
        json.put("nom", materiel.getNom());
        // Use a default description since getDescription() doesn't exist
        json.put("description", "Description du matériel " + materiel.getNom());
        json.put("prix", materiel.getPrix());
        json.put("disponibilite", materiel.isDisponibilite()); // Fixed method name
        
        // Catégorie
        if (materiel.getCategorie() != null) {
            json.put("idCategorie", materiel.getCategorie().getIdCategorie());
            json.put("categorie", materiel.getCategorie().getNomCategorie()); // Fixed method name
        }
        
        // Partenaire
        if (materiel.getPartenaire() != null) {
            ObjectNode partner = objectMapper.createObjectNode();
            partner.put("idPartenaire", materiel.getPartenaire().getIdPartenaire());
            partner.put("nom", materiel.getPartenaire().getNom());
            partner.put("rating", 4.5); // Valeur par défaut, à adapter selon votre modèle
            json.set("partner", partner);
        }
        
        // Photos
        ArrayNode images = objectMapper.createArrayNode();
        if (materiel.getPhotos() != null && !materiel.getPhotos().isEmpty()) {
            for (Photo photo : materiel.getPhotos()) {
                images.add(photo.getUrlPhoto()); // Fixed method name
            }
        } else {
            // Image par défaut si aucune photo
            images.add("https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=600&auto=format&fit=crop&q=80");
        }
        json.set("images", images);
        
        // Spécifications par défaut (à adapter selon votre modèle)
        ArrayNode specifications = objectMapper.createArrayNode();
        specifications.add("Matériel professionnel");
        specifications.add("Entretien régulier");
        specifications.add("Support technique inclus");
        json.set("specifications", specifications);
        
        return json;
    }
}
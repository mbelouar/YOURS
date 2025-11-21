package com.yours.dao;

import com.yours.model.Materiel;
import com.yours.model.Categorie;
import com.yours.model.Partenaire;
import com.yours.model.Photo;
import com.yours.util.DatabaseConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.HashMap;
import java.util.stream.Collectors;

public class MaterielDAO {
    
    private static final String SELECT_ALL_MATERIELS =
        "SELECT m.idMateriel, m.nom, m.disponibilite, m.prix, m.idCategorie, c.nomCategorie, " +
        "m.idPartenaire, p.nom AS nomPartenaire " +
        "FROM materiel m " +
        "LEFT JOIN categorie c ON m.idCategorie = c.idCategorie " +
        "LEFT JOIN partenaire p ON m.idPartenaire = p.idPartenaire";
    
    private static final String SELECT_PHOTOS_BY_MATERIEL =
        "SELECT idPhoto, datePrise, type, urlPhoto, idMateriel " +
        "FROM photo WHERE idMateriel = ? ORDER BY type DESC, datePrise DESC";
    
    public List<Materiel> getAllMateriels() {
        List<Materiel> materiels = new ArrayList<>();
        Map<Integer, Materiel> materielMap = new HashMap<>();

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(SELECT_ALL_MATERIELS);
             ResultSet rs = statement.executeQuery()) {

            while (rs.next()) {
                Materiel m = new Materiel();
                m.setIdMateriel(rs.getInt("idMateriel"));
                m.setNom(rs.getString("nom"));
                m.setDisponibilite(rs.getBoolean("disponibilite"));
                m.setPrix(rs.getFloat("prix"));
                m.setIdCategorie(rs.getInt("idCategorie"));
                m.setIdPartenaire(rs.getInt("idPartenaire"));
                m.setPhotos(new ArrayList<>()); // Initialiser la liste des photos

                if (rs.getObject("idCategorie") != null) {
                    Categorie c = new Categorie();
                    c.setIdCategorie(rs.getInt("idCategorie"));
                    c.setNomCategorie(rs.getString("nomCategorie"));
                    m.setCategorie(c);
                }

                if (rs.getObject("idPartenaire") != null) {
                    Partenaire p = new Partenaire();
                    p.setIdPartenaire(rs.getInt("idPartenaire"));
                    p.setNom(rs.getString("nomPartenaire"));
                    m.setPartenaire(p);
                }
                
                materiels.add(m);
                materielMap.put(m.getIdMateriel(), m);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            return materiels; // En cas d'erreur, retourner ce qui a été trouvé
        }

        // Si aucun matériel n'est trouvé, inutile d'aller plus loin
        if (materielMap.isEmpty()) {
            return materiels;
        }

        // Étape 2: Récupérer toutes les photos pour les matériels trouvés en une seule requête
        String ids = materielMap.keySet().stream()
                                .map(String::valueOf)
                                .collect(Collectors.joining(","));
        String photoQuery = "SELECT * FROM photo WHERE idMateriel IN (" + ids + ") ORDER BY idMateriel, type DESC";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement photoStatement = connection.prepareStatement(photoQuery);
             ResultSet photoRs = photoStatement.executeQuery()) {

            while (photoRs.next()) {
                int materielId = photoRs.getInt("idMateriel");
                Materiel materiel = materielMap.get(materielId);
                if (materiel != null) {
                    Photo photo = new Photo();
                    photo.setIdPhoto(photoRs.getInt("idPhoto"));
                    photo.setDatePrise(photoRs.getDate("datePrise"));
                    photo.setType(photoRs.getString("type"));
                    photo.setUrlPhoto(photoRs.getString("urlPhoto"));
                    photo.setIdMateriel(materielId);
                    materiel.getPhotos().add(photo);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return materiels;
    }
    
    // Méthode pour récupérer les photos d'un matériel
    private List<Photo> getPhotosByMateriel(int idMateriel, Connection connection) {
        System.out.println("Récupération des photos pour le matériel ID: " + idMateriel);
        List<Photo> photos = new ArrayList<>();
        
        try (PreparedStatement statement = connection.prepareStatement(SELECT_PHOTOS_BY_MATERIEL)) {
            System.out.println("Requête SQL préparée: " + SELECT_PHOTOS_BY_MATERIEL);
            statement.setInt(1, idMateriel);
            ResultSet rs = statement.executeQuery();
            
            int count = 0;
            while (rs.next()) {
                count++;
                try {
                    Photo photo = new Photo();
                    photo.setIdPhoto(rs.getInt("idPhoto"));
                    photo.setDatePrise(rs.getDate("datePrise"));
                    photo.setType(rs.getString("type"));
                    photo.setUrlPhoto(rs.getString("urlPhoto"));
                    photo.setIdMateriel(rs.getInt("idMateriel"));
                    photos.add(photo);
                    System.out.println("Photo trouvée: " + photo.getUrlPhoto());
                } catch (SQLException e) {
                    System.err.println("Erreur lors de la lecture d'une photo: " + e.getMessage());
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return photos;
    }
    
    // Méthode pour récupérer un matériel par ID
    public Materiel getMaterielById(int idMateriel) {
        System.out.println("Début de getMaterielById pour l'ID: " + idMateriel);
        Materiel materiel = null;
        String query = SELECT_ALL_MATERIELS + " WHERE m.idMateriel = ?";
        
        try (Connection connection = DatabaseConnection.getConnection()) {
            System.out.println("Connexion à la base de données établie");
            try (PreparedStatement statement = connection.prepareStatement(query)) {
            
            statement.setInt(1, idMateriel);
            ResultSet rs = statement.executeQuery();
            
            if (rs.next()) {
                System.out.println("Matériel trouvé dans la base de données");
                materiel = new Materiel();
                materiel.setIdMateriel(rs.getInt("idMateriel"));
                materiel.setNom(rs.getString("nom"));
                materiel.setDisponibilite(rs.getBoolean("disponibilite"));
                materiel.setPrix(rs.getFloat("prix"));
                materiel.setIdCategorie(rs.getInt("idCategorie"));
                materiel.setIdPartenaire(rs.getInt("idPartenaire"));
                
                if (rs.getObject("idCategorie") != null) {
                    Categorie c = new Categorie();
                    c.setIdCategorie(rs.getInt("idCategorie"));
                    c.setNomCategorie(rs.getString("nomCategorie"));
                    materiel.setCategorie(c);
                }
                
                if (rs.getObject("idPartenaire") != null) {
                    Partenaire p = new Partenaire();
                    p.setIdPartenaire(rs.getInt("idPartenaire"));
                    p.setNom(rs.getString("nomPartenaire"));
                    materiel.setPartenaire(p);
                }
                
                materiel.setPhotos(getPhotosByMateriel(materiel.getIdMateriel(), connection));
            }
            
            } catch (SQLException e) {
                System.err.println("Erreur SQL dans getMaterielById: " + e.getMessage());
                e.printStackTrace();
            }
        } catch (Exception e) {
            System.err.println("Erreur inattendue dans getMaterielById: " + e.getMessage());
            e.printStackTrace();
        }
        
        return materiel;
    }
}
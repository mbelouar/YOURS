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

public class MaterielDAO {
    
    private static final String SELECT_ALL_MATERIELS =
        "SELECT m.idMateriel, m.nom, m.disponibilite, m.prix, m.description, m.idCategorie, c.nomCategorie, " +
        "m.idPartenaire, p.nom AS nomPartenaire " +
        "FROM materiel m " +
        "LEFT JOIN categorie c ON m.idCategorie = c.idCategorie " +
        "LEFT JOIN partenaire p ON m.idPartenaire = p.idPartenaire";
    
    private static final String SELECT_PHOTOS_BY_MATERIEL =
        "SELECT idPhoto, datePrise, type, urlPhoto, idMateriel " +
        "FROM photo WHERE idMateriel = ? ORDER BY type DESC, datePrise DESC";
    
    public List<Materiel> getAllMateriels() {
        List<Materiel> materiels = new ArrayList<>();
        
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(SELECT_ALL_MATERIELS);
             ResultSet rs = statement.executeQuery()) {
            
            while (rs.next()) {
                Materiel m = new Materiel();
                m.setIdMateriel(rs.getInt("idMateriel"));
                m.setNom(rs.getString("nom"));
                m.setDisponibilite(rs.getBoolean("disponibilite"));
                m.setPrix(rs.getFloat("prix"));
                m.setDescription(rs.getString("description"));
                m.setIdCategorie(rs.getInt("idCategorie"));
                m.setIdPartenaire(rs.getInt("idPartenaire"));
                
                // Categorie
                Categorie c = new Categorie();
                c.setIdCategorie(rs.getInt("idCategorie"));
                c.setNomCategorie(rs.getString("nomCategorie"));
                m.setCategorie(c);
                
                // Partenaire
                Partenaire p = new Partenaire();
                p.setIdPartenaire(rs.getInt("idPartenaire"));
                p.setNom(rs.getString("nomPartenaire"));
                m.setPartenaire(p);
                
                // Charger les photos pour ce matériel
                m.setPhotos(getPhotosByMateriel(connection, m.getIdMateriel()));
                
                materiels.add(m);
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return materiels;
    }
    
    // Méthode pour récupérer les photos d'un matériel
    private List<Photo> getPhotosByMateriel(Connection connection, int idMateriel) {
        System.out.println("Récupération des photos pour le matériel ID: " + idMateriel);
        List<Photo> photos = new ArrayList<>();
        
        try (PreparedStatement statement = connection.prepareStatement(SELECT_PHOTOS_BY_MATERIEL)) {
            System.out.println("Requête SQL préparée: " + SELECT_PHOTOS_BY_MATERIEL);
            statement.setInt(1, idMateriel);
            ResultSet rs = statement.executeQuery();
            
            while (rs.next()) {
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
                materiel.setDescription(rs.getString("description"));
                materiel.setIdCategorie(rs.getInt("idCategorie"));
                materiel.setIdPartenaire(rs.getInt("idPartenaire"));
                
                Categorie c = new Categorie();
                c.setIdCategorie(rs.getInt("idCategorie"));
                c.setNomCategorie(rs.getString("nomCategorie"));
                materiel.setCategorie(c);
                
                Partenaire p = new Partenaire();
                p.setIdPartenaire(rs.getInt("idPartenaire"));
                p.setNom(rs.getString("nomPartenaire"));
                materiel.setPartenaire(p);
                
                materiel.setPhotos(getPhotosByMateriel(connection, materiel.getIdMateriel()));
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
    
    // Méthode pour créer un nouveau matériel
    public int createMateriel(Materiel materiel) {
        String INSERT_MATERIEL = 
            "INSERT INTO materiel (nom, disponibilite, prix, description, idPartenaire, idCategorie) " +
            "VALUES (?, ?, ?, ?, ?, ?)";
        
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(INSERT_MATERIEL, 
                 java.sql.Statement.RETURN_GENERATED_KEYS)) {
            
            statement.setString(1, materiel.getNom());
            statement.setBoolean(2, materiel.isDisponibilite());
            statement.setFloat(3, materiel.getPrix());
            statement.setString(4, materiel.getDescription());
            statement.setInt(5, materiel.getIdPartenaire());
            statement.setInt(6, materiel.getIdCategorie());
            
            int rowsAffected = statement.executeUpdate();
            
            if (rowsAffected > 0) {
                try (ResultSet generatedKeys = statement.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        int generatedId = generatedKeys.getInt(1);
                        System.out.println("Matériel créé avec l'ID: " + generatedId);
                        return generatedId;
                    }
                }
            }
            
        } catch (SQLException e) {
            System.err.println("Erreur lors de la création du matériel: " + e.getMessage());
            e.printStackTrace();
        }
        
        return -1; // Retourne -1 en cas d'erreur
    }
    
    // Méthode pour créer une photo associée à un matériel
    public boolean createPhoto(Photo photo) {
        String INSERT_PHOTO = 
            "INSERT INTO photo (datePrise, type, urlPhoto, idMateriel) " +
            "VALUES (?, ?, ?, ?)";
        
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(INSERT_PHOTO)) {
            
            statement.setDate(1, new java.sql.Date(photo.getDatePrise().getTime()));
            statement.setString(2, photo.getType());
            statement.setString(3, photo.getUrlPhoto());
            statement.setInt(4, photo.getIdMateriel());
            
            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
            
        } catch (SQLException e) {
            System.err.println("Erreur lors de la création de la photo: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    
    // Méthode pour récupérer tous les matériels d'un partenaire
    public List<Materiel> getMaterielsByPartnerId(int idPartenaire) {
        List<Materiel> materiels = new ArrayList<>();
        String query = SELECT_ALL_MATERIELS + " WHERE m.idPartenaire = ? ORDER BY m.idMateriel DESC";
        
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            
            statement.setInt(1, idPartenaire);
            ResultSet rs = statement.executeQuery();
            
            while (rs.next()) {
                Materiel m = new Materiel();
                m.setIdMateriel(rs.getInt("idMateriel"));
                m.setNom(rs.getString("nom"));
                m.setDisponibilite(rs.getBoolean("disponibilite"));
                m.setPrix(rs.getFloat("prix"));
                m.setDescription(rs.getString("description"));
                m.setIdCategorie(rs.getInt("idCategorie"));
                m.setIdPartenaire(rs.getInt("idPartenaire"));
                
                // Categorie
                Categorie c = new Categorie();
                c.setIdCategorie(rs.getInt("idCategorie"));
                c.setNomCategorie(rs.getString("nomCategorie"));
                m.setCategorie(c);
                
                // Partenaire
                Partenaire p = new Partenaire();
                p.setIdPartenaire(rs.getInt("idPartenaire"));
                p.setNom(rs.getString("nomPartenaire"));
                m.setPartenaire(p);
                
                // Charger les photos pour ce matériel
                m.setPhotos(getPhotosByMateriel(connection, m.getIdMateriel()));
                
                materiels.add(m);
            }
            
        } catch (SQLException e) {
            System.err.println("Erreur lors de la récupération des matériels du partenaire: " + e.getMessage());
            e.printStackTrace();
        }
        
        return materiels;
    }
    
    // Méthode pour mettre à jour un matériel
    public boolean updateMateriel(Materiel materiel) {
        String UPDATE_MATERIEL = 
            "UPDATE materiel SET nom = ?, disponibilite = ?, prix = ?, description = ?, idCategorie = ? " +
            "WHERE idMateriel = ? AND idPartenaire = ?";
        
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_MATERIEL)) {
            
            statement.setString(1, materiel.getNom());
            statement.setBoolean(2, materiel.isDisponibilite());
            statement.setFloat(3, materiel.getPrix());
            statement.setString(4, materiel.getDescription());
            statement.setInt(5, materiel.getIdCategorie());
            statement.setInt(6, materiel.getIdMateriel());
            statement.setInt(7, materiel.getIdPartenaire());
            
            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
            
        } catch (SQLException e) {
            System.err.println("Erreur lors de la mise à jour du matériel: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    
    // Méthode pour supprimer un matériel (les photos seront supprimées automatiquement via CASCADE)
    public boolean deleteMateriel(int idMateriel, int idPartenaire) {
        String DELETE_MATERIEL = 
            "DELETE FROM materiel WHERE idMateriel = ? AND idPartenaire = ?";
        
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_MATERIEL)) {
            
            statement.setInt(1, idMateriel);
            statement.setInt(2, idPartenaire);
            
            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
            
        } catch (SQLException e) {
            System.err.println("Erreur lors de la suppression du matériel: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    
    // Méthode pour supprimer une photo spécifique
    public boolean deletePhoto(int idPhoto) {
        String DELETE_PHOTO = "DELETE FROM photo WHERE idPhoto = ?";
        
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_PHOTO)) {
            
            statement.setInt(1, idPhoto);
            int rowsAffected = statement.executeUpdate();
            return rowsAffected > 0;
            
        } catch (SQLException e) {
            System.err.println("Erreur lors de la suppression de la photo: " + e.getMessage());
            e.printStackTrace();
            return false;
        }
    }
    
    // Méthode pour obtenir ou créer une catégorie par nom
    public int getOrCreateCategorie(String nomCategorie) {
        String SELECT_CATEGORIE = "SELECT idCategorie FROM categorie WHERE nomCategorie = ?";
        String INSERT_CATEGORIE = "INSERT INTO categorie (nomCategorie) VALUES (?)";
        
        try (Connection connection = DatabaseConnection.getConnection()) {
            // D'abord, chercher si la catégorie existe
            try (PreparedStatement selectStmt = connection.prepareStatement(SELECT_CATEGORIE)) {
                selectStmt.setString(1, nomCategorie);
                try (ResultSet rs = selectStmt.executeQuery()) {
                    if (rs.next()) {
                        return rs.getInt("idCategorie");
                    }
                }
            }
            
            // Si elle n'existe pas, la créer
            try (PreparedStatement insertStmt = connection.prepareStatement(INSERT_CATEGORIE, 
                    java.sql.Statement.RETURN_GENERATED_KEYS)) {
                insertStmt.setString(1, nomCategorie);
                int rowsAffected = insertStmt.executeUpdate();
                
                if (rowsAffected > 0) {
                    try (ResultSet generatedKeys = insertStmt.getGeneratedKeys()) {
                        if (generatedKeys.next()) {
                            return generatedKeys.getInt(1);
                        }
                    }
                }
            }
            
        } catch (SQLException e) {
            System.err.println("Erreur lors de la récupération/création de la catégorie: " + e.getMessage());
            e.printStackTrace();
        }
        
        return -1;
    }
}
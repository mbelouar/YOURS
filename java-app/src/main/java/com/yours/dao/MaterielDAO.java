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
        List<Photo> photos = new ArrayList<>();
        
        try (PreparedStatement statement = connection.prepareStatement(SELECT_PHOTOS_BY_MATERIEL)) {
            statement.setInt(1, idMateriel);
            ResultSet rs = statement.executeQuery();
            
            while (rs.next()) {
                Photo photo = new Photo();
                photo.setIdPhoto(rs.getInt("idPhoto"));
                photo.setDatePrise(rs.getDate("datePrise"));
                photo.setType(rs.getString("type"));
                photo.setUrlPhoto(rs.getString("urlPhoto"));
                photo.setIdMateriel(rs.getInt("idMateriel"));
                photos.add(photo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return photos;
    }
    
    // Méthode pour récupérer un matériel par ID
    public Materiel getMaterielById(int idMateriel) {
        Materiel materiel = null;
        String query = SELECT_ALL_MATERIELS + " WHERE m.idMateriel = ?";
        
        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(query)) {
            
            statement.setInt(1, idMateriel);
            ResultSet rs = statement.executeQuery();
            
            if (rs.next()) {
                materiel = new Materiel();
                materiel.setIdMateriel(rs.getInt("idMateriel"));
                materiel.setNom(rs.getString("nom"));
                materiel.setDisponibilite(rs.getBoolean("disponibilite"));
                materiel.setPrix(rs.getFloat("prix"));
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
            e.printStackTrace();
        }
        
        return materiel;
    }
}
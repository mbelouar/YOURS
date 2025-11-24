package com.yours.model;

import java.util.List;

public class Materiel {
    private int idMateriel;
    private String nom;
    private boolean disponibilite;
    private float prix;
    private String description;
    private int idCategorie;
    private int idPartenaire;
    private Categorie categorie;
    private Partenaire partenaire;
    private List<Photo> photos; // NOUVEAU
    
    // Constructeurs
    public Materiel() {}
    
    // Getters et Setters existants...
    public int getIdMateriel() {
        return idMateriel;
    }
    
    public void setIdMateriel(int idMateriel) {
        this.idMateriel = idMateriel;
    }
    
    public String getNom() {
        return nom;
    }
    
    public void setNom(String nom) {
        this.nom = nom;
    }
    
    public boolean isDisponibilite() {
        return disponibilite;
    }
    
    public void setDisponibilite(boolean disponibilite) {
        this.disponibilite = disponibilite;
    }
    
    public float getPrix() {
        return prix;
    }
    
    public void setPrix(float prix) {
        this.prix = prix;
    }
    
    public String getDescription() {
        return description;
    }
    
    public void setDescription(String description) {
        this.description = description;
    }
    
    public int getIdCategorie() {
        return idCategorie;
    }
    
    public void setIdCategorie(int idCategorie) {
        this.idCategorie = idCategorie;
    }
    
    public int getIdPartenaire() {
        return idPartenaire;
    }
    
    public void setIdPartenaire(int idPartenaire) {
        this.idPartenaire = idPartenaire;
    }
    
    public Categorie getCategorie() {
        return categorie;
    }
    
    public void setCategorie(Categorie categorie) {
        this.categorie = categorie;
    }
    
    public Partenaire getPartenaire() {
        return partenaire;
    }
    
    public void setPartenaire(Partenaire partenaire) {
        this.partenaire = partenaire;
    }
    
    // NOUVEAU: Getter et Setter pour les photos
    public List<Photo> getPhotos() {
        return photos;
    }
    
    public void setPhotos(List<Photo> photos) {
        this.photos = photos;
    }
    
    // Méthode utile pour obtenir la première photo "avant location"
    public String getPrimaryPhotoUrl() {
        if (photos != null && !photos.isEmpty()) {
            for (Photo photo : photos) {
                if ("avantLocation".equals(photo.getType())) {
                    return photo.getUrlPhoto();
                }
            }
            // Si pas de photo "avantLocation", retourner la première photo disponible
            return photos.get(0).getUrlPhoto();
        }
        return null; // Aucune photo disponible
    }
}
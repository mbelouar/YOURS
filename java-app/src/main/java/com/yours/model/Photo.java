// ============================================
// 1. Classe Photo.java (Modèle)
// ============================================
package com.yours.model;

import java.util.Date;

public class Photo {
    private int idPhoto;
    private Date datePrise;
    private String type; // 'avantLocation' ou 'apresLocation'
    private String urlPhoto;
    private int idMateriel;
    
    // Constructeurs
    public Photo() {}
    
    public Photo(int idPhoto, Date datePrise, String type, String urlPhoto, int idMateriel) {
        this.idPhoto = idPhoto;
        this.datePrise = datePrise;
        this.type = type;
        this.urlPhoto = urlPhoto;
        this.idMateriel = idMateriel;
    }
    
    // Getters et Setters
    public int getIdPhoto() {
        return idPhoto;
    }
    
    public void setIdPhoto(int idPhoto) {
        this.idPhoto = idPhoto;
    }
    
    public Date getDatePrise() {
        return datePrise;
    }
    
    public void setDatePrise(Date datePrise) {
        this.datePrise = datePrise;
    }
    
    public String getType() {
        return type;
    }
    
    public void setType(String type) {
        this.type = type;
    }
    
    public String getUrlPhoto() {
        return urlPhoto;
    }
    
    public void setUrlPhoto(String urlPhoto) {
        this.urlPhoto = urlPhoto;
    }
    
    public int getIdMateriel() {
        return idMateriel;
    }
    
    public void setIdMateriel(int idMateriel) {
        this.idMateriel = idMateriel;
    }
}
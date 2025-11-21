package com.yours.model;

import java.util.Date;

public class Photo {
    private int idPhoto;
    private String urlPhoto;
    private Date datePrise;
    private String type;
    private int idMateriel;
    
    // Constructeurs
    public Photo() {}
    
    // Getters et Setters
    public int getIdPhoto() {
        return idPhoto;
    }
    
    public void setIdPhoto(int idPhoto) {
        this.idPhoto = idPhoto;
    }
    
    public String getUrlPhoto() {
        return urlPhoto;
    }
    
    public void setUrlPhoto(String urlPhoto) {
        this.urlPhoto = urlPhoto;
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
    
    public int getIdMateriel() {
        return idMateriel;
    }
    
    public void setIdMateriel(int idMateriel) {
        this.idMateriel = idMateriel;
    }
}
package com.yours.model;

import java.sql.Date;

/**
 * Photo entity representing the photo table
 */
public class Photo {
    private int idPhoto;
    private Date datePrise;
    private PhotoType type;
    private String urlPhoto;
    private Integer idMateriel;

    // Enum for photo type
    public enum PhotoType {
        AVANT_LOCATION("avantLocation"),
        APRES_LOCATION("apresLocation");

        private final String value;

        PhotoType(String value) {
            this.value = value;
        }

        public String getValue() {
            return value;
        }

        public static PhotoType fromValue(String value) {
            for (PhotoType type : PhotoType.values()) {
                if (type.value.equals(value)) {
                    return type;
                }
            }
            throw new IllegalArgumentException("Invalid photo type: " + value);
        }
    }

    // Constructors
    public Photo() {
    }

    public Photo(Date datePrise, PhotoType type, String urlPhoto, Integer idMateriel) {
        this.datePrise = datePrise;
        this.type = type;
        this.urlPhoto = urlPhoto;
        this.idMateriel = idMateriel;
    }

    public Photo(int idPhoto, Date datePrise, PhotoType type, String urlPhoto, Integer idMateriel) {
        this.idPhoto = idPhoto;
        this.datePrise = datePrise;
        this.type = type;
        this.urlPhoto = urlPhoto;
        this.idMateriel = idMateriel;
    }

    // Getters and Setters
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

    public PhotoType getType() {
        return type;
    }

    public void setType(PhotoType type) {
        this.type = type;
    }

    public String getUrlPhoto() {
        return urlPhoto;
    }

    public void setUrlPhoto(String urlPhoto) {
        this.urlPhoto = urlPhoto;
    }

    public Integer getIdMateriel() {
        return idMateriel;
    }

    public void setIdMateriel(Integer idMateriel) {
        this.idMateriel = idMateriel;
    }

    @Override
    public String toString() {
        return "Photo{" +
                "idPhoto=" + idPhoto +
                ", datePrise=" + datePrise +
                ", type=" + type +
                ", urlPhoto='" + urlPhoto + '\'' +
                ", idMateriel=" + idMateriel +
                '}';
    }
}

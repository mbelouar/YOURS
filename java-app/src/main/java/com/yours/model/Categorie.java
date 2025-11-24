package com.yours.model;

/**
 * Categorie entity representing the categorie table
 */
public class Categorie {
    private int idCategorie;
    private String nomCategorie;

    // Constructors
    public Categorie() {
    }

    public Categorie(String nomCategorie) {
        this.nomCategorie = nomCategorie;
    }

    public Categorie(int idCategorie, String nomCategorie) {
        this.idCategorie = idCategorie;
        this.nomCategorie = nomCategorie;
    }

    // Getters and Setters
    public int getIdCategorie() {
        return idCategorie;
    }

    public void setIdCategorie(int idCategorie) {
        this.idCategorie = idCategorie;
    }

    public String getNomCategorie() {
        return nomCategorie;
    }

    public void setNomCategorie(String nomCategorie) {
        this.nomCategorie = nomCategorie;
    }

    @Override
    public String toString() {
        return "Categorie{" +
                "idCategorie=" + idCategorie +
                ", nomCategorie='" + nomCategorie + '\'' +
                '}';
    }
}

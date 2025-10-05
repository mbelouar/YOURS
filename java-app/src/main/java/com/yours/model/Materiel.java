package com.yours.model;

/**
 * Materiel entity representing the materiel table
 */
public class Materiel {
    private int idMateriel;
    private String nom;
    private boolean disponibilite;
    private float prix;
    private Integer idPartenaire;
    private Integer idCategorie;

    // Constructors
    public Materiel() {
    }

    public Materiel(String nom, boolean disponibilite, float prix) {
        this.nom = nom;
        this.disponibilite = disponibilite;
        this.prix = prix;
    }

    public Materiel(String nom, boolean disponibilite, float prix, Integer idPartenaire, Integer idCategorie) {
        this.nom = nom;
        this.disponibilite = disponibilite;
        this.prix = prix;
        this.idPartenaire = idPartenaire;
        this.idCategorie = idCategorie;
    }

    public Materiel(int idMateriel, String nom, boolean disponibilite, float prix, Integer idPartenaire,
            Integer idCategorie) {
        this.idMateriel = idMateriel;
        this.nom = nom;
        this.disponibilite = disponibilite;
        this.prix = prix;
        this.idPartenaire = idPartenaire;
        this.idCategorie = idCategorie;
    }

    // Getters and Setters
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

    public Integer getIdPartenaire() {
        return idPartenaire;
    }

    public void setIdPartenaire(Integer idPartenaire) {
        this.idPartenaire = idPartenaire;
    }

    public Integer getIdCategorie() {
        return idCategorie;
    }

    public void setIdCategorie(Integer idCategorie) {
        this.idCategorie = idCategorie;
    }

    @Override
    public String toString() {
        return "Materiel{" +
                "idMateriel=" + idMateriel +
                ", nom='" + nom + '\'' +
                ", disponibilite=" + disponibilite +
                ", prix=" + prix +
                ", idPartenaire=" + idPartenaire +
                ", idCategorie=" + idCategorie +
                '}';
    }
}

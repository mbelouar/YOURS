package com.yours.model;

/**
 * Simplified Client entity representing only the fields used in registration
 */
public class Client {
    private int idClient;
    private String nom;
    private String prenom;
    private String mail;
    private String numTelephone;
    private String motDepasse;

    // Constructors
    public Client() {
    }

    public Client(String nom, String prenom, String mail, String motDepasse) {
        this.nom = nom;
        this.prenom = prenom;
        this.mail = mail;
        this.motDepasse = motDepasse;
    }

    public Client(int idClient, String nom, String prenom, String mail, String numTelephone, String motDepasse) {
        this.idClient = idClient;
        this.nom = nom;
        this.prenom = prenom;
        this.mail = mail;
        this.numTelephone = numTelephone;
        this.motDepasse = motDepasse;
    }

    // Getters and Setters
    public int getIdClient() {
        return idClient;
    }

    public void setIdClient(int idClient) {
        this.idClient = idClient;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getNumTelephone() {
        return numTelephone;
    }

    public void setNumTelephone(String numTelephone) {
        this.numTelephone = numTelephone;
    }

    public String getMotDepasse() {
        return motDepasse;
    }

    public void setMotDepasse(String motDepasse) {
        this.motDepasse = motDepasse;
    }

    @Override
    public String toString() {
        return "Client{" +
                "idClient=" + idClient +
                ", nom='" + nom + '\'' +
                ", prenom='" + prenom + '\'' +
                ", mail='" + mail + '\'' +
                ", numTelephone='" + numTelephone + '\'' +
                ", motDepasse='" + motDepasse + '\'' +
                '}';
    }
}
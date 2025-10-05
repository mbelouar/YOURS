package com.yours.model;

import java.sql.Date;

/**
 * Client entity representing the client table
 */
public class Client {
    private int idClient;
    private String nom;
    private String prenom;
    private String mail;
    private String adresse;
    private String numTelephone;
    private String cinRECTO;
    private String cinVERSO;
    private String motDepasse;
    private Date dateNaissance;
    private String photoPerso;

    // Constructors
    public Client() {
    }

    public Client(String nom, String prenom, String mail, String motDepasse) {
        this.nom = nom;
        this.prenom = prenom;
        this.mail = mail;
        this.motDepasse = motDepasse;
    }

    public Client(int idClient, String nom, String prenom, String mail, String adresse,
            String numTelephone, String cinRECTO, String cinVERSO, String motDepasse,
            Date dateNaissance, String photoPerso) {
        this.idClient = idClient;
        this.nom = nom;
        this.prenom = prenom;
        this.mail = mail;
        this.adresse = adresse;
        this.numTelephone = numTelephone;
        this.cinRECTO = cinRECTO;
        this.cinVERSO = cinVERSO;
        this.motDepasse = motDepasse;
        this.dateNaissance = dateNaissance;
        this.photoPerso = photoPerso;
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

    public String getAdresse() {
        return adresse;
    }

    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    public String getNumTelephone() {
        return numTelephone;
    }

    public void setNumTelephone(String numTelephone) {
        this.numTelephone = numTelephone;
    }

    public String getCinRECTO() {
        return cinRECTO;
    }

    public void setCinRECTO(String cinRECTO) {
        this.cinRECTO = cinRECTO;
    }

    public String getCinVERSO() {
        return cinVERSO;
    }

    public void setCinVERSO(String cinVERSO) {
        this.cinVERSO = cinVERSO;
    }

    public String getMotDepasse() {
        return motDepasse;
    }

    public void setMotDepasse(String motDepasse) {
        this.motDepasse = motDepasse;
    }

    public Date getDateNaissance() {
        return dateNaissance;
    }

    public void setDateNaissance(Date dateNaissance) {
        this.dateNaissance = dateNaissance;
    }

    public String getPhotoPerso() {
        return photoPerso;
    }

    public void setPhotoPerso(String photoPerso) {
        this.photoPerso = photoPerso;
    }

    @Override
    public String toString() {
        return "Client{" +
                "idClient=" + idClient +
                ", nom='" + nom + '\'' +
                ", prenom='" + prenom + '\'' +
                ", mail='" + mail + '\'' +
                ", adresse='" + adresse + '\'' +
                ", numTelephone='" + numTelephone + '\'' +
                ", cinRECTO='" + cinRECTO + '\'' +
                ", cinVERSO='" + cinVERSO + '\'' +
                ", motDepasse='" + motDepasse + '\'' +
                ", dateNaissance=" + dateNaissance +
                ", photoPerso='" + photoPerso + '\'' +
                '}';
    }
}

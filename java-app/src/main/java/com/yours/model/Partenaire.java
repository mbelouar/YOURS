package com.yours.model;

/**
 * Simplified Partenaire entity representing only the fields used in
 * registration
 */
public class Partenaire {
    private int idPartenaire;
    private String nom;
    private String prenom;
    private String mail;
    private String numTelephone;
    private String motDepasse;
    private String nomEntreprise;
    private String typeActivite;
    private String adresse;
    private String cinRECTO;
    private String cinVERSO;
    private String photoPerso;

    // Constructors
    public Partenaire() {
    }

    public Partenaire(String nom, String prenom, String mail, String motDepasse) {
        this.nom = nom;
        this.prenom = prenom;
        this.mail = mail;
        this.motDepasse = motDepasse;
    }

    public Partenaire(int idPartenaire, String nom, String prenom, String mail, String numTelephone,
            String motDepasse, String nomEntreprise, String typeActivite) {
        this.idPartenaire = idPartenaire;
        this.nom = nom;
        this.prenom = prenom;
        this.mail = mail;
        this.numTelephone = numTelephone;
        this.motDepasse = motDepasse;
        this.nomEntreprise = nomEntreprise;
        this.typeActivite = typeActivite;
    }

    // Getters and Setters
    public int getIdPartenaire() {
        return idPartenaire;
    }

    public void setIdPartenaire(int idPartenaire) {
        this.idPartenaire = idPartenaire;
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

    public String getNomEntreprise() {
        return nomEntreprise;
    }

    public void setNomEntreprise(String nomEntreprise) {
        this.nomEntreprise = nomEntreprise;
    }

    public String getTypeActivite() {
        return typeActivite;
    }

    public void setTypeActivite(String typeActivite) {
        this.typeActivite = typeActivite;
    }

    public String getAdresse() {
        return adresse;
    }

    public void setAdresse(String adresse) {
        this.adresse = adresse;
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

    public String getPhotoPerso() {
        return photoPerso;
    }

    public void setPhotoPerso(String photoPerso) {
        this.photoPerso = photoPerso;
    }

    @Override
    public String toString() {
        return "Partenaire{" +
                "idPartenaire=" + idPartenaire +
                ", nom='" + nom + '\'' +
                ", prenom='" + prenom + '\'' +
                ", mail='" + mail + '\'' +
                ", numTelephone='" + numTelephone + '\'' +
                ", motDepasse='" + motDepasse + '\'' +
                ", nomEntreprise='" + nomEntreprise + '\'' +
                ", typeActivite='" + typeActivite + '\'' +
                ", adresse='" + adresse + '\'' +
                ", cinRECTO='" + cinRECTO + '\'' +
                ", cinVERSO='" + cinVERSO + '\'' +
                ", photoPerso='" + photoPerso + '\'' +
                '}';
    }
}

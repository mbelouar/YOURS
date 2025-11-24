package com.yours.model;

/**
 * Admin entity representing the admin table
 */
public class Admin {
    private int idAdmin;
    private String email;
    private String motDepasse;

    // Constructors
    public Admin() {
    }

    public Admin(String email, String motDepasse) {
        this.email = email;
        this.motDepasse = motDepasse;
    }

    public Admin(int idAdmin, String email, String motDepasse) {
        this.idAdmin = idAdmin;
        this.email = email;
        this.motDepasse = motDepasse;
    }

    // Getters and Setters
    public int getIdAdmin() {
        return idAdmin;
    }

    public void setIdAdmin(int idAdmin) {
        this.idAdmin = idAdmin;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getMotDepasse() {
        return motDepasse;
    }

    public void setMotDepasse(String motDepasse) {
        this.motDepasse = motDepasse;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "idAdmin=" + idAdmin +
                ", email='" + email + '\'' +
                ", motDepasse='" + motDepasse + '\'' +
                '}';
    }
}

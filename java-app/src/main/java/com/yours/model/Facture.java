package com.yours.model;

import java.sql.Date;

/**
 * Facture entity representing the facture table
 */
public class Facture {
    private int idFacture;
    private float montant;
    private Date dateEmission;
    private Integer idReservation;

    // Constructors
    public Facture() {
    }

    public Facture(float montant, Date dateEmission, Integer idReservation) {
        this.montant = montant;
        this.dateEmission = dateEmission;
        this.idReservation = idReservation;
    }

    public Facture(int idFacture, float montant, Date dateEmission, Integer idReservation) {
        this.idFacture = idFacture;
        this.montant = montant;
        this.dateEmission = dateEmission;
        this.idReservation = idReservation;
    }

    // Getters and Setters
    public int getIdFacture() {
        return idFacture;
    }

    public void setIdFacture(int idFacture) {
        this.idFacture = idFacture;
    }

    public float getMontant() {
        return montant;
    }

    public void setMontant(float montant) {
        this.montant = montant;
    }

    public Date getDateEmission() {
        return dateEmission;
    }

    public void setDateEmission(Date dateEmission) {
        this.dateEmission = dateEmission;
    }

    public Integer getIdReservation() {
        return idReservation;
    }

    public void setIdReservation(Integer idReservation) {
        this.idReservation = idReservation;
    }

    @Override
    public String toString() {
        return "Facture{" +
                "idFacture=" + idFacture +
                ", montant=" + montant +
                ", dateEmission=" + dateEmission +
                ", idReservation=" + idReservation +
                '}';
    }
}

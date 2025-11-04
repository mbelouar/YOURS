package com.yours.model;

import java.sql.Date;

/**
 * Reservation entity representing the reservation table
 */
public class Reservation {
    private int idReservation;
    private Date dateDebut;
    private Date dateFin;
    private boolean reserve;
    private Integer idClient;
    private Integer idMateriel;
    
    // Ajout des objets Client et Materiel
    private Client client;
    private Materiel materiel;
    
    // Nouveaux champs
    private String statut; // EN_COURS, A_VENIR, TERMINEE
    private double montantTotal;

    // Constructors
    public Reservation() {
    }

    public Reservation(Date dateDebut, Date dateFin, boolean reserve, Integer idClient, Integer idMateriel) {
        this.dateDebut = dateDebut;
        this.dateFin = dateFin;
        this.reserve = reserve;
        this.idClient = idClient;
        this.idMateriel = idMateriel;
    }

    public Reservation(int idReservation, Date dateDebut, Date dateFin, boolean reserve, Integer idClient,
            Integer idMateriel) {
        this.idReservation = idReservation;
        this.dateDebut = dateDebut;
        this.dateFin = dateFin;
        this.reserve = reserve;
        this.idClient = idClient;
        this.idMateriel = idMateriel;
    }

    // Getters and Setters
    public int getIdReservation() {
        return idReservation;
    }

    public void setIdReservation(int idReservation) {
        this.idReservation = idReservation;
    }

    public Date getDateDebut() {
        return dateDebut;
    }

    public void setDateDebut(Date dateDebut) {
        this.dateDebut = dateDebut;
    }

    public Date getDateFin() {
        return dateFin;
    }

    public void setDateFin(Date dateFin) {
        this.dateFin = dateFin;
    }

    public boolean isReserve() {
        return reserve;
    }

    public void setReserve(boolean reserve) {
        this.reserve = reserve;
    }

    public Integer getIdClient() {
        return idClient;
    }

    public void setIdClient(Integer idClient) {
        this.idClient = idClient;
    }

    public Integer getIdMateriel() {
        return idMateriel;
    }

    public void setIdMateriel(Integer idMateriel) {
        this.idMateriel = idMateriel;
    }
    
    // Méthodes pour les objets Client et Materiel (versions complètes)
    public Client getClient() {
        return client;
    }

    public void setClient(Client client) {
        this.client = client;
        if (client != null) {
            this.idClient = client.getIdClient();
        }
    }

    public Materiel getMateriel() {
        return materiel;
    }

    public void setMateriel(Materiel materiel) {
        this.materiel = materiel;
        if (materiel != null) {
            this.idMateriel = materiel.getIdMateriel();
        }
    }
    
    public String getStatut() {
        return statut;
    }

    public void setStatut(String statut) {
        this.statut = statut;
    }
    
    public double getMontantTotal() {
        return montantTotal;
    }

    public void setMontantTotal(double montantTotal) {
        this.montantTotal = montantTotal;
    }
    
    // Alias pour la JSP
    public int getId() {
        return idReservation;
    }

    @Override
    public String toString() {
        return "Reservation{" +
                "idReservation=" + idReservation +
                ", dateDebut=" + dateDebut +
                ", dateFin=" + dateFin +
                ", reserve=" + reserve +
                ", idClient=" + idClient +
                ", idMateriel=" + idMateriel +
                '}';
    }
}

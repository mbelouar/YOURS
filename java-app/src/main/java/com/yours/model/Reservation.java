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

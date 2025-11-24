package com.yours.model;

/**
 * IA entity representing the ia table
 */
public class Ia {
    private int idIA;
    private String modeleIA;
    private Float seuilDetection;

    // Constructors
    public Ia() {
    }

    public Ia(String modeleIA, Float seuilDetection) {
        this.modeleIA = modeleIA;
        this.seuilDetection = seuilDetection;
    }

    public Ia(int idIA, String modeleIA, Float seuilDetection) {
        this.idIA = idIA;
        this.modeleIA = modeleIA;
        this.seuilDetection = seuilDetection;
    }

    // Getters and Setters
    public int getIdIA() {
        return idIA;
    }

    public void setIdIA(int idIA) {
        this.idIA = idIA;
    }

    public String getModeleIA() {
        return modeleIA;
    }

    public void setModeleIA(String modeleIA) {
        this.modeleIA = modeleIA;
    }

    public Float getSeuilDetection() {
        return seuilDetection;
    }

    public void setSeuilDetection(Float seuilDetection) {
        this.seuilDetection = seuilDetection;
    }

    @Override
    public String toString() {
        return "Ia{" +
                "idIA=" + idIA +
                ", modeleIA='" + modeleIA + '\'' +
                ", seuilDetection=" + seuilDetection +
                '}';
    }
}

package com.example.lab4.entity;
import jakarta.persistence.*;

@Entity
@Table(name = "ocasion")
public class Ocasion {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idocasion", nullable = false)
    private Integer idocasion;

    @Column(name = "nombre", nullable = false, length = 45)
    private String nombre;

    public Integer getIdocasion() {
        return idocasion;
    }

    public void setIdocasion(Integer idocasion) {
        this.idocasion = idocasion;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
}
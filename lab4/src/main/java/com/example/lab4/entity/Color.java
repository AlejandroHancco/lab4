package com.example.lab4.entity;

import jakarta.persistence.*;

@Entity
@Table(name = "color")
public class Color {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idcolor", nullable = false)
    private Integer idcolor;

    @Column(name = "nombre", length = 20)
    private String nombre;

    public Integer getIdcolor() {
        return idcolor;
    }

    public void setIdcolor(Integer idcolor) {
        this.idcolor = idcolor;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
}
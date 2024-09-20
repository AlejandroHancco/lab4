package com.example.lab4.entity;

import com.example.lab4.entity.Color;
import com.example.lab4.entity.Ocasion;
import com.example.lab4.entity.Tipo;
import jakarta.persistence.*;

@Entity
@Table(name = "flores")
public class Flor {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "idflores", nullable = false)
    private Integer id;

    @Column(name = "nombre", length = 20)
    private String nombre;

    @Column(name = "cantidad", length = 20)
    private Integer cantidad;


    @Column(name = "precio", nullable = false , length = 25)
    private Double precio;

    @Column(name = "descripcion", nullable = false , length = 500)
    private String descripcion;

    @Column(name = "imagen_url", nullable = false , length = 255)
    private String imagen_url;


    @ManyToOne
    @JoinColumn(name = "color_idcolor")
    private Color color;

    @ManyToOne
    @JoinColumn(name = "tipo_idtipo")
    private Tipo tipo;

    @ManyToOne
    @JoinColumn(name = "id_ocasion")
    private Ocasion ocasion;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Double getPrecio() {
        return precio;
    }

    public void setPrecio(Double precio) {
        this.precio = precio;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public Color getColor() {
        return color;
    }

    public void setColor(Color color) {
        this.color = color;
    }

    public Tipo getTipo() {
        return tipo;
    }

    public void setTipo(Tipo tipo) {
        this.tipo = tipo;
    }

    public Ocasion getOcasion() {
        return ocasion;
    }

    public void setOcasion(Ocasion ocasion) {
        this.ocasion = ocasion;
    }

    public Integer getCantidad() {
        return cantidad;
    }

    public void setCantidad(Integer cantidad) {
        this.cantidad = cantidad;
    }

    public String getImagen_url() {
        return imagen_url;
    }

    public void setImagen_url(String imagen_url) {
        this.imagen_url = imagen_url;
    }
}
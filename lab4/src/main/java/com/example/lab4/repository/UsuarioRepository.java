package com.example.lab4.repository;

import com.example.lab4.entity.Usuario;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface UsuarioRepository extends JpaRepository<Usuario, Integer> {
    @Query("SELECT u FROM Usuario u ORDER BY u.puntuacion DESC")
    List<Usuario> orderDesc();
}
package com.example.lab4.repository;

import com.example.lab4.entity.Flor;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface FlorRepository extends JpaRepository<Flor, Integer> {
    @Query("SELECT f FROM Flor f WHERE LOWER(f.nombre) LIKE LOWER(CONCAT('%', :query, '%'))")
    List<Flor> findByName(@Param("query") String query);

}
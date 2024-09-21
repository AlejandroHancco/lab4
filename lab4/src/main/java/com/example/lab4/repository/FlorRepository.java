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

    @Query("SELECT f FROM Flor f WHERE (:idtipo = 0 OR f.tipo.idtipo = :idtipo) AND (:idcolor = 0  OR f.color.idcolor = :idcolor) AND (:idocasion = 0 OR f.ocasion.idocasion = :idocasion)")
    List<Flor> filtradoQuery(@Param("idtipo") Integer  idtipo, @Param("idcolor") Integer  color, @Param("idocasion") Integer  idocasion);
}
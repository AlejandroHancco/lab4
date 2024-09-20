package com.example.lab4.repository;

import com.example.lab4.entity.Ocasion;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface OcasionRepository extends JpaRepository<Ocasion, Integer> {
}
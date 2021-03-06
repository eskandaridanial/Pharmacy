package com.company.repository;

import com.company.model.Medicine;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface MedicineRepository extends JpaRepository<Medicine , Long> {

    Optional<Medicine> findByName(String name);

    Optional<Medicine> findByCode(Long code);
}

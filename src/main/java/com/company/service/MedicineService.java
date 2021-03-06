package com.company.service;

import com.company.model.Medicine;

import java.util.List;

public interface MedicineService {

    void save(Medicine medicine);

    List<Medicine> findAll();

    void remove(Long id);

    void update(Long id , String name , Double price , String description);

    Medicine find(Long id);

    Medicine findByName(String name);

    Medicine findByCode(Long code);
}

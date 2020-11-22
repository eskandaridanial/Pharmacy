package com.company.service.impl;

import com.company.model.Medicine;
import com.company.repository.MedicineRepository;
import com.company.service.MedicineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class MedicineServiceImpl implements MedicineService {

    @Autowired
    private MedicineRepository medicineRepository;

    @Override
    public void save(Medicine medicine) {
        medicineRepository.save(medicine);
    }

    @Override
    public List<Medicine> findAll() {
        return medicineRepository.findAll();
    }

    @Override
    public void remove(Long id) {
        medicineRepository.deleteById(id);
    }
}

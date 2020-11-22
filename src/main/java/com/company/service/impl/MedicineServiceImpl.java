package com.company.service.impl;

import com.company.model.Medicine;
import com.company.repository.MedicineRepository;
import com.company.service.MedicineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;


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

    @Override
    public void update(Long id , String name ,
                       Double price , String description) {
        Medicine medicine = findBeforeUpdate(id);
        medicine.setName(name);
        medicine.setPrice(price);
        medicine.setDescription(description);
        medicineRepository.save(medicine);
    }

    @Override
    public Medicine findBeforeUpdate(Long id) {
        Optional<Medicine> optional = medicineRepository.findById(id);
        return optional.isPresent() ? optional.get() : null;
    }
}

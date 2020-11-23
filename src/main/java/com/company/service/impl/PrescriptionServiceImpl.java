package com.company.service.impl;

import com.company.model.Prescription;
import com.company.repository.PrescriptionRepository;
import com.company.service.PrescriptionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PrescriptionServiceImpl implements PrescriptionService {

    @Autowired
    private PrescriptionRepository prescriptionRepository;

    @Override
    public void save(Prescription prescription) {
        prescriptionRepository.save(prescription);
    }
}

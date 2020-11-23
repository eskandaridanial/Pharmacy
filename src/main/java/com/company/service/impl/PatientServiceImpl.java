package com.company.service.impl;

import com.company.model.Patient;
import com.company.model.Prescription;
import com.company.repository.PatientRepository;
import com.company.repository.PrescriptionRepository;
import com.company.service.PatientService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class PatientServiceImpl implements PatientService {

    @Autowired
    private PatientRepository patientRepository;
    @Autowired
    private PrescriptionRepository prescriptionRepository;

    @Override
    public void customSave(Patient patient , Prescription prescription) {
        save(patient);
        prescriptionRepository.save(prescription);
        Patient helperPatient = find(patient.getId());
        helperPatient.addPrescription(prescription);
        save(helperPatient);
    }

    @Override
    public void save(Patient patient) {
        patientRepository.save(patient);
    }

    @Override
    public Patient find(Long id) {
        Optional<Patient> optional = patientRepository.findById(id);
        return optional.isPresent() ? optional.get() : null;
    }
}

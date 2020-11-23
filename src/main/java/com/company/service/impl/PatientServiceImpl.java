package com.company.service.impl;

import com.company.dto.PrescriptionFormDto;
import com.company.model.Patient;
import com.company.model.Prescription;
import com.company.repository.PatientRepository;
import com.company.service.PatientService;
import com.company.service.PrescriptionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class PatientServiceImpl implements PatientService {

    @Autowired
    private PatientRepository patientRepository;
    @Autowired
    private PrescriptionService prescriptionService;

    @Override
    public void customSave(Patient patient , PrescriptionFormDto dto) {
        save(patient);
        Patient helperPatient = find(patient.getId());
        helperPatient.setPrescriptions(populatePrescriptions(dto));
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

    @Override
    public List<Patient> findAll() {
        return patientRepository.findAll();
    }

    @Override
    public void remove(Long id) {
        patientRepository.deleteById(id);
    }

    @Override
    public void customUpdate(Long id, PrescriptionFormDto dto) {
        Patient helperPatient = find(id);
        for (Prescription prescription : populatePrescriptions(dto)){
            helperPatient.addPrescription(prescription);
        }
        save(helperPatient);
    }

    private List<Prescription> populatePrescriptions(PrescriptionFormDto dto){
        List<Prescription> prescriptions = new ArrayList<>();
        for(int i = 0 ; i < dto.getCode().length ; i++){
            Prescription prescription = new Prescription();
            prescription.setCode(dto.getCode()[i]);
            prescription.setCreationDate(dto.getCreationDate()[i]);
            prescription.setVisitDate(dto.getVisitDate()[i]);
            prescriptionService.save(prescription);
            prescriptions.add(prescription);
        }
        return prescriptions;
    }
}

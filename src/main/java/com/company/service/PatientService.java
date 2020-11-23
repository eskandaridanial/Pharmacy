package com.company.service;

import com.company.model.Patient;
import com.company.model.Prescription;

public interface PatientService {

    void customSave(Patient patient , Prescription prescription);

    void save(Patient patient);

    Patient find(Long id);
}

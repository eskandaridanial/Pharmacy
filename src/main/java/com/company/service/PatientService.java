package com.company.service;

import com.company.dto.PrescriptionFormDto;
import com.company.model.Patient;

public interface PatientService {

    void customSave(Patient patient , PrescriptionFormDto dto);

    void save(Patient patient);

    Patient find(Long id);
}

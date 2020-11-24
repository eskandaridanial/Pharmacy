package com.company.service;

import com.company.dto.PrescriptionFormDto;
import com.company.model.Patient;

import java.util.List;

public interface PatientService {

    void customSave(Patient patient , PrescriptionFormDto dto);

    void customUpdate(Long id , PrescriptionFormDto prescriptionFormDto);

    void save(Patient patient);

    Patient find(Long id);

    List<Patient> findAll();

    void remove(Long id);

    Patient findByFirstNameAndLastName(String firstName , String lastName);
}

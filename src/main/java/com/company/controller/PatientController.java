package com.company.controller;

import com.company.dto.PrescriptionFormDto;
import com.company.model.Patient;
import com.company.service.PatientService;
import com.company.service.PrescriptionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/patient")
public class PatientController {

    @Autowired
    private PatientService patientService;
    @Autowired
    private PrescriptionService prescriptionService;

    @PostMapping("/add")
    public String add(Patient patient, PrescriptionFormDto dto) {
        patientService.customSave(patient, dto);
        return "redirect:/add_patient";
    }
}

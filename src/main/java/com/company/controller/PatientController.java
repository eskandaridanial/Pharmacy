package com.company.controller;

import com.company.dto.PrescriptionFormDto;
import com.company.model.Medicine;
import com.company.model.Patient;
import com.company.service.PatientService;
import com.company.service.PrescriptionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    @GetMapping("/list")
    public ModelAndView findAll(){
        Map<String , List<Patient>> map = new HashMap<>();
        map.put("list" , patientService.findAll());
        return new ModelAndView("patient_list" , map);
    }

    @PostMapping("/remove")
    public String remove(@RequestParam Long id){
        patientService.remove(id);
        return "redirect:/patient/list";
    }
}

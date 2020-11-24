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

    @GetMapping("/find_before_update")
    public ModelAndView findBeforeUpdate(@RequestParam Long id){
        Map<String , Patient> map = new HashMap<>();
        map.put("patient" , patientService.find(id));
        return new ModelAndView("update_patient" , map);
    }

    @PostMapping("/update_patient_prescriptions")
    public String updatePatientPrescriptions(@RequestParam Long id , PrescriptionFormDto dto){
        patientService.customUpdate(id , dto);
        return "redirect:/patient/find_before_update?id=" + id;
    }

    @PostMapping("/remove_prescription")
    public String remove(@RequestParam Long prescriptionId , @RequestParam Long patientId){
        prescriptionService.remove(prescriptionId);
        return "redirect:/patient/find_before_update?id=" + patientId;

    }

    @GetMapping("/find")
    public ModelAndView find(@RequestParam Long id){
        Map<String , Patient> map = new HashMap<>();
        map.put("patient" , patientService.find(id));
        return new ModelAndView("patient_info" , map);
    }

    @GetMapping("/find_by_full_name")
    public ModelAndView findByFirstNameAndLastName(String firstName , String lastName){
        Map<String , Patient> map = new HashMap<>();
        map.put("patient" , patientService.findByFirstNameAndLastName(firstName , lastName));
        return new ModelAndView("find_patient_by_full_name" , map);
    }
}

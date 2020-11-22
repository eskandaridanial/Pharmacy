package com.company.controller;

import com.company.model.Medicine;
import com.company.service.MedicineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/medicine")
public class MedicineController {

    @Autowired
    private MedicineService medicineService;

    @PostMapping("/add")
    public String add(Medicine medicine){
        medicineService.save(medicine);
        return "home";
    }

    @GetMapping("/list")
    public ModelAndView findAll(){
        Map<String , List<Medicine>> map = new HashMap<>();
        map.put("list" , medicineService.findAll());
        return new ModelAndView("medicine_list" , map);
    }

    @PostMapping("/remove")
    public String remove(@RequestParam Long id){
        medicineService.remove(id);
        return "redirect:/medicine/list";
    }
}

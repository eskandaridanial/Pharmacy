package com.company.annotation.constraint;

import com.company.annotation.UniqeMedicineName;
import com.company.service.MedicineService;
import org.springframework.beans.factory.annotation.Autowired;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class UniqeMedicineNameValidator implements ConstraintValidator<UniqeMedicineName , String> {

    @Autowired
    private MedicineService medicineService;

    @Override
    public void initialize(UniqeMedicineName constraintAnnotation) {

    }

    @Override
    public boolean isValid(String name, ConstraintValidatorContext constraintValidatorContext) {
        if (medicineService == null)
            return true;
        return medicineService.findByName(name) == null;
    }
}

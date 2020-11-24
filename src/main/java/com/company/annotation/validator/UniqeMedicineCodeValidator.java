package com.company.annotation.validator;

import com.company.annotation.UniqeMedicineCode;
import com.company.service.MedicineService;
import org.springframework.beans.factory.annotation.Autowired;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class UniqeMedicineCodeValidator implements ConstraintValidator<UniqeMedicineCode , Long> {

    @Autowired
    private MedicineService medicineService;

    @Override
    public void initialize(UniqeMedicineCode constraintAnnotation) {

    }

    @Override
    public boolean isValid(Long code, ConstraintValidatorContext constraintValidatorContext) {
        if (medicineService == null)
            return true;
        return medicineService.findByCode(code) == null;
    }
}

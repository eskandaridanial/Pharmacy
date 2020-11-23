package com.company.dto;

public class PrescriptionFormDto {

    private String[] creationDate;
    private Long[] code;
    private String[] visitDate;

    public String[] getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(String[] creationDate) {
        this.creationDate = creationDate;
    }

    public Long[] getCode() {
        return code;
    }

    public void setCode(Long[] code) {
        this.code = code;
    }

    public String[] getVisitDate() {
        return visitDate;
    }

    public void setVisitDate(String[] visitDate) {
        this.visitDate = visitDate;
    }
}

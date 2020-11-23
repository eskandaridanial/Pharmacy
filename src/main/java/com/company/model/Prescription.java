package com.company.model;

import com.company.base.model.BaseModel;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.Date;

@Entity
@Table(name = "tbl_prescription")
public class Prescription extends BaseModel {

    @Column(nullable = false , unique = true)
    private Long code;
    @Column(name = "creation_date" , nullable = false , updatable = false)
    private String creationDate;
    @Column(name = "visit_date" , nullable = false , updatable = false)
    private String visitDate;

    public Long getCode() {
        return code;
    }

    public void setCode(Long code) {
        this.code = code;
    }

    public String getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(String creationDate) {
        this.creationDate = creationDate;
    }

    public String getVisitDate() {
        return visitDate;
    }

    public void setVisitDate(String visitDate) {
        this.visitDate = visitDate;
    }
}

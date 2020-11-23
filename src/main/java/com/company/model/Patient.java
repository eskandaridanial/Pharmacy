package com.company.model;

import com.company.base.model.BaseModel;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "tbl_patient")
public class Patient extends BaseModel {

    @Column(name = "first_name" , nullable = false)
    private String firstName;
    @Column(name = "last_name" , nullable = false)
    private String lastName;
    @Column(name = "gender" , nullable = false)
    private String gender;
    @OneToMany(cascade = CascadeType.PERSIST , fetch = FetchType.EAGER)
    @JoinColumn(name = "fk_patient")
    private List<Prescription> prescriptions;

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public List<Prescription> getPrescriptions() {
        return prescriptions;
    }

    public void setPrescriptions(List<Prescription> prescriptions) {
        this.prescriptions = prescriptions;
    }

    public void addPrescription(Prescription prescription){
        this.prescriptions.add(prescription);
    }
}

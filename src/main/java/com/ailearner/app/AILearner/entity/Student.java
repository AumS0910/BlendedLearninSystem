package com.ailearner.app.AILearner.entity;

import com.fasterxml.jackson.annotation.JsonCreator;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class Student {
    private String Name;
    @Id
    private Long PRN;
    private int rollNo;
    private String email;


    public Student() {
    }

    @JsonCreator
    public Student(String name, Long PRN, int rollNo, String email) {

        Name = name;
        this.PRN = PRN;
        this.rollNo = rollNo;
        this.email = email;
    }


    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    public int getRollNo() {
        return rollNo;
    }

    public void setRollNo(int rollNo) {
        this.rollNo = rollNo;
    }

    public Long getPRN() {
        return PRN;
    }

    public void setPRN(Long PRN) {
        this.PRN = PRN;
    }

    @Override
    public String toString() {
        return "Student{" +
                ", Name='" + Name + '\'' +
                ", PRN=" + PRN +
                ", rollNo=" + rollNo +
                ", mail='" + email + '\'' +
                '}';
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}

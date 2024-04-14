package com.ailearner.app.AILearner.service;

import com.ailearner.app.AILearner.entity.Student;
import com.ailearner.app.AILearner.repository.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class StudentServiceImplements implements StudentService {
    @Autowired
    private StudentRepository studentRepository;

    @Override
    public List<Student> getAllStudents() {
        return studentRepository.findAll();
    }

    @Override
    public Student getStudentById(Long PRN) {
        return studentRepository.findById(PRN).get();
    }

    @Override
    public Student createStudent(Student student) {
        return studentRepository.save(student);
    }

    @Override
    public Student updateStudent(Long PRN, Student student) {
        if (!studentRepository.existsById(PRN)) {
            return null;
        }
        student.setPRN(PRN);
        return studentRepository.save(student);
    }

    @Override
    public void deleteStudent(Long PRN) {
        studentRepository.deleteById(PRN);
    }
}

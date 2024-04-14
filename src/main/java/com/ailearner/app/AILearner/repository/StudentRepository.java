package com.ailearner.app.AILearner.repository;

import org.springframework.data.mongodb.repository.MongoRepository;
import com.ailearner.app.AILearner.entity.Student;
public interface StudentRepository extends MongoRepository<Student,Long>  {
}

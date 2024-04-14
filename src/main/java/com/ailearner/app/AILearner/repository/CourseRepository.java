package com.ailearner.app.AILearner.repository;

import com.ailearner.app.AILearner.entity.Course;
import org.springframework.data.mongodb.repository.MongoRepository;

public interface CourseRepository extends MongoRepository<Course,Long> {
}

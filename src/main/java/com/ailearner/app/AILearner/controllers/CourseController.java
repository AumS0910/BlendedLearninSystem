package com.ailearner.app.AILearner.controllers;

import com.ailearner.app.AILearner.entity.Course;
import com.ailearner.app.AILearner.service.CloudinaryImageService;
import com.ailearner.app.AILearner.service.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/course")
public class CourseController {
    @Autowired
    private final CourseService courseService;

    @Autowired
    private final CloudinaryImageService cloudinaryImageService;

    public CourseController(CourseService courseService, CloudinaryImageService cloudinaryImageService, CloudinaryImageService cloudinaryImageService1) {
        this.courseService = courseService;
        this.cloudinaryImageService = cloudinaryImageService1;
    }

    @GetMapping
    public List<Course> getAllCourses() {
        return courseService.getAllCourses();
    }

    @GetMapping("/{id}")
    public Course getCourseById(@PathVariable Long id) {
        return courseService.getCourseById(id);
    }

    @PostMapping("/add")
    public Course createCourse(@RequestParam("title") String title,
                               @RequestParam("aim") String aim,
                               @RequestParam("theory") String theory,
                               @RequestParam("videoUrl") String videoUrl,
                               @RequestParam("conclusion") String conclusion,
                               @RequestParam("image") MultipartFile file) {

        Course course = new Course(title,aim,theory,videoUrl,conclusion);

//        course.setTitle(title);
//        course.setAim(aim);
//        course.setTheory(theory);
//        course.setVideoUrl(videoUrl);
//        course.setConclusion(conclusion);

        String uploadResult = cloudinaryImageService.upload(file);
        if (!uploadResult.isEmpty()) {
//            String imageUrl= String.valueOf(uploadResult.contains("url"));
            course.setCoverImagePath(uploadResult);
        } else {
            throw new RuntimeException("Failed to upload image");
        }
        return courseService.createCourse(course);
    }

    @PutMapping("/{id}")
    public Course updateCourse(@PathVariable Long id, @RequestBody Course course) {
        return courseService.updateCourse(id, course);
    }

    @DeleteMapping("/{id}")
    public void deleteCourse(@PathVariable Long id) {
        courseService.deleteCourse(id);
    }
}

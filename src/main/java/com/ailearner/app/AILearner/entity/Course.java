package com.ailearner.app.AILearner.entity;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document
public class Course {
    @Id
    private Long id;
    private String title;
    private String aim;
    private String theory;
    private String videoUrl;
    private String conclusion;
    private String coverImagePath;

    // Constructors
    public Course(String aim, String theory, String videoUrl, String conclusion) {
        this.aim = aim;
        this.theory = theory;
        this.videoUrl = videoUrl;
        this.conclusion = conclusion;
    }

    public Course(String title, String aim, String theory, String videoUrl, String conclusion) {
        this.title = title;
        this.aim = aim;
        this.theory = theory;
        this.videoUrl = videoUrl;
        this.conclusion = conclusion;
    }

    public Course() {
    }


    // Getters and setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAim() {
        return aim;
    }

    public void setAim(String aim) {
        this.aim = aim;
    }

    public String getTheory() {
        return theory;
    }

    public void setTheory(String theory) {
        this.theory = theory;
    }
    public String getConclusion() {
        return conclusion;
    }

    public void setConclusion(String conclusion) {
        this.conclusion = conclusion;
    }

    public String getVideoUrl() {
        return videoUrl;
    }

    public void setVideoUrl(String videoUrl) {
        this.videoUrl = videoUrl;
    }



    @Override
    public String toString() {
        return "Course{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", aim='" + aim + '\'' +
                ", theory='" + theory + '\'' +
                ", videoUrl='" + videoUrl + '\'' +
                ", conclusion='" + conclusion + '\'' +
                '}';
    }

    public String getCoverImagePath() {
        return coverImagePath;
    }

    public void setCoverImagePath(String coverImagePath) {
        this.coverImagePath = coverImagePath;
    }
}

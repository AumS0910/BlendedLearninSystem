package com.ailearner.app.AILearner.service;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public interface CloudinaryImageService {

    public String upload(MultipartFile file);
}

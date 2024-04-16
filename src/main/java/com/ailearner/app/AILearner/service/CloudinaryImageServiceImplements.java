package com.ailearner.app.AILearner.service;

import com.cloudinary.Cloudinary;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Map;

@Service
public class CloudinaryImageServiceImplements implements CloudinaryImageService{

    @Autowired
    private Cloudinary cloudinary;

    @Autowired
    private CloudinaryImageService cloudinaryImageService;

    @Override
    public Map upload(MultipartFile file) {
        try {
            this.cloudinary.uploader().upload(file.getBytes(),Map.of());
        } catch (IOException e) {
            throw new RuntimeException("Image Uploading Fail");
        }
        return null;
    }
}

package com.ailearner.app.AILearner.service;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.Map;

@Service
public class CloudinaryImageServiceImplements implements CloudinaryImageService{

//    @Autowired
//    private Cloudinary cloudinary;

//    @Autowired
    //private CloudinaryImageService cloudinaryImageService;

    private final Cloudinary cloudinary;


    @Autowired
    public CloudinaryImageServiceImplements(Cloudinary cloudinary) {
        this.cloudinary = cloudinary;
    }

    @Override
    public String upload(MultipartFile file) {
        try {
            // Upload the image to Cloudinary
            Map uploadResult = cloudinary.uploader().upload(file.getBytes(), ObjectUtils.emptyMap());

            // Extract the URL of the uploaded image
            String imageUrl = (String) uploadResult.get("url");

            // You can extract other useful data if needed

            // Return the URL of the uploaded image
            return imageUrl;
        } catch (IOException e) {
//            throw new RuntimeException("Image Uploading Fail");
            e.printStackTrace();
            return Map.of("error", "An error occurred during image upload").toString();
        }

    }
}

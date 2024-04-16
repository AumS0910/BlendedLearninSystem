package com.ailearner.app.AILearner.controllers;

import com.ailearner.app.AILearner.service.CloudinaryImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.util.Map;

@RestController
@RequestMapping("/cloudinary/upload")
public class CloudinaryImageUploadController {

//    @Autowired
//    private CloudinaryImageService cloudinaryImageService;
//
//    @PostMapping
//    public ResponseEntity<Map> uploadImage(@RequestParam("image")MultipartFile file){
//        Map data=this.cloudinaryImageService.upload(file);
//        return new ResponseEntity<>(data, HttpStatus.OK);
//    }
private final CloudinaryImageService cloudinaryImageService;

    @Autowired
    public CloudinaryImageUploadController(CloudinaryImageService cloudinaryImageService) {
        this.cloudinaryImageService = cloudinaryImageService;
    }

    @PostMapping
    public ResponseEntity<String> uploadImage(@RequestParam("image") MultipartFile file) {
        String uploadResult = cloudinaryImageService.upload(file);

        // Check if the upload was successful or not
        if (uploadResult.contains("error")) {
            // Handle the case where an error occurred during the upload
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(uploadResult);
        }

        // If upload was successful, return the map containing the URL and possibly other data
        return ResponseEntity.ok(uploadResult);
    }
}


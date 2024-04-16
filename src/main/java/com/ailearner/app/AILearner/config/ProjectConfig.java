package com.ailearner.app.AILearner.config;

import com.ailearner.app.AILearner.service.CloudinaryImageService;
import com.cloudinary.Cloudinary;
import org.springframework.context.annotation.Bean;
import org.springframework.web.multipart.MultipartFile;

import java.util.HashMap;
import java.util.Map;

public class ProjectConfig {

    @Bean
    public Cloudinary getCloudinary(){

        Map map= new HashMap();
        map.put("cloud_name", "");
        map.put("api_key","");
        map.put("api_secret","");
        map.put("secure",true);

        return new Cloudinary(map);
    }

    @Bean
    public CloudinaryImageService cloudinaryImageService() {
        return new CloudinaryImageService() {
            @Override
            public String upload(MultipartFile file) {
                return Map.of().toString();
            }
        };
    }

}

package com.ailearner.app.AILearner;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.PropertySource;

@SpringBootApplication
@ComponentScan(basePackages = {"com.ailearner.app"})
public class AiLearnerApplication {

	public static void main(String[] args) {
		SpringApplication.run(AiLearnerApplication.class, args);
	}

}

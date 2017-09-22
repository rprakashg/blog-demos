package com.rprakashg.io.demos.controllers;

import com.rprakashg.io.demos.properties.ApplicationProperties;
import com.rprakashg.io.demos.properties.AwsProperties;
import com.rprakashg.io.demos.services.Serializer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

    @Autowired
    private AwsProperties awsProperties;

    @Autowired
    private ApplicationProperties applicationProperties;

    @RequestMapping("/")
    public String get(Model model) {
        Serializer<AwsProperties> serializer = new Serializer<>(AwsProperties.class);
        String awsPropsJson = serializer.toJson(awsProperties);

        Serializer<ApplicationProperties> propertiesSerializer = new Serializer<>(ApplicationProperties.class);
        String appPropsJson = propertiesSerializer.toJson(applicationProperties);

        model.addAttribute("awsProperties", awsPropsJson);
        model.addAttribute("applicationProperties", appPropsJson);

        return "index";
    }
}

package com.rprakashg.io.demos.configurations;

import com.rprakashg.io.demos.properties.ApplicationProperties;
import com.rprakashg.io.demos.properties.AwsProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Configuration;

@EnableConfigurationProperties(
        value = {
                ApplicationProperties.class,
                AwsProperties.class
        }
)
@Configuration
public class ApplicationConfig {
}

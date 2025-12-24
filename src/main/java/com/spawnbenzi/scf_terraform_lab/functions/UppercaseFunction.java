package com.spawnbenzi.scf_terraform_lab.functions;

import java.util.Locale;
import java.util.function.Function;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class UppercaseFunction {
    @Bean
    public Function<String, String> uppercase() {
        return (input) -> {
            if (input == null) {
                return null;
            }
            return input.trim().toUpperCase(Locale.ROOT);
        };
    }
}

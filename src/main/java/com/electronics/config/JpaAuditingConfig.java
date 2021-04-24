package com.electronics.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.data.domain.AuditorAware;
import org.springframework.data.jpa.repository.config.EnableJpaAuditing;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import java.util.Optional;

@Configuration
@EnableJpaAuditing(auditorAwareRef = "auditorProvider")
public class JpaAuditingConfig {

    public static class AuditorAwareImpl implements AuditorAware<String> {
        @Bean
        public AuditorAware<String> auditorProvider() {
            return new AuditorAwareImpl();
        }

        @Override
        public Optional<String> getCurrentAuditor() { //get thông tin session username
            Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
            if (authentication == null) {
                return null;
            }
            return Optional.of(authentication.getName());//trả về username trong session lúc user đăng nhập
        }
    }
}

package com.electronics.controller.web;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;

@RestController
@RequestMapping(value = "user")
public class LoginFbController {
    @GetMapping
    public Principal getUser(Principal user) {
        return user;
    }
}

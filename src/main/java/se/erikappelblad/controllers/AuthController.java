package se.erikappelblad.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AuthController {

    @RequestMapping("/login")
    String admin() {
        return "app.login";
    }
}

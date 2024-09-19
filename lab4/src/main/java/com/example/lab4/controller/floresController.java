package com.example.lab4.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/flores")
public class floresController {

    @GetMapping("/catalogo")
    public String showCatalogo() {
        return "catalogo";
    }


}

package com.example.lab4.controller;

import com.example.lab4.entity.Color;
import com.example.lab4.entity.Flor;
import com.example.lab4.entity.Ocasion;
import com.example.lab4.entity.Tipo;
import com.example.lab4.repository.ColorRepository;
import com.example.lab4.repository.FlorRepository;
import com.example.lab4.repository.OcasionRepository;
import com.example.lab4.repository.TipoRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/flores")
public class floresController {

    final FlorRepository florRepository;
    final ColorRepository colorRepository;
    final OcasionRepository ocasionRepository;
    final TipoRepository tipoRepository;


    public floresController(FlorRepository florRepository, ColorRepository colorRepository, OcasionRepository ocasionRepository, TipoRepository tipoRepository) {
        this.florRepository = florRepository;
        this.colorRepository = colorRepository;
        this.ocasionRepository = ocasionRepository;
        this.tipoRepository = tipoRepository;
    }

    @GetMapping("/catalogo")
    public String showCatalogo(Model model) {
        List<Ocasion> ocasionList = ocasionRepository.findAll();
        List<Flor> floresList = florRepository.findAll();
        List<Color> colorList = colorRepository.findAll();
        List<Tipo> tipoList = tipoRepository.findAll();


        model.addAttribute("floresList", floresList);
        model.addAttribute("colorList", colorList);
        model.addAttribute("ocasionList", ocasionList);
        model.addAttribute("tipoList", tipoList);
        return "catalogo";

    }
    @GetMapping("/entretenimiento")
    public String showEntretenimiento(Model model) {
        return "entretenimiento";

    }
    @GetMapping("/carrito")
    public String showCarrito(Model model) {
        return "carrito";

    }
    @GetMapping("/search")
    public String buscarFlor(Model model, @RequestParam String query) {
        String lowerCaseQuery = query.toLowerCase();
        List<Flor> floresList = florRepository.findByName(lowerCaseQuery);
        model.addAttribute("floresList", floresList);
        return "catalogo";


    }


}

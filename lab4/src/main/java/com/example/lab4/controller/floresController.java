package com.example.lab4.controller;

import com.example.lab4.entity.*;
import com.example.lab4.repository.*;
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
    final UsuarioRepository usuarioRepository;


    public floresController(FlorRepository florRepository, ColorRepository colorRepository, OcasionRepository ocasionRepository, TipoRepository tipoRepository, UsuarioRepository usuarioRepository) {
        this.florRepository = florRepository;
        this.colorRepository = colorRepository;
        this.ocasionRepository = ocasionRepository;
        this.tipoRepository = tipoRepository;
        this.usuarioRepository=usuarioRepository;
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
        List<Usuario> usuarioList = usuarioRepository.orderDesc(); // Asumiendo que tienes este método en tu repositorio

        model.addAttribute("usuarioList", usuarioList);
        return "entretenimiento";


    }
    @PostMapping("/entretenimiento/juego")
    public String showJuego(Model model) {
        List<Flor> floresList = florRepository.findAll();
        model.addAttribute("floresList", floresList);
        return "juego";

    }
    @GetMapping("/carrito")
    public String showCarrito(Model model) {
        return "carrito";

    }
    @GetMapping("/search")
    public String buscarFlor(Model model,  @RequestParam("idtipo") Integer  idtipo,
                             @RequestParam("idcolor") Integer  idcolor,
                             @RequestParam("idocasion") Integer idocasion) {

        List<Flor> floresList = florRepository.filtradoQuery(idtipo, idcolor, idocasion);
        model.addAttribute("floresList", floresList);
        List<Ocasion> ocasionList = ocasionRepository.findAll();
        List<Color> colorList = colorRepository.findAll();
        List<Tipo> tipoList = tipoRepository.findAll();

        model.addAttribute("colorList", colorList);
        model.addAttribute("ocasionList", ocasionList);
        model.addAttribute("tipoList", tipoList);
        return "catalogo";


    }


}

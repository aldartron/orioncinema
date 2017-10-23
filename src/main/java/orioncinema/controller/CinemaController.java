package orioncinema.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import orioncinema.service.MovieService;

@Controller
@RequestMapping("/")
public class CinemaController {

    private MovieService movieService;

    @RequestMapping(method = RequestMethod.GET)
    public String cinema(Model model) {
        model.addAttribute("movies", movieService.getAllMovies());
        return "index";
    }

    @Autowired
    public void MovieService(MovieService movieService) {
        this.movieService = movieService;
    }
}

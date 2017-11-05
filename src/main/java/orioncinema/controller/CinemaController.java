package orioncinema.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import orioncinema.entity.Movie;
import orioncinema.service.MovieService;
import orioncinema.service.ScheduleService;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

@Controller
@RequestMapping("/")
public class CinemaController {

    private MovieService movieService;
    private ScheduleService scheduleService;

    // Main page
    @RequestMapping(method = RequestMethod.GET)
    public String index(
            Model model,
            @RequestParam(value = "day", required = false) @DateTimeFormat(pattern="yyyy-MM-dd") Date date
    ) {
        model.addAttribute("movies", movieService.getAllMovies());
        model.addAttribute("days", scheduleService.getDaysSequence());
        model.addAttribute("currentDay", date == null ? null : (new SimpleDateFormat("yyyy-MM-dd")).format(date));
        return "index";
    }

    // Movie page
    @RequestMapping(value = "movies/{name}", method = RequestMethod.GET)
    public String movies(
            Model model,
            @PathVariable(value = "name") String name
    ) {
        Movie movie = movieService.getMovieByName(name);
        model.addAttribute("halls", scheduleService.getHalls());
        model.addAttribute("days", scheduleService.getDaysSequence());
        model.addAttribute("movie", movie);
        model.addAttribute("schedule", scheduleService.getScheduleForMovie(movie));
        return "movie";
    }

    @Autowired
    public void setMovieService(MovieService movieService) {
        this.movieService = movieService;
    }

    @Autowired
    public void setScheduleService(ScheduleService scheduleService) {
        this.scheduleService = scheduleService;
    }
}

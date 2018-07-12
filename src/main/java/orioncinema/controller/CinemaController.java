package orioncinema.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import orioncinema.entity.Movie;
import orioncinema.service.MovieService;
import orioncinema.service.ScheduleService;
import orioncinema.util.DateHelper;

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
        model.addAttribute("movies", movieService.getMoviesByDate(date));
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
        model.addAttribute("helper", new DateHelper());
        model.addAttribute("halls", scheduleService.getHalls());
        model.addAttribute("days", scheduleService.getDaysSequence());
        model.addAttribute("movie", movie);
        model.addAttribute("schedule", scheduleService.getScheduleForMovie(movie));
        model.addAttribute("now", DateHelper.getFakeDate().getTime());
        return "movie";
    }

    @GetMapping(value = "about")
    public String about() {
        return "about";
    }

    @GetMapping(value = "contacts")
    public String contacts() {
        return "contacts";
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

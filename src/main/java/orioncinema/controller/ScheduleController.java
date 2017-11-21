package orioncinema.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import orioncinema.dto.OrderDto;
import orioncinema.entity.Session;
import orioncinema.service.MovieService;
import orioncinema.service.ScheduleService;
import orioncinema.service.SessionService;
import orioncinema.service.TicketService;
import orioncinema.util.DateHelper;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;


@Controller
@RequestMapping("schedule/")
public class ScheduleController {

    private SessionService sessionService;
    private ScheduleService scheduleService;
    private TicketService ticketService;
    private MovieService movieService;

    @RequestMapping(value = "session/{sessionId}", method = RequestMethod.GET)
    public String session(
            Model model,
            @PathVariable(value = "sessionId") int sessionId
    ) {
        Session session = sessionService.getSesssionById(sessionId);
        model.addAttribute("grid", ticketService.getTicketGridBySession(session));
        model.addAttribute("session", session);
        model.addAttribute("days", scheduleService.getDaysSequence());
        model.addAttribute("busySeats", scheduleService.getBusySeatsBySession(session));
        model.addAttribute("now", DateHelper.getFakeDate().getTime());
        return "session";
    }

    @PostMapping(value = "session/buy")
    public @ResponseBody String makeOrder(
            @RequestBody OrderDto dto
    ) {
        int sessionId = dto.getSessionId();
        for (int seatId : dto.getSeats()) {
            ticketService.saveTicket(seatId, sessionId);
        }
        return "success";
    }

    @GetMapping(value = "day/{day}")
    public String daySchedule(
            Model model,
            @PathVariable(value = "day")  @DateTimeFormat(pattern="yyyy-MM-dd") Date date
    ) {
        model.addAttribute("date", date);
        model.addAttribute("niceDate", DateHelper.getNiceDate(date));
        model.addAttribute("days", scheduleService.getDaysSequence());
        model.addAttribute("schedule", scheduleService.getScheduleForDate(date));
        model.addAttribute("currentDay", date == null ? null : (new SimpleDateFormat("yyyy-MM-dd")).format(date));
        model.addAttribute("halls", scheduleService.getHalls());
        model.addAttribute("now", DateHelper.getFakeDate().getTime());
        return "day";
    }

    @Autowired
    public void setSessionService(SessionService sessionService) {
        this.sessionService = sessionService;
    }

    @Autowired
    public void setScheduleService(ScheduleService scheduleService) {
        this.scheduleService = scheduleService;
    }

    @Autowired
    public void setTicketService(TicketService ticketService) {
        this.ticketService = ticketService;
    }

    @Autowired
    public void setMovieService(MovieService movieService) {
        this.movieService = movieService;
    }
}

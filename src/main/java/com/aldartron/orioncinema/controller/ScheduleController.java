package com.aldartron.orioncinema.controller;

import com.aldartron.orioncinema.entity.MovieSession;
import lombok.AllArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import com.aldartron.orioncinema.dto.OrderDto;
import com.aldartron.orioncinema.service.ScheduleService;
import com.aldartron.orioncinema.service.MovieSessionService;
import com.aldartron.orioncinema.service.TicketService;
import com.aldartron.orioncinema.util.DateHelper;

import java.text.SimpleDateFormat;
import java.util.Date;

@AllArgsConstructor
@Controller
@RequestMapping("schedule/")
public class ScheduleController {

    private MovieSessionService movieSessionService;
    private ScheduleService scheduleService;
    private TicketService ticketService;

    @RequestMapping(value = "session/{sessionId}", method = RequestMethod.GET)
    public String session(
            Model model,
            @PathVariable(value = "sessionId") int sessionId
    ) {
        MovieSession session = movieSessionService.getSessionById(sessionId);
        model.addAttribute("grid", ticketService.getTicketGridBySession(session));
        model.addAttribute("movieSession", session);
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

        ticketService.buyTickets(sessionId, dto.getSeats());

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

    @GetMapping(value = "day")
    public String todaySchedule(
            Model model
    ) {
        Date date = DateHelper.getFakeDate().getTime();
        model.addAttribute("date", date);
        model.addAttribute("niceDate", DateHelper.getNiceDate(date));
        model.addAttribute("days", scheduleService.getDaysSequence());
        model.addAttribute("schedule", scheduleService.getScheduleForDate(date));
        model.addAttribute("currentDay", date == null ? null : (new SimpleDateFormat("yyyy-MM-dd")).format(date));
        model.addAttribute("halls", scheduleService.getHalls());
        model.addAttribute("now", DateHelper.getFakeDate().getTime());
        return "day";
    }

}

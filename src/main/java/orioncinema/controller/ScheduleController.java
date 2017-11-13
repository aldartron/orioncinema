package orioncinema.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import orioncinema.entity.Session;
import orioncinema.service.ScheduleService;
import orioncinema.service.SessionService;
import orioncinema.service.TicketService;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("schedule/")
public class ScheduleController {

    private SessionService sessionService;
    private ScheduleService scheduleService;
    private TicketService ticketService;

    @RequestMapping(value = "session/{sessionId}", method = RequestMethod.GET)
    public String session(
            Model model,
            @PathVariable(value = "sessionId") int sessionId
    ) {
        Session session = sessionService.getSesssionById(sessionId);
        model.addAttribute("grid", ticketService.getTicketGridBySession(session));
        model.addAttribute("session", session);
        model.addAttribute("days", scheduleService.getDaysSequence());
        return "session";
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

}

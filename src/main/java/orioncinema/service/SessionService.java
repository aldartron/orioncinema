package orioncinema.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import orioncinema.dao.SessionDao;
import orioncinema.entity.Session;

@Service
public class SessionService {

    private SessionDao sessionDao;

    @Autowired
    public void setSessionDao(SessionDao sessionDao) {
        this.sessionDao = sessionDao;
    }

    public Session getSesssionById(long id) {
        return sessionDao.getSessionById(id);
    }
}

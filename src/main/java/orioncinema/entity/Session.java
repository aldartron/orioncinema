package orioncinema.entity;

import javax.persistence.*;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.TimeZone;

@Entity
@Table(name = "sessions")
public class Session {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column private long id;
    @Column private Date datetime;

    @ManyToOne
    @JoinColumn(name = "movie_id")
    private Movie movie;

    @ManyToOne
    @JoinColumn(name = "hall_id")
    private Hall hall;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getNiceTime() {
        return new SimpleDateFormat("HH:mm").format(datetime);
    }

    public Date getDatetime() {
        return datetime;
    }

    public void setDatetime(Date datetime) {
        this.datetime = datetime;
    }

    public Movie getMovie() {
        return movie;
    }

    public void setMovie(Movie movie) {
        this.movie = movie;
    }

    public Hall getHall() {
        return hall;
    }

    public void setHall(Hall hall) {
        this.hall = hall;
    }

    @Override
    public String toString() {
        return "Session{" +
                "datetime=" + datetime +
                ", movie=" + movie.getTitle() +
                ", hall=" + hall.getName() +
                '}';
    }
}

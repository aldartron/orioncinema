package orioncinema.entity;

import orioncinema.util.DateHelper;

import javax.persistence.*;
import java.util.Date;
import java.text.SimpleDateFormat;

@Entity
@Table(name = "sessions")
public class Session {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column private long id;
    @Column private Date datetime;
    @Column(name = "common_cost") private int commonCost;
    @Column(name = "vip_cost") private int vipCost;

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

    public String getNiceDate() {
        return DateHelper.getNiceDate(datetime);
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

    public int getCommonCost() {
        return commonCost;
    }

    public void setCommonCost(int commonCost) {
        this.commonCost = commonCost;
    }

    public int getVipCost() {
        return vipCost;
    }

    public void setVipCost(int vipCost) {
        this.vipCost = vipCost;
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

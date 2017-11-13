package orioncinema.entity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "halls")
public class Hall {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column private long id;
    @Column private String name;
    @Column(name = "rows") private int rowNumber;
    @Column(name = "cols") private int colNumber;

    @OneToMany(mappedBy = "hall")
    private List<Session> sessions = new ArrayList<Session>();

    @OneToMany(mappedBy = "hall", fetch = FetchType.EAGER)
    private List<Seat> seats = new ArrayList<Seat>();


    public List<Seat> getSeats() {
        return seats;
    }

    public int getRowNumber() {
        return rowNumber;
    }

    public void setRowNumber(int rowNumber) {
        this.rowNumber = rowNumber;
    }

    public int getColNumber() {
        return colNumber;
    }

    public void setColNumber(int colNumber) {
        this.colNumber = colNumber;
    }

    public void setSeats(List<Seat> seats) {
        this.seats = seats;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Session> getSessions() {
        return sessions;
    }

    public void setSessions(List<Session> sessions) {
        this.sessions = sessions;
    }
}

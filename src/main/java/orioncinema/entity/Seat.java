package orioncinema.entity;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "seats")
public class Seat {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column private long id;
    @ManyToOne
    @JoinColumn(name = "hall_id") private Hall hall;
    @Column(name = "row_num") private int row;
    @Column(name = "col_num") private int col;
    @Column(name = "is_vip") private boolean isVip;

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public Hall getHall() {
        return hall;
    }

    public void setHall(Hall hall) {
        this.hall = hall;
    }

    public int getRow() {
        return row;
    }

    public void setRow(int row) {
        this.row = row;
    }

    public int getCol() {
        return col;
    }

    public void setCol(int col) {
        this.col = col;
    }

    public boolean isVip() {
        return isVip;
    }

    public void setVip(boolean vip) {
        isVip = vip;
    }

    @Override
    public String toString() {
        return "Seat{" +
                "hall=" + hall +
                ", row=" + row +
                ", col=" + col +
                ", isVip=" + isVip +
                '}';
    }

    @Override
    public boolean equals(Object obj) {
        if (obj instanceof Seat) {
            return ((Seat) obj).getId() == this.getId();
        } else {
            return false;
        }
    }
}

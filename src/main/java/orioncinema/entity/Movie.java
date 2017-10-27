package orioncinema.entity;

import orioncinema.util.DateHelper;

import javax.persistence.*;
import java.sql.Date;

@Entity
@Table(name = "movies")
public class Movie {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column private long id;
    @Column private String title;
    @Column private String annotation;
    @Column(name = "placard_name") private String placardName;
    @Column(name = "trailer_link") private String trailerLink;
    @Column(name = "start") private Date startDate;
    @Column(name = "end") private Date endDate;
    @Column private String cast;
    @Column private String director;
    @Column private String genre;
    @Column(name = "duration") private int duration;
    @Column private int age;
    @Column private String country;
    @Column private String year;
    @Column(name = "original_title") private String originalTitle;
    @Column(name = "is_high") private boolean isHigh;
    @Column(name = "kinopoisk_name") private String kinopoiskName;

    protected Movie() {}

    public String getNiceStartDate() {
        return DateHelper.getNiceDate(startDate);
    }

    public String getNiceEndDate() {
        return DateHelper.getNiceDate(endDate);
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAnnotation() {
        return annotation;
    }

    public void setAnnotation(String annotation) {
        this.annotation = annotation;
    }

    public String getPlacardName() {
        return placardName;
    }

    public void setPlacardName(String placardName) {
        this.placardName = placardName;
    }

    public String getTrailerLink() {
        return trailerLink;
    }

    public void setTrailerLink(String trailerLink) {
        this.trailerLink = trailerLink;
    }

    public Date getStartDate() {
        return startDate;
    }

    public void setStartDate(Date startDate) {
        this.startDate = startDate;
    }

    public Date getEndDate() {
        return endDate;
    }

    public void setEndDate(Date endDate) {
        this.endDate = endDate;
    }

    public String getCast() {
        return cast;
    }

    public void setCast(String cast) {
        this.cast = cast;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getOriginalTitle() {
        return originalTitle;
    }

    public void setOriginalTitle(String originalTitle) {
        this.originalTitle = originalTitle;
    }

    public boolean isHigh() {
        return isHigh;
    }

    public void setHigh(boolean high) {
        isHigh = high;
    }

    public String getKinopoiskName() {
        return kinopoiskName;
    }

    public void setKinopoiskName(String kinopoiskName) {
        this.kinopoiskName = kinopoiskName;
    }


    @Override
    public String toString() {
        return "Movie{" +
                "title='" + title + '\'' +
                ", annotation='" + annotation + '\'' +
                ", startDate=" + startDate +
                ", endDate=" + endDate +
                ", cast='" + cast + '\'' +
                ", director='" + director + '\'' +
                ", genre='" + genre + '\'' +
                ", duration=" + duration +
                ", age=" + age +
                ", country='" + country + '\'' +
                ", year='" + year + '\'' +
                ", originalTitle='" + originalTitle + '\'' +
                '}';
    }
}

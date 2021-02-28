package by.educ.Vlad.model;

import java.util.Date;
import java.util.Set;

public class Film {
    private Long id;
    private String name;
    private Date year;
    private String genre; // ПОДУМАТЬ!!!!!(новое перечисление?)
    private Country countryOfOrigin;
    private String director;
    private float budget;
    private float duration;
    private StatusPresentation status;
    private Session session;
    private Set<Actor> actors;

    public Film() {
    }

    public Session getSession() {
        return session;
    }

    public void setSession(Session session) {
        this.session = session;
    }

    public Country getCountryOfOrigin() {
        return countryOfOrigin;
    }

    public void setCountryOfOrigin(Country countryOfOrigin) {
        this.countryOfOrigin = countryOfOrigin;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Date getYear() {
        return year;
    }

    public void setYear(Date year) {
        this.year = year;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public Country getCountry() {
        return countryOfOrigin;
    }

    public void setCountry(Country country) {
        this.countryOfOrigin = country;
    }

    public String getDirector() {
        return director;
    }

    public void setDirector(String director) {
        this.director = director;
    }

    public float getBudget() {
        return budget;
    }

    public void setBudget(float budget) {
        this.budget = budget;
    }

    public float getDuration() {
        return duration;
    }

    public void setDuration(float duration) {
        this.duration = duration;
    }

    public StatusPresentation getStatus() {
        return status;
    }

    public void setStatus(StatusPresentation status) {
        this.status = status;
    }

    public Set<Actor> getActors() {
        return actors;
    }

    public void setActors(Set<Actor> actors) {
        this.actors = actors;
    }
}

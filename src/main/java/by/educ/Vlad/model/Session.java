package by.educ.Vlad.model;

import java.util.Date;
import java.util.Set;

public class Session {
    private Long id;
    private int number;
    private Date time;
    private float cost;
    private StatusPresentation status;
    private Film film;
    private Hall hall;
    private User manager;
    private Set<Ticket> tickets;



    public Session() {
    }

    public Set<Ticket> getTickets() {
        return tickets;
    }

    public void setTickets(Set<Ticket> tickets) {
        this.tickets = tickets;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public int getNumber() {
        return number;
    }

    public void setNumber(int number) {
        this.number = number;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public float getCost() {
        return cost;
    }

    public void setCost(float cost) {
        this.cost = cost;
    }

    public StatusPresentation getStatus() {
        return status;
    }

    public void setStatus(StatusPresentation status) {
        this.status = status;
    }

    public Film getFilm() {
        return film;
    }

    public void setFilm(Film film) {
        this.film = film;
    }

    public Hall getHall() {
        return hall;
    }

    public void setHall(Hall hall) {
        this.hall = hall;
    }

    public User getManager() {
        return manager;
    }

    public void setManager(User manager) {
        this.manager = manager;
    }
}

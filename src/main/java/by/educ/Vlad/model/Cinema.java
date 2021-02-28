package by.educ.Vlad.model;

import java.util.Date;
import java.util.Set;

public class Cinema {
    private Long id;
    private String name;
    private Country country;
    private String address;
    private String description;
    private Date creationDate;
    private StatusPremises status;
    private Set<Hall> halls;

    public Cinema() {
    }

    public Set<Hall> getHalls() {
        return halls;
    }

    public void setHalls(Set<Hall> halls) {
        this.halls = halls;
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

    public Country getCountry() {
        return country;
    }

    public void setCountry(Country country) {
        this.country = country;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Date getCreationDate() {
        return creationDate;
    }

    public void setCreationDate(Date creationDate) {
        this.creationDate = creationDate;
    }

    public StatusPremises getStatus() {
        return status;
    }

    public void setStatus(StatusPremises status) {
        this.status = status;
    }
}

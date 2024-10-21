package testdemo.testdemo.Model;

import jakarta.persistence.*;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.*;

import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import testdemo.testdemo.Model.*;

@Entity
@Table(name = "comments")
public class comment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String comment;
    @Column(insertable = false, updatable = false)
    private String hotelname;
    @Column(insertable = false, updatable = false)
    private String username;
    private Timestamp date;
    @ManyToOne
    @JoinColumn(name = "username")
    @OnDelete(action= OnDeleteAction.CASCADE)
    private user user;
    @ManyToOne
    @JoinColumn(name="hotelname")
    @OnDelete(action = OnDeleteAction.CASCADE)
    private hotel hotel;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getHotelname() {
        return hotelname;
    }

    public void setHotelname(String hotelname) {
        this.hotelname = hotelname;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Timestamp getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public testdemo.testdemo.Model.user getUser() {
        return user;
    }

    public void setUser(testdemo.testdemo.Model.user user) {
        this.user = user;
    }

    public testdemo.testdemo.Model.hotel getHotel() {
        return hotel;
    }

    public void setHotel(testdemo.testdemo.Model.hotel hotel) {
        this.hotel = hotel;
    }

    public comment() {
    }

    public comment(String comment, String hotelname, String username, Timestamp date, testdemo.testdemo.Model.user user, testdemo.testdemo.Model.hotel hotel) {
        this.comment = comment;
        this.hotelname = hotelname;
        this.username = username;
        this.date = date;
        this.user = user;
        this.hotel = hotel;
    }

    @Override
    public String toString() {
        return "comment{" +
                "id=" + id +
                ", comment='" + comment + '\'' +
                ", hotelname='" + hotelname + '\'' +
                ", username='" + username + '\'' +
                ", date=" + date +
                ", user=" + user +
                ", hotel=" + hotel +
                '}';
    }
}

package testdemo.testdemo.Model;

import jakarta.persistence.*;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.*;
@Entity
@Table(name = "booking")
public class booking {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String hotelname;
    @Column(insertable=false, updatable=false)
    private String username;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date date;
    private float price;
    private String room_type;

    @ManyToOne()
    @JoinColumn(name = "username")
    @OnDelete(action =  OnDeleteAction.CASCADE)
    private user user;

    public int getId() {
        return id;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public booking() {
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }


    public String getHotelname() {
        return hotelname;
    }


    public booking(String hotelname, String username, Date date, float price, String room_type, testdemo.testdemo.Model.user user) {
        this.hotelname = hotelname;
        this.username = username;
        this.date = date;
        this.price = price;
        this.room_type = room_type;
        this.user = user;
    }

    public void setHotelname(String hotelname) {
        this.hotelname = hotelname;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getDate() {
        return date;
    }

    public String getRoom_type() {
        return room_type;
    }

    public void setRoom_type(String room_type) {
        this.room_type = room_type;
    }

    public testdemo.testdemo.Model.user getUser() {
        return user;
    }

    public void setUser(testdemo.testdemo.Model.user user) {
        this.user = user;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "booking{" +
                "id=" + id +
                ", hotelname='" + hotelname + '\'' +
                ", username='" + username + '\'' +
                ", date=" + date +
                ", price=" + price +
                ", room_type='" + room_type + '\'' +
                ", user=" + user +
                '}';
    }
}

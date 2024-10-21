package testdemo.testdemo.Model;

import jakarta.persistence.*;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

@Entity
@Table(name = "favouritehotels")
public class favHotel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(insertable = false, updatable = false)
    private String username;

    @Column(insertable = false, updatable = false)
    private String hotelname;
    @ManyToOne
    @JoinColumn(name = "username")
    @OnDelete(action = OnDeleteAction.CASCADE)
    private user user;
    @ManyToOne
    @JoinColumn(name = "hotelname")
    @OnDelete(action = OnDeleteAction.CASCADE)
    private hotel hotel;

    public favHotel() {
    }

    public favHotel(String hotelname, String username, testdemo.testdemo.Model.user user, testdemo.testdemo.Model.hotel hotel) {
        this.hotelname = hotelname;
        this.username = username;
        this.user = user;
        this.hotel = hotel;
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
}

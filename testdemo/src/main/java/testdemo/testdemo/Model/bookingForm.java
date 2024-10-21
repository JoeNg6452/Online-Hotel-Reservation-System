package testdemo.testdemo.Model;

import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class bookingForm {
    private String hotelname;
    private String username;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date date;
    private float price;

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

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public float getPrice() {
        return price;
    }

    public void setPrice(float price) {
        this.price = price;
    }

    public String getRoom_type() {
        return room_type;
    }

    public void setRoom_type(String room_type) {
        this.room_type = room_type;
    }

    private String room_type;

    public bookingForm() {
    }

    public bookingForm(String hotelname, String username, Date date, float price, String room_type) {
        this.hotelname = hotelname;
        this.username = username;
        this.date = date;
        this.price = price;
        this.room_type = room_type;
    }
}

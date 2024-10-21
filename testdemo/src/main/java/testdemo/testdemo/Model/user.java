package testdemo.testdemo.Model;

import io.micrometer.core.instrument.util.AbstractPartition;
import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "users")
public class user {
    @Id
    private String username;
    private String password;
    private String email;
    private String full_name;
    private String address;
    private String user_Role = "ROLE_USER";
    @OneToMany(mappedBy = "username", fetch = FetchType.EAGER, cascade = CascadeType.MERGE, orphanRemoval = true)
    private List<booking> bookings = new ArrayList<>();

    @OneToMany(mappedBy = "username", fetch = FetchType.EAGER, cascade = CascadeType.MERGE, orphanRemoval = true)
    private List<comment> comments = new ArrayList<>();

    @OneToMany(mappedBy = "username", fetch = FetchType.EAGER, cascade = CascadeType.MERGE, orphanRemoval = true)
    private List<favHotel> favHotels = new ArrayList<>();
    public List<booking> getBookings() {
        return bookings;
    }

    public void setBookings(List<booking> bookings) {
        this.bookings = bookings;
    }

    public String getUser_Role() {
        return user_Role;
    }

    @Override
    public String toString() {
        return "user{" +
                "username='" + username + '\'' +
                ", password='" + password + '\'' +
                ", email='" + email + '\'' +
                ", full_name='" + full_name + '\'' +
                ", address='" + address + '\'' +
                ", user_Role='" + user_Role + '\'' +
                '}';
    }

    public void setUser_Role(String user_Role) {
        this.user_Role = user_Role;
    }

    public user() {
    }

    public String getUsername() {
        return username;
    }

    public user(String username, String password, String full_name, String email, String address, String user_Role) {
        this.username = username;
        this.password = password;
        this.full_name = full_name;
        this.email = email;
        this.address = address;
        this.user_Role = user_Role;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFull_name() {
        return full_name;
    }

    public void setFull_name(String full_name) {
        this.full_name = full_name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public List<comment> getComments() {
        return comments;
    }

    public void setComments(List<comment> comments) {
        this.comments = comments;
    }
}

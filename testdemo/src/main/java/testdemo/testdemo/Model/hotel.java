package testdemo.testdemo.Model;
import jakarta.persistence.*;
import org.hibernate.annotations.Type;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.*;
@Entity
@Table(name = "hotel")
public class hotel {

    @Id
    @Column(name = "hotelname")
    private String name;
    private String address;
    private double price;
    String room_type;

    String description;
    boolean availability;

    @Lob
    private byte[] photo;

    @OneToMany(mappedBy = "hotelname", fetch = FetchType.EAGER, cascade = CascadeType.MERGE, orphanRemoval = true)
    private List<comment> comments = new ArrayList<>();

    @OneToMany(mappedBy = "hotelname", fetch = FetchType.EAGER, cascade = CascadeType.MERGE, orphanRemoval = true)
    private List<favHotel> favHotels = new ArrayList<>();


    public hotel(String name, String address, double price, String room_type, String description, boolean availability) {
        this.name = name;
        this.address = address;
        this.price = price;
        this.room_type = room_type;
        this.description = description;
        this.availability = availability;
    }


    public String getPhoto() {
        if (this.photo != null) {
            return "data:image/png;base64," + Base64.getEncoder().encodeToString(this.photo);
        }
        return null;
    }

    public void setPhoto(MultipartFile fi) throws IOException {
        this.photo = fi.getBytes();
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public boolean isAvailability() {
        return availability;
    }

    public void setAvailability(boolean availability) {
        this.availability = availability;
    }

    public hotel() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getRoom_type() {
        return room_type;
    }

    public void setRoom_type(String room_type) {
        this.room_type = room_type;
    }
}

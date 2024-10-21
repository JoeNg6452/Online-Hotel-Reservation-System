package testdemo.testdemo.Model;

import org.springframework.web.multipart.MultipartFile;

public class addHotelForm {
    private String name;
    private String address;
    private double price;
    private String room_type;

    private String description;
    private boolean availability;
    private MultipartFile file;

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

    public MultipartFile getFile() {
        return file;
    }

    public void setFile(MultipartFile file) {
        this.file = file;
    }

    public addHotelForm(String name, String address, double price, String room_type, String description, boolean availability, MultipartFile file) {
        this.name = name;
        this.address = address;
        this.price = price;
        this.room_type = room_type;
        this.description = description;
        this.availability = availability;
        this.file = file;
    }

    public addHotelForm() {
    }
}

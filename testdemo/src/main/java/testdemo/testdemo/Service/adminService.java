package testdemo.testdemo.Service;

import jakarta.annotation.Resource;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import testdemo.testdemo.Model.user;
import testdemo.testdemo.Repositroy.userRepo;
import testdemo.testdemo.Repositroy.*;
import testdemo.testdemo.Model.*;

import java.io.IOException;
import java.security.Principal;
import java.util.Arrays;
import java.util.List;
@Service
public class adminService {
    @Resource
    private hotelRepo hotelRepo;

    @Resource
    private commentRepo commentRepo;

    @Resource
    private bookingRepo bookingRepo;

    private final BCryptPasswordEncoder encoder = new BCryptPasswordEncoder(12);

    @Resource
    private userRepo userRepo;
    public void addUser(user user) {
        user.setPassword(encoder.encode(user.getPassword()));
        userRepo.save(user);
    }
    public List<user> getAllUsers(){
        return userRepo.findAll();
    }

    public user getUserByUsername(String username) {
        return userRepo.findById(username).orElse(null);
    }

    public void updateUser(user user) {
        user.setPassword(encoder.encode(user.getPassword()));
        userRepo.save(user);
    }

    public void deleteUser(String username) {
        userRepo.findById(username).ifPresent(user -> userRepo.delete(user));
    }

    public List<hotel> getAllHotels() {
        return hotelRepo.findAll();
    }

    public void addHotel(addHotelForm form) throws IOException {
        hotel check = hotelRepo.findById(form.getName()).orElse(null);
        if(check == null){
            hotel newHotel = new hotel(form.getName(), form.getAddress(), form.getPrice(), form.getRoom_type(), form.getDescription(), form.isAvailability());
            newHotel.setPhoto(form.getFile());
            hotelRepo.save(newHotel);
        }
    }

    public hotel getHotel(String name) {
        return hotelRepo.findById(name).orElse(null);
    }

    public void deleteHotel(String name) {
        hotelRepo.deleteById(name);
    }

    public void updateUserProfile(user user, Principal principal) {
        user.setPassword(encoder.encode(user.getPassword()));
        user.setUsername(principal.getName());
        userRepo.save(user);
    }

    public List<comment> getAllComments() {
        return commentRepo.findAll();
    }

    public List<comment> getCommentsById(String hotelname){return commentRepo.findAllByHotelName(hotelname);}

    public void deleteComment(int id) {
        commentRepo.deleteById(id);
    }

    public void updateHotel(updateHotelForm form) throws IOException {
        hotel hotel = hotelRepo.findById(form.getName()).orElse(null);
        if(hotel != null) {
            hotel.setPrice(form.getPrice());
            hotel.setDescription(form.getDescription());
            hotel.setAvailability(form.isAvailability());
            hotel.setAddress(form.getAddress());
            hotel.setRoom_type(form.getRoom_type());
            hotel.setPhoto(form.getFile());
            hotelRepo.save(hotel);
        }
    }

    public void deleteBooking(int id) {
        bookingRepo.deleteById(id);
    }
}

package testdemo.testdemo.Service;

import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;
import testdemo.testdemo.Model.user;
import testdemo.testdemo.Repositroy.bookingRepo;
import testdemo.testdemo.Repositroy.hotelRepo;
import testdemo.testdemo.Repositroy.userRepo;
import testdemo.testdemo.Model.booking;
import java.util.*;
@Service
public class bookingManagementService {
    @Resource
    private bookingRepo bookingRepo;
    @Resource
    private hotelRepo hotelRepo;
    @Resource
    private userRepo userRepo;


    public List<booking> getAllBookings() {
        return bookingRepo.findAll();
    }
    public booking getBooking(int id){
        return bookingRepo.findById(id).orElse(null);
    }

    public void save(booking booking) {
        bookingRepo.save(booking);
    }

    public List<booking> getAllMyBookings(String username) {
        return bookingRepo.findBookingsByUsername(username);
    }


    public void addBooking(String hotelname, String username, Date date, float price, String room_type, user user) {
        booking booking = new booking(hotelname, username, date, price, room_type, user);
        bookingRepo.save(booking);
    }
}

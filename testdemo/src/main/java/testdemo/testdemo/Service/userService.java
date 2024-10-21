package testdemo.testdemo.Service;

import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;
import testdemo.testdemo.Repositroy.*;
import testdemo.testdemo.Model.*;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Service
public class userService {
    @Resource
    userRepo userRepo;
    @Resource
    commentRepo commentRepo;
    @Resource
    favHotelRepo favHotelRepo;

    @Resource
    bookingRepo bookingRepo;


    public void addComment(String comment, hotel hotel, String username) {
        user user = userRepo.findById(username).orElse(null);
        Timestamp currentTime = new Timestamp(System.currentTimeMillis());
        if(user == null){
            System.out.println("no such user");
        }
        else {
            comment newComment = new comment(comment, hotel.getName(), user.getUsername(), currentTime, user, hotel);
            commentRepo.save(newComment);
            List<comment> commentList = new ArrayList<>();
            commentList.add(newComment);
            user.setComments(commentList);
        }
    }

    public List<comment> getUserComments(String username){
        return commentRepo.findAllByUsername(username);
    }

    public void addHotelTofav(String hotelname, String username, hotel hotel, user user) {
        favHotel favHotel = favHotelRepo.checkfavHotelByNames(username, hotelname);
        if(favHotel == null){
            favHotel = new favHotel(hotelname, username, user, hotel);
            favHotelRepo.save(favHotel);
        }
        else{
            System.out.println("Favourite Hotel already exist");
        }
    }

    public List<favHotel> getUserFavHotels(String username){
        return favHotelRepo.findAllFavHotelsByUsername(username);
    }

    public void removeFavHotel(String hotelname, String username) {
        favHotel favhotel = favHotelRepo.checkfavHotelByNames(username, hotelname);
        if(favhotel != null){
            favHotelRepo.delete(favhotel);
        }
    }

    public void deleteMyComment(int id) {
        commentRepo.deleteById(id);
    }

    public void deleteMyBooking(int id) {
        bookingRepo.deleteById(id);
    }

    public void deleteAccount(String name) {
        user user = userRepo.findById(name).orElse(null);
        if (user != null) {
            userRepo.delete(user);
        }
    }
}

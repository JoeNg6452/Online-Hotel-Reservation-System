package testdemo.testdemo.Repositroy;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import testdemo.testdemo.Model.favHotel;

import java.util.List;
@Transactional
public interface favHotelRepo extends JpaRepository<favHotel, String> {
    @Query("select h from favHotel h where h.username=:username")
    List<favHotel> findAllFavHotelsByUsername(String username);

    @Query("select h from favHotel h where h.username=:username and h.hotelname=:hotelname")
    favHotel checkfavHotelByNames(String username, String hotelname);
}

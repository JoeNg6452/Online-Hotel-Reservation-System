package testdemo.testdemo.Repositroy;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import testdemo.testdemo.Model.booking;

import java.util.List;
@Transactional
public interface bookingRepo extends JpaRepository<booking, Integer> {
    List<booking> findBookingsByUsername(String username);
}

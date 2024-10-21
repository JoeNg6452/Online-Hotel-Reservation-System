package testdemo.testdemo.Repositroy;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import testdemo.testdemo.Model.comment;

import java.util.List;

@Repository
@Transactional
public interface commentRepo extends JpaRepository<comment, Integer> {
    List<comment> findAllByUsername(String username);

    List<comment> findAllByHotelName(String hotelname);
}

package testdemo.testdemo.Repositroy;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;
import testdemo.testdemo.Model.hotel;
@Transactional
public interface hotelRepo extends JpaRepository<hotel, String> {
}

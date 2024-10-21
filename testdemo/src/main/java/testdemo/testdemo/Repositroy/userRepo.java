package testdemo.testdemo.Repositroy;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import testdemo.testdemo.Model.user;
@Repository
@Transactional
public interface userRepo extends JpaRepository<user, String> {
    user findByUsername(String username);
}

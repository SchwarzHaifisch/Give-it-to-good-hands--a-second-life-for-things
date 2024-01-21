package pl.coderslab.loginSystem;

import org.hibernate.sql.Select;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findByEmail(String email);

    @Query("SELECT u FROM User u JOIN u.roles r WHERE r.id = 2")
    List<User> showAllAdmins();
    @Query("SELECT u FROM User u JOIN u.roles r WHERE r.id = 1")
    List<User> showAllUsers();
}

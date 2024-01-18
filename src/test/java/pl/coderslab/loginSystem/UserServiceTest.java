package pl.coderslab.loginSystem;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.mockito.Mock;
import org.mockito.Mockito;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import java.util.Optional;

class UserServiceTest {
    @Mock
    private UserRepository userRepository;
    @Mock
    private RoleRepository roleRepository;
    private BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
    private UserService userService = new UserService(userRepository, roleRepository, encoder);

    @Test
    public void shouldReturnUserForGivenEmail() {
        String email = "test@gmail.com";
        Mockito.when(userRepository.findByEmail(email)).thenReturn(Optional.of(new User()));
        User user = userService.findByEmail(email);
        Assertions.assertEquals(user.getRoles(), email);
        Assertions.assertTrue(user.getRoles().stream().map(Role::getName).toList().contains("ROLE_USER"));

    }

}
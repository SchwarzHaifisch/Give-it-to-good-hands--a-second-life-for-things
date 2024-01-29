package pl.coderslab.loginSystem;

import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.HashSet;

@Service
@RequiredArgsConstructor
public class UserService {
    private final UserRepository userRepository;
    private final RoleRepository roleRepository;
    private final BCryptPasswordEncoder passwordEncoder;

    public void registerUser(User user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setEnabled(1);
        Role userRole = roleRepository.findByName("ROLE_USER");
        user.setRoles(new HashSet<>(Arrays.asList(userRole)));
        userRepository.save(user);
    }

    public void registerAdmin(User user) {
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setEnabled(1);
        Role userRole = roleRepository.findByName("ROLE_ADMIN");
        user.setRoles(new HashSet<>(Arrays.asList(userRole)));
        userRepository.save(user);
    }

    public User findByEmail(String email) {
        return userRepository.findByEmail(email).orElseThrow(() -> new UsernameNotFoundException(email));
    }

    public User findUserById(Long userId) {
        return userRepository.findById(userId)
                .orElseThrow(() -> new UsernameNotFoundException("User not found with id: " + userId));
    }

    public boolean matchesPassword(String rawPassword, String encodedPassword) {
        return passwordEncoder.matches(rawPassword, encodedPassword);
    }

    public void editAccount(User editedUser) {
        User existingUser = findUserById(editedUser.getId());

        if (!editedUser.getPassword().equals(editedUser.getPasswordRep())) {
            throw new IllegalArgumentException("Hasła nie są takie same");
        } else if (editedUser.getName().isEmpty() || editedUser.getName().isBlank()) {
            throw new IllegalArgumentException("Niepoprawne imię");
        } else if (editedUser.getLastName().isEmpty() || editedUser.getLastName().isBlank()) {
            throw new IllegalArgumentException("Niepoprawne nazwisko");
        } else if (editedUser.getPassword().isEmpty() || editedUser.getPassword().isBlank() || editedUser.getPassword().length() < 10) {
            throw new IllegalArgumentException("Hasło jest za krótkie");
        }

        existingUser.setName(editedUser.getName());
        existingUser.setLastName(editedUser.getLastName());
        existingUser.setPassword(passwordEncoder.encode(editedUser.getPassword()));
        userRepository.save(existingUser);
    }
}

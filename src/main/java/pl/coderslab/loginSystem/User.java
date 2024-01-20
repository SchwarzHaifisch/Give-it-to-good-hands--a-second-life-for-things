package pl.coderslab.loginSystem;

import lombok.Getter;
import lombok.Setter;
import pl.coderslab.loginSystem.Role;

import javax.persistence.*;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;
import java.util.Set;

@Entity
@Getter
@Setter
@Table(name = "user")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @NotBlank(message = "Wprowadź poprawne imię")
    private String name;

    @NotBlank(message = "Wprowadź poprawne nazwisko")
    private String lastName;

    @Email(message = "Wprowadź poprawny adres email")
    @NotBlank(message = "Wprowadź poprawny adres email")
    @Column(unique = true)
    private String email;

    @Size(min = 10, message = "Hasło musi mieć minimum 10 znaków")
    private String password;

    @Transient
    private String passwordRep;

    private int enabled;

    @ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinTable(name = "user_role", joinColumns = @JoinColumn(name = "user_id"),
            inverseJoinColumns = @JoinColumn(name = "role_id"))
    private Set<Role> roles;
}

package pl.coderslab.donation;

import lombok.Getter;
import lombok.Setter;
import pl.coderslab.category.Category;
import pl.coderslab.institution.Institution;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.List;

@Entity
@Table(name = "donation")
@Getter
@Setter
public class Donation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private Integer quantity;
    @OneToMany
    private List<Category> categories;
    @ManyToOne
    @JoinColumn(name = "institution_id")
    private Institution institution;
    @Column(length = 100)
    private String street;
    @Column(length = 50)
    private String city;
    @Column(length = 9)
    private String zipCode;
//    private LocalDateTime pickUp;
//    @Transient
//    private String formattedPickUp;
    private LocalDate pickUpDate;
    private LocalTime pickUpTime;
    private String pickUpComment;
}

package pl.coderslab.donation;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface DonationRepository extends JpaRepository<Donation,Long> {
    @Query("SELECT SUM(d.quantity) FROM Donation d")
    Integer getAllDonations();

    @Query("SELECT d FROM Donation d ORDER BY d.id DESC")
    List<Donation> getInstitutions();

}

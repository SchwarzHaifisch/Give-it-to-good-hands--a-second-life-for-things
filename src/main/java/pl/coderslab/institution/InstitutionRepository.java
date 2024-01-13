package pl.coderslab.institution;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import pl.coderslab.donation.Donation;

import java.util.List;

@Repository
public interface InstitutionRepository extends JpaRepository<Institution,Long> {
    @Query("SELECT i FROM Institution i ORDER BY i.id DESC")
    List<Institution> getInstitutions();
}

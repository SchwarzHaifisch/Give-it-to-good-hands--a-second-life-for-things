package pl.coderslab.institution;

import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface InstitutionRepository extends JpaRepository<Institution,Long> {
    @Query("SELECT i FROM Institution i WHERE i.deleted = false ORDER BY i.id DESC")
    List<Institution> getInstitutions(Pageable pageable);

    @Query("SELECT i FROM Institution i where i.deleted is false Order BY i.id ASC")
    List<Institution> getInstitutionsToIndex();

    Optional<Institution> findById(Long id);
}

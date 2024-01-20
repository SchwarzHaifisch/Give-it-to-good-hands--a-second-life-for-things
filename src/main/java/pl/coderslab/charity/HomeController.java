package pl.coderslab.charity;

import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import pl.coderslab.donation.DonationRepository;
import pl.coderslab.institution.InstitutionRepository;


@Controller
@RequiredArgsConstructor
public class HomeController {
    private final InstitutionRepository institutionRepository;
    private final DonationRepository donationRepository;

    @GetMapping("/")
    public String homeAction(Model model) {
        model.addAttribute("Institutions", institutionRepository.getInstitutions(PageRequest.of(0, 4)));
        model.addAttribute("allDonations", donationRepository.getAllDonations());
        model.addAttribute("allDonationsCounter", donationRepository.count());
        return "index";
    }


}

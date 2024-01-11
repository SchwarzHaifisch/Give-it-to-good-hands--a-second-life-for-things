package pl.coderslab.charity;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.donation.DonationRepository;
import pl.coderslab.institution.InstitutionRepository;


@Controller
public class HomeController {

    private final InstitutionRepository institutionRepository;
    private final DonationRepository donationRepository;

    public HomeController(InstitutionRepository institutionRepository, DonationRepository donationRepository) {
        this.institutionRepository = institutionRepository;
        this.donationRepository = donationRepository;
    }


    @GetMapping("/")
    public String homeAction(Model model) {
        model.addAttribute("Institutions", institutionRepository.findAll());
        model.addAttribute("allDonations", donationRepository.getAllDonations());
        model.addAttribute("allDonationsCounter", donationRepository.count());
        return "index";
    }
}

package pl.coderslab.donation;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.category.CategoryRepository;
import pl.coderslab.institution.InstitutionRepository;

@Controller
@RequiredArgsConstructor
public class DonationController {
    private final CategoryRepository categoryRepository;
    private final InstitutionRepository institutionRepository;
    private final DonationRepository donationRepository;

    @GetMapping("/donation")
    String dontaionFormRedirect(Model model){
        model.addAttribute("categories",categoryRepository.findAll());
        model.addAttribute("donation", new Donation());
        model.addAttribute("institutions",institutionRepository.findAll());
        return "donationForm";
    }
    @PostMapping("/donation")
    String donationFormSave(@ModelAttribute Donation donation){
        donationRepository.save(donation);
        return "redirect:/confirm";
    }
    @GetMapping("/confirm")
    String formConfirmation(){
        return "donationConfirmation";
    }
}

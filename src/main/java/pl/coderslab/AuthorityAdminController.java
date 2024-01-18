package pl.coderslab;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import pl.coderslab.donation.Donation;
import pl.coderslab.institution.Institution;
import pl.coderslab.institution.InstitutionRepository;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
public class AuthorityAdminController {
    private final InstitutionRepository institutionRepository;

    @GetMapping("/main")
    String homeActionAdmin(RedirectAttributes redirectAttributes) {
        redirectAttributes.addFlashAttribute("successMessage", "Zalogowano");
        return "admin/index";
    }

    @GetMapping("/institutions")
    String institutionsCRUD(Model model) {
        model.addAttribute("Institutions", institutionRepository.findAll());
        return "admin/institutions";
    }

    @GetMapping("/edit")
    String editInstitution(@RequestParam("idCon") Long id, Model model) {
        Institution institution = institutionRepository.findById(id).orElseThrow();
        model.addAttribute("institution", institution);
        return "admin/editInstitution";
    }

    @PostMapping("/edit")
    String editInstitutionConfirm(@ModelAttribute Institution institution){
        institutionRepository.save(institution);
        return "redirect:/admin/institutions";
    }
    @GetMapping("/add")
    String addInstitution(Model model) {
        model.addAttribute("institution", new Institution());
        return "admin/addInstitution";
    }

    @PostMapping("/delete")
    String deleteInstitution(@RequestParam("idDen") Long id){
        institutionRepository.deleteById(id);
        return "redirect:/admin/institutions";
    }
}

package pl.coderslab.admin;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import pl.coderslab.institution.Institution;
import pl.coderslab.institution.InstitutionRepository;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/institution")
public class AuthorityAdminInstitutionController {
    private final InstitutionRepository institutionRepository;

    @GetMapping("/institutions")
    String institutionsCRUD(Model model) {
        model.addAttribute("Institutions", institutionRepository.getInstitutionsToIndex());
        return "admin/institutions/institutions";
    }

    @GetMapping("/edit")
    String editInstitution(@RequestParam("idCon") Long id, Model model) {
        Institution institution = institutionRepository.findById(id).orElseThrow();
        model.addAttribute("institution", institution);
        return "admin/institutions/editInstitution";
    }

    @PostMapping("/edit")
    String editInstitutionConfirm(@ModelAttribute Institution institution){
        institution.setDeleted(false);
        institutionRepository.save(institution);
        return "redirect:/admin/institution/institutions";
    }
    @GetMapping("/add")
    String addInstitution(Model model) {
        model.addAttribute("institution", new Institution());
        return "admin/institutions/addInstitution";
    }

    @PostMapping("/delete")
    String deleteInstitution(@RequestParam("idDen") Long id){
        Institution institution = institutionRepository.findById(id).orElseThrow();
        institution.setDeleted(true);
        institutionRepository.save(institution);
        return "redirect:/admin/institution/institutions";
    }


}

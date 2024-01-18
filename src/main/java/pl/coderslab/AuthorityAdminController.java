package pl.coderslab;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import pl.coderslab.institution.InstitutionRepository;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
public class AuthorityAdminController {
    private final InstitutionRepository institutionRepository;
    @GetMapping("/main")
    String homeActionAdmin(RedirectAttributes redirectAttributes){
        redirectAttributes.addFlashAttribute("successMessage", "Zalogowano");
        return "admin/index";
    }

    @GetMapping("/institutions")
    String institutionsCRUD(Model model){
        model.addAttribute("Institutions", institutionRepository.findAll());
        return "admin/institutions";
    }
}

package pl.coderslab.admin;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin")
public class AuthorityAdminController {

    @GetMapping("/main")
    String homeActionAdmin(RedirectAttributes redirectAttributes) {
        redirectAttributes.addFlashAttribute("successMessage", "Zalogowano");
        return "admin/index";
    }

}
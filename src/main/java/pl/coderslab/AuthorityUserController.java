package pl.coderslab;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequiredArgsConstructor
@RequestMapping("/user")
public class AuthorityUserController {
    @GetMapping("/main")
    public String homeActionUser(RedirectAttributes redirectAttributes) {
        redirectAttributes.addFlashAttribute("successMessage", "Zalogowano");
        return "user/index";
    }
}

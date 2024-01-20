package pl.coderslab.admin;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import pl.coderslab.loginSystem.UserRepository;

@Controller
@RequiredArgsConstructor
@RequestMapping("/admin/admins")
public class AuthorityAdminAdminsController {
    private final UserRepository userRepository;
    @GetMapping
    String showAllAdmins(Model model){
        model.addAttribute("admins", userRepository.showAllAdmins());
        return "admin/admins/showAllAdmins";
    }
}

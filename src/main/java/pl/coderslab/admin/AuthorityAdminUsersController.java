package pl.coderslab.admin;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pl.coderslab.loginSystem.User;
import pl.coderslab.loginSystem.UserRepository;

@Controller
@RequestMapping("/admin/users")
@RequiredArgsConstructor
public class AuthorityAdminUsersController {
    private final UserRepository userRepository;
    @GetMapping
    String showAllUsers(Model model){
        model.addAttribute("users", userRepository.showAllUsers());
        return "admin/users/showAllUsers";
    }

    @GetMapping("/edit")
    String editUser(@RequestParam("idCon") Long id, Model model){
        User user = userRepository.findById(id).orElseThrow();
        model.addAttribute("user", user);
        return "admin/users/editUser";
    }
}

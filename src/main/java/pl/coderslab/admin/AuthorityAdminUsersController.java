package pl.coderslab.admin;

import lombok.RequiredArgsConstructor;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import pl.coderslab.loginSystem.User;
import pl.coderslab.loginSystem.UserRepository;
import pl.coderslab.loginSystem.UserService;

@Controller
@RequestMapping("/admin/users")
@RequiredArgsConstructor
public class AuthorityAdminUsersController {
    private final UserRepository userRepository;
    private final UserService userService;
    private final BCryptPasswordEncoder passwordEncoder;

    @GetMapping
    String showAllUsers(Model model) {
        model.addAttribute("users", userRepository.showAllUsers());
        return "admin/users/showAllUsers";
    }

    @GetMapping("/edit")
    String editRedirect(@RequestParam("idCon") Long id, Model model) {
        User user = userRepository.findById(id).orElseThrow();
        model.addAttribute("user", user);
        return "admin/users/editUser";
    }

    @PostMapping("/edit")
    String editUser(User user,
                    BindingResult result,
                    RedirectAttributes redirectAttributes,
                    Model model) {
        if (!user.getPassword().equals(user.getPasswordRep())) {
            result.rejectValue("passwordRep", "error.user", "Hasła nie są takie same");
        } else if (user.getName().isEmpty() || user.getName().isBlank()) {
            result.rejectValue("name", "error.user", "Niepoprawne imię");
        } else if (user.getLastName().isEmpty() || user.getLastName().isBlank()) {
            result.rejectValue("lastName", "error.user", "Niepoprawne nazwisko");
        } else if (user.getPassword().isEmpty() || user.getPassword().isBlank() || user.getPassword().length() < 10) {
            result.rejectValue("password", "error.user", "Hasło jest za krótkie");
        }
        if (result.hasErrors()) {
            model.addAttribute("error", result.getAllErrors());
            model.addAttribute("user", user);
            return "admin/users/editUser";
        }
        User existingUser = userService.findUserById(user.getId());
        existingUser.setName(user.getName());
        existingUser.setLastName(user.getLastName());
        existingUser.setPassword(passwordEncoder.encode(user.getPassword()));
        userRepository.save(existingUser);
        redirectAttributes.addFlashAttribute("successMessage", "Zmieniono użytkownika");
        return "redirect:/admin/users";
    }
}

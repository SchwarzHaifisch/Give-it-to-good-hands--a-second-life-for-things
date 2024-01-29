package pl.coderslab.admin;

import lombok.RequiredArgsConstructor;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import pl.coderslab.loginSystem.User;
import pl.coderslab.loginSystem.UserRepository;
import pl.coderslab.loginSystem.UserService;

import java.util.Collections;

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
        try {
            userService.editAccount(user);
            redirectAttributes.addFlashAttribute("successMessage", "Zmieniono użytkownika");
            return "redirect:/admin/user";
        } catch (IllegalArgumentException e) {
            result.reject("error.user", e.getMessage());
            model.addAttribute("error", result.getAllErrors());
            model.addAttribute("user", user);
            return "admin/users/editUser";
        }
    }
    @GetMapping("/ban")
    String banUser(@RequestParam("idBan") Long id, RedirectAttributes redirectAttributes){
        User user = userRepository.findById(id).orElseThrow();
        user.setEnabled(0);
        userRepository.save(user);
        redirectAttributes.addFlashAttribute("successMessage","Użytkownik został zbanowany");
        return "redirect:/admin/users";
    }
    @PostMapping("/ban")
    String unBanUser(@RequestParam("idUban") Long id, RedirectAttributes redirectAttributes){
        User user = userRepository.findById(id).orElseThrow();
        user.setEnabled(1);
        userRepository.save(user);
        redirectAttributes.addFlashAttribute("successMessage","Użytkownik został odbanowany");
        return "redirect:/admin/users";
    }
    @PostMapping("/delete")
    String deleteUser(@RequestParam("idDen") Long id, RedirectAttributes redirectAttributes){
        User user = userRepository.findById(id).orElseThrow(() -> new UsernameNotFoundException("User not found with id: "+id));
        user.setRoles(Collections.emptySet());
        userRepository.deleteById(id);
        redirectAttributes.addFlashAttribute("successMessage","Usunięto administratora");
        return "redirect:/admin/users";
    }
}
